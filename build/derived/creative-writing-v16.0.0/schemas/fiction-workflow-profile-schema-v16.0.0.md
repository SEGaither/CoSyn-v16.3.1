<!--
CoSyn v16 Authority Header (added at derivation; original content follows unchanged)

Package: creative-writing-v16.0.0
Tier: Task-specific bolt-on
Role: Fiction workflow profile schema
Authority Level: task_specific_bolt_on
Authority Ceiling: cosyn-constitution-v16.0.0.md
Core dependencies: cosyn-constitution-v16.0.0.md, writing-mode-registry-v16.0.0.md
Source basis: FictionWorkflowProfileSchema_CfW_v1.0.1.md
Status: PROPOSED / READY FOR CREATOR REVIEW
Generated: 2026-08-13

Note: The interior content that follows is preserved verbatim from the source basis except as documented in provenance. Legacy CfW authority declarations, version references, and cross-references inside the interior content refer to the artifacts as they existed in the CoSyn-for-Writing v1.0.1 migration source. Under v16, this bolt-on binds Core (cosyn-constitution-v16.0.0.md and its subordinates) rather than any legacy CGS/CfW authority. This header supersedes any legacy authority declaration inside the interior content for v16 composition purposes.
-->
# FictionWorkflowProfileSchema_CfW — CoSyn for Writing Workflow Profile Schema, v1.0.1

## Artifact Identity

- **Artifact name:** FictionWorkflowProfileSchema_CfW
- **Artifact version:** 1.0.1
- **Package identity:** CoSyn_for_Writing_v1.0.1 (short: CfW)
- **Normative or informative status:** Normative
- **Source lineage:** Phase 2 `PROFILE_AND_WORKFLOW_ARCHITECTURE_CfW_v1.0.0.md` §§3, 4, 6, 8; Phase 2 `AUTHORITY_MODEL_CfW_v1.0.0.md` §7; Phase 2 `PRESENTATION_AND_SILENT_GOVERNANCE_ARCHITECTURE_CfW_v1.0.0.md` §§3, 4; Phase 1 requirement categories O (O-1..O-3), Q (Q-1..Q-4).
- **Authority level:** Tier 4 (schema is CfW-normative). A ratified workflow profile authored against this schema sits at tier 6.
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

A **Workflow Profile** is a portable, user-authored, user-ratified in-session artifact that supplies workflow-scope configuration (phase enumeration, transition matrix, turn shape, integration order, cadence, artifact rendering, authorized-exception declarations) for one fiction project. It sits at authority tier 6. It MUST NOT create independent authority; it MAY only specialize behavior that CGS + CfW + the referenced project profile already permit.

## 2. Ownership

The user owns the workflow profile. Only user ratification creates or amends it.

## 3. Required Sections

A workflow profile MUST contain the following sections.

### 3.1 Identity
- Profile name.
- Profile package identifier (workflow-owned).
- Profile version.
- Reference to the project profile it accompanies (project profile name + version).
- Profile authoring timestamp.

### 3.2 Constitutional inheritance declaration
- Explicit statement that the workflow profile inherits CGS by version.
- Explicit statement that the workflow profile inherits CfW by version.
- Explicit statement that the workflow profile inherits the referenced project profile.
- Explicit statement that the workflow profile creates no authority above tier 6.

### 3.3 Phase enumeration
- Which phases from the twelve-phase minimum set (see `ModeRegistry_CfW_v1.0.1.md` §5) this workflow uses.
- Any project-scoped naming for phases (optional; the mapping to the canonical phase name MUST be explicit).

### 3.4 Phase-transition matrix
- Which transitions are permitted between the enumerated phases and what triggers them (user command, workflow event, scheduled checkpoint).
- MUST NOT widen the reference matrix in `ModeRegistry_CfW_v1.0.1.md` §6. MAY narrow it.

### 3.5 Turn shape
- Default shape of a turn per phase (e.g., "one meaningful story beat + substantive creative handoff" in Active Simulation; "review-only, no artifact change" in Critique).

### 3.6 Integration order
- Where the user-contribution integration check runs in the turn (default: pre-emission for Active Simulation and Early Canon Development).
- The generic integration-failure identifier used by this profile (default: `INTEGRATION_CHECK_FAILURE`; the profile MAY rename via ratified declaration).

### 3.7 Handoff rules
- Constraints on handoff wording per `FictionControlBoundaryModel_CfW_v1.0.1.md` §10.
- Handoff is a creative opening, not a selectable action list (except when the workflow profile explicitly declares an administrative decision moment).

