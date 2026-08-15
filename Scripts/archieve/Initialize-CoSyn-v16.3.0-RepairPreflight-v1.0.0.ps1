#Requires -Version 7.0
<#
.SYNOPSIS
    Fail-closed Phase 1 + Phase 2 preflight for the CoSyn v16.3.0 Core repair workflow.

.DESCRIPTION
    Verifies the immutable CoSyn-v16.1.0 baseline, fingerprints and protects the flawed
    CoSyn-v16.2.0 historical evidence, creates a clean copy-on-write CoSyn-v16.3.0
    workspace from v16.1.0, instantiates the D01-D10 unresolved-defect ledger, and
    generates an evidence-backed file/section change map before any CCT editing begins.

    This script performs NO semantic correction and NO version-content promotion.
    The copied v16.1.0 artifacts remain byte-identical in the new workspace at exit.
    All corrective editing is deferred to the later patch-only CCT phase.

.NOTES
    Script version: 1.0.0
    Target: PowerShell 7+
    External dependencies: none
    Failure behavior: fail closed
#>

[CmdletBinding()]
param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$Root = 'D:\cosyn-gov\Chat-gov-files\CGS-v16',

    [Parameter()]
    [ValidatePattern('^[0-9A-Fa-f]{64}$')]
    [string]$ExpectedBaselineZipSha256 = '98C8BE3CF6E7B5B6548341F34489F6F708CF08C229223455ABAF33BCA93EB987',

    [Parameter()]
    [switch]$RequireHistoricalZip
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

$ScriptVersion = '1.0.0'
$BaselineVersion = '16.1.0'
$HistoricalVersion = '16.2.0'
$TargetVersion = '16.3.0'
$ExpectedBaselineFileCount = 12

function Stop-Preflight {
    param(
        [Parameter(Mandatory)][string]$Code,
        [Parameter(Mandatory)][string]$Message
    )
    throw "[$Code] $Message"
}

function Get-Sha256 {
    param([Parameter(Mandatory)][string]$LiteralPath)
    if (-not (Test-Path -LiteralPath $LiteralPath -PathType Leaf)) {
        Stop-Preflight -Code 'FILE_NOT_FOUND' -Message "Required file not found: $LiteralPath"
    }
    return (Get-FileHash -LiteralPath $LiteralPath -Algorithm SHA256).Hash.ToUpperInvariant()
}

function Get-RelativeNormalizedPath {
    param(
        [Parameter(Mandatory)][string]$BasePath,
        [Parameter(Mandatory)][string]$ChildPath
    )
    return ([System.IO.Path]::GetRelativePath($BasePath, $ChildPath) -replace '\\','/')
}

function Assert-NoReparsePoints {
    param(
        [Parameter(Mandatory)][string]$Directory,
        [Parameter(Mandatory)][string]$Label
    )
    $reparse = @(
        Get-ChildItem -LiteralPath $Directory -Recurse -Force |
            Where-Object { ($_.Attributes -band [System.IO.FileAttributes]::ReparsePoint) -ne 0 }
    )
    if ($reparse.Count -gt 0) {
        $names = ($reparse.FullName -join '; ')
        Stop-Preflight -Code 'REPARSE_POINT_REJECTED' -Message "$Label contains reparse-point content: $names"
    }
}

function Get-TreeInventory {
    param([Parameter(Mandatory)][string]$Directory)

    if (-not (Test-Path -LiteralPath $Directory -PathType Container)) {
        Stop-Preflight -Code 'DIRECTORY_NOT_FOUND' -Message "Required directory not found: $Directory"
    }

    Assert-NoReparsePoints -Directory $Directory -Label $Directory

    $items = @(
        Get-ChildItem -LiteralPath $Directory -Recurse -Force -File |
            ForEach-Object {
                [pscustomobject][ordered]@{
                    relative_path = Get-RelativeNormalizedPath -BasePath $Directory -ChildPath $_.FullName
                    bytes         = [int64]$_.Length
                    sha256        = (Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256).Hash.ToUpperInvariant()
                }
            } |
            Sort-Object relative_path
    )
    return $items
}

function Get-InventorySignature {
    param([Parameter(Mandatory)][object[]]$Inventory)
    return (@(
        $Inventory | ForEach-Object {
            '{0}|{1}|{2}' -f $_.relative_path, $_.bytes, $_.sha256
        }
    ) -join "`n")
}

function Assert-InventoriesEqual {
    param(
        [Parameter(Mandatory)][object[]]$Expected,
        [Parameter(Mandatory)][object[]]$Actual,
        [Parameter(Mandatory)][string]$Code,
        [Parameter(Mandatory)][string]$Label
    )
    $a = Get-InventorySignature -Inventory $Expected
    $b = Get-InventorySignature -Inventory $Actual
    if ($a -cne $b) {
        Stop-Preflight -Code $Code -Message "$Label inventory changed or does not match."
    }
}

