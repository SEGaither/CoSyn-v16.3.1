# WBG v1.1.0 Ratification and Provenance Record — v1.0.0

**WBG version:** 1.1.0  
**Status:** RATIFIED / CANONICAL  
**Ratified:** 2026-08-17T17:11:00-05:00  
**Required parent governance:** CoSyn CGS v16.3.3

## 1. Ratification Event

The User explicitly directed creation of a:

`full hierarchy compliant, ratified wbg zip`

That instruction ratifies WBG v1.1.0 and authorizes creation of the canonical package represented by this record.

## 2. Supersession

WBG v1.1.0 supersedes WBG v1.0.0 as the active canonical WBG package architecture.

WBG v1.0.0 remains preserved inside v1.1.0 as the immutable registered base layer and retains historical/provenance value.

No unchanged v1.0.0 baseline file was rewritten merely to introduce the hierarchy.

## 3. Parent Governance

WBG v1.1.0 requires and pins:

`CoSyn CGS v16.3.3`

WBG versioning remains independent from CGS versioning.

## 4. Hierarchy Ratified

The canonical hierarchy is:

`CoSyn CGS v16.3.3`
→ `WBG Root Authority v1.1.0`
→ `Registered WBG v1.0.0 Base Governance`
→ `Registered WBG Functional Extensions`
→ `Project-Specific Writing Governance`
→ `Manuscript / Project Artifacts`

## 5. Self-Registering Extension Model

WBG v1.1.0 ratifies the Artifact Registration and Sync Contract.

New WBG artifacts may evolve independently when they:

- declare a versioned WBG URN;
- declare a stable artifact family ID;
- identify capabilities;
- identify authority ceiling and minimum compatible WBG Root;
- identify dependencies, handoffs, conflicts, and activation conditions;
- pass integrity and capability-ownership validation.

A new extension does not force unrelated WBG artifacts to receive new versions.

Self-announcement is not self-loading. The artifact must actually be available to the active session/context.

## 6. Registered Functional Extensions

Ratified with this package:

- WBG Anti-Plagiarism Check v1.0.3
- WBG Anti-Plagiarism Gate v1.0.3
- WBG Copyright Page Creator v1.0.2
- WBG AI Use Disclosure Creator v1.0.2

## 7. Baseline Verification

The User supplied an 11-member WBG v1.0.0 archive for direct review.

Historical canonical v1.0.0 ZIP SHA-256:

`91ffbb843cc93db968fad5b40f66217113a040833726ce0aef4f03741333b0ac`

The supplied archive's outer ZIP hash differed from that historical archive hash, but:

- all 11 expected WBG v1.0.0 members were present;
- all 10 files covered by the internal integrity manifest matched their declared SHA-256 values;
- all 11 actual baseline artifacts were read for the semantic collision audit.

WBG v1.1.0 therefore ratifies the verified 11-member content fingerprint as its baseline compatibility anchor:

`37ff43471c8b21756319ff5d9c603654bc56780b87176817a031e6d7691c4b98`

This does not alter the historical v1.0.0 archive provenance.

## 8. Collision Audit

Direct audit against the actual v1.0.0 baseline exposed and repaired:

- artifact-ID convention mismatch;
- legacy exact-11-member binding incompatibility with the new hierarchy;
- circular Anti-Plagiarism Check/Gate dependency;
- internal/registered capability-name mismatch;
- potential ambiguity between User Artistic Authority and originality-gate disposition.

Final result:

`PASS — no unresolved capability collision`

## 9. Canonical Package

Canonical package filename:

`WBG-v1.1.0-ratified.zip`

The package's ZIP SHA-256 is external to this record and is rendered with the completed artifact.

## 10. One-Line Record

**WBG v1.1.0 is RATIFIED / CANONICAL: hierarchical, CGS v16.3.3-bound, baseline-preserving, and independently extensible.**
