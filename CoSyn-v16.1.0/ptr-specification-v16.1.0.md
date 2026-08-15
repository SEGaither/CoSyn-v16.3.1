# Parsed Turn Record (PTR) Specification — v16.1.0

**Schema Version:** 16.1.0
**Package Tier:** 1 (Core)
**Role:** Subordinate specification bound by CoSyn Constitution v16.1.0
**Authority Level:** subordinate_specification
**Authority Ceiling:** `cosyn-constitution-v16.1.0.md`
**Status:** PROPOSED / READY FOR CREATOR REVIEW
**Supersedes source basis:** PTR Specification v1.2.2 (migration/reference source only)
**Refined from:** ptr-specification-v16.0.0.md (SHA-256 C93205F07BDD45E8E8C5407AC31D7242BF09B87964ACE675D43FCAA0C5917D8C)
**Generated:** 2026-08-13

---

## 0. Provenance

Source basis: `PTR_Specification_v1.2.2.md`. Substantive schema and semantics preserved verbatim from v1.2.2. Version identifiers, cross-references, and compatibility statements retargeted to v16.0.0.

---

## 1. Authority and Subordination

The PTR Specification is a subordinate specification bound by CoSyn Constitution v16.1.0. It is not a constitutional authority.

- CoSyn Constitution v16.1.0 owns the seven constitutional PTR principles CP1–CP7.
- `persona-governor-v16.1.0.md` enforces this specification.
- `stack-architect-v16.1.0.md` routes PTR creation, retrieval, correction, and recovery.
- `cosyn-v16-bind-template-v16.1.0.json` pins the active version.

This specification cannot override the Constitution, the current explicit user instruction, or any higher-authority ratified artifact.

In-session governance is a protocol executed inside the model's response construction. This specification does not claim transactional persistence, atomic storage, exactly-once delivery, rollback guarantees, or executable runtime enforcement.

## 2. Terminology

- **PTR** — Parsed Turn Record. Governing term for the per-turn record.
- **TPR** — legacy predecessor terminology for PTR. Not used in active provisions. Preserved only in exact historical quotations or migration notes.
- **PCR** — Project Continuity Record. Governing term for cross-session continuity.
- **CRS** — legacy predecessor terminology for PCR. Preserved only in exact historical quotations, changelog entries, or compatibility aliases where an actual consumer requires it.
- **Current PTR State** — the mutable working state carried into later turns by default.
- **PTR ledger** — the ordered set of immutable PTR records.
- **Finalized response snapshot** — the immutable response snapshot produced by the Presentation Gate (CoSyn Constitution v16.1.0 Canonical Turn Lifecycle step 4–5). Also referred to as `finalized`, `frozen`, or `emission-locked`.
- **User-visible emission** — Canonical Turn Lifecycle step 9 only. Distinct from the finalized snapshot.

## 3. Canonical Turn Lifecycle (Reference)

This specification inherits the canonical turn lifecycle from CoSyn Constitution v16.1.0. Summarized here for reference; the Constitution is authoritative:

1. User turn received.
2. Prior Current PTR State validated (or Turn 1 bootstrap state established per §5).
3. Governance and reasoning execute.
4. Finalization and Presentation Gate produce the finalized response snapshot.
5. The snapshot becomes immutable.
6. PTR record creation and Current PTR State transition are attempted from that immutable snapshot.
7. PTR validation occurs.
8. Governance telemetry is recorded.
9. The unchanged finalized snapshot is emitted to the user.
10. The next turn validates the predecessor state.

PTR processing operates on the finalized snapshot only. PTR processing cannot modify, replace, suppress, reorder, or append to that snapshot. Telemetry processing cannot modify the snapshot either.

## 4. Record Types

Each completed user-assistant turn produces exactly one PTR ledger entry of one of the following types. Record types are enumerated; new record types require a subsequent PTR Specification version.

| `record_type` value | Purpose |
|---|---|
| `state_change` | The turn materially changes Current PTR State. |
| `no_material_change` | The completed turn produces no material state change. |
| `closure` | NFAR, EOS, or another closure instruction changes or confirms closure state. |
| `halt` | Governance cannot safely proceed. |
| `correction` | The user or a governed review corrects a prior interpretation. |
| `recovery` | Missing or inconsistent state is reconstructed, or degraded handling is authorized. |

