<!--
CoSyn v16 Authority Header (added at derivation; original content follows unchanged)

Package: creative-writing-v16.0.0
Tier: Task-specific bolt-on
Role: Writing mode and phase registry (twelve fiction phases, transition matrix, phase-to-artifact activation map)
Authority Level: task_specific_bolt_on_extending_core_mode_registry
Authority Ceiling: cosyn-constitution-v16.0.0.md
Core dependencies: cosyn-constitution-v16.0.0.md, mode-registry-v16.0.0.md (owns Core mode-registry schema and base mode set)
Source basis: ModeRegistry_CfW_v1.0.1.md
Status: PROPOSED / READY FOR CREATOR REVIEW
Generated: 2026-08-13

Note: The interior content that follows is preserved verbatim from the source basis except as documented in provenance. Legacy CfW authority declarations, version references, and cross-references inside the interior content refer to the artifacts as they existed in the CoSyn-for-Writing v1.0.1 migration source. Under v16, this bolt-on binds Core (cosyn-constitution-v16.0.0.md and its subordinates) rather than any legacy CGS/CfW authority. This header supersedes any legacy authority declaration inside the interior content for v16 composition purposes.
-->
# ModeRegistry_CfW — CoSyn for Writing Mode and Phase Registry, v1.0.1

## Artifact Identity

- **Artifact name:** ModeRegistry_CfW
- **Artifact version:** 1.0.1
- **Package identity:** CoSyn_for_Writing_v1.0.1 (short: CfW)
- **Normative or informative status:** Normative
- **Source lineage:** Phase 2 `MODE_AND_PHASE_ARCHITECTURE_CfW_v1.0.0.md` §§1–8; Phase 1 requirement categories P (P-1..P-5), O (O-1..O-3).
- **Authority level:** Tier 4 (ratified CfW governance).
- **Ratification status:** Proposed — pending user ratification.
- **Session status:** Unbound; inactive; not loaded into any live fiction session.
- **Compatibility scope:** CGS Mode Registry `mode_registry_v1.0.1` (pinned by reference); CGS v15.0.1; PTR-Spec v1.1.0.
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

## 1. Purpose

Declare CfW's distinction between **modes** (per-turn reasoning frames registered in the CGS Mode Registry) and **phases** (workflow-scope states owned by the workflow profile). Enumerate the minimum viable set of each and define the mapping and transition discipline.

Modes and phases are enforced by the Stack Architect (see `StackArchitect_CfW_v1.0.1.md` §§3–5). Mode selection is silent within ordinary fiction prose (see `PersonaGovernor_CfW_v1.0.1.md` §3.2).

## 2. Mode Discipline (Inherited by Reference from CGS)

- **P-1 — One mode per turn.** Mid-turn mode switching and mode mixing are prohibited. Violation is a Class 0 failure.
- **P-2 — Registered before use.** Unregistered modes are a Class 0 failure.
- **P-3 — Unconditional gate inheritance.** Every registered mode inherits every gate applied to default allowed modes. Registration schema forbids `bypass` / `exemption` / `override` / `gate_suppression` fields.

## 3. Modes Registered

CfW inherits the CGS Mode Registry **by version** (`mode_registry_v1.0.1`, pinned). The registered modes are:

| Mode identifier | CGS description scope | CfW fiction-workflow availability |
|---|---|---|
| `domain_insider` | Domain-expert framing. | Available for Critique / Review-Only phases when the domain is a specific real-world field (e.g., legal review of a manuscript with legal content). NOT available in drafting or simulation. |
| `risk_auditor` | Risk-audit framing. | Available for Critique phases. NOT used in drafting or simulation. |
| `compliance_platform_normative` | Platform-normative compliance framing. | Registered and inherited; never surfaced in fiction workflows. |
| `dual_track_labeled` | Two labeled framings. | Available for Critique phases (e.g., "author-intent reading" vs. "surface-text reading"). NOT used in drafting or simulation. |

CfW does not add modes to the registry. CfW does not remove any. A future CGS Mode Registry version becomes CfW-visible only via a CfW amendment that pins the new version.

**Silent-governance interaction.** Mode selection does not display a mode header inside ordinary fiction prose (see `PersonaGovernor_CfW_v1.0.1.md` §3.2). Mode is recorded in the PTR record.

## 4. MM (Minimal Mode) Output-Shape Command

The CGS Response Instructions **MM Mode** is an output-shape command that constrains response shape to minimal. It is not a fiction-workflow phase and not a Mode-Registry mode. It is a user command available in any phase and does not affect gate evaluation.

## 5. Minimum Phase Set (Twelve Phases)

Phases are workflow-scope states describing the kind of work the session is currently doing. A workflow profile MAY enumerate a subset (a Critique / Review-Only workflow uses only the Critique phase). A workflow profile MUST NOT add a phase outside this set without a ratified CfW amendment. A workflow profile MAY name phases with project-scoped labels.

