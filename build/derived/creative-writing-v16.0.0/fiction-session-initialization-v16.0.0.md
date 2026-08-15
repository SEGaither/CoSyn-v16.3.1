<!--
CoSyn v16 Authority Header (added at derivation; original content follows unchanged)

Package: creative-writing-v16.0.0
Tier: Task-specific bolt-on
Role: Fiction session initialization instructions (binding validation, activation, bootstrap discipline for writing sessions)
Authority Level: task_specific_bolt_on
Authority Ceiling: cosyn-constitution-v16.0.0.md
Core dependencies: cosyn-constitution-v16.0.0.md, creative-writing-bind-template-v16.0.0.json, writing-mode-registry-v16.0.0.md
Source basis: SessionInitialization_CfW_v1.0.1.md
Status: PROPOSED / READY FOR CREATOR REVIEW
Generated: 2026-08-13

Note: The interior content that follows is preserved verbatim from the source basis except as documented in provenance. Legacy CfW authority declarations, version references, and cross-references inside the interior content refer to the artifacts as they existed in the CoSyn-for-Writing v1.0.1 migration source. Under v16, this bolt-on binds Core (cosyn-constitution-v16.0.0.md and its subordinates) rather than any legacy CGS/CfW authority. This header supersedes any legacy authority declaration inside the interior content for v16 composition purposes.
-->
# SessionInitialization_CfW — CoSyn for Writing Session Initialization Instructions, v1.0.1

## Artifact Identity

- **Artifact name:** SessionInitialization_CfW
- **Artifact version:** 1.0.1
- **Package identity:** CoSyn_for_Writing_v1.0.1 (short: CfW)
- **Normative or informative status:** Normative
- **Source lineage:** Phase 2 `PTR_AND_PCR_ARCHITECTURE_CfW_v1.0.0.md` §9; Phase 2 `MODE_AND_PHASE_ARCHITECTURE_CfW_v1.0.0.md` §4 phase 1; Phase 1 requirement category V (V-1..V-4).
- **Authority level:** Tier 4 (ratified CfW governance).
- **Ratification status:** Proposed — pending user ratification.
- **Session status:** Unbound; inactive; not loaded into any live fiction session.
- **Compatibility scope:** CGS v15.0.1; CfW v1.0.1.
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

**Session initialization** is the deliberate loading and declaration of governance instructions for one conversation. Binding is not software execution — it is an in-session instruction-loading sequence. Session initialization is one of the twelve phases (see `ModeRegistry_CfW_v1.0.1.md` §5, phase 1).

Session initialization produces the initial Current PTR State (Bootstrap) and records the load-and-ratification events.

## 2. Load and Activation Order

The user issues a Session Initialization Prompt (§3). The prompt declares the available package and project artifacts in the following order:

1. CGS v15.0.1 (by reference).
2. `Manifest_CoSyn_for_Writing_v1.0.1.json` for package-membership and activation-model validation.
3. The seven-file always-active CfW core declared by the manifest.
4. The project profile (per `FictionProjectProfileSchema_CfW_v1.0.1.md`).
5. The workflow profile (per `FictionWorkflowProfileSchema_CfW_v1.0.1.md`).
6. Project canon or accepted source artifacts referenced by the project profile.
7. If continuation: the PCR to be resumed; if present, the subordinate CRC.
8. Any conditional artifact required by the session's declared start phase.

The full fourteen-file normative set is not activated at initialization. Conditional protocols remain inactive until their phase or operation trigger applies. Profile schemas remain inactive unless a profile is being authored or validated. Templates remain inactive unless explicitly invoked.

Loading does not equal ratification. The user's explicit ratification statement in the Session Initialization Prompt is the ratification act for tier-3–7 items (see `CGS_CfW_v1.0.1.md` §6). Activation is in-session instruction routing from available artifacts, not runtime loading or autonomous retrieval.

## 3. Session Initialization Prompt Content Schema

A Session Initialization Prompt MUST state:

### 3.1 Continuation vs. reinitialization

Explicit statement of whether this session:
- **Continues** a prior project via a loaded PCR (name, version, timestamp), OR
- **Reinitializes** (no PCR; the project profile and workflow profile establish the starting state).

### 3.2 Load-and-bind ordering

