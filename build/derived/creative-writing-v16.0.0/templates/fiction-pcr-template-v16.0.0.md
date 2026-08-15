<!--
CoSyn v16 Authority Header (added at derivation; original content follows unchanged)

Package: creative-writing-v16.0.0
Tier: Task-specific bolt-on
Role: Twenty-section fiction PCR fillable template
Authority Level: task_specific_bolt_on_template
Authority Ceiling: cosyn-constitution-v16.0.0.md
Core dependencies: fiction-pcr-protocol-v16.0.0.md, ptr-specification-v16.0.0.md
Source basis: PCR_Template_CfW_v1.0.1.md
Status: PROPOSED / READY FOR CREATOR REVIEW
Generated: 2026-08-13

Note: The interior content that follows is preserved verbatim from the source basis except as documented in provenance. Legacy CfW authority declarations, version references, and cross-references inside the interior content refer to the artifacts as they existed in the CoSyn-for-Writing v1.0.1 migration source. Under v16, this bolt-on binds Core (cosyn-constitution-v16.0.0.md and its subordinates) rather than any legacy CGS/CfW authority. This header supersedes any legacy authority declaration inside the interior content for v16 composition purposes.
-->
# PCR_Template_CfW — Project Continuity Record Template, v1.0.1

## Artifact Identity

- **Artifact name:** PCR_Template_CfW
- **Artifact version:** 1.0.1
- **Package identity:** CoSyn_for_Writing_v1.0.1 (short: CfW)
- **Normative or informative status:** Informative (template only). A specific PCR authored against this template is a resume-input artifact; ratification of items within the PCR requires a separate user act (see `CGS_CfW_v1.0.1.md` §6).
- **Source lineage:** `PCR_Protocol_CfW_v1.0.1.md` §4 (twenty-section content schema); Phase 2 `PTR_AND_PCR_ARCHITECTURE_CfW_v1.0.0.md` §7.4.
- **Authority level:** None until a specific PCR is authored, ratified, and loaded into a session.
- **Ratification status:** Proposed — pending user ratification.
- **Session status:** Unbound; inactive; not loaded into any live fiction session.
- **Compatibility scope:** CGS v15.0.1; CfW v1.0.1; PTR-Spec v1.1.0.
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

Copy this file, rename to `[YourProject]_PCR_v[N].md`, fill every field marked with square brackets, save. Loading this template does not produce a PCR. A PCR is produced only on explicit user command per `PCR_Protocol_CfW_v1.0.1.md` §2.

Every section below is required per `PCR_Protocol_CfW_v1.0.1.md` §4. Omitting a required section is a Class 1 failure that MUST be surfaced for user resolution before the artifact is delivered.

---

# [PROJECT NAME] — Project Continuity Record — v[N]

**PCR name:** [name]
**PCR version:** [version]
**Ratification timestamp:** [YYYY-MM-DD HH:MM]
**pcr-ratification-link (PTR ledger):** [ledger sequence + record id]
**Status:** Proposed — pending user ratification

## 1. Purpose Statement

[What this PCR is for and what it continues. One paragraph.]

## 2. Governing Sources with Load Order

Enumerate what must be loaded in the next session, in what order.

1. CGS v15.0.1 (inherited by reference).
2. Manifest: `Manifest_CoSyn_for_Writing_v1.0.1.json`.
3. Always-active core: the seven files declared by the manifest.
4. Project profile: [name, version, path].
5. Workflow profile: [name, version, path].
6. Project canon or accepted source: [name, version, path] (if applicable).
7. This PCR: [PCR name, version, path].
8. CRC: [name, version, path] (if applicable; subordinate to this PCR).
9. Resume-phase conditional artifacts: [names and versions required by the manifest activation map].

## 3. Exact Resume Objective / Scene

- **Resume objective:** [what the next session continues toward].
- **Resume scene reference:** [scene identifier, chapter identifier, or narrative position].

## 4. Character Controllers and Agency

Per-participant snapshot. One entry per participant.

- **Participant:** [name]
  - **Controller category:** [Author-Controlled character | Model-Controlled Supporting Character | Shared / NPC | External Narrator | Scene Director]
  - **Category holder:** [human name | model]
  - **Sole-authority-over-resource:** [enumerated per resource, if any]

## 5. Character States

Per-participant current state.

- **Participant:** [name]
  - **Location:** [where the participant is at the resume point]
  - **Condition:** [physical, emotional, situational state]
  - **Current knowledge:** [what the participant knows and does not know at the resume point]

