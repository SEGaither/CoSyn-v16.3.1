---
artifact_id: urn:cosyn:wbg:readme:1.0.0
artifact_title: Writing Bolt-on Governance (WBG) v1.0.0
artifact_version: 1.0.0
package_id: urn:cosyn:wbg:package:1.0.0
package_version: 1.0.0
artifact_type: General / non-normative guide
status: PROPOSED / READY FOR USER REVIEW
parent_governance: CoSyn CGS v16.3.3
parent_source: https://github.com/SEGaither/CoSyn/tree/v16.3.3/CoSyn-v16.3.3
internet_dependency: required for source-validation and remote professional-reference retrieval
---

# Writing Bolt-on Governance (WBG) v1.0.0

**Package status:** PROPOSED / READY FOR USER REVIEW  
**Required parent governance:** CoSyn CGS v16.3.3  
**Canonical parent source:** `https://github.com/SEGaither/CoSyn/tree/v16.3.3/CoSyn-v16.3.3`

## Purpose

WBG is a generic writing-governance bolt-on for CoSyn CGS v16.3.3. It supports writing, manuscript development, revision, evaluation, and project-specific writing governance across fiction, nonfiction, memoir, essays, technical/manual writing, business writing, screenwriting, and other forms.

WBG does not replace CGS. It extends CGS for writing work while preserving User authorship authority and the approved **User Artistic Authority** mechanism for deliberate artistic choices.

## Internet requirement

**An internet connection is required for full/proper WBG operation.**

Internet access may be required to:

1. source-validate CoSyn CGS v16.3.3 from its canonical tagged GitHub Core before WBG binding; and
2. retrieve the remote Bookfox professional-reference corpus when a Writing Team persona determines that reference material is materially useful.

The Bookfox corpus is **not included in this ZIP**. It is resolved relative to the GitHub repository from which WBG is bound:

`references/writing-team-reference-corpus.md`

If required reference material cannot be reached, WBG must not fabricate or reconstruct it. The task may continue only if it can be completed without that reference; otherwise the reference dependency must be surfaced to the User.

When an output materially relies on Bookfox reference material, Bookfox must be cited as the professional reference source.

## Mandatory bind order

1. Source-validate and bind CoSyn CGS v16.3.3.
2. Validate WBG v1.0.0 package membership and integrity.
3. Bind WBG.
4. On the **next turn**, begin the mandatory Project Governance Q&A.

WBG fails closed if the parent bind cannot be proven.

## Project Governance Q&A

The mandatory Project Governance Q&A configures governance only. It is not a manuscript-development interview.

It terminates immediately when all required governance fields are in one of these states:

- `RESOLVED`
- `NOT APPLICABLE`
- `USER-DEFERRED — NONBLOCKING`

At termination, WBG creates a project-specific writing-governance ZIP containing **only artifacts actually specialized or modified by setup/Q&A**, plus package-specific manifests created for that ZIP. Irrelevant generic or fiction-specific artifacts are omitted.

Project-specific governance artifacts begin at `v1.0.0`.

The user should be advised to save the resulting ZIP in that writing project's **Project Files**.

## Optional development Q&A

After governance setup, the User may separately invoke Creative Development Q&A. For fiction, Story Development Q&A examples include:

- `Develop this character(s) through Q&A.`
- `Work out the plot through Q&A.`
- `Develop the ending through Q&A.`
- `Build the chapter structure through Q&A.`

Development Q&A is objective-scoped and may not automatically expand into additional development stages.

## Canonical package members

The package contains 11 canonical members:

1. `README-WBG-v1.0.0.md`
2. `writing-governance-and-authority-v1.0.0.md`
3. `Writing-Team-Personas-v2.3.1-canonical.md`
4. `writing-operation-state-and-revision-control-v1.0.0.md`
5. `writing-user-artistic-authority-v1.0.0.md`
6. `writing-package-manifest-v1.0.0.json`
7. `writing-integrity-manifest-v1.0.0.json`
8. `writing-voice-style-and-naturalness-v1.0.0.md`
9. `writing-diagnostic-and-evaluation-protocol-v1.0.0.md`
10. `writing-project-workbook-template-v1.0.0.md`
11. `writing-bind-template-v1.0.0.json`

The Writing Team Personas artifact retains its independently approved version `v2.3.1`; it is a pinned canonical dependency/member and is not renumbered to match WBG.

## Telemetry and provenance

WBG creates no independent telemetry system. CGS remains the owner of any Core telemetry behavior.

WBG **does require writing provenance** where material: source lineage, user decisions, author directives, revision/change records, User Artistic Authority decisions, project-specific governance derivation, and package integrity records.

## Authority

This README is explanatory. Normative authority resides in the package's governance artifacts and in the required parent CoSyn CGS v16.3.3.
