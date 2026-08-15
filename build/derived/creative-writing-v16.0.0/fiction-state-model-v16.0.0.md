<!--
CoSyn v16 Authority Header (added at derivation; original content follows unchanged)

Package: creative-writing-v16.0.0
Tier: Task-specific bolt-on
Role: Fiction state model (classification, source separation, materiality, counters, continuity precedence)
Authority Level: task_specific_bolt_on
Authority Ceiling: cosyn-constitution-v16.0.0.md
Core dependencies: cosyn-constitution-v16.0.0.md, ptr-specification-v16.0.0.md
Source basis: FictionStateModel_CfW_v1.0.1.md
Status: PROPOSED / READY FOR CREATOR REVIEW
Generated: 2026-08-13

Note: The interior content that follows is preserved verbatim from the source basis except as documented in provenance. Legacy CfW authority declarations, version references, and cross-references inside the interior content refer to the artifacts as they existed in the CoSyn-for-Writing v1.0.1 migration source. Under v16, this bolt-on binds Core (cosyn-constitution-v16.0.0.md and its subordinates) rather than any legacy CGS/CfW authority. This header supersedes any legacy authority declaration inside the interior content for v16 composition purposes.
-->
# FictionStateModel_CfW — CoSyn for Writing State and Materiality Model, v1.0.1

## Artifact Identity

- **Artifact name:** FictionStateModel_CfW
- **Artifact version:** 1.0.1
- **Package identity:** CoSyn_for_Writing_v1.0.1 (short: CfW)
- **Normative or informative status:** Normative
- **Source lineage:** Phase 2 `STATE_AND_MATERIALITY_MODEL_CfW_v1.0.0.md` §§1–13; Phase 1 requirement categories B, G, T, DD, BB, H, I, S, J, K, L.
- **Authority level:** Tier 4 (ratified CfW governance).
- **Ratification status:** Proposed — pending user ratification.
- **Session status:** Unbound; inactive; not loaded into any live fiction session.
- **Compatibility scope:** CGS v15.0.1; PTR-Spec v1.1.0; CfW v1.0.1.
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

Separate the distinct classes of fictional and governance state that CfW must keep addressable and non-collapsible. Define materiality rules. Define counters. Define continuity precedence. Define the uncertainty vs. ambiguity boundary. Define correction discipline.

## 2. Fiction State Classification (Eight Classes)

Every material development in fiction belongs to exactly one classification below at any given time. Transitions between classifications are recorded, never silent.

| # | Class | Definition | Authority tier that establishes | Silent transition prohibited? |
|---:|---|---|---|---|
| 1 | **Established** | Canon accepted as fact within the project. | Tiers 5–8 | Yes |
| 2 | **Proposed** | Under consideration for canon; not yet approved. | Tier 11 (draft) or user proposal | Yes |
| 3 | **Approved** | Formerly proposed; now user-ratified as canon; logically equivalent to Established after promotion is recorded. | Tier 8 (ratification event) | Yes |
| 4 | **Randomized-Provisional** | Result of an in-fiction uncertainty resolution not yet narrated as a settled consequence. | Workflow profile | Yes |
| 5 | **Rejected** | Explicitly refused; MUST NOT silently return as active canon, planning input, foreshadowing, or randomization input. | Tier 8 (rejection event) | Yes |
| 6 | **Superseded** | Replaced by a later ratified item via a linked supersession record; prior remains available. | Tier 8 (supersession event) | Yes |
| 7 | **Quarantined** | Held in-context pending decision; carries a compact rejection guard or ambiguity marker. | Persona Governor or Stack Architect | Yes |
| 8 | **Intentionally Undefined** | User has designated the matter organic or unspecified; MUST NOT be silently filled for completeness. | Tier 5 (project profile) or tier 8 | Yes |

### 2.1 Transition matrix (allowed, with explicit record)

- Proposed → Approved (ratification).
- Proposed → Rejected.
- Approved → Superseded (linked supersession).
- Approved → Rejected (linked rejection).
- Rejected → Approved (reopening — requires J-3 basis: explicit user reopening OR authoritative artifact change OR verified source-change basis; prior disposition preserved).
- Superseded → Reopened (same J-3 basis).
- Quarantined → Approved / Rejected / Superseded (per resolution).
- Intentionally Undefined → Proposed (only via explicit user un-designation; the un-designation is itself recorded).
- Randomized-Provisional → Approved (once narrated as settled) or Rejected (per user).

### 2.2 Prohibited silent transitions