## 5. Turn 1 Bootstrap and One-Record-Per-Completed-Turn Rule

### 5.1 One-record-per-turn rule

- Every completed user-assistant turn creates exactly one PTR ledger entry beginning with Turn 1.
- Draft or discarded assistant text is not recorded; the PTR records the finalized response snapshot only.

### 5.2 Bootstrap Current PTR State

Before Turn 1 executes, no prior PTR ledger entry exists. A **Bootstrap Current PTR State** is established with the following canonical field values:

| Field | Bootstrap value |
|---|---|
| `ptr_schema_version` | current PTR Specification schema version (e.g., `"16.0.0"`) |
| `state_version` | `0` |
| `state_status` | `"bootstrap"` |
| `last_ptr_record_id` | `null` |
| `last_ledger_sequence` | `0` |
| `session_id` | assigned session identifier |
| `session_purpose` | `null` unless established by user |
| all other Current PTR State fields (§8) | empty, `null`, or default per §8 |

Bootstrap state satisfies predecessor-state validation for Turn 1 only.

### 5.3 Turn 1 record creation

After Turn 1's finalized snapshot exists (Canonical Turn Lifecycle step 5), a PTR record is created with:

- `ledger_sequence = 1`;
- `state_version_before = 0` (bootstrap);
- `state_version_after` = `1` if the turn materially changes Current PTR State, else `0` (bootstrap state retained);
- `record_type` per §4.

### 5.4 State-version advancement rule

- `ledger_sequence` advances by 1 for every completed turn.
- `state_version` advances only when Current PTR State materially changes.
- A `no_material_change` record references the existing (unchanged) `state_version` in both `state_version_before` and `state_version_after`.
- Whether Turn 1 advances `state_version` to `1` or remains at `0` is deterministic per §5.3.

### 5.5 Predecessor validation

- Turn 1: predecessor is Bootstrap Current PTR State; validation cannot fail on grounds of "no prior record."
- Turn N > 1: predecessor is the prior valid Current PTR State. If missing, corrupted, or schema-incompatible, route to recovery per §21.

## 6. Canonical PTR Record Schema

Every PTR ledger record MUST conform to this schema. Additional fields beyond those listed are permitted only when required by a specific `record_type` (§7).

### 6.1 Common fields (all records)

| Field | Type | Required | Meaning |
|---|---|---|---|
| `ptr_schema_version` | string (semver) | required | PTR Specification schema version the record conforms to. Must be compatible with the version bound by the Core bind template. |
| `ptr_record_id` | string (opaque unique identifier) | required | Immutable unique identifier for this PTR record. Correction and supersession references target this identifier. |
| `session_id` | string | required | Session identifier. |
| `turn_id` | string | required | Turn identifier within the session. |
| `ledger_sequence` | integer ≥ 1 | required | Ordered position in the PTR ledger. Advances by 1 per completed turn. |
| `record_type` | enum (§4) | required | Record type. |
| `state_version_before` | integer ≥ 0 | required | Current PTR State version at start of turn. Bootstrap = 0. |
| `state_version_after` | integer ≥ 0 | required | Current PTR State version at end of turn. Equals `state_version_before` for `no_material_change`. |
| `source_turn_ids` | array of string | required | User turn identifiers this record derives from. |
| `source_evidence_pointers` | array of pointer objects | required (may be empty for `no_material_change`) | Pointers to transcript regions, tool results, artifacts, or prior PTR IDs. |
| `classification_summary` | object (§9 summary) | required | Summary of classification dimensions applicable at the record level (e.g., predominant authority, protection, retention). Per-item classifications appear in `state_delta`. |
| `classification_status` | enum: `confirmed`, `provisional`, `disputed` | required | Overall classification status of the record. |
| `governance_status` | enum: `normal`, `recovery_required`, `degraded_authorized`, `halted` | required | Governance status recorded for this turn. |
| `mode_and_persona_state` | object | optional | Mode and persona state when material. |
| `state_delta` | array of state-transition objects (§10) | required (may be empty for `no_material_change`) | Additions, amendments, activations, deactivations, pauses, resumptions, completions, closures, supersessions, rejections, archival, reopening, protection changes, PCR-candidate changes. |
| `record_created_at` | ISO-8601 string | required | Record creation timestamp. |
| `prior_state_pointer` | string (`ptr_record_id` or `null` for Turn 1) | required | Pointer to the last valid PTR record whose Current PTR State snapshot this record advances from. |