function Write-JsonAtomic {
    param(
        [Parameter(Mandatory)][object]$InputObject,
        [Parameter(Mandatory)][string]$LiteralPath
    )
    $directory = Split-Path -Parent $LiteralPath
    if (-not (Test-Path -LiteralPath $directory -PathType Container)) {
        New-Item -ItemType Directory -Path $directory -Force | Out-Null
    }

    $temp = "$LiteralPath.tmp-$([guid]::NewGuid().ToString('N'))"
    try {
        $json = $InputObject | ConvertTo-Json -Depth 100
        [System.IO.File]::WriteAllText(
            $temp,
            $json + [Environment]::NewLine,
            [System.Text.UTF8Encoding]::new($false)
        )
        Move-Item -LiteralPath $temp -Destination $LiteralPath
    }
    finally {
        if (Test-Path -LiteralPath $temp) {
            Remove-Item -LiteralPath $temp -Force -ErrorAction SilentlyContinue
        }
    }
}

function Assert-SetEqual {
    param(
        [Parameter(Mandatory)][string[]]$Expected,
        [Parameter(Mandatory)][string[]]$Actual,
        [Parameter(Mandatory)][string]$Code,
        [Parameter(Mandatory)][string]$Label
    )

    $left  = @($Expected | Sort-Object -Unique)
    $right = @($Actual   | Sort-Object -Unique)

    if ($left.Count -ne $right.Count) {
        Stop-Preflight -Code $Code -Message "$Label count mismatch. Expected $($left.Count), got $($right.Count)."
    }

    for ($i = 0; $i -lt $left.Count; $i++) {
        if ($left[$i] -cne $right[$i]) {
            Stop-Preflight -Code $Code -Message "$Label set mismatch. Expected '$($left[$i])', got '$($right[$i])'."
        }
    }
}

function Read-JsonStrict {
    param([Parameter(Mandatory)][string]$LiteralPath)
    try {
        return (Get-Content -LiteralPath $LiteralPath -Raw -Encoding UTF8 | ConvertFrom-Json)
    }
    catch {
        Stop-Preflight -Code 'JSON_PARSE_FAILURE' -Message "Cannot parse JSON '$LiteralPath': $($_.Exception.Message)"
    }
}

function Get-ZipInventory {
    param(
        [Parameter(Mandatory)][string]$ZipPath,
        [Parameter(Mandatory)][string]$OptionalRootPrefix
    )

    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $archive = [System.IO.Compression.ZipFile]::OpenRead($ZipPath)
    try {
        $fileEntries = @($archive.Entries | Where-Object { -not [string]::IsNullOrEmpty($_.Name) })
        $normalizedNames = @($fileEntries | ForEach-Object { ($_.FullName -replace '\\','/').TrimStart('/') })

        $prefix = "$OptionalRootPrefix/"
        $stripPrefix = $false
        if ($normalizedNames.Count -gt 0) {
            $outsidePrefix = @($normalizedNames | Where-Object { -not $_.StartsWith($prefix, [System.StringComparison]::Ordinal) })
            if ($outsidePrefix.Count -eq 0) {
                $stripPrefix = $true
            }
        }

        $inventory = foreach ($entry in $fileEntries) {
            $name = ($entry.FullName -replace '\\','/').TrimStart('/')
            if ($stripPrefix) {
                $name = $name.Substring($prefix.Length)
            }

            $sha = [System.Security.Cryptography.SHA256]::Create()
            $stream = $entry.Open()
            try {
                $hashBytes = $sha.ComputeHash($stream)
                $hash = ([System.BitConverter]::ToString($hashBytes) -replace '-','').ToUpperInvariant()
            }
            finally {
                $stream.Dispose()
                $sha.Dispose()
            }

            [pscustomobject][ordered]@{
                relative_path = $name
                bytes         = [int64]$entry.Length
                sha256        = $hash
            }
        }

        $duplicates = @($inventory | Group-Object relative_path | Where-Object Count -gt 1)
        if ($duplicates.Count -gt 0) {
            Stop-Preflight -Code 'ZIP_DUPLICATE_ENTRY' -Message "ZIP contains duplicate normalized file paths: $(($duplicates.Name) -join ', ')"
        }

        return @($inventory | Sort-Object relative_path)
    }
    finally {
        $archive.Dispose()
    }
}

function Find-AnchorMatches {
    param(
        [Parameter(Mandatory)][string]$Workspace,
        [Parameter(Mandatory)][object[]]$AnchorDefinitions
    )

    $results = @()

    foreach ($anchor in $AnchorDefinitions) {
        $files = @()

        if ($anchor.file -eq '*') {
            $files = @(
                Get-ChildItem -LiteralPath $Workspace -File |
                    Where-Object { $_.Extension -in @('.md', '.json') } |
                    Sort-Object Name
            )
        }
        else {
            $full = Join-Path $Workspace $anchor.file
            if (-not (Test-Path -LiteralPath $full -PathType Leaf)) {
                Stop-Preflight -Code 'CHANGE_MAP_FILE_MISSING' -Message "Change-map source file missing: $($anchor.file)"
            }
            $files = @((Get-Item -LiteralPath $full))
        }

        $matches = @()
        foreach ($file in $files) {
            $lines = [System.IO.File]::ReadAllLines($file.FullName)
            for ($i = 0; $i -lt $lines.Length; $i++) {
                if ($lines[$i] -match $anchor.pattern) {
                    $matches += [pscustomobject][ordered]@{
                        file = $file.Name
                        line = $i + 1
                        text = $lines[$i].Trim()
                    }
                }
            }
        }

        if ($matches.Count -lt $anchor.minimum_matches) {
            Stop-Preflight -Code 'CHANGE_MAP_ANCHOR_MISSING' -Message (
                "Defect $($anchor.defect_id) anchor '$($anchor.label)' expected at least " +
                "$($anchor.minimum_matches) match(es), found $($matches.Count). Baseline differs from the expected reviewed state."
            )
        }

        $results += [pscustomobject][ordered]@{
            defect_id      = $anchor.defect_id
            label          = $anchor.label
            pattern        = $anchor.pattern
            minimum_matches = $anchor.minimum_matches
            matches        = @($matches)
        }
    }

    return $results
}