- Proposed → Established without a ratification event.
- Rejected → Approved without a J-3 basis and a preserved prior-disposition link.
- Randomized-Provisional → Approved through narration alone (must include a state record).
- Intentionally Undefined → any resolved class through model completion behavior alone.

### 2.3 Paraphrase-based reintroduction is silent return

Reintroducing rejected or superseded material via paraphrase, renaming, restatement in different words, thematic echo, or foreshadowing-style hint is a silent-return event and is prohibited (J-1). The Rejection class holds a compact rejection guard including original wording pointers sufficient to detect paraphrase. A would-be reintroduction that shares an item's semantic identity is a J-1 failure regardless of surface wording.

## 3. Source Separation (Eleven Classes, Non-Collapsible)

Silent collision between any pair is a Class 0 failure. Each class has a defined authority tier and lifecycle.

| Class | Content | Authority | Lifecycle |
|---|---|---|---|
| **Source** | Transcript, tool results, user-authored inputs, project reference material loaded at session initialization. | Tier 3–7 (as applicable) | Immutable within the session; extends by user input only. |
| **Simulation** | Fictional outputs generated during simulation — story beats, character speech, world action. | Tier 11 (draft) until user disposition | Becomes Proposed → Approved / Rejected as user acts. |
| **Proposed Canon** | Fictional facts, world facts, or character facts a simulation turn or canon-development turn has offered for canon status. | Tier 11 | Becomes Approved on ratification; else Rejected/Quarantined. |
| **Accepted Canon** | Ratified canon (Established / Approved). | Tier 7 | Modified only by Approved-Correction or Approved-Supersession. |
| **Draft** | Any in-progress non-canon prose — a chapter draft, a scene draft, a proposed rewrite. | Tier 11 | Becomes Approved Draft on user approval. |
| **Approved Draft** | A draft user-approved for the current working purpose without yet becoming manuscript. | Tier 7 (scoped) | Becomes Manuscript on further ratification, or is superseded. |
| **Manuscript** | The presentation-format text (e.g., long-form prose) that assembles Approved Drafts. | Tier 7 | Never modified silently; edits use Approved-Correction discipline. |
| **Approved Manuscript** | Manuscript state user-ratified as the deliverable at a checkpoint. | Tier 7 | Silent modification prohibited; supersession preserves prior. |
| **Critique** | Analytical output about an artifact. | Tier 12 | Never modifies its subject artifact; only user-approved incorporation modifies. |
| **Rejection** | Rejected-material record — one line per rejected item with source-correction pointer and reason. | Tier 8 (event) | Becomes Archive when reintroduction risk ends; retains audit link. |
| **Archive** | Dormant material preserved as historical reference. | Tier 7 (read-only) | Never controls current interpretation; retrievable on user request. |

**Collision-safe boundaries:**
- Simulation ≠ Proposed Canon.
- Draft ≠ Approved Draft ≠ Manuscript ≠ Approved Manuscript.
- Critique ≠ Editing.
- Rejection ≠ Archive.
- Accepted Canon ≠ Approved Manuscript.

## 4. Governance State Classes (Six)

Distinct from fiction state classes.

| Class | Definition | See |
|---|---|---|
| **Current PTR State** | The single mutable working representation carried into the next turn by default. | `PTR_Specification_CfW_v1.0.1.md` §7 |
| **PTR Ledger** | Ordered set of immutable per-turn PTR records for the session. | `PTR_Specification_CfW_v1.0.1.md` §8 |
| **PCR** | Deliberately-created portable handoff artifact for a later session. | `PCR_Protocol_CfW_v1.0.1.md` |
| **Compact Resume Companion (CRC)** | Optional subordinate artifact to a PCR. | `PCR_Protocol_CfW_v1.0.1.md` §6 |
| **Session Initialization Prompt** | User-supplied load-and-declare instruction that begins a session. | `SessionInitialization_CfW_v1.0.1.md` |
| **Governance Ambiguity Record** | Provisional / disputed classification per PTR-Spec §9.7. | `PTR_Specification_CfW_v1.0.1.md` §3 |

Governance state classes MUST NOT become source (I-9). Governance state records interpretation.

**Relationship to DD-1 non-collapsibility.** DD-1 (see `PTR_Specification_CfW_v1.0.1.md` §12 and `PCR_Protocol_CfW_v1.0.1.md` §8) names three record classes that MUST remain distinct — **Lossless Preservation Record**, **Current PTR State**, **PCR**. Two of these (Current PTR State and PCR) are governance state classes above; the third (Lossless Preservation Record) is a fiction-workflow-owned artifact class (per §8 of this artifact) rather than a governance state class. The two categorizations are compatible: the DD-1 set spans both, and its three items MUST NOT be collapsed regardless of category.