Ordered list of artifacts to declare and activate per §2. The user MUST enumerate the package version, core, project profile, workflow profile, source/canon artifacts, continuation artifacts, and start-phase conditional artifacts by name and version.

### 3.3 Required operating behavior list

Enumerated behaviors the model applies for this session, including at minimum:
- Silent governance ON (per `PersonaGovernor_CfW_v1.0.1.md` §3.2).
- Integration-check ON for the phases the workflow profile requires (default: Active Simulation, Early Canon Development).
- Corrections carve-out limited to mechanical prose only.
- Anti-AI Signature Review ON for fiction-prose emissions (per `AntiAISignatureReview_CfW_v1.0.1.md`).
- PCR trigger policy `explicit-command-only` (per `PCR_Protocol_CfW_v1.0.1.md` §2).
- Ratification discipline per `CGS_CfW_v1.0.1.md` §6.
- Cross-project isolation per `CGS_CfW_v1.0.1.md` §I-11.
- Minimum-necessary artifact activation per `StackArchitect_CfW_v1.0.1.md` §7.
- Start phase declared, with every required conditional artifact available before execution.

### 3.4 Canonical completion locks

Events completed and not to be replayed as pending. Each lock MUST be recoverable to its completed disposition. For continuation sessions, the loaded PCR §9 provides the completion locks; the Session Initialization Prompt MAY restate the critical ones.

### 3.5 Exact resume state

The specific starting point:
- Current scene reference.
- Active controller assignments.
- Current facts material to the next turn.
- Any active rejection guards or protection markers.

### 3.6 Start instruction

The first user turn to be executed (either an immediate first fiction turn from the user or an explicit "wait for user instruction" placeholder).

### 3.7 Stale-artifact enumeration

Explicit list of artifacts that MUST NOT control continuation, with reason for each. Stale artifacts include (non-exhaustive):
- Prior project profile versions.
- Prior workflow profile versions.
- Prior PCR versions.
- Prior CRC versions.
- Superseded canon artifacts.
- Prior manuscript versions where a newer Approved Manuscript exists.

If the loaded PCR includes a stale-artifact enumeration (see `PCR_Protocol_CfW_v1.0.1.md` §4 section 19), the Session Initialization Prompt MAY reference it by inclusion.

## 4. Bootstrap Current PTR State

Upon successful session initialization:

- Turn 0 records the load-and-ratification events (record type `state_change` or `closure`).
- Current PTR State is populated with:
  - `state_version = 0` (bootstrap) or the last valid `state_version` from the loaded PCR, per PTR-Spec §5 conventions.
  - Current phase (typically Session Initialization at Turn 0, transitioning to Early Canon Development or Active Simulation on Turn 1).
  - Active controller assignments from the project profile.
  - Ratification records for CGS, CfW, project profile, workflow profile, and any loaded canon.
- Turn 1 (the first substantive user turn) predecessor-validates the Bootstrap Current PTR State per PTR-Spec §5.

## 5. Stale-Artifact Discipline

Enumerated stale artifacts MUST NOT control continuation. Specifically:

- Content in a stale artifact MUST NOT be routed into Current PTR State.
- Contradictions between a stale artifact and a current artifact resolve in favor of the current artifact.
- If a stale artifact is inadvertently referenced by user input mid-session, the model MUST surface a clarification (Q-2 condition 2 — material ambiguity).

## 6. Session Initialization Failure Handling

- **Missing required prompt section** (per §3): Class 1 — surface for user completion before proceeding.
- **Ambiguous continuation vs. reinitialization**: Class 1 — halt and request user clarification.
- **Missing referenced artifact** (e.g., prompt names a PCR that is not loaded): Class 1 — halt and request loading.
- **Version mismatch** between workflow profile's project-profile reference and the loaded project profile: Class 1 — halt and request resolution.
- **Model attempting to self-ratify a tier-3–7 item during load**: Class 0 — halt; only the user's explicit ratification statement ratifies.
- **Load order violation (e.g., workflow profile loaded before its referenced project profile)**: Class 1 — surface and reorder before ratification.
- **Required start-phase conditional artifact unavailable**: Class 1 — halt before substantive execution and request the named artifact or an explicit reroute.
- **Schema, template, or unrelated protocol activated without a current trigger**: Class 1 — remove it from the controlling instruction set before substantive execution.

## 7. Session Initialization Prompt Template (Skeleton)