$Root = [System.IO.Path]::GetFullPath($Root)

$BaselineDir = Join-Path $Root "CoSyn-v$BaselineVersion"
$BaselineZip = Join-Path $Root "CoSyn-v$BaselineVersion.zip"
$HistoricalDir = Join-Path $Root "CoSyn-v$HistoricalVersion"
$HistoricalZip = Join-Path $Root "CoSyn-v$HistoricalVersion.zip"
$TargetDir = Join-Path $Root "CoSyn-v$TargetVersion"
$TargetZip = Join-Path $Root "CoSyn-v$TargetVersion.zip"
$StageDir = Join-Path $Root (".CoSyn-v$TargetVersion.preflight-$([guid]::NewGuid().ToString('N'))")

$CanonicalManifestName = "canonical-manifest-v$BaselineVersion.json"
$CoreManifestName = "core-package-manifest-v$BaselineVersion.json"
$IntegrityManifestName = "integrity-manifest-v$BaselineVersion.json"

$Defects = @(
    [pscustomobject][ordered]@{
        id='D01'; title='PTR optional note field contradicts schema closure'
        status='REQUIRED'
        allowed_files=@("ptr-specification-v$BaselineVersion.md")
        required_new_files=@()
        authorized_change='Resolve note-field schema contradiction only; synchronize directly dependent PTR schema/example text.'
    },
    [pscustomobject][ordered]@{
        id='D02'; title='PTR one-record-per-completed-turn contradicts PTR failure semantics'
        status='REQUIRED'
        allowed_files=@(
            "ptr-specification-v$BaselineVersion.md",
            "cosyn-constitution-v$BaselineVersion.md",
            "persona-governor-v$BaselineVersion.md",
            "stack-architect-v$BaselineVersion.md",
            "cosyn-v16-bind-template-v$BaselineVersion.json"
        )
        required_new_files=@()
        authorized_change='Make completed-turn, failed-record, recovery, turn_id, ledger_sequence, prior_state_pointer, and state_version semantics coherent.'
    },
    [pscustomobject][ordered]@{
        id='D03'; title='PTR normative schema-version example is stale'
        status='REQUIRED'
        allowed_files=@("ptr-specification-v$BaselineVersion.md")
        required_new_files=@()
        authorized_change='Correct current normative example schema identity without rewriting historical examples.'
    },
    [pscustomobject][ordered]@{
        id='D04'; title='Integrity-manifest contract is logically impossible'
        status='REQUIRED'
        allowed_files=@(
            "cosyn-v16-extension-contract-v$BaselineVersion.md",
            "core-package-manifest-v$BaselineVersion.json",
            "integrity-manifest-v$BaselineVersion.json",
            "cosyn-constitution-v$BaselineVersion.md"
        )
        required_new_files=@()
        authorized_change='Synchronize the non-self-hashing integrity model and external ZIP trust-anchor semantics.'
    },
    [pscustomobject][ordered]@{
        id='D05'; title='Core and bolt-on compatibility policy contradicts mixed-version prohibition'
        status='REQUIRED'
        allowed_files=@(
            "core-package-manifest-v$BaselineVersion.json",
            "stack-architect-v$BaselineVersion.md",
            "cosyn-v16-extension-contract-v$BaselineVersion.md",
            "cosyn-v16-bind-template-v$BaselineVersion.json",
            "cosyn-constitution-v$BaselineVersion.md"
        )
        required_new_files=@()
        authorized_change='Establish one synchronized deterministic compatibility policy; do not impose unapproved y.z lockstep.'
    },
    [pscustomobject][ordered]@{
        id='D06'; title='Mode Registry misclassifies Creative Writing workflow phases as modes'
        status='REQUIRED'
        allowed_files=@("mode-registry-v$BaselineVersion.md")
        required_new_files=@()
        authorized_change='Separate Core mode semantics from bolt-on workflow-phase semantics without editing the Creative Writing bolt-on.'
    },
    [pscustomobject][ordered]@{
        id='D07'; title='Core hard-codes task-specific bolt-on filenames or versions'
        status='REQUIRED'
        allowed_files=@(
            "mode-registry-v$BaselineVersion.md",
            "cosyn-v16-bind-template-v$BaselineVersion.json",
            "anti-ai-signature-gate-v$BaselineVersion.md",
            "ptr-specification-v$BaselineVersion.md",
            "persona-governor-v$BaselineVersion.md",
            "stack-architect-v$BaselineVersion.md",
            "cosyn-constitution-v$BaselineVersion.md",
            "cosyn-v16-extension-contract-v$BaselineVersion.md",
            "core-package-manifest-v$BaselineVersion.json",
            "canonical-manifest-v$BaselineVersion.json"
        )
        required_new_files=@()
        authorized_change='Remove operational hard-coded task-specific bolt-on filenames/versions; preserve legitimate historical provenance.'
    },
    [pscustomobject][ordered]@{
        id='D08'; title='Candidate status semantics are unsynchronized'
        status='REQUIRED'
        allowed_files=@(
            "cosyn-constitution-v$BaselineVersion.md",
            "persona-governor-v$BaselineVersion.md",
            "stack-architect-v$BaselineVersion.md",
            "ptr-specification-v$BaselineVersion.md",
            "mode-registry-v$BaselineVersion.md",
            "editing-discipline-v$BaselineVersion.md",
            "anti-ai-signature-gate-v$BaselineVersion.md",
            "cosyn-v16-extension-contract-v$BaselineVersion.md",
            "cosyn-v16-bind-template-v$BaselineVersion.json",
            "canonical-manifest-v$BaselineVersion.json",
            "core-package-manifest-v$BaselineVersion.json"
        )
        required_new_files=@()
        authorized_change='Synchronize working/final candidate status without implying Creator ratification.'
    },
    [pscustomobject][ordered]@{
        id='D09'; title='Capability ownership map is referenced but not shipped'
        status='REQUIRED'
        allowed_files=@(
            "cosyn-constitution-v$BaselineVersion.md",
            "cosyn-v16-extension-contract-v$BaselineVersion.md",
            "canonical-manifest-v$BaselineVersion.json",
            "core-package-manifest-v$BaselineVersion.json",
            "integrity-manifest-v$BaselineVersion.json"
        )
        required_new_files=@("capability-ownership-map-v$TargetVersion.json")
        authorized_change='Add derived ownership metadata/index only; it must not become a new governance authority.'
    },
    [pscustomobject][ordered]@{
        id='D10'; title='Canonical manifest role and scope semantics are incorrect'
        status='REQUIRED'
        allowed_files=@(
            "cosyn-constitution-v$BaselineVersion.md",
            "canonical-manifest-v$BaselineVersion.json",
            "integrity-manifest-v$BaselineVersion.json",
            "core-package-manifest-v$BaselineVersion.json"
        )
        required_new_files=@()
        authorized_change='Synchronize semantic-index scope, constitutional-root classification, and identity-vs-integrity responsibilities.'
    }
)

