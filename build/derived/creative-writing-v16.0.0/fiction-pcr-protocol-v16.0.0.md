<!--
CoSyn v16 Authority Header (added at derivation; original content follows unchanged)

Package: creative-writing-v16.0.0
Tier: Task-specific bolt-on
Role: Fiction PCR protocol (twenty-section fiction PCR schema, explicit-command-only trigger, CRC subordination)
Authority Level: task_specific_bolt_on_extending_core_pcr_framework
Authority Ceiling: cosyn-constitution-v16.0.0.md
Core dependencies: cosyn-constitution-v16.0.0.md, ptr-specification-v16.0.0.md (owns PCR promotion framework §20), persona-governor-v16.0.0.md
Source basis: PCR_Protocol_CfW_v1.0.1.md
Status: PROPOSED / READY FOR CREATOR REVIEW
Generated: 2026-08-13

Note: The interior content that follows is preserved verbatim from the source basis except as documented in provenance. Legacy CfW authority declarations, version references, and cross-references inside the interior content refer to the artifacts as they existed in the CoSyn-for-Writing v1.0.1 migration source. Under v16, this bolt-on binds Core (cosyn-constitution-v16.0.0.md and its subordinates) rather than any legacy CGS/CfW authority. This header supersedes any legacy authority declaration inside the interior content for v16 composition purposes.
-->
# PCR_Protocol_CfW — CoSyn for Writing PCR Protocol, v1.0.1

## Artifact Identity

- **Artifact name:** PCR_Protocol_CfW
- **Artifact version:** 1.0.1
- **Package identity:** CoSyn_for_Writing_v1.0.1 (short: CfW)
- **Normative or informative status:** Normative
- **Source lineage:** Phase 2 `PTR_AND_PCR_ARCHITECTURE_CfW_v1.0.0.md` §§7–8; Phase 1 requirement categories U (U-1..U-7), DD (DD-1..DD-2).
- **Authority level:** Tier 4 (ratified CfW governance). A PCR artifact itself is a resume-input artifact requiring ratification discipline before its content modifies higher tiers.
- **Ratification status:** Proposed — pending user ratification.
- **Session status:** Unbound; inactive; not loaded into any live fiction session.
- **Compatibility scope:** PTR-Spec v1.1.0 §20 (inherited by reference); CGS v15.0.1.
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

**Activation.** This artifact is conditionally active for PCR loading, PCR Handoff, CRC handling, or an explicit PCR audit. It is not part of the always-active core and deactivates when that operation closes unless the next phase also requires it.

A **Project Continuity Record (PCR)** is a portable, deliberately-created, in-session-produced cross-session continuity artifact. A PCR is not automatically created. Only user ratification promotes PCR-candidate items to `pcr-promoted`. Silent PCR promotion is a Class 0 failure (U-3).

A PCR MUST be deliberately loaded into a later session to have effect. CfW makes no claim of automatic cross-session memory or automatic restoration (U-4).

## 2. Trigger Policy

**Default trigger policy: `explicit-command-only`.**

- The PCR is generated only when the user issues an explicit command in-session.
- The values `automatic-on-eos` and `both` appear only as reference-only values in the pinned CGS binding schema. CfW does not enable them; their names read as autonomous behavior which CfW does not implement.

The trigger policy is declared in the completed project-specific instance created from `BindTemplate_CfW_v1.0.1.json` and inherited by the workflow profile. The unfilled template has no authority. A workflow profile MUST NOT enable `automatic-on-eos` or `both` under CfW v1.0.1.

## 3. Synthesis Inputs

PCR synthesis MUST consult (per PTR-Spec §20):

- Finalized Current PTR State.
- Complete PTR ledger (as held in the active session representation).
- Relevant source turns.
- Material artifacts.
- Unresolved items.
- Correction / supersession / reopening / recovery history.

Synthesis is an in-session act performed at user command. Its output is the PCR artifact — a deliverable the user saves outside the session.

## 4. PCR Content Schema (20 Sections)

Every PCR MUST contain, at minimum, the twenty sections below. A PCR that omits a required section is a Class 1 failure and MUST be surfaced for user resolution before the artifact is delivered.

