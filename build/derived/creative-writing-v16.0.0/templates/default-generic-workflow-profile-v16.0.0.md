<!--
CoSyn v16 Authority Header (added at derivation; original content follows unchanged)

Package: creative-writing-v16.0.0
Tier: Task-specific bolt-on
Role: Default generic workflow-profile template with conditional-artifact activation declaration
Authority Level: task_specific_bolt_on_template
Authority Ceiling: cosyn-constitution-v16.0.0.md
Core dependencies: schemas/fiction-workflow-profile-schema-v16.0.0.md
Source basis: DefaultGenericWorkflowProfile_CfW_v1.0.1.md
Status: PROPOSED / READY FOR CREATOR REVIEW
Generated: 2026-08-13

Note: The interior content that follows is preserved verbatim from the source basis except as documented in provenance. Legacy CfW authority declarations, version references, and cross-references inside the interior content refer to the artifacts as they existed in the CoSyn-for-Writing v1.0.1 migration source. Under v16, this bolt-on binds Core (cosyn-constitution-v16.0.0.md and its subordinates) rather than any legacy CGS/CfW authority. This header supersedes any legacy authority declaration inside the interior content for v16 composition purposes.
-->
# DefaultGenericWorkflowProfile_CfW — Default Workflow Profile Template (Collaborative Narrative Simulation shape), v1.0.1

## Artifact Identity

- **Artifact name:** DefaultGenericWorkflowProfile_CfW
- **Artifact version:** 1.0.1
- **Package identity:** CoSyn_for_Writing_v1.0.1 (short: CfW)
- **Normative or informative status:** Informative (template only). A specific workflow profile authored against this template acquires authority only through user ratification (tier 6).
- **Source lineage:** `FictionWorkflowProfileSchema_CfW_v1.0.1.md` §§3, 4, 6, 7, 8; Phase 2 `PROFILE_AND_WORKFLOW_ARCHITECTURE_CfW_v1.0.0.md` §3.4 (Collaborative Narrative Simulation reference shape).
- **Authority level:** None until ratified by a user for a specific project.
- **Ratification status:** Proposed — pending user ratification.
- **Session status:** Unbound; inactive; not loaded into any live fiction session.
- **Compatibility scope:** CGS v15.0.1; CfW v1.0.1.
- **Supersession intent:** Supersedes the corresponding v1.0.0 artifact; preserves all unaffected v1.0.0 provisions.
- **Generation timestamp:** 2026-08-02

## Mandatory Statements

This artifact defines in-session instruction governance only. It does not define or claim runtime enforcement, external persistence, telemetry, storage, deployment, or executable behavior.

This artifact has no normative dependency on The Roatan Amulet, CCBNS, or any project-specific fiction package. It contains no character name, no resource name, no scene name.

## Standing Scope Disclaimers

1. CfW is not a runtime, software, or executable enforcement system.
2. CfW makes no claim of transactional persistence, atomic storage, exactly-once delivery, or rollback.
3. CfW does not claim automatic cross-session memory or automatic restoration.
4. CfW does not run background processes, services, or daemons.
5. CfW does not integrate with APIs, tools, or external ledgers.
6. In-session governance is a protocol the model applies inside its own response construction; the words "gate" and "ledger" are terms of art with no runtime connotation.

---

## Usage

Copy this file, rename to `[YourProject]_WorkflowProfile_v0.1.md`, fill or adjust every field marked with square brackets, save, and reference from your Session Initialization Prompt (see `SessionInitialization_CfW_v1.0.1.md`).

This template implements a **Collaborative Narrative Simulation** shape (one or more human authors co-simulate with the model voicing Model-Controlled Supporting Characters via a supporting-cast routing role — see `FictionControlBoundaryModel_CfW_v1.0.1.md` §2). Two other reference shapes — **Solo-Author Draft** and **Critique / Review-Only** — are informative shapes described in `FictionWorkflowProfileSchema_CfW_v1.0.1.md` §8; adapt this template or author bespoke.

Loading this template does not ratify anything. Ratification is a deliberate user act (see `CGS_CfW_v1.0.1.md` §6).

---

# [PROJECT NAME] — Workflow Profile (Collaborative Narrative Simulation shape)

**Profile name:** [name]
**Profile package identifier:** [identifier]
**Profile version:** 0.1.0
**Referenced project profile:** [project profile name, version]
**Authoring timestamp:** [YYYY-MM-DD]
**Status:** Proposed — pending user ratification

## 1. Identity

- **Profile name:** [name]
- **Profile package identifier:** [identifier]
- **Profile version:** [version]
- **Referenced project profile:** [name, version]

## 2. Constitutional Inheritance Declaration