### 6.2 Conditional fields

| Field | Type | Condition | Meaning |
|---|---|---|---|
| `corrects_ptr_record_id` | string | required when `record_type = correction` | Immutable identifier of the prior PTR record being corrected. |
| `supersedes_ptr_record_id` | string | required when a supersession is asserted | Immutable identifier of the prior record superseded. Prior record remains unchanged in the ledger. |
| `halt_reason_code` | string | required when `record_type = halt` | Enumerated halt reason. |
| `halt_reason_detail` | string | optional when `record_type = halt` | Short human-readable detail. |
| `archive_reason` | enum (§13) | required for any state-delta item with `Reuse = archived` | Archive reason. |
| `derivation_basis` | array of pointer objects | required for any state-delta item with `authority = derived` | Authoritative evidence identifiers. |
| `ambiguity_description` | object | required when `classification_status ∈ {provisional, disputed}` | Ambiguity/conflict description, source basis, resolution criteria, blocking status. |
| `dispute_resolution_required` | boolean | required when `classification_status = disputed` | Whether the dispute blocks current work. |
| `protected_items` | array of item references | optional | Items classified `Protection = protected` in this turn's Current PTR State. |
| `rejection_guards` | array of guard objects | optional | Compact rejection guards active this turn. |
| `unresolved_items` | array of item references | optional | Currently unresolved questions, approvals, dependencies, blocked actions. |
| `pcr_candidates` | array of item references | optional | Items marked `pcr-candidate` this turn. |
| `pcr_ratification_link` | string | required for any state-delta item transitioning to `Retention = pcr-promoted` | Identifier of the ratifying user action (never model-set). |
| `recovery_inputs` | object | required when `record_type = recovery` | Reconstruction inputs enumerated per §21. |
| `recovery_result` | enum: `succeeded`, `failed`, `degraded_authorized` | required when `record_type = recovery` | Recovery outcome. |
| `closure_kind` | enum: `nfar`, `eos`, `other` | required when `record_type = closure` | Closure kind. |
| `nfar_visible_output` | string | required when `closure_kind = nfar` | Must be exactly `"Standing by."` |

### 6.3 Nullability and empty-array rules

- Required fields with `type = array` MAY be empty arrays where marked "may be empty".
- Required scalar fields MUST NOT be null unless a specific bootstrap or Turn 1 exemption applies (see §5.2).
- Optional fields MAY be omitted or set to null.
- Undefined fields are prohibited; adding a new field requires a subsequent PTR Specification version.

## 7. Record-Type Schemas (Deltas from §6)

### 7.1 `state_change`

Uses the full §6.1 schema. `state_delta` MUST be non-empty and `state_version_after > state_version_before`.

### 7.2 `no_material_change` (compact)

The `no_material_change` record retains all §6.1 required fields for schema consistency but reflects that no material state changed:

- `state_version_after = state_version_before`;
- `state_delta = []`;
- `source_evidence_pointers` MAY be empty because `source_turn_ids` is sufficient;
- `classification_summary` reflects Current PTR State as of `state_version_before`;
- optional short `note` field permitted.

The full Current PTR State is not embedded; the record references the existing state version.

### 7.3 `closure`

- `closure_kind` required (§6.2).
- For `closure_kind = nfar`: `nfar_visible_output = "Standing by."` exactly; `state_delta` MAY be empty; `state_version_after = state_version_before` unless closure materially changes state.
- For `closure_kind = eos`: closure snapshot fields (Bound authorities in force, Session outcomes, Open items) MUST be represented either directly on the record or as pointers via `source_evidence_pointers`.

### 7.4 `halt`

- `halt_reason_code` required (§6.2).
- `state_version_after = state_version_before`; halted turns do not advance state.
- Preserves unresolved dependencies via `unresolved_items`.

### 7.5 `correction`

- `corrects_ptr_record_id` required (§6.2).
- The prior record is NOT overwritten; it remains available in the ledger.
- `state_delta` reflects the corrective transitions.

### 7.6 `recovery`