| # | Phase | Purpose | Modal defaults | Emitted-artifact defaults |
|---:|---|---|---|---|
| 1 | **Session Initialization** | Deliberate load-and-declare phase at the start of a session. | None surfaced. | Load record; ratification records; Bootstrap Current PTR State. |
| 2 | **Early Canon Development** | Establishing initiation-canon (roster, world facts, starting state, sole-authority assignments). | Any registered mode; typically none surfaced. | Proposed canon → user ratification into Accepted Canon. |
| 3 | **Active Simulation** | Story turns advancing narrative through user contribution + model supporting-cast response (Model-Controlled Supporting Character routing per `FictionControlBoundaryModel_CfW_v1.0.1.md` §2). | None surfaced (silent). | Simulation prose; optional Proposed Canon; state records. |
| 4 | **Correction / Rollback** | Applying a fiction-continuity repair per `FictionStateModel_CfW_v1.0.1.md` §13. | None surfaced. | Correction record (Approved-Correction event); rerender; state markers. |
| 5 | **Revision** | Scoped delta against a last-approved canonical baseline. | None surfaced. | Revised Draft (delta only); baseline preserved verbatim outside scope. |
| 6 | **Editing** | CREATE / EDIT / REVIEW discipline on a source-controlled artifact. | None surfaced. | Edited artifact; regression-check output. |
| 7 | **Critique** | REVIEW-mode evaluation without changing the artifact. | `risk_auditor`, `dual_track_labeled`, `domain_insider` MAY be surfaced per profile. | Critique output (Critique class; tier 12); no artifact modification. |
| 8 | **Preservation Checkpoint** | Firing of a lossless-preservation checkpoint. | None surfaced. | Preservation record (verbatim; workflow-profile-owned artifact class). |
| 9 | **Conversion** | Format conversion of Approved Draft / Manuscript into another format. | None surfaced. | Formatted derivative artifact; source preserved. |
| 10 | **Continuity Repair** | Session-level continuity dispute resolution across preservation layers. | None surfaced. | Amendments to PTR/PCR; source stands. |
| 11 | **Recovery** | PTR-schema recovery. | None surfaced. | Recovery record; degraded-authorized handling on user authorization. |
| 12 | **PCR Handoff** | Deliberate creation of a PCR for a later session. | None surfaced. | PCR artifact; optional CRC. |

**Notes:**
- "None surfaced" means governance headers / mode headers / routing notices are suppressed by default (silent governance active). Q-2 surface conditions still surface as required.
- Critique is the only phase where mode-selection MAY be surfaced (analytical work benefits from labeled framing).
- Early Canon Development and Active Simulation are the two phases where the ordinary-fiction integration-check applies pre-emission.
- Correction/Rollback, Continuity Repair, and Recovery are non-collapsible recovery-family phases (see `StackArchitect_CfW_v1.0.1.md` §6, `RecoveryProtocol_CfW_v1.0.1.md`).

## 6. Reference Phase-Transition Matrix

The workflow profile enumerates permitted transitions. Below is the reference transition matrix used by the shipped default workflow profile. A bespoke workflow profile MAY narrow this matrix; it MUST NOT widen it.

**Legend:** ✓ = permitted transition; ✗ = prohibited unless explicitly declared; — = same phase (no transition).

|From \ To|Init|EarlyCanon|Sim|Correction|Revision|Editing|Critique|Preservation|Conversion|ContinuityRepair|Recovery|PCRHandoff|
|---|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|**Session Init**|—|✓|✓|✗|✗|✗|✓|✗|✗|✗|✗|✗|
|**Early Canon**|✗|—|✓|✗|✗|✗|✓|✗|✗|✗|✓|✓|
|**Active Simulation**|✗|✓|—|✓|✗|✗|✓|✓|✗|✓|✓|✓|
|**Correction / Rollback**|✗|✗|✓|—|✗|✗|✗|✗|✗|✓|✓|✗|
|**Revision**|✗|✗|✗|✗|—|✗|✓|✗|✗|✗|✓|✗|
|**Editing**|✗|✗|✗|✗|✓|—|✓|✗|✗|✗|✓|✗|
|**Critique**|✗|✗|✓|✗|✓|✓|—|✗|✗|✗|✓|✗|
|**Preservation Checkpoint**|✗|✗|✓|✗|✗|✗|✗|—|✗|✗|✓|✓|
|**Conversion**|✗|✗|✗|✗|✗|✓|✓|✗|—|✗|✓|✗|
|**Continuity Repair**|✗|✓|✓|✗|✗|✗|✗|✗|✗|—|✓|✗|
|**Recovery**|✓|✓|✓|✓|✓|✓|✓|✓|✓|✓|—|✓|
|**PCR Handoff**|✗|✓|✓|✗|✗|✗|✗|✗|✗|✗|✓|—|

**Reading the matrix.**
- Recovery may transition to any phase after successful recovery.
- Session Initialization may transition to Early Canon, Active Simulation, or Critique — the three natural starting phases.
- Active Simulation is the hub phase.
- Correction/Rollback returns to Simulation after correction is applied.
- Preservation Checkpoint returns to Simulation after preservation is produced.
- Conversion returns to Editing or Critique for defect-review.
- Correction/Rollback, Continuity Repair, and Recovery are distinct entry-and-exit patterns; the matrix keeps them non-collapsible.