## 5. Materiality Rules

A turn is **material** iff it produces at least one of the state changes below. Otherwise the turn is **non-material** (record type `no_material_change`).

**Material change categories:**

1. **Canon change.** Any Established / Approved / Rejected / Superseded / Quarantined / Intentionally-Undefined transition on a canonical fact, character fact, or world fact.
2. **Controller change.** Any change to controller assignment, external narrator role, scene-director role, or sole-authority-over-resource assignment.
3. **Rejection or supersession event.** Any addition to the Rejection class or any supersession link.
4. **Protection change.** Any protection-status change on a preserved item.
5. **Phase transition.** Any move from one workflow phase to another.
6. **PCR-candidate change.** Any item marked pcr-candidate or the recording of a user-ratified pcr-promotion.
7. **Unresolved-item change.** Any addition, resolution, or reclassification of an item in the Governance Ambiguity Record.
8. **Correction event.** Any Approved-Correction that supersedes a prior record.
9. **Reopening event.** Any J-3-authorized transition of Rejected → Approved or Superseded → Approved.
10. **Preservation checkpoint.** A workflow-profile-owned preservation trigger firing and producing a preservation record.

**Non-material change categories:**

- Ordinary fiction prose that does not touch any of the above.
- Formatting-only rerenders that do not change source text.
- Critique output about an artifact without incorporation, provided the session remains in the Critique phase. Entering or leaving Critique remains material because the phase transition is material.
- Restatement of previously-recorded state without change.
- Halts and clarification requests that produce no state delta.

**Counter interaction:**

- A material turn advances `state_version` by exactly one.
- A non-material turn retains `state_version`.
- A blocked or discarded draft (integration-check failure — §6) does NOT advance the storyline-turn counter, `ledger_sequence`, or `state_version`. The re-rendered replacement turn is the one recorded.
- A correction event advances `state_version`; the correction record supersedes the prior record via link.
- A phase transition advances `state_version`; silent phase transitions are prohibited.
- Critique content never advances `state_version` on its own. Entering or leaving the Critique phase advances `state_version` because the phase transition is material. User-approved incorporation advances `state_version` only when the incorporation changes governed state through Revision or Editing.

## 6. Integration Discipline and Re-Render Trigger

**Rule (generalized from user-contribution integration requirements).** The workflow profile owns an integration order for user contribution: any user creative contribution in the immediately-prior user turn MUST be integrated into the next visible model output before the model advances world state, supporting-character response, environmental development, exposition, or new scene beat.

**Integration failure modes** (any of these blocks emission and requires re-render):

- **Omission** — the user's contribution is not represented.
- **Substitution** — the user's contribution is replaced by a similar but non-equivalent element.
- **Material reordering** — the user's contribution is placed after model-authored advancement, functionally treating it as an afterthought.
- **Responding-around** — the model narrates around the user's contribution without integrating it.
- **Invented internal state** — the model attributes thought, motive, emotion, or intent to the user's character beyond what the user's contribution supplied.

**Generic integration-failure identifier default:** `INTEGRATION_CHECK_FAILURE`. The workflow profile MAY rename via ratified declaration; semantics do not change.

**Re-render discipline:**
- Blocked emission is not visible to the user.
- The re-rendered response replaces the blocked draft.
- Storyline-turn counter, `ledger_sequence`, and `state_version` are not advanced by the blocked draft.
- A blocked-draft event MAY be recorded as a governance annotation on the completed replacement turn's PTR record if the workflow profile so specifies; the blocked draft itself is not preserved.

## 7. Counters

Three orthogonal counters. Definitions and orthogonality are declared in `PTR_Specification_CfW_v1.0.1.md` §6. Blocked drafts advance none.

## 8. Preservation

**Preservation record class (Approved-Draft aggregation).** A workflow profile MAY enumerate a lossless preservation record class — a full-fidelity storyline artifact accumulating user-approved storyline content verbatim. This is a fiction-workflow concern owned by the workflow profile, not by the CfW core.

**Preservation cadence.** A configurable, workflow-profile-owned turn-count preservation trigger MAY be declared. Firing produces a preservation checkpoint (a §5 material event). CfW core does not enumerate a default cadence value.

