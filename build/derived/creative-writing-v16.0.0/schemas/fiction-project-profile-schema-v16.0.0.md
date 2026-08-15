<!--
CoSyn v16 Authority Header (added at derivation; original content follows unchanged)

Package: creative-writing-v16.0.0
Tier: Task-specific bolt-on
Role: Fiction project profile schema
Authority Level: task_specific_bolt_on
Authority Ceiling: cosyn-constitution-v16.0.0.md
Core dependencies: cosyn-constitution-v16.0.0.md, fiction-state-model-v16.0.0.md, fiction-control-boundary-model-v16.0.0.md
Source basis: FictionProjectProfileSchema_CfW_v1.0.1.md
Status: PROPOSED / READY FOR CREATOR REVIEW
Generated: 2026-08-13

Note: The interior content that follows is preserved verbatim from the source basis except as documented in provenance. Legacy CfW authority declarations, version references, and cross-references inside the interior content refer to the artifacts as they existed in the CoSyn-for-Writing v1.0.1 migration source. Under v16, this bolt-on binds Core (cosyn-constitution-v16.0.0.md and its subordinates) rather than any legacy CGS/CfW authority. This header supersedes any legacy authority declaration inside the interior content for v16 composition purposes.
-->
# FictionProjectProfileSchema_CfW — CoSyn for Writing Project Profile Schema, v1.0.1

## Artifact Identity

- **Artifact name:** FictionProjectProfileSchema_CfW
- **Artifact version:** 1.0.1
- **Package identity:** CoSyn_for_Writing_v1.0.1 (short: CfW)
- **Normative or informative status:** Normative
- **Source lineage:** Phase 2 `PROFILE_AND_WORKFLOW_ARCHITECTURE_CfW_v1.0.0.md` §2; Phase 1 requirement categories N (N-1..N-4), M (M-1..M-3).
- **Authority level:** Tier 4 (schema is CfW-normative). A ratified project profile authored against this schema sits at tier 5 (see `CGS_CfW_v1.0.1.md` §2).
- **Ratification status:** Proposed — pending user ratification.
- **Session status:** Unbound; inactive; not loaded into any live fiction session.
- **Compatibility scope:** CGS v15.0.1; CfW v1.0.1; the schema is neutral about model, tool, or platform.
- **Supersession intent:** Supersedes the corresponding v1.0.0 artifact; preserves all unaffected v1.0.0 provisions.
- **Generation timestamp:** 2026-08-02

## Mandatory Statements

This artifact defines in-session instruction governance only. It does not define or claim runtime enforcement, external persistence, telemetry, storage, deployment, or executable behavior.

This artifact has no normative dependency on The Roatan Amulet, CCBNS, or any project-specific fiction package.

## Standing Scope Disclaimers

1. CfW is not a runtime, software, or executable enforcement system.
2. CfW makes no claim of transactional persistence, atomic storage, exactly-once delivery, or rollback.
3. CfW does not claim automatic cross-session memory or automatic restoration.
4. CfW does not run background processes, services, or daemons.
5. CfW does not integrate with APIs, tools, or external ledgers.
6. In-session governance is a protocol the model applies inside its own response construction; the words "gate" and "ledger" are terms of art with no runtime connotation.

---

## 1. Definition

A **Project Profile** is a portable, user-authored, user-ratified in-session artifact that supplies project-scope configuration (canon, roster, resources, boundaries) for one fiction project. It sits at authority tier 5. It MUST NOT override higher tiers. It MUST NOT be bundled with a workflow profile (see §7).

## 2. Ownership

The user owns the project profile. Only user ratification creates or amends it. The model MAY propose edits; only user ratification changes it.

## 3. Required Sections

A project profile MUST contain the following sections in the order below.

### 3.1 Identity
- Project name.
- Project package identifier (project-owned).
- Profile version.
- Profile authoring timestamp.

### 3.2 Constitutional inheritance declaration
- Explicit statement that the project inherits CGS by version (e.g., "CGS v15.0.1 inherited by reference").
- Explicit statement that the project inherits CfW by version (e.g., "CoSyn for Writing v1.0.1 inherited by reference").
- Explicit statement that the project profile creates no authority above tier 5 and does not override tiers 1–4.

### 3.3 Roster
- Enumeration of every named participant with, per participant:
  - Category assignment (Author-Controlled / Model-Controlled Supporting / Shared-NPC / External Narrator / Scene Director — per `FictionControlBoundaryModel_CfW_v1.0.1.md` §2).
  - Category holder (human name / model).
  - Voice-and-values summary (short, sufficient to differentiate voice from any other participant).