- `recovery_inputs` and `recovery_result` required (§6.2).
- When `recovery_result = degraded_authorized`, `governance_status = degraded_authorized` and the record MUST reference the explicit user authorization.
- When `recovery_result = failed`, subsequent behavior is defined by §21.

## 8. Current PTR State Schema

Current PTR State is a canonical object routed into the next turn by default in place of the full PTR ledger.

### 8.1 Canonical fields

| Field | Type | Required | Meaning |
|---|---|---|---|
| `ptr_schema_version` | string (semver) | required | PTR Specification schema version. Must match the version bound by the Core bind template. |
| `state_version` | integer ≥ 0 | required | Current state version. Bootstrap = 0. |
| `state_status` | enum: `bootstrap`, `active`, `recovery_required`, `halted` | required | Current state status. |
| `session_id` | string | required | Session identifier. |
| `last_ptr_record_id` | string or `null` | required (`null` in bootstrap) | Identifier of the most recent PTR ledger record. |
| `last_ledger_sequence` | integer ≥ 0 | required (0 in bootstrap) | Ledger sequence of the most recent PTR record. |
| `session_purpose` | string or `null` | required | Current session purpose. Nullable in bootstrap. |
| `current_objective` | object or `null` | required | Current objective and objective version. |
| `active_topic` | object or `null` | required | Active topic and topic boundaries. |
| `current_scope` | object or `null` | required | Current scope. |
| `active_constraints` | array | required (may be empty) | Active constraints. |
| `active_exclusions` | array | required (may be empty) | Active exclusions and prohibitions. |
| `authoritative_decisions` | array | required (may be empty) | Authoritative decisions. |
| `provisional_or_disputed_items` | array | required (may be empty) | Provisional or disputed interpretations that remain material. |
| `unresolved_items` | array | required (may be empty) | Unresolved questions, approvals, dependencies, and blocked actions. |
| `protected_items` | array | required (may be empty) | Items classified `Protection = protected`. |
| `rejection_guards` | array | required (may be empty) | Active compact rejection guards. |
| `evidence_pointers` | array | required (may be empty) | Current evidence and source pointers. |
| `active_artifacts` | array | required (may be empty) | Active artifacts, canonical filenames, and versions. |
| `mode_and_persona_state` | object or `null` | required | Active mode and persona state when material. |
| `ambiguity_or_drift_or_halt` | object or `null` | required | Current ambiguity, drift, trust, or halt condition when material. |
| `pcr_candidates` | array | required (may be empty) | PCR candidates. |
| `retrieval_pointers` | array | required (may be empty) | Retrieval pointers to dormant or archived PTR records and source turns. |
| `last_material_state_delta` | object or `null` | required | Summary of the last material state delta. |

### 8.2 Must-not-contain-by-default

Current PTR State MUST NOT contain by default:

- the complete transcript;
- the full PTR ledger;
- full tool logs;
- private chain-of-thought;
- repeated source passages;
- every rejected alternative in full;
- completed intermediate steps whose outcome is settled;
- unrelated topic branches;
- raw telemetry fields that do not affect later-turn interpretation.

### 8.3 Compaction rule

Compaction removes duplicated wording, not authority or meaning. Use:

- outcomes instead of full discussion;
- source pointers instead of copied passages;
- compact rejection guards;
- dormant pointers for reusable historical material;
- exact wording for protected requirements when paraphrase could change effect.

### 8.4 Last-valid-state rule

The Current PTR State reflects the last valid state version. On failed PTR validation or failed recovery, Current PTR State remains at the last valid `state_version` and `state_status = recovery_required` is recorded (see §21).

## 9. Classification Dimensions

Each information item uses only the dimensions applicable to it. Classifications appear per state-delta item (§10) and are summarized at record level in `classification_summary`.

### 9.1 Authority

| Value | Meaning |
|---|---|
| `authoritative` | Direct user instruction, user-ratified decision, or binding governance artifact. |
| `advisory` | Nonbinding guidance or recommendation. |
| `proposed` | Model interpretation or recommendation not yet confirmed. |
| `derived` | Explicit inference drawn from identified authoritative evidence. |

There is no universal default. A model-created interpretation is `proposed` unless its inferential basis is explicit enough to justify `derived`.

### 9.2 Lifecycle