### 3.8 Authorized-exception declarations
- One or more ratified declarations narrowing specific gate surfacing behaviors (§6 below).
- The workflow profile is the sole locus of these declarations.

### 3.9 Mode-to-phase mapping
- Which registered modes (per `ModeRegistry_CfW_v1.0.1.md` §3) are available in which phases.

### 3.10 Artifact rendering timing
- For each artifact class the workflow uses: when it is rendered (per turn / on user request / on checkpoint firing / at phase transition).

### 3.11 Conditional-artifact activation declaration
- Explicit adoption of the phase-to-artifact activation map in `ModeRegistry_CfW_v1.0.1.md` §9, or a narrower phase set that preserves every required artifact for each retained phase.
- Explicit statement that conditional artifacts deactivate on phase or operation exit unless the next phase also requires them.
- Explicit statement that unavailable required artifacts block the affected operation.

### 3.12 Amendments log
- Ordered list of ratified amendments with dates and one-line rationale.

## 4. Optional Sections

### 4.1 Uncertainty resolution
- Optional definition of an uncertainty-resolution flow per `FictionControlBoundaryModel_CfW_v1.0.1.md` §7. Method choice is workflow-profile-owned; CfW imposes no specific method.

### 4.2 Preservation cadence
- Optional configurable turn-count preservation trigger per `FictionStateModel_CfW_v1.0.1.md` §8. CfW core defines no default numeric value.

### 4.3 CRC configuration
- If the project generates a Compact Resume Companion alongside PCRs, workflow-profile-owned rules for when to produce it.

## 5. Prohibited Content

A workflow profile MUST NOT contain:

- Any override of tiers 1–5.
- Any project canon (belongs to project profile).
- Any character or resource enumeration (belongs to project profile).
- Any authority-creation language (a workflow profile specializes; it does not establish tiers).
- Any implementation instruction for a specific model, tool, or platform.
- Any declaration that suppresses a conditional artifact required by the phase-to-artifact activation map.
- A trigger policy for PCR that enables `automatic-on-eos` or `both` (see `PCR_Protocol_CfW_v1.0.1.md` §2).

## 6. Authorized-Exception Declaration Surface

The workflow profile is the sole authorized surface for narrowing gate surfacing behaviors. Each declaration MUST include:

- **Gate name** (e.g., "Presentation Gate — Persona Header").
- **Specific surfacing behavior narrowed** (e.g., "persona-header surfacing on user-facing snapshots is suppressed").
- **Specific phase(s) or turn types** in which the narrowing applies.
- **Preserved evaluation clause** — explicit statement that the underlying gate evaluation is preserved (silent governance is not absence of governance).
- **Q-2 suspension clause** — enumeration of Q-2 surface conditions under which the narrowing is suspended for that turn (see `PersonaGovernor_CfW_v1.0.1.md` §3.3).
- **Tier-1 / tier-2 rescission clause** — explicit statement that a tier-1 or tier-2 override rescinds the narrowing for the affected turn.

An authorized-exception declaration MUST NOT narrow:

- A Class 0 halt behavior.
- A required refusal.
- An explicit audit request.
- A required user decision surface.

## 7. Two Default Authorized-Exception Declarations

Every CfW workflow profile that produces ordinary fiction output MUST ratify the two default declarations below (or explicitly opt out for a documented reason).

### 7.1 Persona-Header Suppression

- **Gate:** CGS Presentation Gate — Persona Header.
- **Behavior narrowed:** persona-header / router-header surfacing on user-facing finalized snapshots.
- **Phases:** Active Simulation, Early Canon Development, Revision output, Editing output, Conversion output, Preservation Checkpoint output.
- **Preserved evaluation:** persona/router routing evaluation continues internally and is recorded in the PTR record.
- **Q-2 suspension:** narrowing is suspended for any turn meeting any Q-2 condition.
- **Tier-1 / tier-2 rescission:** live-turn user request for headers overrides the narrowing.

### 7.2 Option-Labeling Suppression

- **Gate:** CGS Presentation Gate — Option Labeling.
- **Behavior narrowed:** A/B/C labeling on creative-handoff wording (scene openings that invite the user to author the next beat).
- **Phases:** Active Simulation (and Drafting-adjacent workflows where creative handoff applies).
- **Preserved evaluation:** administrative decision moments (a selectable action list where the user is being asked to pick among enumerated alternatives) continue to receive labeling per CGS.
- **Boundary rule:** if a specific turn's handoff wording could reasonably read as either a creative handoff or an administrative decision moment, default to creative-handoff treatment (labeling suppressed) and surface a minimal clarification only if the ambiguity itself is material.
- **Q-2 suspension:** narrowing is suspended for any turn meeting any Q-2 condition.
- **Tier-1 / tier-2 rescission:** live-turn user request for labeled options overrides the narrowing.