## 6. Relationship State

Where relevant to the resume point.

- **Relationship:** [participant A ↔ participant B]
  - **State:** [current state of the relationship]
  - **Recent developments:** [material changes since prior PCR, if any]

## 7. Leadership / Authority State

Where relevant to the resume point.

- **Authority / leadership position:** [description]
- **Holder:** [participant name]
- **Recent changes:** [if any]

## 8. Technical / Resource State

Where relevant to the resume point.

- **Resource / technology:** [name]
- **Current state:** [operational status, location, ownership per §4]
- **Recent changes:** [if any]

## 9. Completed Developments (Canonical Completion Locks)

Events completed and not to be replayed as pending. Each lock MUST be recoverable to its completed disposition.

- **Completion lock:** [event]
  - **Disposition:** completed
  - **Recovery pointer:** [where the completion is recorded]

## 10. Exact Procedure / Outcome for Pivotal Recent Events

For events whose resolution logic must be preserved verbatim.

- **Event:** [name]
  - **Procedure:** [step-by-step description of how the event resolved]
  - **Outcome:** [the resolved outcome]

## 11. Available Resources

In-fiction resources available at the resume point.

- **Resource:** [name] — **Status:** [available / unavailable / partially available] — **Holder:** [participant name if applicable]

## 12. Accepted Canon Summary

Compact list of Established / Approved canon relevant to the resume point.

- [canon item]
- [canon item]

## 13. Rejected and Superseded Material List

J-1 non-return applies. Each entry MUST include a source-correction pointer and reason.

- **Rejected item:** [compact identifier]
  - **Source-correction pointer:** [reference]
  - **Reason:** [one line]

- **Superseded item:** [compact identifier]
  - **Superseded-by pointer:** [reference to the successor record]
  - **Reason:** [one line]

## 14. Intentionally-Undefined Items

Non-predetermination applies (see `FictionControlBoundaryModel_CfW_v1.0.1.md` §8).

- **Item:** [identifier]
  - **Scope:** [what the item covers]
  - **Reason for undefined status:** [rationale]

## 15. Unresolved Decisions

Each entry MUST include resolution criteria per PTR-Spec §9.7.

- **Unresolved decision:** [description]
  - **Resolution criteria:** [what would resolve the decision]
  - **Deadline / dependency:** [if any]

## 16. Exact Restart Instruction

[How the next session begins. Verbatim first user turn OR "Await user instruction."]

## 17. Next Creative Handoff

If Active Simulation resumption applies:

- **Handoff wording:** [the scene opening that invites the user to author the next beat]
- **Author-Controlled character to whom the handoff points (if any):** [name]

## 18. Next-Turn Requirements Block

Integration checks or pre-emission checks that MUST fire on the first substantive turn.

- **Integration of the last user contribution captured in this PCR:** [describe the specific contribution to integrate]
- **Other pre-emission checks:** [enumerate any additional required checks]

## 19. Stale-Artifact Enumeration

Any prior artifact that MUST NOT control the continuation, with reason.

- **Artifact:** [name and version]
  - **Reason:** [why this artifact must not control continuation]

## 20. PCR Version and Ratification Record

- **PCR name:** [name]
- **PCR version:** [version]
- **Ratification timestamp:** [YYYY-MM-DD HH:MM]
- **pcr-ratification-link (PTR ledger):** [ledger sequence + record id]
- **Prior PCR (superseded):** [name, version if applicable]
- **Supersession link:** [reference to the supersession record in the PTR ledger]

---

## Load-Time Reminder

Loading this PCR into a later session is a deliberate act during the Session Initialization phase. Content in this PCR does NOT automatically enter tiers 3–7. Items requiring ratification acquire authority only through the ratification discipline in `CGS_CfW_v1.0.1.md` §6. Stale-artifact enumeration in §19 is honored — enumerated artifacts MUST NOT control continuation.

## Cross-References

- Trigger policy, synthesis inputs, content schema, ratification: `PCR_Protocol_CfW_v1.0.1.md`.
- Session initialization: `SessionInitialization_CfW_v1.0.1.md`.
- State model and continuity precedence: `FictionStateModel_CfW_v1.0.1.md`.
- Recovery-family phases: `RecoveryProtocol_CfW_v1.0.1.md`.
- CRC (optional subordinate): `PCR_Protocol_CfW_v1.0.1.md` §6.

---

*End of PCR_Template_CfW_v1.0.1 — Proposed — pending user ratification*