- This workflow profile inherits **CGS v15.0.1** by reference.
- This workflow profile inherits **CoSyn for Writing v1.0.1** by reference.
- This workflow profile inherits the referenced project profile (above).
- This workflow profile creates no authority above tier 6.

## 3. Phase Enumeration

This workflow uses the following phases from the twelve-phase minimum set (per `ModeRegistry_CfW_v1.0.1.md` §5). Project-scoped naming (right column) is optional; the mapping to the canonical name MUST be explicit.

| Canonical name | Used by this workflow | Project-scoped label (optional) |
|---|---|---|
| Session Initialization | Yes | [label or leave blank] |
| Early Canon Development | Yes | [label or leave blank] |
| Active Simulation | Yes | [label or leave blank] |
| Correction / Rollback | Yes | [label or leave blank] |
| Revision | Yes | [label or leave blank] |
| Editing | Yes | [label or leave blank] |
| Critique | Yes | [label or leave blank] |
| Preservation Checkpoint | Yes | [label or leave blank] |
| Conversion | [Yes / No] | [label or leave blank] |
| Continuity Repair | Yes | [label or leave blank] |
| Recovery | Yes | [label or leave blank] |
| PCR Handoff | Yes | [label or leave blank] |

## 4. Phase-Transition Matrix

This workflow uses the reference matrix in `ModeRegistry_CfW_v1.0.1.md` §6 unchanged, OR narrows it as follows:

- [If narrowing: enumerate the specific transitions this profile disallows and the reason. Otherwise write "No narrowing — reference matrix used unchanged."]

**Transition triggers.** User command drives all transitions except:
- Recovery Phase is entered on error trigger (PTR schema failure per `RecoveryProtocol_CfW_v1.0.1.md` §4).
- Preservation Checkpoint MAY be triggered by a configurable turn-count cadence (see §7 below).

## 5. Turn Shape

- **Active Simulation:** one meaningful story beat + substantive creative handoff, integrating the immediately-prior user contribution pre-emission.
- **Early Canon Development:** one canon proposal (or one confirmation of a proposed canon item) per turn.
- **Correction / Rollback:** the fiction-continuity repair flow steps 1–9 (see `RecoveryProtocol_CfW_v1.0.1.md` §2.3) grouped as one or more turns per user pacing.
- **Revision:** delta output (only the changed material) plus baseline reference.
- **Editing:** one edit unit (edit + regression-check) per turn.
- **Critique:** analytical output only; no artifact modification.
- **Preservation Checkpoint:** the preservation record as a single artifact output.
- **Conversion:** rendered pages plus formatting-defect list; inspection before delivery.
- **Continuity Repair:** the layered precedence resolution as one or more turns.
- **Recovery:** per PTR-Spec §21 discipline.
- **PCR Handoff:** the twenty-section PCR content as a single artifact output.

## 6. Integration Order

- **Integration check phases:** Active Simulation, Early Canon Development.
- **Integration check placement:** pre-emission (the check fires before the response is user-visible).
- **Generic integration-failure identifier:** `INTEGRATION_CHECK_FAILURE` (default).
- **Rename option:** [leave `INTEGRATION_CHECK_FAILURE` or specify a project-scoped rename that preserves semantics].

## 7. Preservation Cadence (optional)

- **Preservation trigger:** [choose one and delete the others]
  - **Turn-count trigger:** After every [N] storyline turns, produce a preservation checkpoint. (CfW core defines no default numeric value; the project MUST choose a value if this trigger is enabled.)
  - **Phase-transition trigger:** On transition from Active Simulation to [phase X], produce a preservation checkpoint.
  - **Explicit-command-only:** Preservation checkpoints are produced only on explicit user command.

## 8. Handoff Rules

- Handoff is a creative opening (a scene-opening invitation for the user to author the next beat), not a selectable action list.
- Handoff MUST NOT default to a specific Author-Controlled character unless the scene depends on that character's agency.
- Handoff MUST NOT be an abandoned scene.
- Handoff MUST NOT be a same-shape closing question across consecutive turns (see `AntiAISignatureReview_CfW_v1.0.1.md` §3 item 11).

## 9. Authorized-Exception Declarations

This workflow ratifies the two default declarations from `FictionWorkflowProfileSchema_CfW_v1.0.1.md` §7:

### 9.1 Persona-Header Suppression
- **Gate:** CGS Presentation Gate — Persona Header.
- **Behavior narrowed:** persona-header / router-header surfacing on user-facing finalized snapshots.
- **Phases:** Active Simulation, Early Canon Development, Revision output, Editing output, Conversion output, Preservation Checkpoint output.
- **Preserved evaluation:** persona / router routing evaluation continues internally and is recorded in the PTR record.
- **Q-2 suspension:** narrowing is suspended for any turn meeting any Q-2 condition (see `PersonaGovernor_CfW_v1.0.1.md` §3.3).
- **Tier-1 / tier-2 rescission:** live-turn user request for headers overrides the narrowing.