| Value | Meaning |
|---|---|
| `unresolved` | Open question, decision, or dependency. |
| `in-progress` | Adopted work that has actually begun. |
| `completed` | Intended work or decision completed. |
| `paused` | Intentionally suspended and potentially resumable. |
| `closed` | No further action expected under the current scope. |

Lifecycle is optional. Non-task statements do not receive a Lifecycle value.

### 9.3 Disposition

| Value | Meaning |
|---|---|
| `current` | Still valid under the current source basis. |
| `superseded` | Replaced by a later authoritative item. |
| `rejected` | Explicitly declined or prohibited. |
| `obsolete` | No longer valid because conditions or authority changed. |

### 9.4 Reuse

| Value | Meaning |
|---|---|
| `in-context` | Included in the next governed turn. |
| `dormant` | Valid and retrievable but normally omitted from the next turn. |
| `archived` | Retained for audit or conditional retrieval; not normally reused. |

### 9.5 Protection

| Value | Meaning |
|---|---|
| `protected` | Cannot be silently compressed, omitted, or retired. |
| `standard` | Normal governed handling. |

### 9.6 Retention

| Value | Meaning |
|---|---|
| `session-only` | Expected to end with the session. |
| `pcr-candidate` | Proposed for possible cross-session continuity. |
| `pcr-promoted` | Included through a user-ratified PCR or another explicitly approved continuity action. |

A model may mark `pcr-candidate`. A model may not independently mark `pcr-promoted`.

### 9.7 Classification Status

| Value | Meaning |
|---|---|
| `confirmed` | Directly supported by explicit authority or verified evidence. |
| `provisional` | Best current interpretation but not yet confirmed. |
| `disputed` | Conflicting sources or user correction remain unresolved. |

Every `provisional` or `disputed` item must identify:

- the ambiguity or conflict;
- source basis;
- what would resolve it;
- whether the issue blocks current work.

## 10. State Delta Schema

`state_delta` items describe individual transitions. Each item has:

| Field | Type | Required | Meaning |
|---|---|---|---|
| `item_ref` | string | required | Identifier for the affected information item. |
| `transition` | enum (§11) | required | The state transition applied. |
| `authority` | §9.1 | required | Authority classification of the item. |
| `lifecycle` | §9.2 | optional | Lifecycle value where applicable. |
| `disposition` | §9.3 | required | Disposition. |
| `reuse` | §9.4 | required | Reuse category. |
| `protection` | §9.5 | required | Protection. |
| `retention` | §9.6 | required | Retention. |
| `classification_status` | §9.7 | required | Classification status. |
| `archive_reason` | §13 | required when `reuse = archived` | Archive reason. |
| `derivation_basis` | array of pointers | required when `authority = derived` | Basis. |
| `source_evidence_pointers` | array of pointers | required | Source evidence for this transition. |

## 11. Permitted State Transitions

- `add`, `confirm`, `amend`, `activate`, `deactivate`, `pause`, `resume`, `complete`, `close`, `supersede`, `reject`, `mark_obsolete`, `protect`, `retire_protection_authorized`, `archive`, `reopen`, `promote_to_pcr_candidate`, `record_pcr_promotion_after_ratification`.

Silent retirement of a `protected` item is prohibited (§14).

## 12. State-Transition Precedence

When information conflicts, apply this order:

1. Platform system and safety requirements.
2. Ratified CoSyn Constitution authority stack.
3. Current explicit user instruction.
4. Current user-ratified project artifact or PCR.
5. Verified current tool or source evidence within its proper domain.
6. Prior authoritative Current PTR State.
7. Derived conclusion with identified evidence.
8. Model proposal or advisory content.

Additional rules:

- The current user turn may correct or supersede prior PTR state.
- A stored PTR item cannot override a current explicit user correction.
- A model proposal cannot silently become authoritative through repetition.
- Conflicting authoritative sources remain `disputed` until resolved.
- Historical text does not outrank a later ratified amendment.
- Cross-project information cannot enter active state without valid routing and source identification.

## 13. Archive Reasons

Required when `Reuse = archived`. Enumerated values:

- `obsolete`
- `irrelevant-to-current-objective`
- `extraneous`
- `unneeded-for-current-reuse`
- `completed-residue`
- `rejected-residue`
- `superseded-residue`

## 14. Rejection Guards and Protected-Item Handling