**Transition triggers** are workflow-profile-owned (user command, workflow event, scheduled checkpoint, error trigger for Recovery). CfW core does not schedule transitions; there is no runtime scheduler.

## 7. Modes-vs-Phases Boundary Rule

- Modes describe the framing of a single response.
- Phases describe the current work of the session.
- One phase MAY host turns in different modes over its duration.
- One turn is in exactly one phase and exactly one mode.
- Mode change within a turn is prohibited (P-1). Phase change within a turn is prohibited (P-4).
- Mode change between turns is permitted if the mode is registered and available for the current phase (per the workflow profile).
- Phase change between turns is a material event and requires the transition matrix's permission.
- Critique output while remaining inside the Critique phase is non-material unless another material change occurs; entering or leaving Critique remains material.

## 8. Silent-Governance Interaction

- Phase headers are not displayed inside ordinary fiction prose.
- Mode headers are not displayed inside ordinary fiction prose.
- Phase transition is recorded in the PTR record's `state_delta` and reflected in Current PTR State's phase field.
- User-facing surfacing of a phase transition occurs only if the workflow profile requires user confirmation of the transition, or if a Q-2 surface condition applies.

## 9. Phase-to-Artifact Activation Map

The package uses a minimum-necessary activation model. The always-active core is declared in `Manifest_CoSyn_for_Writing_v1.0.1.json` and enforced by `StackArchitect_CfW_v1.0.1.md` §7. The table below lists additional package artifacts activated by phase.

| Phase | Additional artifact(s) activated | Deactivation point |
|---|---|---|
| Session Initialization | `SessionInitialization_CfW_v1.0.1.md`; manifest; profile schemas only if authoring or validating profiles | After Bootstrap Current PTR State is valid and the start phase is entered |
| Early Canon Development | `AntiAISignatureReview_CfW_v1.0.1.md` when narrative prose is emitted | On exit, unless next phase also generates or reviews fiction prose |
| Active Simulation | `AntiAISignatureReview_CfW_v1.0.1.md` | On exit, unless next phase also generates or reviews fiction prose |
| Correction / Rollback | `RecoveryProtocol_CfW_v1.0.1.md`; Anti-AI review only if corrected fiction prose is generated | After correction closes or phase changes |
| Revision | `Editing_Critique_Preservation_Conversion_CfW_v1.0.1.md`; `AntiAISignatureReview_CfW_v1.0.1.md` when prose is generated | On exit, subject to next-phase need |
| Editing | `Editing_Critique_Preservation_Conversion_CfW_v1.0.1.md`; `AntiAISignatureReview_CfW_v1.0.1.md` when prose is generated | On exit, subject to next-phase need |
| Critique | `Editing_Critique_Preservation_Conversion_CfW_v1.0.1.md`; `AntiAISignatureReview_CfW_v1.0.1.md` under its analytical adaptation | On exit |
| Preservation Checkpoint | `Editing_Critique_Preservation_Conversion_CfW_v1.0.1.md` | After preservation output and validation |
| Conversion | `Editing_Critique_Preservation_Conversion_CfW_v1.0.1.md` | After conversion output and inspection |
| Continuity Repair | `RecoveryProtocol_CfW_v1.0.1.md`; `PCR_Protocol_CfW_v1.0.1.md` only when PCR/CRC is a conflicting layer | After repair closes or phase changes |
| Recovery | `RecoveryProtocol_CfW_v1.0.1.md` | After recovery succeeds, fails to halt, or phase changes |
| PCR Handoff | `PCR_Protocol_CfW_v1.0.1.md`; `PCR_Template_CfW_v1.0.1.md` only when rendering the requested artifact | After PCR/CRC delivery and validation |

A workflow profile MAY narrow which listed phases it uses. It MUST NOT suppress a conditional artifact required for a phase it retains. An unavailable required artifact blocks that operation.

## 10. Failure Classes

**Class 0:**
- Mode mixing within a turn.
- Unregistered mode used.
- Silent phase transition.
- Phase transition prohibited by the workflow profile's matrix (or the CfW reference matrix if none declared).

**Class 1:**
- Ambiguous phase at emission (unclear whether a turn is Critique or Editing).
- Mode surfaced inside ordinary fiction prose (silent-governance leak).
- Mode change between turns to a mode not authorized in the current phase.

## 11. Cross-References

- Enforcement roles: `StackArchitect_CfW_v1.0.1.md`, `PersonaGovernor_CfW_v1.0.1.md`.
- State, materiality, continuity precedence: `FictionStateModel_CfW_v1.0.1.md`.
- Workflow-profile phase enumeration and matrix narrowing: `FictionWorkflowProfileSchema_CfW_v1.0.1.md`.
- Recovery-family phase definitions: `RecoveryProtocol_CfW_v1.0.1.md`.

---

*End of ModeRegistry_CfW_v1.0.1 — Proposed — pending user ratification*