### 9.2 Option-Labeling Suppression
- **Gate:** CGS Presentation Gate — Option Labeling.
- **Behavior narrowed:** A/B/C labeling on creative-handoff wording.
- **Phases:** Active Simulation.
- **Preserved evaluation:** administrative decision moments (a selectable action list) continue to receive labeling per CGS.
- **Boundary rule:** ambiguous handoff defaults to creative-handoff treatment; surface a minimal clarification only if the ambiguity is material.
- **Q-2 suspension:** narrowing is suspended for any turn meeting any Q-2 condition.
- **Tier-1 / tier-2 rescission:** live-turn user request for labeled options overrides the narrowing.

## 10. Mode-to-Phase Mapping

- **Active Simulation, Early Canon Development, Correction/Rollback, Revision, Editing, Preservation Checkpoint, Conversion, Session Initialization, Continuity Repair, Recovery, PCR Handoff:** default (no mode surfaced).
- **Critique:** `risk_auditor` and `dual_track_labeled` available; `domain_insider` available for critique of manuscript content that intersects a specific real-world domain.

Mode selection is silent within ordinary fiction prose per `ModeRegistry_CfW_v1.0.1.md` §8.

## 11. Conditional-Artifact Activation

This workflow adopts the phase-to-artifact activation map in `ModeRegistry_CfW_v1.0.1.md` §9 without widening or suppressing any required artifact.

- Conditional artifacts activate before substantive work in their mapped phase or operation.
- Conditional artifacts deactivate on phase or operation exit unless the next authorized phase also requires them.
- An unavailable required artifact blocks the affected operation and is surfaced for user resolution.
- Project and workflow profile schemas activate only for profile authoring or validation.
- Templates activate only when explicitly invoked or filled.

## 12. Artifact Rendering Timing

- **Simulation prose:** per turn (Active Simulation).
- **PTR record:** per turn (silent; rendered only on user request or Q-2 condition).
- **Current PTR State:** maintained continuously; rendered on user request.
- **Preservation record:** on preservation trigger (see §7).
- **PCR:** on explicit user command (see `PCR_Protocol_CfW_v1.0.1.md` §2).
- **CRC:** [choose: on PCR creation | on explicit user command | never].
- **Critique output:** per turn during Critique Phase.
- **Editing output:** per turn during Editing Phase.
- **Conversion output:** per rendering pass during Conversion Phase.

## 13. Uncertainty Resolution (optional)

- **Method:** [choose one and delete the others]
  - **Skip resolution** when outcome is deterministic or routine.
  - **Resolve by judgment** when only one outcome materially matters and reasoning is stateable.
  - **Explicit method:** [die, table, ranked criteria, coin — specify].

Method choice is workflow-profile-owned per `FictionControlBoundaryModel_CfW_v1.0.1.md` §7.

## 14. CRC Configuration (optional)

- **Produce CRC alongside PCR?** [yes | no]
- **CRC subordinate to PCR:** yes (fixed per `PCR_Protocol_CfW_v1.0.1.md` §6.4).
- **CRC naming:** CRC (CfW generic core) or [legacy name if project-owned].

## 15. Prohibited-Content Reminder

This workflow profile MUST NOT contain:

- Any override of tiers 1–5.
- Any project canon (belongs to project profile).
- Any character or resource enumeration (belongs to project profile).
- Any authority-creation language.
- Any implementation instruction for a specific model, tool, or platform.
- A PCR trigger policy that enables `automatic-on-eos` or `both`.

## 16. Amendments Log

- **Date:** [YYYY-MM-DD] — **Rationale:** [one line] — **PTR ratification-record reference:** [ledger sequence + record id]

## 17. Cross-References

- Constitutional ordering and ratification discipline: `CGS_CfW_v1.0.1.md`.
- Workflow-profile schema (authoritative field list): `FictionWorkflowProfileSchema_CfW_v1.0.1.md`.
- Phase set and reference transition matrix: `ModeRegistry_CfW_v1.0.1.md`.
- Recovery-family phases: `RecoveryProtocol_CfW_v1.0.1.md`.
- Consolidated phase behavior (Revision, Editing, Critique, Preservation, Conversion): `Editing_Critique_Preservation_Conversion_CfW_v1.0.1.md`.
- Project-profile template: `DefaultGenericFictionProfile_CfW_v1.0.1.md`.
- Session initialization: `SessionInitialization_CfW_v1.0.1.md`.

---

*End of DefaultGenericWorkflowProfile_CfW_v1.0.1 — Proposed — pending user ratification*