$Anchors = @(
    [pscustomobject]@{ defect_id='D01'; file="ptr-specification-v$BaselineVersion.md"; label='schema closure'; pattern='(?i)undefined fields|undefined field'; minimum_matches=1 },
    [pscustomobject]@{ defect_id='D01'; file="ptr-specification-v$BaselineVersion.md"; label='optional note'; pattern='(?i)\bnote\b'; minimum_matches=1 },

    [pscustomobject]@{ defect_id='D02'; file="ptr-specification-v$BaselineVersion.md"; label='exactly-one/completed-turn invariant'; pattern='(?i)(every completed.*turn.*exactly one|exactly one.*(PTR|ledger).*entry|one record.*completed turn)'; minimum_matches=1 },
    [pscustomobject]@{ defect_id='D02'; file="ptr-specification-v$BaselineVersion.md"; label='failed record not committed / finalized snapshot emitted'; pattern='(?i)(invalid PTR record.*not.*committed|finalized (response )?snapshot.*emit|snapshot.*emitted unchanged)'; minimum_matches=1 },

    [pscustomobject]@{ defect_id='D03'; file="ptr-specification-v$BaselineVersion.md"; label='stale normative ptr_schema_version'; pattern='"ptr_schema_version"\s*:\s*"16\.0\.0"'; minimum_matches=1 },

    [pscustomobject]@{ defect_id='D04'; file="cosyn-v16-extension-contract-v$BaselineVersion.md"; label='all manifest_files integrity coverage'; pattern='(?i)(cover|hash).*(all|every).*manifest_files'; minimum_matches=1 },
    [pscustomobject]@{ defect_id='D04'; file="cosyn-v16-extension-contract-v$BaselineVersion.md"; label='integrity manifest self-hash exclusion'; pattern='(?i)(must not|does not|exclude).*hash.*(itself|self)|self-hash'; minimum_matches=1 },

    [pscustomobject]@{ defect_id='D05'; file="stack-architect-v$BaselineVersion.md"; label='mixed-version prohibition'; pattern='(?i)mixed-version.*prohibit'; minimum_matches=1 },
    [pscustomobject]@{ defect_id='D05'; file="core-package-manifest-v$BaselineVersion.json"; label='minimum compatible bolt-on generation'; pattern='minimum_compatible_bolt_on_generation'; minimum_matches=1 },

    [pscustomobject]@{ defect_id='D06'; file="mode-registry-v$BaselineVersion.md"; label='fiction phase treated as mode'; pattern='(?i)(fiction.*phase|creative writing.*phase|phases.*registered mode|registered mode.*phase)'; minimum_matches=1 },

    [pscustomobject]@{ defect_id='D07'; file='*'; label='hard-coded creative-writing package/version'; pattern='creative-writing-v16\.\d+\.\d+'; minimum_matches=1 },

    [pscustomobject]@{ defect_id='D08'; file='*'; label='candidate status declarations'; pattern='(?i)(PROPOSED\s*/\s*READY FOR CREATOR REVIEW|PROPOSED\s*[—-]\s*pending Creator ratification|Canonical\s*[—-]\s*optional render)'; minimum_matches=1 },

    [pscustomobject]@{ defect_id='D09'; file="cosyn-v16-extension-contract-v$BaselineVersion.md"; label='capability ownership map reference'; pattern='(?i)capability-ownership-map'; minimum_matches=1 },

    [pscustomobject]@{ defect_id='D10'; file="cosyn-constitution-v$BaselineVersion.md"; label='canonical manifest hash-role wording'; pattern='(?i)canonical-manifest.*(SHA-256|hash)'; minimum_matches=1 },
    [pscustomobject]@{ defect_id='D10'; file="canonical-manifest-v$BaselineVersion.json"; label='subordinate-only canonical-manifest scope'; pattern='(?i)Core subordinate artifacts'; minimum_matches=1 }
)

