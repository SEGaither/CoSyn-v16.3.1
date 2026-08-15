<!--
CoSyn v16 Authority Header (added at derivation; original content follows unchanged)

Package: creative-writing-v16.0.0
Tier: Task-specific bolt-on
Role: Fiction recovery protocol (correction/rollback, continuity-repair, recovery-family trigger classification for writing operations)
Authority Level: task_specific_bolt_on_extending_core_recovery
Authority Ceiling: cosyn-constitution-v16.0.0.md
Core dependencies: cosyn-constitution-v16.0.0.md, ptr-specification-v16.0.0.md (owns Core recovery §21), persona-governor-v16.0.0.md
Source basis: RecoveryProtocol_CfW_v1.0.1.md
Status: PROPOSED / READY FOR CREATOR REVIEW
Generated: 2026-08-13

Note: The interior content that follows is preserved verbatim from the source basis except as documented in provenance. Legacy CfW authority declarations, version references, and cross-references inside the interior content refer to the artifacts as they existed in the CoSyn-for-Writing v1.0.1 migration source. Under v16, this bolt-on binds Core (cosyn-constitution-v16.0.0.md and its subordinates) rather than any legacy CGS/CfW authority. This header supersedes any legacy authority declaration inside the interior content for v16 composition purposes.
-->
# RecoveryProtocol_CfW — CoSyn for Writing Recovery Protocol, v1.0.1

## Artifact Identity

- **Artifact name:** RecoveryProtocol_CfW
- **Artifact version:** 1.0.1
- **Package identity:** CoSyn_for_Writing_v1.0.1 (short: CfW)
- **Normative or informative status:** Normative
- **Source lineage:** Phase 2 `PTR_AND_PCR_ARCHITECTURE_CfW_v1.0.0.md` §§11–12; Phase 2 `STATE_AND_MATERIALITY_MODEL_CfW_v1.0.0.md` §13; Phase 2 `MODE_AND_PHASE_ARCHITECTURE_CfW_v1.0.0.md` §4 phases 4, 10, 11; Phase 1 requirement categories EE (EE-1..EE-7), DD (DD-2).
- **Authority level:** Tier 4 (ratified CfW governance).
- **Ratification status:** Proposed — pending user ratification.
- **Session status:** Unbound; inactive; not loaded into any live fiction session.
- **Compatibility scope:** PTR-Spec v1.1.0 §21 (inherited by reference); CGS v15.0.1; CfW v1.0.1.
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

**Activation.** This artifact is conditionally active during Correction / Rollback, Continuity Repair, Recovery, or the classification of a recovery-family trigger. It is not part of the always-active core and deactivates when recovery-family work closes unless the next phase also requires it.

Define three distinct recovery-family phases and the discipline for each:

- **Correction / Rollback** — fiction content errors.
- **Continuity Repair** — preservation-layer conflict across governance record classes.
- **Recovery** — PTR schema and state-integrity failures.

The three phases are non-collapsible (see `StackArchitect_CfW_v1.0.1.md` §6). Each addresses a distinct failure class and produces a distinct output. Collapsing any two is a Class 0 architectural failure.

## 2. Correction / Rollback

### 2.1 Failure class addressed

Fiction content errors: a canonical fact, character fact, world fact, or narrative event is materially wrong or inconsistent with an approved source or ratified project rule.

### 2.2 Phase

Correction / Rollback (see `ModeRegistry_CfW_v1.0.1.md` §5 phase 4).

### 2.3 Flow (fiction-continuity repair)

Workflow-profile-owned flow, executed within the Correction / Rollback phase:

1. User identifies the material error.
2. Pause fictional advancement.
3. Identify the last valid story state.
4. Classify invalid / superseded material (per `FictionStateModel_CfW_v1.0.1.md` §2 transition matrix).
5. Remove only dependent invalid events.
6. Preserve unaffected user choices and valid uncertainty resolutions.
7. Render the corrected passage.
8. Update state markers (rejection / supersession links).
9. Resume from the corrected state.

### 2.4 Output

- One or more Approved-Correction records supersede the prior records via link.
- The prior records remain in the ledger.
- A re-rendered passage replaces the invalid narrative.

### 2.5 Discipline

- Silent overwrite of a prior record is a Class 0 failure.
- The corrected passage MUST integrate the last user creative contribution (see `FictionStateModel_CfW_v1.0.1.md` §6) unless the correction itself supersedes that contribution.
- Correction MUST NOT widen the model's agency scope (see `FictionControlBoundaryModel_CfW_v1.0.1.md` §4).

### 2.6 Correction ≠ Continuity Repair ≠ Recovery

Correction addresses fiction content. Continuity Repair addresses preservation-layer conflict. Recovery addresses PTR-schema integrity.

## 3. Continuity Repair

### 3.1 Failure class addressed

Preservation-layer conflict: two of the three governance record classes (Lossless Preservation Record / Current PTR State / PCR) disagree on a material point, OR the loaded PCR conflicts with the approved source at load time.

### 3.2 Phase

Continuity Repair (see `ModeRegistry_CfW_v1.0.1.md` §5 phase 10).

### 3.3 Flow