1. **Purpose statement.** What this PCR is for and what it continues.
2. **Governing sources with load order.** Explicit enumeration of what must be loaded in the next session, in what order.
3. **Exact resume objective / scene.** The specific point of resumption.
4. **Character controllers and agency.** Per-participant controller category and agency scope; sole-authority-over-resource assignments.
5. **Character states.** Per-participant current state (location, condition, current knowledge).
6. **Relationship state.** Where relevant to the resume point.
7. **Leadership / authority state.** Where relevant.
8. **Technical / resource state.** Where relevant.
9. **Completed developments.** Canonical Completion Locks — events completed and not to be replayed as pending.
10. **Exact procedure / outcome for pivotal recent events.** For events whose resolution logic must be preserved verbatim.
11. **Available resources.** In-fiction resources available at the resume point.
12. **Accepted canon summary.** Compact list of Established / Approved canon relevant to the resume point.
13. **Rejected and superseded material list.** Each entry with source-correction pointer and reason; J-1 non-return applies.
14. **Intentionally-Undefined items.** Explicit list; non-predetermination applies (see `FictionControlBoundaryModel_CfW_v1.0.1.md` §8).
15. **Unresolved decisions.** Each with resolution criteria per PTR-Spec §9.7.
16. **Exact restart instruction.** How the next session begins.
17. **Next creative handoff.** If Active Simulation resumption applies.
18. **Next-turn requirements block.** Any integration checks or pre-emission checks that MUST fire on the first substantive turn (e.g., integration of the last user contribution captured in the PCR).
19. **Stale-artifact enumeration.** Any prior artifact that MUST NOT control the continuation, with reason (see `SessionInitialization_CfW_v1.0.1.md` §5).
20. **PCR version and ratification record.** PCR identity, version, ratification timestamp, and reference to the pcr-ratification-link recorded in the PTR ledger.

A concrete populated example of these twenty sections is provided in `PCR_Template_CfW_v1.0.1.md`.

## 5. PCR Ratification

PCR promotion is a two-step act:

1. The model MAY mark items `pcr-candidate` during the session (permitted; not authoritative).
2. User ratification transitions items from `pcr-candidate` to `pcr-promoted`; the PCR artifact is produced from the ratified set. The ratification is recorded in the PTR ledger with a `pcr-ratification-link`.

The model MUST NOT self-promote items past `pcr-candidate`. See `CGS_CfW_v1.0.1.md` §6 (the model cannot self-ratify).

## 6. Compact Resume Companion (CRC) — Optional

### 6.1 Definition

An optional compact resume-state companion subordinate to a PCR. Purpose: fast resume when the full PCR is too long for a quick continuation.

### 6.2 Content

A CRC contains a compact version of:

- Current scene.
- Character positions.
- Current facts (compact).
- Active risks.
- Unresolved matters.
- Prohibited regressions.
- Exact restart directive.

### 6.3 Naming

The generic core name is **Compact Resume Companion (CRC)**. A project profile MAY retain legacy naming (e.g., "CRS") for compatibility with prior project material; historical legacy terminology is preserved only in project-side changelogs and quotations, not in the CfW generic core.

### 6.4 Subordination

The CRC is subordinate to the PCR. On conflict between CRC and PCR content, the PCR controls. On conflict between either and the source transcript at load time, source controls (see `FictionStateModel_CfW_v1.0.1.md` §10).

## 7. Loading a PCR

Loading a PCR into a later session is a deliberate act performed during the Session Initialization phase (see `SessionInitialization_CfW_v1.0.1.md`).

- The loaded PCR is treated as a resume-input artifact scoped to the referenced project profile.
- Its content does not automatically enter tiers 3–7. Items in the PCR that require ratification acquire authority only through the same ratification discipline that applies to all tier-3–7 changes (see `CGS_CfW_v1.0.1.md` §6).
- Stale-artifact enumeration in the PCR is honored: enumerated artifacts MUST NOT control continuation.

## 8. PCR ≠ PTR ≠ Preservation Record (DD-1)

Three separate record classes MUST remain distinct:

- **Lossless preservation record** (workflow-profile-owned; see `FictionStateModel_CfW_v1.0.1.md` §8).
- **Current PTR State** (see `PTR_Specification_CfW_v1.0.1.md` §7).
- **PCR** (this artifact).

None replaces the others. Collapsing any pair is a Class 0 architectural failure.

## 9. Failure Classes

**Class 0:**
- Silent PCR promotion.
- PCR triggered automatically without explicit user command (default policy violation).
- Compact Resume Companion asserting authority over PCR content in conflict.
- Collapsing preservation / Current PTR State / PCR into a single record.
- Silent modification of a delivered PCR artifact.

**Class 1:**
- Compact Resume Companion content stale relative to loaded PCR.
- PCR missing a required content-schema section.
- PCR ratification record missing from the PTR ledger.

## 10. Non-Runtime Reminder

A PCR is a Markdown (or user-preferred format) artifact the user saves outside the session. CfW does not persist it, does not synchronize it, does not restore it. Cross-session continuity is achieved solely through deliberate creation and deliberate loading.

## 11. Cross-References

- Per-turn record contract: `PTR_Specification_CfW_v1.0.1.md`.
- Session initialization and stale-artifact enumeration: `SessionInitialization_CfW_v1.0.1.md`.
- State model, materiality, and continuity precedence: `FictionStateModel_CfW_v1.0.1.md`.
- Concrete populated example: `PCR_Template_CfW_v1.0.1.md`.
- Recovery discipline: `RecoveryProtocol_CfW_v1.0.1.md`.

---

*End of PCR_Protocol_CfW_v1.0.1 — Proposed — pending user ratification*