$StageCreated = $false
$TargetCommitted = $false

try {
    if (-not (Test-Path -LiteralPath $Root -PathType Container)) {
        Stop-Preflight -Code 'ROOT_NOT_FOUND' -Message "CGS v16 root does not exist: $Root"
    }

    if (Test-Path -LiteralPath $TargetDir) {
        Stop-Preflight -Code 'TARGET_VERSION_COLLISION' -Message "Target directory already exists: $TargetDir"
    }
    if (Test-Path -LiteralPath $TargetZip) {
        Stop-Preflight -Code 'TARGET_VERSION_COLLISION' -Message "Target ZIP already exists: $TargetZip"
    }

    $staleStages = @(
        Get-ChildItem -LiteralPath $Root -Force |
            Where-Object { $_.Name -like ".CoSyn-v$TargetVersion.preflight-*" }
    )
    if ($staleStages.Count -gt 0) {
        Stop-Preflight -Code 'STALE_PREFLIGHT_STAGE' -Message "Stale v$TargetVersion preflight staging content exists: $(($staleStages.FullName) -join '; ')"
    }

    if (-not (Test-Path -LiteralPath $BaselineDir -PathType Container)) {
        Stop-Preflight -Code 'BASELINE_DIRECTORY_MISSING' -Message "Immutable baseline directory missing: $BaselineDir"
    }
    if (-not (Test-Path -LiteralPath $BaselineZip -PathType Leaf)) {
        Stop-Preflight -Code 'BASELINE_ZIP_MISSING' -Message "Immutable baseline ZIP missing: $BaselineZip"
    }
    if (-not (Test-Path -LiteralPath $HistoricalDir -PathType Container)) {
        Stop-Preflight -Code 'HISTORICAL_V16_2_MISSING' -Message "Flawed v$HistoricalVersion historical directory must be preserved before repair: $HistoricalDir"
    }
    if ($RequireHistoricalZip -and -not (Test-Path -LiteralPath $HistoricalZip -PathType Leaf)) {
        Stop-Preflight -Code 'HISTORICAL_V16_2_ZIP_MISSING' -Message "RequireHistoricalZip was set but historical ZIP is missing: $HistoricalZip"
    }

    $baselineZipHash = Get-Sha256 -LiteralPath $BaselineZip
    if ($baselineZipHash -cne $ExpectedBaselineZipSha256.ToUpperInvariant()) {
        Stop-Preflight -Code 'BASELINE_IDENTITY_FAILURE' -Message (
            "v$BaselineVersion ZIP SHA-256 mismatch. Expected $($ExpectedBaselineZipSha256.ToUpperInvariant()); got $baselineZipHash"
        )
    }

    $baselineBefore = Get-TreeInventory -Directory $BaselineDir
    if ($baselineBefore.Count -ne $ExpectedBaselineFileCount) {
        Stop-Preflight -Code 'BASELINE_FILE_COUNT_MISMATCH' -Message (
            "Expected $ExpectedBaselineFileCount v$BaselineVersion Core files; found $($baselineBefore.Count)."
        )
    }

    $baselineNames = @($baselineBefore.relative_path)
    foreach ($required in @($CanonicalManifestName, $CoreManifestName, $IntegrityManifestName)) {
        if ($baselineNames -cnotcontains $required) {
            Stop-Preflight -Code 'BASELINE_MANIFEST_MISSING' -Message "Required baseline manifest missing: $required"
        }
    }

    $coreManifest = Read-JsonStrict -LiteralPath (Join-Path $BaselineDir $CoreManifestName)
    $canonicalManifest = Read-JsonStrict -LiteralPath (Join-Path $BaselineDir $CanonicalManifestName)
    $integrityManifest = Read-JsonStrict -LiteralPath (Join-Path $BaselineDir $IntegrityManifestName)

    if ([string]$coreManifest.package_identity -cne "CoSyn-v$BaselineVersion") {
        Stop-Preflight -Code 'BASELINE_PACKAGE_IDENTITY_MISMATCH' -Message "core-package-manifest package_identity is not CoSyn-v$BaselineVersion."
    }
    if ([string]$coreManifest.package_version -cne $BaselineVersion) {
        Stop-Preflight -Code 'BASELINE_PACKAGE_VERSION_MISMATCH' -Message "core-package-manifest package_version is not $BaselineVersion."
    }

    $manifestFiles = @($coreManifest.manifest_files | ForEach-Object { [string]$_ })
    Assert-SetEqual -Expected $manifestFiles -Actual $baselineNames -Code 'BASELINE_MANIFEST_FILESET_MISMATCH' -Label 'core-package-manifest vs baseline directory'

    $canonicalFiles = @($canonicalManifest.files | ForEach-Object { [string]$_.name })
    Assert-SetEqual -Expected $canonicalFiles -Actual $baselineNames -Code 'BASELINE_CANONICAL_FILESET_MISMATCH' -Label 'canonical-manifest vs baseline directory'

    $expectedIntegrityNames = @($baselineNames | Where-Object { $_ -cne $IntegrityManifestName })
    $integrityEntries = @($integrityManifest.entries)
    $integrityNames = @($integrityEntries | ForEach-Object { [string]$_.filename })
    Assert-SetEqual -Expected $expectedIntegrityNames -Actual $integrityNames -Code 'BASELINE_INTEGRITY_FILESET_MISMATCH' -Label 'integrity-manifest implemented coverage'

    foreach ($entry in $integrityEntries) {
        $filePath = Join-Path $BaselineDir ([string]$entry.filename)
        if (-not (Test-Path -LiteralPath $filePath -PathType Leaf)) {
            Stop-Preflight -Code 'BASELINE_INTEGRITY_TARGET_MISSING' -Message "Integrity entry target missing: $($entry.filename)"
        }
        $actualHash = Get-Sha256 -LiteralPath $filePath
        $actualSize = (Get-Item -LiteralPath $filePath).Length
        if ($actualHash -cne ([string]$entry.sha256).ToUpperInvariant()) {
            Stop-Preflight -Code 'BASELINE_INTEGRITY_HASH_MISMATCH' -Message "Hash mismatch for $($entry.filename)."
        }
        if ([int64]$actualSize -ne [int64]$entry.size) {
            Stop-Preflight -Code 'BASELINE_INTEGRITY_SIZE_MISMATCH' -Message "Size mismatch for $($entry.filename)."
        }
    }

    $baselineZipInventory = Get-ZipInventory -ZipPath $BaselineZip -OptionalRootPrefix "CoSyn-v$BaselineVersion"
    Assert-InventoriesEqual -Expected $baselineBefore -Actual $baselineZipInventory -Code 'BASELINE_ZIP_CONTENT_MISMATCH' -Label 'v16.1.0 ZIP vs baseline directory'

    $historicalBefore = Get-TreeInventory -Directory $HistoricalDir
    $historicalZipHashBefore = $null
    if (Test-Path -LiteralPath $HistoricalZip -PathType Leaf) {
        $historicalZipHashBefore = Get-Sha256 -LiteralPath $HistoricalZip
    }

    New-Item -ItemType Directory -Path $StageDir | Out-Null
    $StageCreated = $true

    foreach ($file in $baselineBefore) {
        $source = Join-Path $BaselineDir ($file.relative_path -replace '/','\')
        $destination = Join-Path $StageDir ($file.relative_path -replace '/','\')
        $parent = Split-Path -Parent $destination
        if (-not (Test-Path -LiteralPath $parent -PathType Container)) {
            New-Item -ItemType Directory -Path $parent -Force | Out-Null
        }
        Copy-Item -LiteralPath $source -Destination $destination
    }

    $copiedBaseline = Get-TreeInventory -Directory $StageDir
    Assert-InventoriesEqual -Expected $baselineBefore -Actual $copiedBaseline -Code 'COPY_VERIFICATION_FAILURE' -Label 'v16.3.0 working copy vs immutable v16.1.0 baseline'

    $anchorResults = Find-AnchorMatches -Workspace $StageDir -AnchorDefinitions $Anchors

    # A reviewed defect may not silently expand into an unapproved file.
    foreach ($defect in $Defects) {
        $allowed = @($defect.allowed_files)
        $observedFiles = @(
            $anchorResults |
                Where-Object defect_id -eq $defect.id |
                ForEach-Object { $_.matches } |
                ForEach-Object { $_.file } |
                Sort-Object -Unique
        )
        foreach ($observedFile in $observedFiles) {
            if ($allowed -cnotcontains $observedFile) {
                Stop-Preflight -Code 'CHANGE_MAP_SCOPE_EXPANSION' -Message (
                    "Defect $($defect.id) has reviewed anchor evidence in '$observedFile', " +
                    "which is outside its authorized file set. Stop for explicit map correction before CCT editing."
                )
            }
        }
    }

    $controlDir = Join-Path $StageDir '_preflight'
    New-Item -ItemType Directory -Path $controlDir | Out-Null

    $baselineInventoryRecord = [ordered]@{
        record_type = 'immutable_baseline_inventory'
        script_version = $ScriptVersion
        baseline_version = $BaselineVersion
        baseline_directory = $BaselineDir
        baseline_zip = $BaselineZip
        baseline_zip_sha256 = $baselineZipHash
        file_count = $baselineBefore.Count
        files = @($baselineBefore)
    }
    Write-JsonAtomic -InputObject $baselineInventoryRecord -LiteralPath (Join-Path $controlDir "baseline-inventory-v$BaselineVersion.json")

    $historicalRecord = [ordered]@{
        record_type = 'historical_failed_candidate_inventory'
        script_version = $ScriptVersion
        historical_version = $HistoricalVersion
        role = 'Flawed historical evidence only; not a repair source.'
        historical_directory = $HistoricalDir
        historical_zip = if (Test-Path -LiteralPath $HistoricalZip -PathType Leaf) { $HistoricalZip } else { $null }
        historical_zip_sha256 = $historicalZipHashBefore
        file_count = $historicalBefore.Count
        files = @($historicalBefore)
    }
    Write-JsonAtomic -InputObject $historicalRecord -LiteralPath (Join-Path $controlDir "historical-v$HistoricalVersion-inventory.json")

    $defectLedger = [ordered]@{
        record_type = 'unresolved_defect_ledger'
        script_version = $ScriptVersion
        target_version = $TargetVersion
        source_baseline = "CoSyn-v$BaselineVersion"
        forbidden_source = "CoSyn-v$HistoricalVersion"
        status = 'PREFLIGHT_INITIALIZED_NOT_EDITED'
        defects = @(
            $Defects | ForEach-Object {
                [ordered]@{
                    id = $_.id
                    title = $_.title
                    status = $_.status
                    disposition = $null
                    allowed_files = @($_.allowed_files)
                    required_new_files = @($_.required_new_files)
                    authorized_change = $_.authorized_change
                    evidence = @()
                }
            }
        )
    }
    Write-JsonAtomic -InputObject $defectLedger -LiteralPath (Join-Path $controlDir "defect-ledger-v$TargetVersion.json")

    $changeMapDefects = foreach ($defect in $Defects) {
        $evidence = @($anchorResults | Where-Object defect_id -eq $defect.id)
        [ordered]@{
            id = $defect.id
            title = $defect.title
            status = 'MAPPED_NOT_EDITED'
            allowed_files = @($defect.allowed_files)
            required_new_files = @($defect.required_new_files)
            authorized_change = $defect.authorized_change
            protected_remainder = $true
            anchor_evidence = @($evidence)
        }
    }

    $changeMap = [ordered]@{
        record_type = 'pre_edit_change_map'
        script_version = $ScriptVersion
        target_version = $TargetVersion
        baseline_version = $BaselineVersion
        historical_version = $HistoricalVersion
        edit_policy = [ordered]@{
            patch_only = $true
            whole_file_regeneration_forbidden = $true
            whole_file_reconstruction_forbidden = $true
            protected_remainder = 'All copied baseline content outside an authorized defect delta or mechanically required version/identity dependency remains protected.'
            source_for_corrections = "CoSyn-v$BaselineVersion only"
            historical_v16_2_role = 'Evidence only; never source for v16.3.0 correction.'
            preflight_control_directory = '_preflight; excluded from governed Core package.'
        }
        defects = @($changeMapDefects)
    }
    Write-JsonAtomic -InputObject $changeMap -LiteralPath (Join-Path $controlDir "change-map-v$TargetVersion.json")

    $preflightReport = [ordered]@{
        record_type = 'repair_preflight_report'
        script_version = $ScriptVersion
        generated_utc = [DateTime]::UtcNow.ToString('o')
        status = 'PREFLIGHT_READY_FOR_CCT'
        root = $Root
        baseline = [ordered]@{
            version = $BaselineVersion
            directory = $BaselineDir
            zip = $BaselineZip
            zip_sha256 = $baselineZipHash
            file_count = $baselineBefore.Count
            manifest_file_set = 'PASS'
            canonical_file_set = 'PASS'
            implemented_integrity_hashes = 'PASS'
            zip_matches_directory = 'PASS'
        }
        historical = [ordered]@{
            version = $HistoricalVersion
            directory = $HistoricalDir
            file_count = $historicalBefore.Count
            zip_present = [bool](Test-Path -LiteralPath $HistoricalZip -PathType Leaf)
            zip_sha256 = $historicalZipHashBefore
            role = 'Preserved flawed historical evidence; not repair source.'
        }
        target = [ordered]@{
            version = $TargetVersion
            directory = $TargetDir
            source = "byte-identical copy of CoSyn-v$BaselineVersion at preflight exit"
            semantic_edits_performed = $false
            version_content_promotion_performed = $false
            defect_ledger = "_preflight/defect-ledger-v$TargetVersion.json"
            change_map = "_preflight/change-map-v$TargetVersion.json"
        }
        gates = [ordered]@{
            baseline_identity = 'PASS'
            baseline_physical_integrity = 'PASS'
            historical_presence_and_fingerprint = 'PASS'
            target_collision = 'PASS'
            copy_verification = 'PASS'
            defect_ledger_D01_D10 = 'PASS'
            exact_anchor_change_map = 'PASS'
            cct_editing_started = $false
        }
    }
    Write-JsonAtomic -InputObject $preflightReport -LiteralPath (Join-Path $controlDir "preflight-report-v$TargetVersion.json")

    # Verify the original baseline and historical evidence again before committing the stage.
    $baselineAfterStage = Get-TreeInventory -Directory $BaselineDir
    Assert-InventoriesEqual -Expected $baselineBefore -Actual $baselineAfterStage -Code 'BASELINE_MUTATED_DURING_PREFLIGHT' -Label 'immutable v16.1.0 baseline'
    $baselineZipHashAfterStage = Get-Sha256 -LiteralPath $BaselineZip
    if ($baselineZipHashAfterStage -cne $baselineZipHash) {
        Stop-Preflight -Code 'BASELINE_ZIP_MUTATED_DURING_PREFLIGHT' -Message "Immutable v$BaselineVersion ZIP changed during preflight."
    }

    $historicalAfterStage = Get-TreeInventory -Directory $HistoricalDir
    Assert-InventoriesEqual -Expected $historicalBefore -Actual $historicalAfterStage -Code 'HISTORICAL_MUTATED_DURING_PREFLIGHT' -Label 'historical v16.2.0 directory'

    if ($null -ne $historicalZipHashBefore) {
        $historicalZipHashAfterStage = Get-Sha256 -LiteralPath $HistoricalZip
        if ($historicalZipHashAfterStage -cne $historicalZipHashBefore) {
            Stop-Preflight -Code 'HISTORICAL_ZIP_MUTATED_DURING_PREFLIGHT' -Message "Historical v$HistoricalVersion ZIP changed during preflight."
        }
    }

    # Confirm copied baseline files are STILL byte-identical after control artifacts were added.
    $stageCoreOnly = @(
        Get-ChildItem -LiteralPath $StageDir -File |
            ForEach-Object {
                [pscustomobject][ordered]@{
                    relative_path = $_.Name
                    bytes         = [int64]$_.Length
                    sha256        = (Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256).Hash.ToUpperInvariant()
                }
            } |
            Sort-Object relative_path
    )
    Assert-InventoriesEqual -Expected $baselineBefore -Actual $stageCoreOnly -Code 'STAGED_BASELINE_CHANGED' -Label 'staged baseline artifact bytes'

    if (Test-Path -LiteralPath $TargetDir) {
        Stop-Preflight -Code 'TARGET_RACE_COLLISION' -Message "Target directory appeared during preflight: $TargetDir"
    }

    Move-Item -LiteralPath $StageDir -Destination $TargetDir
    $StageCreated = $false
    $TargetCommitted = $true

    # Final source-preservation verification after target commit.
    $baselineFinal = Get-TreeInventory -Directory $BaselineDir
    Assert-InventoriesEqual -Expected $baselineBefore -Actual $baselineFinal -Code 'BASELINE_MUTATED_AFTER_COMMIT' -Label 'immutable v16.1.0 baseline'
    $baselineZipHashFinal = Get-Sha256 -LiteralPath $BaselineZip
    if ($baselineZipHashFinal -cne $baselineZipHash) {
        Stop-Preflight -Code 'BASELINE_ZIP_MUTATED_AFTER_COMMIT' -Message "Immutable v$BaselineVersion ZIP changed after target commit."
    }

    $historicalFinal = Get-TreeInventory -Directory $HistoricalDir
    Assert-InventoriesEqual -Expected $historicalBefore -Actual $historicalFinal -Code 'HISTORICAL_MUTATED_AFTER_COMMIT' -Label 'historical v16.2.0 directory'

    if ($null -ne $historicalZipHashBefore) {
        $historicalZipHashFinal = Get-Sha256 -LiteralPath $HistoricalZip
        if ($historicalZipHashFinal -cne $historicalZipHashBefore) {
            Stop-Preflight -Code 'HISTORICAL_ZIP_MUTATED_AFTER_COMMIT' -Message "Historical v$HistoricalVersion ZIP changed after target commit."
        }
    }

    $targetCoreOnly = @(
        Get-ChildItem -LiteralPath $TargetDir -File |
            ForEach-Object {
                [pscustomobject][ordered]@{
                    relative_path = $_.Name
                    bytes         = [int64]$_.Length
                    sha256        = (Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256).Hash.ToUpperInvariant()
                }
            } |
            Sort-Object relative_path
    )
    Assert-InventoriesEqual -Expected $baselineBefore -Actual $targetCoreOnly -Code 'TARGET_COPY_NOT_BASELINE_IDENTICAL' -Label 'committed v16.3.0 pre-edit artifact bytes'

    # Confirm control artifacts survived the commit and remain parseable.
    foreach ($controlName in @(
        "baseline-inventory-v$BaselineVersion.json",
        "historical-v$HistoricalVersion-inventory.json",
        "defect-ledger-v$TargetVersion.json",
        "change-map-v$TargetVersion.json",
        "preflight-report-v$TargetVersion.json"
    )) {
        $controlPath = Join-Path (Join-Path $TargetDir '_preflight') $controlName
        if (-not (Test-Path -LiteralPath $controlPath -PathType Leaf)) {
            Stop-Preflight -Code 'CONTROL_ARTIFACT_MISSING_AFTER_COMMIT' -Message "Control artifact missing after commit: $controlName"
        }
        $null = Read-JsonStrict -LiteralPath $controlPath
    }

    Write-Host 'PREFLIGHT_READY_FOR_CCT'
    Write-Host "Target workspace: $TargetDir"
    Write-Host "Baseline source:   $BaselineDir"
    Write-Host "Historical v16.2:  $HistoricalDir"
    Write-Host "Defect ledger:     $(Join-Path $TargetDir "_preflight\defect-ledger-v$TargetVersion.json")"
    Write-Host "Change map:        $(Join-Path $TargetDir "_preflight\change-map-v$TargetVersion.json")"
    Write-Host 'Semantic edits performed: NO'
    Write-Host 'CCT editing authorized by this script: NO — preflight only'
}
catch {
    if ($StageCreated -and (Test-Path -LiteralPath $StageDir)) {
        Remove-Item -LiteralPath $StageDir -Recurse -Force -ErrorAction SilentlyContinue
    }

    if ($TargetCommitted -and (Test-Path -LiteralPath $TargetDir)) {
        # A post-commit source-preservation failure means this workspace must not be trusted.
        # Remove only the target created by this run; never touch v16.1.0 or v16.2.0.
        Remove-Item -LiteralPath $TargetDir -Recurse -Force -ErrorAction SilentlyContinue
    }

    Write-Error $_
    exit 1
}