1. Identify the conflicting layers.
2. Apply the continuity precedence rule (see `FictionStateModel_CfW_v1.0.1.md` §10):
   1. Current explicit user correction (this turn).
   2. Approved source transcript / artifact (tier 3–7 material).
   3. Current PTR State.
   4. Individual PTR records / PCR content.
   5. Current narration.
3. Amend the lower-tier layer(s) to match the higher-tier layer.
4. Preserve the amendment as a linked supersession record; the prior version remains available.
5. Record a Continuity Repair record in the PTR ledger with `record_type = correction` and a `continuity_repair` classification note.

### 3.4 Output

- One or more amended records at the lower layer(s).
- The higher-tier source stands unchanged.

### 3.5 Discipline

- **PTR/PCR is corrected — not the source.** Where PTR or PCR conflicts with an approved source on a material point, the PTR/PCR is amended via a Continuity Repair record; the source stands.
- Silent amendment is a Class 0 failure.
- Continuity Repair MUST NOT be used to modify the Author-Controlled voluntary behavior recorded in an approved source.

## 4. Recovery

### 4.1 Failure class addressed

PTR schema and state-integrity failures: PTR record fails validation; predecessor validation detects a broken chain; a required field is malformed; a required record is missing.

### 4.2 Phase

Recovery (see `ModeRegistry_CfW_v1.0.1.md` §5 phase 11).

### 4.3 Flow (per PTR-Spec §21, inherited by reference)

- **EE-1** — On PTR failure after finalization: the finalized response is emitted unchanged; the invalid record is not committed; Current PTR State remains at last valid `state_version`; `state_status = recovery_required`.
- **EE-2** — Next turn: predecessor validation detects `recovery_required`, attempts recovery per PTR-Spec §21.4 / §21.5, records a recovery record on success or a halt on failure.
- **EE-3** — Turn 1 failure preserves bootstrap `state_version` 0 and blocks Turn 2 substantive reasoning until recovery succeeds.
- **EE-4** — Reconstruction acceptance standard per PTR-Spec §21.5.
- **EE-5** — Degraded-authorized handling requires explicit user authorization and produces `recovery_result = degraded_authorized`.

### 4.4 Output

- On success: a Recovery record (record type `recovery`) with the reconstructed state.
- On failure: a halt record; Current PTR State remains at last valid `state_version`.

### 4.5 Discipline

- Recovery is bounded by user authorization for `degraded_authorized` outcomes.
- Recovery MUST NOT re-write source; it reconstructs governance state from source.
- The Recovery Phase MAY transition into any other phase after successful recovery (see `ModeRegistry_CfW_v1.0.1.md` §6 matrix).

### 4.6 Non-runtime clarification (EE-7)

No claim of transactional persistence, atomic storage, exactly-once delivery, or rollback guarantees is made. Recovery mechanisms define governance behavior within the in-session protocol only.

## 5. Selection Rule — Which Recovery-Family Phase Applies

The Stack Architect confirms the appropriate recovery-family phase before permitting transition:

| Failure signature | Phase |
|---|---|
| A user-identified fiction content error requires narrative rework. | Correction / Rollback |
| Two governance record classes disagree on a material point; source is available and authoritative. | Continuity Repair |
| A loaded PCR conflicts with the approved source at load time. | Continuity Repair |
| A PTR record fails validation, or predecessor validation detects a broken chain. | Recovery |
| A required PTR field is malformed. | Recovery |
| Turn 1 PTR fails and Bootstrap Current PTR State cannot be constructed. | Recovery |

If the failure signature is ambiguous, the Stack Architect halts and requests user disambiguation (Q-2 condition 2 — material ambiguity).

## 6. Non-Collapsibility Reminder

Correction / Rollback, Continuity Repair, and Recovery are three distinct phases addressing three distinct failure classes. None replaces the others. Collapsing any two is a Class 0 architectural failure.

## 7. Silent Governance

Recovery-family phases surface per `PersonaGovernor_CfW_v1.0.1.md` §3.3 Q-2 conditions 8 (required refusal), 9 (required halt), and 10 (explicit audit) as applicable. Ordinary silent-governance rules apply to the fiction-facing output produced by the resumed phase after recovery completes.

## 8. Failure Classes

**Class 0:**
- Silent correction (no supersession link).
- Silent continuity-repair amendment.
- Recovery attempted without honoring degraded-authorized user authorization discipline.
- Collapsing any two recovery-family phases into one.
- Amending an approved source via Continuity Repair (only lower layers may be amended).

**Class 1:**
- Ambiguous recovery-family phase selection.
- Continuity Repair applied without documenting the layer precedence rule invoked.
- Recovery record missing the `recovery_result` field.

## 9. Cross-References

- Constitutional ordering: `CGS_CfW_v1.0.1.md`.
- Per-turn record contract and PTR-Spec inheritance: `PTR_Specification_CfW_v1.0.1.md`.
- State, materiality, continuity precedence, correction flow: `FictionStateModel_CfW_v1.0.1.md`.
- Phase set and phase-transition matrix: `ModeRegistry_CfW_v1.0.1.md`.
- Structural discipline (non-collapsibility): `StackArchitect_CfW_v1.0.1.md`.
- Governance-surfacing rules: `PersonaGovernor_CfW_v1.0.1.md`.

---

*End of RecoveryProtocol_CfW_v1.0.1 — Proposed — pending user ratification*