### 3.4 Accepted canon summary
- Compact list of Established / Approved canon at the profile's ratification point.
- One line per item; source-correction pointer for any item that supersedes a prior record.

### 3.5 Amendments log
- Ordered list of ratified amendments, each with:
  - Date.
  - One-line rationale.
  - Reference to the PTR ledger ratification record.

## 4. Optional Sections

The following sections MAY be included if the project needs them.

### 4.1 Sole-authority-over-resource assignments
- Per assignment: named resource, sole-authority holder (a named participant from the roster), definition of "consent recorded in-turn" for this resource type (per `FictionControlBoundaryModel_CfW_v1.0.1.md` §5).

### 4.2 Rejected material list
- Per rejected item: compact identifier, source-correction pointer, one-line reason.
- Rejection guards are project-authored; the CfW generic core does not enumerate any rejection.

### 4.3 Intentionally-Undefined items
- Per item: identifier, scope, rationale (why the matter is designated organic or unspecified).

### 4.4 Initiation-canon reference
- Reference to a separate initiation-canon artifact (project-profile-owned; naming is project-owned). The initiation-canon artifact sits at tier 7. It MUST NOT create tier 4 authority.

## 5. Prohibited Content

A project profile MUST NOT contain:

- Any override of tiers 1–4.
- Any workflow behavior (turn shape, cadence, phase transitions, integration order, authorized-exception declarations) — these belong exclusively in a workflow profile.
- Any authorized-exception declaration (workflow-profile-scope only).
- Any implementation instruction for a specific model, tool, or platform.
- Any tier-3–7 rule stated as being active without an explicit ratification record.
- Any content from another project (cross-project isolation, I-11).

## 6. Activation and Amendment

- **Activation.** Explicit user act at session initialization (see `SessionInitialization_CfW_v1.0.1.md`). Silent activation is a Class 0 failure.
- **Amendment.** Explicit user ratification act. Amendment produces a linked supersession record; prior version remains available.
- **Version pinning.** Activation records the profile version. A session MUST NOT silently swap profile versions mid-session.

## 7. Separation from Workflow Profile

Project profile and workflow profile are separate artifact classes with distinct schemas. Bundling is prohibited in CfW v1.0.1 because bundling structurally hinders replacing one without altering the other and structurally hinders preventing workflow-scope content from silently escalating into project-scope authority. Any single artifact that carries both project-schema fields and workflow-schema fields is a Class 0 architectural failure.

## 8. Isolation

- No project profile MAY inject content into another project's working state (M-1, M-2, M-3, I-11).
- Cross-project reference is permitted only via explicit user routing and source identification.
- Loading two project profiles into the same session simultaneously is a Class 1 failure (surface for user disambiguation) unless the workflow profile explicitly authorizes a cross-project scenario and the user has ratified that scenario.

## 9. Ratification Discipline

Per `CGS_CfW_v1.0.1.md` §6:

- Explicit user act (in-session or via a ratification statement loaded at initialization).
- Named item, named version, tier declared.
- Recorded in the current PTR record.
- MUST NOT be inferred from user silence, thanks, testing, or continued engagement.

Ratification records are immutable. The model cannot self-ratify.

## 10. Failure Classes

**Class 0:**
- Silent activation, amendment, or replacement of a project profile.
- Project profile asserting tier ≥ 3 authority.
- Bundling project and workflow scope into a single artifact.
- Roster entry with no category assignment.
- Missing constitutional inheritance declaration.

**Class 1:**
- Two project profiles loaded simultaneously without explicit cross-project ratification.
- Roster entry with insufficient voice-and-values summary to satisfy character-voice differentiation.
- Amendments log with an entry missing the PTR ratification-record reference.

## 11. Cross-References

- Constitutional ordering and ratification discipline: `CGS_CfW_v1.0.1.md`.
- Controller categories, agency scopes, sole-authority discipline: `FictionControlBoundaryModel_CfW_v1.0.1.md`.
- Workflow-scope schema: `FictionWorkflowProfileSchema_CfW_v1.0.1.md`.
- Blank template: `DefaultGenericFictionProfile_CfW_v1.0.1.md`.
- Session initialization: `SessionInitialization_CfW_v1.0.1.md`.

---

*End of FictionProjectProfileSchema_CfW_v1.0.1 — Proposed — pending user ratification*