**Preservation discipline:**
- Preservation content is verbatim; summarization is prohibited without explicit user request.
- Silent removal of corrections is prohibited unless the user has requested a clean-canon variant (which is itself a distinct derivative artifact, not the preservation record).
- Storyline-turn counter markers stay outside the reusable narrative text unless the user opts in.
- A preservation artifact is not a PCR and not a PTR — three non-collapsible classes (DD-1).

## 9. Conversion Discipline

When source (Approved Draft or Manuscript) is converted into another format:

- Source text is preserved exactly; only formatting needed for the target format MAY be adjusted.
- Every rendered page is inspectable before delivery.
- Delivery occurs only after formatting defects are corrected without altering source text.
- Internal rendering is a review step only; not publication or external distribution.
- Conversion output does not become the authoritative PTR/PCR record.
- The conversion output is a distinct artifact from the source; a supersession event on the source does not automatically supersede the conversion output (the workflow profile defines the reconciliation cadence).

## 10. Continuity Precedence During Dispute

When any two of the following conflict on a specific material point, the higher item in the list controls:

1. Current explicit user correction (this turn).
2. Approved source transcript / artifact (tier 3–7 material).
3. Current PTR State.
4. Individual PTR records / PCR content.
5. Current narration (Simulation or Draft prose).

**Governing invariant:** PTR/PCR is corrected — not the source. Where PTR or PCR conflicts with an approved source on a material point, the PTR/PCR is amended via a Correction event; the source stands.

## 11. Uncertainty vs. Ambiguity Boundary

Fictional uncertainty and governance ambiguity are distinct and never conflated.

**Fictional uncertainty** (MUST NOT halt governance):
- Unknown character motive.
- Conflicting in-fiction testimony.
- Risky in-fiction plan whose outcome is not yet resolved.
- Character disagreement.
- Unpredictable future events within the story.
- Weak in-character theories; character mistakes; refusals; friction; unintended in-story consequences.

Fictional uncertainty is a legitimate creative state. It does not trigger a halt. It does not require completion. It does not force the model into a governance ambiguity halt.

**Governance ambiguity** (halts or provisional-marks):
- Ambiguous ratification status of a project rule.
- Conflicting instructions from higher tiers.
- Uncertain classification of a state-delta item.
- Uncertain controller assignment for a character or resource whose owner is not declared.
- Source-conflict on a material point.
- Missing or malformed prior-turn state that blocks recovery.

Governance ambiguity triggers halt-for-clarification or the least-committal-interpretation-with-provisional-marking discipline.

**Boundary rule:** MUST NOT convert fictional uncertainty into governance ambiguity. MUST NOT resolve governance ambiguity by fictional narration. Enforced at emission by the Persona Governor (see `PersonaGovernor_CfW_v1.0.1.md` §6).

## 12. Non-Predetermination Discipline

- The model MUST NOT secretly predetermine matters designated Intentionally-Undefined unless the user has explicitly approved hidden pre-generation.
- The model MUST NOT force safer, cleaner, more balanced, or more conventional plot development.
- The model MUST NOT require complete worldbuilding before play begins; minimum sufficient canon is the operating standard.
- Weak theories, mistakes, refusals, silence, friction, and unintended consequences are allowed to remain.

## 13. Correction Discipline (Fiction-Continuity Repair)

Workflow-profile-owned flow, executed during the Correction / Rollback phase. Distinct from PTR-schema recovery (see `RecoveryProtocol_CfW_v1.0.1.md`).

1. User identifies material error.
2. Pause fictional advancement.
3. Identify last valid story state.
4. Classify invalid / superseded material.
5. Remove only dependent invalid events.
6. Preserve unaffected user choices and valid uncertainty resolutions.
7. Render the corrected passage.
8. Update state markers (rejection / supersession links per §2).
9. Resume from the corrected state.

A correction event supersedes the prior record via link; the prior record remains in the ledger. Silent overwrite of a prior record is a Class 0 failure.

## 14. Cross-References

- Constitutional ordering: `CGS_CfW_v1.0.1.md`.
- Enforcement roles: `PersonaGovernor_CfW_v1.0.1.md`, `StackArchitect_CfW_v1.0.1.md`.
- Per-turn record, counters, disposition mapping: `PTR_Specification_CfW_v1.0.1.md`.
- Cross-session handoff: `PCR_Protocol_CfW_v1.0.1.md`.
- Recovery-family phases: `RecoveryProtocol_CfW_v1.0.1.md`.
- Editing / Critique / Preservation / Conversion behavior: `Editing_Critique_Preservation_Conversion_CfW_v1.0.1.md`.

---

*End of FictionStateModel_CfW_v1.0.1 — Proposed — pending user ratification*
