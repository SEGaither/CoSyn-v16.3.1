# CoSyn Development Provenance

This document is an index and guide to the development history retained in this repository. It is not a rewritten or reconstructed history — it points to the actual records where development, failure, repair, testing, and validation evidence can be found.

Where chronology is confidently supported by the records, it is shown. Where chronology or authority is uncertain, that is stated rather than inferred.

---

## How to Use This Document

- **To understand the design intent:** start with the planning records.
- **To trace a version:** go to the version-specific directory and its associated report files.
- **To see where defects were found and repaired:** go to the v16.3.0 preflight records.
- **To verify the validation and falsification results:** go to the v16.3.0 preflight directory.
- **To understand the current Core:** see `CoSyn-v16.3.1/` and `README.md`.
- **To understand the publication and tag correction:** see `PUBLICATION-PROVENANCE.md`.

---

## Provenance Map

### 1. Planning and Design

Records of the hierarchical architecture design and implementation planning that preceded the v16 build.

| File | Purpose |
|---|---|
| [`cgs-v16-design-plan-provenance.md`](cgs-v16-design-plan-provenance.md) | Design intent, source directories, approved hierarchical implementation plan |
| [`add-prov-record-cgsv16-hierarchical-plan-v1.1.0.md`](add-prov-record-cgsv16-hierarchical-plan-v1.1.0.md) | Additive provenance record: approved hierarchical plan (v1.1.0), architectural intent |
| [`CGS-v16-Hierarchical-Planning-Continuation-State-v1.0.0.md`](CGS-v16-Hierarchical-Planning-Continuation-State-v1.0.0.md) | Session continuation state for the hierarchical planning work |
| [`CGS-v16-Continuation-Package-Manifest-v1.0.0.md`](CGS-v16-Continuation-Package-Manifest-v1.0.0.md) | Continuation package manifest |
| [`CGS-v16-New-Session-Initialization-Prompt-v1.0.0.md`](CGS-v16-New-Session-Initialization-Prompt-v1.0.0.md) | Session initialization prompt used during development |

---

### 2. Version History

Versions are listed oldest to newest. Earlier versions are superseded and historical. Do not use them as active governance.

#### v16.0.0 — Initial derivation

| Location | Contents |
|---|---|
| [`CoSyn-v16.0.0-FINAL-REPORT.md`](CoSyn-v16.0.0-FINAL-REPORT.md) | v16.0.0 release report |
| [`CoSyn-v16.0.0.zip`](CoSyn-v16.0.0.zip) | v16.0.0 archived artifact package |
| [`build/derived/CoSyn-v16.0.0/`](build/derived/CoSyn-v16.0.0/) | v16.0.0 derived source files |

#### v16.1.0 — Corrective pass

| Location | Contents |
|---|---|
| [`CoSyn-v16.1.0/`](CoSyn-v16.1.0/) | v16.1.0 Core artifacts |
| [`CoSyn-v16.1.0-FINAL-REPORT.md`](CoSyn-v16.1.0-FINAL-REPORT.md) | v16.1.0 release report |
| [`CoSyn-v16.1.0-PROVENANCE-RECORD.md`](CoSyn-v16.1.0-PROVENANCE-RECORD.md) | Corrective pass provenance: source hashes, output hashes, source-to-output mapping |
| [`CoSyn-v16.1.0-ADVERSARIAL-TEST-REPORT.md`](CoSyn-v16.1.0-ADVERSARIAL-TEST-REPORT.md) | Adversarial testing results for v16.1.0 |
| [`build/adversarial/adversarial-test-report.json`](build/adversarial/adversarial-test-report.json) | Adversarial test data |
| [`build/CoSyn-v16.1.0.zip`](build/CoSyn-v16.1.0.zip) | v16.1.0 archived build artifact |

#### v16.2.0

| Location | Contents |
|---|---|
| [`CoSyn-v16.2.0/`](CoSyn-v16.2.0/) | v16.2.0 Core artifacts |

No separate final report file was located for v16.2.0. The v16.3.0 preflight records reference v16.2.0 as a historical baseline (see `CoSyn-v16.3.0/_preflight/historical-v16.2.0-inventory.json`).

#### v16.3.0 — Repair, falsification, and validation pass

The v16.3.0 working directory contains the most complete set of build, repair, and validation records in the repository. The preflight subdirectory holds 10 structured records generated during the repair and validation process.

| Location | Contents |
|---|---|
| [`CoSyn-v16.3.0/`](CoSyn-v16.3.0/) | v16.3.0 working directory |
| [`CoSyn-v16.3.0/_baseline-v16.1.0/`](CoSyn-v16.3.0/_baseline-v16.1.0/) | Frozen v16.1.0 baseline used as repair reference |
| [`CoSyn-v16.3.0/CoSyn-v16.3.0-corrected.zip`](CoSyn-v16.3.0/CoSyn-v16.3.0-corrected.zip) | v16.3.0 corrected artifact archive |

**Preflight and repair records** (`CoSyn-v16.3.0/_preflight/`):

