# CoSyn Writing Bolt-on Governance (WBG) v1.1.0

**Status:** RATIFIED / CANONICAL  
**Required parent:** CoSyn CGS v16.3.3  
**Architecture:** Hierarchical WBG with independently versioned functional extensions

## Bind Order

1. Bind/validate CoSyn CGS v16.3.3.
2. Load `WBG-Root-Authority-v1.1.0.md`.
3. Load `WBG-Artifact-Registration-and-Sync-Contract-v1.0.1.md`.
4. Validate the registered WBG v1.0.0 base through `WBG-Base-Artifact-Registry-v1.0.1.json`.
5. Apply `WBG-Hierarchical-Bind-Profile-v1.0.0.json`.
6. Discover registered extensions through `WBG-Extension-Index-v1.0.1.json` and/or directly supplied conforming artifacts.
7. Activate only extensions whose trigger applies.
8. Apply project-specific writing governance beneath WBG.

## Hierarchy

`CoSyn CGS v16.3.3`
→ `WBG Root Authority`
→ `Registered WBG Base Governance`
→ `Registered WBG Functional Extensions`
→ `Project-Specific Writing Governance`
→ `Manuscript / Project Artifacts`

## Registered Base

The 11 original WBG v1.0.0 files are preserved byte-for-byte as the registered base.

Their older package manifest and bind template describe the v1.0.0 baseline only. They do not supersede this v1.1.0 Root, canonical package manifest, or hierarchical bind profile.

## Ratified Functional Extensions

- Anti-Plagiarism Check v1.0.3
- Anti-Plagiarism Gate v1.0.3
- Copyright Page Creator v1.0.2
- AI Use Disclosure Creator v1.0.2

## Extension Model

Future WBG extensions can be added without re-versioning unrelated WBG artifacts.

Every new extension must conform to the registration/sync contract and declare:

- exact versioned WBG URN;
- stable artifact family ID;
- capability ownership;
- authority/compatibility;
- dependencies and handoffs;
- activation conditions;
- external integrity.

## Package Control

Canonical package inventory:

`WBG-v1.1.0-Canonical-Package-Manifest-v1.0.0.json`

Canonical member integrity:

`WBG-v1.1.0-Canonical-Integrity-Manifest-v1.0.0.json`

Ratification/provenance:

`WBG-v1.1.0-Ratification-and-Provenance-Record-v1.0.0.md`

## Runtime Boundary

WBG governance operates only when its artifacts are actually available to the model/session. Self-registering artifacts do not autonomously load themselves from GitHub, disk, or another unavailable source.
