# Creative Writing Bolt-On — v16.0.0

**Package:** creative-writing-v16.0.0
**Tier:** Task-specific bolt-on
**Bolt-on identity:** Creative Writing (fiction, manuscript development, revision, evaluation, publishing)
**Authority Ceiling:** `cosyn-constitution-v16.0.0.md` and its Core subordinates
**Applicability:** Loaded only when a project's declared expertise scope includes creative writing.
**Status:** PROPOSED / READY FOR CREATOR REVIEW
**Generated:** 2026-08-13

---

## Overview

The Creative Writing bolt-on extends the CoSyn v16 Core with writing-specific governance for fiction, manuscript development, revision, evaluation, and publishing. It supplies:

- The full Writing Team Personas governance (seven professional personas).
- Fiction-specific control-boundary, state, and continuity models.
- Fiction-specific editing, critique, preservation, and conversion protocols.
- Fiction-specific PCR (Project Continuity Record) protocol and template, extending the Core PCR promotion framework.
- Fiction-specific recovery protocol, extending Core PTR §21 recovery semantics.
- A Writing Mode/Phase Registry (twelve fiction phases) that extends the Core Mode Registry.
- An Anti-AI Fiction Naturalness Standard (11 items) that extends the Core Anti-AI Signature Gate to fiction prose.
- Fiction-specific session initialization, bind template, project/workflow profile schemas, and default templates.
- Subordinate reference material (Bookfox Batch 03 purview reference, excluded-runtime-concepts, legacy CfW implementation report, legacy CfW source lineage, generic first manuscript draft protocol reference).

## Boundary with Core

Core owns the constitutional root and the universal subordinate specifications. This bolt-on:

- MUST NOT restate, fork, weaken, override, or compete with Core governance.
- MUST declare Core dependency for each extended capability.
- Fails closed at composition time if it attempts to duplicate a Core-owned capability, extend a capability that Core does not authoritatively own, or weaken any Core rule.

## Bolt-On Membership

### Normative active-governance artifacts

- `writing-team-personas-v16.0.0.md` — full seven-persona writing governance (active governance).
- `fiction-control-boundary-model-v16.0.0.md` — controller categories, agency scopes, handoff rules, character-voice discipline.
- `fiction-state-model-v16.0.0.md` — fiction state classification, source separation, materiality, counters, continuity precedence.
- `writing-editing-critique-preservation-conversion-v16.0.0.md` — fiction editorial protocol families.
- `anti-ai-fiction-naturalness-v16.0.0.md` — 11-item fiction naturalness standard extending Core anti-AI gate.
- `fiction-pcr-protocol-v16.0.0.md` — twenty-section fiction PCR schema extending Core PCR promotion framework.
- `fiction-recovery-protocol-v16.0.0.md` — fiction recovery protocol extending Core PTR §21.
- `fiction-session-initialization-v16.0.0.md` — writing-session initialization instructions.
- `writing-mode-registry-v16.0.0.md` — twelve fiction phases extending Core Mode Registry.

### Schemas

- `schemas/fiction-project-profile-schema-v16.0.0.md`
- `schemas/fiction-workflow-profile-schema-v16.0.0.md`

### Templates (on-demand)

- `templates/default-generic-fiction-profile-v16.0.0.md`
- `templates/default-generic-workflow-profile-v16.0.0.md`
- `templates/fiction-pcr-template-v16.0.0.md`

### Bind template

- `bind/creative-writing-bind-template-v16.0.0.json` — concrete v16-compliant bind template that binds Core + this bolt-on for a fiction-project session.

### Subordinate reference material

- `reference/bookfox-batch-03-purview-reference-v16.0.0.md` — 25 classified source records from Bookfox Batch 03, separated from the active persona governance per approved architectural decision.
- `reference/excluded-runtime-concepts-v16.0.0.md` — consolidated runtime-exclusion boundary.
- `reference/implementation-report-legacy-cfw-v1.0.1.md` — historical CfW v1.0.1 implementation report (preserved reference).
- `reference/source-lineage-legacy-cfw-v1.0.1.md` — historical CfW phase-1/2/3 lineage (preserved reference).
- `reference/Generic_First_Manuscript_Draft_Protocol_v1.0.0.docx` — writing-craft reference (binary; preserved verbatim from source).

### Package artifacts

- `creative-writing-package-manifest-v16.0.0.json` — package manifest per Core extension contract.
- `creative-writing-integrity-manifest-v16.0.0.json` — SHA-256 integrity hashes for all bolt-on files.
- `README-creative-writing-v16.0.0.md` — this file.

## Activation Model

- **Always-active core (of the bolt-on):** `writing-team-personas-v16.0.0.md`, `fiction-control-boundary-model-v16.0.0.md`, `fiction-state-model-v16.0.0.md`, `writing-mode-registry-v16.0.0.md`. Active whenever the bolt-on is loaded.
- **Phase-conditional:** `anti-ai-fiction-naturalness-v16.0.0.md` (fiction prose emission), `writing-editing-critique-preservation-conversion-v16.0.0.md` (Revision/Editing/Critique/Preservation Checkpoint/Conversion), `fiction-recovery-protocol-v16.0.0.md` (Correction/Rollback/Continuity Repair/Recovery), `fiction-pcr-protocol-v16.0.0.md` (PCR loading/handoff/audit).
- **Initialization-only:** `fiction-session-initialization-v16.0.0.md`, `creative-writing-package-manifest-v16.0.0.json`, `bind/creative-writing-bind-template-v16.0.0.json`.
- **Templates (on-demand):** `templates/*` and `schemas/*` when explicitly requested.
- **Reference (informative):** `reference/*` — consulted, never enforced.

## Applicability Declaration

This bolt-on is loaded only when the project's declared expertise scope includes creative writing (fiction, manuscript development, revision, evaluation, publishing).

A non-writing project MUST NOT receive this bolt-on. Loading this bolt-on into a non-writing project is a wrong-context bolt-on load and fails closed at composition time per `cosyn-v16-extension-contract-v16.0.0.md` §5.

## Non-Runtime Statement

This bolt-on is interpreted in-chat governance. It does not claim transactional persistence, atomic storage, exactly-once delivery, rollback guarantees, background processes, external API integration, or executable runtime enforcement outside the response-construction protocol.

## Provenance

Source basis: CoSyn-for-Writing v1.0.1 package (`D:\cosyn-gov\Chat-gov-files\Cosyn-for-writing-cfw\CoSyn_for_Writing_v1.0.0_InSession\package\package-v2`) plus the added-reference source `writing-team-personas-v2.2.0.md`. All CfW-side artifacts that duplicated Core governance (CGS_CfW, PersonaGovernor_CfW, StackArchitect_CfW, PTR_Specification_CfW, AntiAISignatureReview_CfW as fork, BindTemplate_CfW as v15 shape) were excluded from this bolt-on because Core owns those capabilities. Writing-specific artifacts were migrated with authority-header addition, dependency retargeting, and — for `writing-team-personas` — separation of the embedded Bookfox reference material.

Full derivation provenance is recorded in `../provenance/migration-provenance-map.json`.

---

*Document ID: README-creative-writing-v16.0.0 — PROPOSED / READY FOR CREATOR REVIEW — Generated 2026-08-13*