| File | Purpose |
|---|---|
| [`baseline-inventory-v16.1.0.json`](CoSyn-v16.3.0/_preflight/baseline-inventory-v16.1.0.json) | Inventory of the v16.1.0 baseline before repair began |
| [`historical-v16.2.0-inventory.json`](CoSyn-v16.3.0/_preflight/historical-v16.2.0-inventory.json) | Inventory of v16.2.0 for historical reference |
| [`preflight-report-v16.3.0.json`](CoSyn-v16.3.0/_preflight/preflight-report-v16.3.0.json) | Overall preflight assessment for v16.3.0 |
| [`change-map-v16.3.0.json`](CoSyn-v16.3.0/_preflight/change-map-v16.3.0.json) | What changed from baseline to v16.3.0 |
| [`defect-ledger-v16.3.0.json`](CoSyn-v16.3.0/_preflight/defect-ledger-v16.3.0.json) | Defects discovered during the repair pass |
| [`haiku-mechanical-prep-report-v16.3.0.json`](CoSyn-v16.3.0/_preflight/haiku-mechanical-prep-report-v16.3.0.json) | Mechanical preparation report (Haiku model) |
| [`sonnet-semantic-repair-report-v16.3.0.json`](CoSyn-v16.3.0/_preflight/sonnet-semantic-repair-report-v16.3.0.json) | Semantic repair report (Sonnet model) |
| [`global-invariant-audit-v16.3.0.json`](CoSyn-v16.3.0/_preflight/global-invariant-audit-v16.3.0.json) | Global invariant audit across all Core artifacts |
| [`semantic-falsification-report-v16.3.0.json`](CoSyn-v16.3.0/_preflight/semantic-falsification-report-v16.3.0.json) | Semantic falsification testing results |
| [`deterministic-validation-report-v16.3.0.json`](CoSyn-v16.3.0/_preflight/deterministic-validation-report-v16.3.0.json) | Deterministic validation results |

**Repair scripts** (`Scripts/`):

| File | Purpose |
|---|---|
| [`Scripts/Initialize-CoSyn-v16.3.0-RepairPreflight-v1.0.2.ps1`](Scripts/Initialize-CoSyn-v16.3.0-RepairPreflight-v1.0.2.ps1) | Current repair preflight script |
| [`Scripts/archieve/`](Scripts/archieve/) | Archived earlier versions of the repair script (v1.0.0, v1.0.1) |

#### v16.3.1 — Current Core (corrected packaging)

| Location | Contents |
|---|---|
| [`CoSyn-v16.3.1/`](CoSyn-v16.3.1/) | Current published Core — 13 governance artifacts |

The `CoSyn-v16.3.1/` directory is the corrected packaging of the v16.3.0 artifacts. Internal artifact identifiers carry the v16.3.0 label. This is the active governance version.

---

### 3. Build and Migration Provenance

Records of the derivation and migration process that produced the v16 Core from prior sources.

| File | Purpose |
|---|---|
| [`build/provenance/migration-provenance-map.json`](build/provenance/migration-provenance-map.json) | Maps source artifacts to derived outputs across the migration |
| [`build/provenance/source-classification-map.json`](build/provenance/source-classification-map.json) | Classifies source artifacts by type and lineage |
| [`build/provenance/capability-ownership-map.json`](build/provenance/capability-ownership-map.json) | Capability ownership across the v16 architecture |
| [`build/manifests/source-freeze-manifest.json`](build/manifests/source-freeze-manifest.json) | Source freeze manifest — what was frozen before the build |
| [`build/validation/optimization-report.json`](build/validation/optimization-report.json) | Build validation and optimization report |

---

### 4. Creative Writing Derived Package

The v16 build also produced a creative-writing-specific derived package. It is historical and separate from the governance Core.

| Location | Contents |
|---|---|
| [`build/derived/creative-writing-v16.0.0/`](build/derived/creative-writing-v16.0.0/) | Creative writing derived artifacts |
| [`creative-writing-v16.0.0.zip`](creative-writing-v16.0.0.zip) | Creative writing package archive |

---

### 5. Publication Provenance

| File | Purpose |
|---|---|
| [`PUBLICATION-PROVENANCE.md`](PUBLICATION-PROVENANCE.md) | Record of the initial publication and v16.3.1 tag correction |

---

## Chronological Narrative

Where the records support it, the development sequence was approximately:

1. **Design and planning** — hierarchical architecture designed; implementation plan approved; source directories established
2. **v16.0.0 derivation** — initial Core derived from v15 and creative-writing sources; build and migration provenance generated
3. **v16.1.0 corrective pass** — defects from v16.0.0 addressed; provenance record and adversarial testing generated
4. **v16.2.0 development** — Core artifacts advanced; no separate final report located
5. **v16.3.0 repair and validation** — preflight, defect discovery, mechanical prep, semantic repair, global invariant audit, semantic falsification, and deterministic validation; repair scripts iterated
6. **v16.3.1 packaging** — corrected packaging of v16.3.0 artifacts into the public Core directory
7. **Publication** — initial public release; documentation revised; v16.3.1 tag corrected to include final documentation state

---

## What Is Not Present

- No formal ratification record has been located. Governance artifacts are PROPOSED / UNDER REFINEMENT.
- No separate v16.2.0 final report was located in the repository.
- Tier-2 and Tier-3 project-specific governance are not included in this repository. They are project-local.