### 14.1 Rejection guards

A rejected item remains `Reuse = in-context` only as a compact guard when reintroduction risk remains material. When that risk ends, the item transitions to `Disposition = rejected`, `Reuse = archived`, `archive_reason = rejected-residue`.

A rejection guard consists of a short label, `source_correction_ptr_record_id` (or `source_correction_turn_id`), and a one-line reason.

### 14.2 Protected-item retirement

A protected item may leave active context only through an auditable transition grounded in:

- explicit user action;
- user-ratified supersession;
- user-confirmed scope closure;
- promotion into a user-ratified PCR where active injection is no longer needed.

Silent retirement is prohibited (Class 0 failure per CoSyn Constitution v16.1.0).

### 14.3 Reopening

A rejected, superseded, dormant, or archived item may return to active consideration only when:

- the user explicitly reopens it;
- a current authoritative artifact changes its standing;
- a verified source change makes reconsideration necessary.

The reopening record must preserve the prior disposition and identify the new source basis.

## 15. Telemetry Fields

Per PTR record (silent by default; rendered only on explicit user command):

- `ptr_record_id`
- `ptr_schema_version`
- `session_id`
- `turn_id`
- `ledger_sequence`
- `record_type`
- `state_version_before`
- `state_version_after`
- `classification_summary`
- `classification_status`
- `governance_status`
- `source_turn_ids`
- `source_evidence_pointers`
- `derivation_basis` (when any state-delta item has `authority = derived`)
- `corrects_ptr_record_id` (when `record_type = correction`)
- `supersedes_ptr_record_id` (when applicable)
- `protected_items` (list)
- `rejection_guards` (list)
- `unresolved_items` (list)
- `pcr_candidates` (list)
- `pcr_ratification_link` (when applicable)
- `mode_and_persona_state` (when material)
- `halt_reason_code` (when `record_type = halt`)
- `archive_reason` (per state-delta item with `reuse = archived`)
- `recovery_result` (when `record_type = recovery`)
- `closure_kind` (when `record_type = closure`)

These fields are versioned by this specification. Governor enforces collection, access, rendering, and filtering by versioned reference to this section. Governor does not restate them.

## 16. Render Controls

- Default render: suppressed.
- Explicit triggers: `ptr render on`, `ptr render off`, `ptr render level minimal|standard|full`, `ptr audit last`, `ptr audit range`, `ptr show state`.
- Render level `minimal` includes: `ptr_record_id`, `turn_id`, `record_type`, `classification_status`, and `last_material_state_delta` summary.
- Render level `standard` adds: `classification_summary`, `source_turn_ids`, `unresolved_items`.
- Render level `full` adds: remaining telemetry fields except any protected system content.

## 17. No Chain-of-Thought Exposure

PTR records the CoSyn-governed interpretation and its outcomes. Private reasoning traces, hidden system content, and non-emitted draft text must not be exposed. Render controls have no level that discloses chain-of-thought.

## 18. Selective Retrieval

- Later-turn reasoning uses Current PTR State by default.
- The full PTR ledger and full transcript are not injected by default.
- Historical PTRs and source turns are retrieved only on defined triggers:
  - explicit user command (e.g., `ptr audit last`, `ptr audit range`, `ptr show state`);
  - active reference in the current turn to a specific prior record;
  - correction or recovery workflow that requires prior state.

## 19. Correction and Supersession

- A `correction` PTR record links via `corrects_ptr_record_id` (§6.2) to the affected prior record.
- The prior record is NOT overwritten and remains in the ledger.
- Current PTR State reflects the correction after the turn completes.
- Supersession links are preserved via `supersedes_ptr_record_id` and never overwrite the original.

## 20. PCR-Candidate Behavior and Ratified PCR Promotion

- A model may mark items `Retention = pcr-candidate` when they appear to have durable cross-session value.
- Marking `pcr-candidate` does not confer authoritative status.
- `Retention = pcr-promoted` requires user ratification through a PCR or another explicitly approved continuity action. The `pcr_ratification_link` field identifies the ratifying user action.
- Absent ratification, `pcr-promoted` cannot be set.
- PCR synthesis consults: the finalized Current PTR State, the complete PTR ledger, relevant source turns, material artifacts, unresolved items, and correction/supersession/reopening/recovery history.
- Task-specific bolt-ons MAY extend PCR schemas with domain-specific fields (e.g., the Creative Writing bolt-on defines a twenty-section fiction PCR schema in `fiction-pcr-protocol-v16.0.0.md`). Extensions MUST NOT restate promotion ratification rules, MUST NOT permit `pcr-promoted` without `pcr_ratification_link`, and MUST declare dependency on this §20 as their base ownership.