A paste-ready template a user MAY use at session start. The user fills bracketed fields.

```
SESSION INITIALIZATION PROMPT — [Project Name]

Continuation status: [continuation | reinitialization]

Load-and-bind order:
 1. CGS v15.0.1 (inherited by reference).
 2. Manifest: Manifest_CoSyn_for_Writing_v1.0.1.json.
 3. Always-active core:
    - CGS_CfW_v1.0.1.md.
    - PersonaGovernor_CfW_v1.0.1.md.
    - StackArchitect_CfW_v1.0.1.md.
    - FictionStateModel_CfW_v1.0.1.md.
    - FictionControlBoundaryModel_CfW_v1.0.1.md.
    - ModeRegistry_CfW_v1.0.1.md.
    - PTR_Specification_CfW_v1.0.1.md.
 4. Project profile: [name, version, path].
 5. Workflow profile: [name, version, path].
 6. Project canon or accepted source: [name, version, path] (if applicable).
 7. PCR: [name, version, path] (if continuation).
 8. CRC: [name, version, path] (if continuation and CRC exists).
 9. Start-phase conditional artifacts: [names and versions required by the manifest activation map].

Required operating behavior:
 - Silent governance ON.
 - Integration-check ON for [phases per workflow profile].
 - Corrections carve-out limited to mechanical prose only.
 - Anti-AI Signature Review ON for fiction-prose emissions.
 - PCR trigger policy: explicit-command-only.
 - Ratification discipline per CGS_CfW_v1.0.1.md §6.
 - Cross-project isolation per CGS_CfW_v1.0.1.md I-11.
 - Minimum-necessary artifact activation per StackArchitect_CfW_v1.0.1.md §7.
 - Declared start phase: [phase].
 - Start-phase conditional artifacts available: [list].

Canonical completion locks (this session):
 - [Completion lock 1]
 - [Completion lock 2]
 - [...]

Exact resume state:
 - Scene: [current scene reference].
 - Active controllers: [per project profile roster].
 - Current facts: [material facts for the next turn].
 - Active rejection guards: [if any].
 - Protection markers: [if any].

Stale-artifact enumeration (MUST NOT control continuation):
 - [Artifact A — reason]
 - [Artifact B — reason]
 - [...]

Ratification statement:
 I hereby ratify:
  - CoSyn for Writing v1.0.1 at tier 4.
  - Project profile [name, version] at tier 5.
  - Workflow profile [name, version] at tier 6.
  - Project canon [name, version] at tier 7 (if applicable).
  - Loaded PCR [name, version] as a resume-input artifact (if continuation).

Start instruction:
 [The first user turn OR the placeholder "Await user instruction."]
```

The sole shipped binding template is `BindTemplate_CfW_v1.0.1.json`. It remains authority-free until the user fills every required field, names the project-specific instance, validates it against this initialization schema, and explicitly ratifies the referenced tier-3–7 items. CfW v1.0.1 ships no prefilled or concrete BindNGo instance.

## 8. Non-Runtime Reminder

Session initialization is a deliberate act by the user, not an executable process. Binding is instruction-loading, not software execution. No runtime binder runs; no bootstrap process runs; the model's own instruction-following produces the effect described in this artifact.

## 9. Cross-References

- Constitutional ordering and ratification: `CGS_CfW_v1.0.1.md`.
- Manifest and load order: `Manifest_CoSyn_for_Writing_v1.0.1.json`.
- Project-profile schema and template: `FictionProjectProfileSchema_CfW_v1.0.1.md`, `DefaultGenericFictionProfile_CfW_v1.0.1.md`.
- Workflow-profile schema and template: `FictionWorkflowProfileSchema_CfW_v1.0.1.md`, `DefaultGenericWorkflowProfile_CfW_v1.0.1.md`.
- PCR protocol and template: `PCR_Protocol_CfW_v1.0.1.md`, `PCR_Template_CfW_v1.0.1.md`.
- Binding template: `BindTemplate_CfW_v1.0.1.json`.
- Per-turn record and Bootstrap Current PTR State: `PTR_Specification_CfW_v1.0.1.md`.
- Recovery-family phases: `RecoveryProtocol_CfW_v1.0.1.md`.

---

*End of SessionInitialization_CfW_v1.0.1 — Proposed — pending user ratification*
