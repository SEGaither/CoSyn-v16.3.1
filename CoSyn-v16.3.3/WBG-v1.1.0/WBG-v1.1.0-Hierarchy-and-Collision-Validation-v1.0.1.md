# WBG v1.1.0 — Hierarchy and Collision Validation v1.0.1

**Result:** PASS — RATIFIED / CANONICAL VALIDATION  
**Ratification:** RATIFIED / CANONICAL  
**Actual v1.0.0 baseline artifacts read:** 11/11

## Baseline Verification

Uploaded ZIP SHA-256:

`ddd5c72ae0e8dbc6429480149e2034e809b7956097c826a37e05f18420a03e92`

Historical canonical ZIP SHA-256 from ratification provenance:

`91ffbb843cc93db968fad5b40f66217113a040833726ce0aef4f03741333b0ac`

The outer ZIP hashes do **not** match.

That means this upload is not byte-for-byte the historical ZIP container. ZIP recompression/repacking can change that container hash.

Inside the uploaded ZIP:

- expected members: 11;
- actual members: 11;
- exact expected filenames: PASS;
- files covered by `writing-integrity-manifest-v1.0.0.json`: 10/10 PASS;
- integrity-manifest SHA-256: `f8ca080e98f8d8ef8e190475a3432cd7f2ba3b657249cd4ae57cb4ea32877a5e`;
- deterministic 11-member content fingerprint: `37ff43471c8b21756319ff5d9c603654bc56780b87176817a031e6d7691c4b98`.

WBG v1.1.0 therefore uses member-content identity for baseline compatibility if the Creator ratifies this transition. The historical outer ZIP hash remains v1.0.0 archive provenance.

## Collision Audit

### C01 — Resolved

**Issue:** Candidate r1 used stable non-URN artifact_id values, conflicting with WBG v1.0.0's required versioned URN convention.

**Disposition:** v1.0.1 sync contract keeps versioned artifact_id and adds artifact_family_id for stable cross-version identity.

### C02 — Resolved

**Issue:** The v1.0.0 bind template validates an exact 11-member v1.0.0 package and cannot by itself bind the new hierarchy/extensions.

**Disposition:** Added Hierarchical Bind Profile wrapper; the legacy bind template remains baseline owner and is not modified.

### C03 — Resolved

**Issue:** Candidate r1 Anti-Plagiarism Check and Gate had circular required dependencies.

**Disposition:** Check has no Gate dependency; Gate depends one-way on Check.

### C04 — Resolved

**Issue:** Check/Gate body capability names did not exactly match their registration capability names.

**Disposition:** Standardized on writing.originality.source-comparison-check and writing.originality.pre-emission-gate.

### C05 — No collision

**Issue:** Existing Source/Authorship and provenance rules overlap conceptually with anti-plagiarism.

**Disposition:** No ownership conflict: baseline owns source/authorship/provenance discipline; anti-plagiarism owns source-comparison classification and originality disposition.

### C06 — No collision

**Issue:** Publisher persona and Publisher diagnostic cover publication readiness and pre-publication checks.

**Disposition:** No ownership conflict: those are advisory evaluation/purview functions; Copyright Page Creator and AI Use Disclosure Creator own concrete publication artifact generation.

### C07 — No collision after clarification

**Issue:** User Artistic Authority could be misread as allowing an originality gate result to be artistically overridden.

**Disposition:** Gate now states User Artistic Authority cannot falsify provenance, remove required attribution, or turn known source dependence into an originality PASS.

## Actual Baseline Review Result

No unresolved capability collision remains between the actual WBG v1.0.0 base and the four new functional extensions.

The baseline's:

- source/authorship discipline remains upstream of anti-plagiarism;
- provenance ownership remains upstream evidence for AI disclosure;
- Publisher persona remains advisory and does not own copyright-page or disclosure generation;
- baseline bind template remains the v1.0.0 binder beneath the new hierarchical wrapper;
- User Artistic Authority remains intact but cannot falsify source provenance or gate disposition.

## Editor → Publisher Recheck

**Editor:** PASS. The ratified package conforms to the actual baseline metadata/identity rules and resolves the binding/dependency defects exposed by direct baseline review.

**Publisher:** PASS. No unresolved publication-function collision remains.

## Ratification

The User explicitly ratified WBG v1.1.0 on 2026-08-17.

The validated hierarchy, registered v1.0.0 baseline, hierarchical bind wrapper, sync/registration contract, and four functional extensions are canonical under this package.