## 21. Failure Semantics and Recovery

This section defines deterministic behavior when PTR creation or validation fails after the finalized response snapshot has been produced.

### 21.1 Non-interference invariant

1. The finalized response snapshot remains unchanged in all failure conditions.
2. PTR failure may not rewrite, suppress, or append to the response snapshot.
3. Telemetry failure may not rewrite, suppress, or append to the response snapshot.
4. The invalid PTR record is not committed as valid to the ledger.
5. Current PTR State remains at the last valid `state_version`.
6. A `governance_status = recovery_required` (or `halted`) condition is recorded using the strongest available in-session mechanism.
7. The unchanged response snapshot is emitted (Canonical Turn Lifecycle step 9).

### 21.2 Next-turn behavior after in-turn PTR failure

Before the next substantive turn proceeds:

- predecessor validation detects the `recovery_required` condition;
- recovery is attempted using the inputs enumerated in §21.4;
- if recovery succeeds, a `recovery` record with `recovery_result = succeeded` is created and normal operation resumes;
- if recovery fails, the next turn issues a `halt` record and emits the minimum user-visible recovery notice, then requires explicit user direction to proceed.

### 21.3 Turn 1 failure rule

If PTR creation or validation fails on Turn 1:

- Bootstrap state version 0 is preserved;
- `state_status = recovery_required`;
- the unchanged finalized response is emitted;
- Turn 2 substantive reasoning is blocked until recovery succeeds.

### 21.4 Reconstruction inputs

Reconstruction considers:

- prior Current PTR State;
- source user message;
- finalized response snapshot;
- material tool outcomes;
- created or modified artifacts;
- authoritative decisions;
- provisional and disputed items;
- protected items;
- active exclusions and prohibitions;
- rejection guards;
- supersession links;
- unresolved items;
- objective changes;
- expected state-delta categories;
- source-turn identifiers.

### 21.5 Reconstruction acceptance standard

Reconstruction succeeds only when:

- all prior protected items are accounted for;
- rejection guards are preserved or audibly retired;
- supersession links remain represented;
- the explicit user instruction is reflected;
- expected state-delta categories are accounted for;
- artifact effects are represented;
- uncertain classifications remain `provisional` or `disputed` rather than guessed;
- the `recovery` record links to the affected turn;
- no prior record is overwritten.

### 21.6 Failure behavior table

| Outcome | Behavior |
|---|---|
| Reconstruction succeeds | Record `recovery` with `recovery_result = succeeded`; update Current PTR State; notify the user briefly. |
| Reconstruction fails | Halt with a minimal statement of what could not be reconstructed. |
| User explicitly authorizes degraded handling | Proceed only for the stated scope; record `recovery_result = degraded_authorized` and `governance_status = degraded_authorized`. |
| Recovery itself fails | Halt and require explicit user direction. |

### 21.7 Telemetry-only failure

A telemetry-render or telemetry-storage failure does not invalidate an otherwise valid PTR state unless the missing telemetry is itself required for reconstruction. In that case, treat as PTR failure per §21.1.

### 21.8 No claim of executable persistence

This specification does not claim transactional persistence, atomic storage, exactly-once delivery, or rollback guarantees. The mechanisms above define governance behavior within the in-session protocol only.

### 21.9 Bolt-on recovery extensions

Task-specific bolt-ons MAY define domain-specific recovery triggers and continuity-repair rules that consume Core recovery outcomes. Extensions MUST NOT weaken the §21.1 non-interference invariant, MUST NOT weaken §21.5 acceptance criteria, and MUST declare dependency on this §21 as their base ownership.

## 22. Halt Conditions

The specification governs the following halt conditions:

- unresolvable classification ambiguity that blocks current work;
- missing predecessor Current PTR State that cannot be reconstructed;
- schema-incompatible PTR record;
- attempted silent PCR promotion;
- attempted silent retirement of a protected item;
- attempted silent overwrite of a prior PTR record;
- rejected-item reintroduction without an authorized reopening;
- attempted silent modification of the finalized response snapshot by PTR or telemetry processing (Class 0 per CoSyn Constitution v16.1.0).

A halt records `record_type = halt` with `halt_reason_code`, preserves unresolved dependencies, and requires explicit user direction to resume.

## 23. Schema Compatibility

- PTR Specification schema version is declared at the top of this file (`16.1.0`).
- Governor and Architect reject records whose `ptr_schema_version` is not compatible with the version bound by the active bind template.
- Current PTR State whose `ptr_schema_version` does not match the bound version routes to recovery per §21.
- Compatibility statement: PTR Specification v16.1.0 is compatible with CoSyn Constitution v16.1.0, Persona Governor v16.1.0, Stack Architect v16.1.0, Core Bind Template v16.1.0, Mode Registry v16.1.0, Extension Contract v16.1.0.

## 24. Terminology Migration

- Active TPR references have been migrated to PTR throughout this specification.
- Active CRS references have been migrated to PCR where the semantic concept is continuity-record.
- Historical references (changelog entries in other artifacts) remain unchanged.
- Compatibility aliases exist only where an actual consumer requires them; none are declared in this specification.

## 25. Normative Examples

These examples are schema-consistent and illustrative. They are not additional authority.

### 25.1 Turn 1 bootstrap with material state change

```json
{
  "ptr_schema_version": "16.0.0",
  "ptr_record_id": "ptr-<opaque>",
  "session_id": "sess-<opaque>",
  "turn_id": "turn-1",
  "ledger_sequence": 1,
  "record_type": "state_change",
  "state_version_before": 0,
  "state_version_after": 1,
  "prior_state_pointer": null,
  "source_turn_ids": ["turn-1"],
  "source_evidence_pointers": [{"kind":"transcript","turn":"turn-1"}],
  "classification_summary": {"authority":"authoritative","protection":"standard","retention":"session-only"},
  "classification_status": "confirmed",
  "governance_status": "normal",
  "state_delta": [
    {"item_ref":"objective:setup","transition":"add","authority":"authoritative",
     "disposition":"current","reuse":"in-context","protection":"standard",
     "retention":"session-only","classification_status":"confirmed",
     "source_evidence_pointers":[{"kind":"transcript","turn":"turn-1"}]}
  ],
  "record_created_at": "2026-08-13T00:00:00Z"
}
```

### 25.2 Turn 1 bootstrap with no material state change

Same shape as §25.1 but `state_version_after = 0`, `state_delta = []`, `record_type = "no_material_change"`, `source_evidence_pointers = []`.

### 25.3 Correction record

`record_type = "correction"`, `corrects_ptr_record_id = "ptr-<earlier>"`. Prior record remains in the ledger.

### 25.4 Rejection guard

State-delta item with `disposition = rejected`, `reuse = in-context`, plus a `rejection_guards` entry `{ "label": "...", "source_correction_ptr_record_id": "...", "reason": "..." }`.

### 25.5 Protected-item retirement

State-delta item with `protection = protected`, `transition = retire_protection_authorized`, plus explicit user-action reference in `source_evidence_pointers`.

### 25.6 Failed PTR validation

- Finalized snapshot remains emitted unchanged (§21.1).
- Current PTR State keeps `state_version = last_valid`; `state_status = recovery_required`.
- No PTR record is committed as valid for this turn.
- Next turn attempts recovery per §21.2.

### 25.7 Recovery

`record_type = "recovery"`, `recovery_inputs` enumerated per §21.4, `recovery_result = "succeeded"`.

### 25.8 PCR candidate designation

State-delta item with `retention = pcr-candidate` and `pcr_candidates` list populated. Not yet promoted.

### 25.9 Ratified PCR promotion

State-delta item with `retention = pcr-promoted`, `transition = record_pcr_promotion_after_ratification`, `pcr_ratification_link` identifying the ratifying user action.

### 25.10 NFAR closure

`record_type = "closure"`, `closure_kind = "nfar"`, `nfar_visible_output = "Standing by."` (exact).

---

*Document ID: ptr-specification-v16.1.0 — PROPOSED / READY FOR CREATOR REVIEW — Generated 2026-08-13*