## 8. Reference Workflow-Profile Shapes (Informative)

Three reference shapes inform bespoke workflow-profile authoring. They are not authorities. A workflow profile is not required to derive from any of them.

- **Collaborative Narrative Simulation** — one or more human authors co-simulate with the model as supporting-cast router (voicing Model-Controlled Supporting Characters per `FictionControlBoundaryModel_CfW_v1.0.1.md` §2). Active Simulation is dominant; integration-check pre-emission every turn; handoff is a creative opening; both default authorized-exception declarations ratified; preservation-checkpoint cadence declared per project need.
- **Solo-Author Draft** — single human author drafts long-form fiction with the model assisting; no live simulation. Drafting-equivalent and Revision phases dominate; integration-check pre-emission for drafting; both default authorized-exception declarations ratified; preservation is per-chapter rather than per-turn.
- **Critique / Review-Only** — existing artifact is being reviewed. Critique Phase only; no Simulation; no Drafting; no artifact modification; both default authorized-exception declarations OFF (critique output benefits from structural clarity); incorporation of critique requires an explicit transition into a different workflow profile.

The default shipped workflow profile (`DefaultGenericWorkflowProfile_CfW_v1.0.1.md`) is a Collaborative-Narrative-Simulation shape.

## 9. Project Profile ↔ Workflow Profile Relationship

- Every workflow profile references exactly one project profile (identity + version).
- A project profile MAY be used with multiple workflow profiles across sessions.
- Loading a workflow profile that references a non-loaded project profile is a Class 1 failure (surface: request the project profile be loaded first).
- Loading a workflow profile that references a project profile at a version other than the loaded version is a Class 1 failure (surface: request user resolution — accept the loaded version, load the referenced version, or cancel).

## 10. Activation, Amendment, Replacement

- Activation is an explicit user act at session initialization or at an explicit in-session workflow-profile-change ratification.
- Only one workflow profile is active per session. Workflow-profile change mid-session is a material event and produces a phase-transition record if phases change.
- A workflow profile MAY be replaced per project without touching the generic core or the project profile.
- Silent activation, amendment, or replacement is a Class 0 failure.

## 11. Ratification Discipline

Per `CGS_CfW_v1.0.1.md` §6: explicit user act, named item + version + tier, PTR-recorded, not inferred. Ratification records are immutable. The model cannot self-ratify.

## 12. Failure Classes

**Class 0:**
- Silent activation, amendment, or replacement of a workflow profile.
- Workflow profile asserting tier ≥ 5 authority.
- Bundling project and workflow scope into a single artifact.
- Authorized-exception declaration narrowing a Class 0 halt, required refusal, explicit audit request, or required user decision surface.
- Workflow profile enabling `automatic-on-eos` or `both` PCR trigger policy.
- Widening the reference phase-transition matrix.
- Suppressing a conditional artifact required for a retained phase.

**Class 1:**
- Version-mismatch between workflow profile's project-profile reference and the loaded project profile.
- Loading a workflow profile without its referenced project profile.
- Authorized-exception declaration missing a required clause (§6).
- Reference-shape adoption that omits a required schema section without user acknowledgment.
- Conditional-artifact activation declaration missing deactivation or unavailable-artifact halt behavior.

## 13. Cross-References

- Constitutional ordering: `CGS_CfW_v1.0.1.md`.
- Enforcement roles: `PersonaGovernor_CfW_v1.0.1.md`, `StackArchitect_CfW_v1.0.1.md`.
- Phase set, transition matrix: `ModeRegistry_CfW_v1.0.1.md`.
- Project-scope schema: `FictionProjectProfileSchema_CfW_v1.0.1.md`.
- State, materiality, uncertainty boundary: `FictionStateModel_CfW_v1.0.1.md`.
- Control boundaries, handoff, agency: `FictionControlBoundaryModel_CfW_v1.0.1.md`.
- Blank template: `DefaultGenericWorkflowProfile_CfW_v1.0.1.md`.

---

*End of FictionWorkflowProfileSchema_CfW_v1.0.1 — Proposed — pending user ratification*
