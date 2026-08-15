<!--
CoSyn v16 Authority Header (added at derivation; original content follows unchanged)

Package: creative-writing-v16.0.0
Tier: Task-specific bolt-on
Role: Default generic fiction-profile template
Authority Level: task_specific_bolt_on_template
Authority Ceiling: cosyn-constitution-v16.0.0.md
Core dependencies: schemas/fiction-project-profile-schema-v16.0.0.md
Source basis: DefaultGenericFictionProfile_CfW_v1.0.1.md
Status: PROPOSED / READY FOR CREATOR REVIEW
Generated: 2026-08-13

Note: The interior content that follows is preserved verbatim from the source basis except as documented in provenance. Legacy CfW authority declarations, version references, and cross-references inside the interior content refer to the artifacts as they existed in the CoSyn-for-Writing v1.0.1 migration source. Under v16, this bolt-on binds Core (cosyn-constitution-v16.0.0.md and its subordinates) rather than any legacy CGS/CfW authority. This header supersedes any legacy authority declaration inside the interior content for v16 composition purposes.
-->
# DefaultGenericFictionProfile_CfW — Blank Project Profile Template, v1.0.1

## Artifact Identity

- **Artifact name:** DefaultGenericFictionProfile_CfW
- **Artifact version:** 1.0.1
- **Package identity:** CoSyn_for_Writing_v1.0.1 (short: CfW)
- **Normative or informative status:** Informative (template only). A specific project profile authored against this template acquires authority only through user ratification (tier 5).
- **Source lineage:** `FictionProjectProfileSchema_CfW_v1.0.1.md` §§3, 4.
- **Authority level:** None until ratified by a user for a specific project.
- **Ratification status:** Proposed — pending user ratification.
- **Session status:** Unbound; inactive; not loaded into any live fiction session.
- **Compatibility scope:** CGS v15.0.1; CfW v1.0.1.
- **Supersession intent:** Supersedes the corresponding v1.0.0 artifact; preserves all unaffected v1.0.0 provisions.
- **Generation timestamp:** 2026-08-02

## Mandatory Statements

This artifact defines in-session instruction governance only. It does not define or claim runtime enforcement, external persistence, telemetry, storage, deployment, or executable behavior.

This artifact has no normative dependency on The Roatan Amulet, CCBNS, or any project-specific fiction package. It contains no character name, no resource name, no scene name, no canon statement.

## Standing Scope Disclaimers

1. CfW is not a runtime, software, or executable enforcement system.
2. CfW makes no claim of transactional persistence, atomic storage, exactly-once delivery, or rollback.
3. CfW does not claim automatic cross-session memory or automatic restoration.
4. CfW does not run background processes, services, or daemons.
5. CfW does not integrate with APIs, tools, or external ledgers.
6. In-session governance is a protocol the model applies inside its own response construction; the words "gate" and "ledger" are terms of art with no runtime connotation.

---

## Usage

Copy this file, rename to `[YourProject]_ProjectProfile_v0.1.md`, fill every field marked with square brackets, save, and reference from your Session Initialization Prompt (see `SessionInitialization_CfW_v1.0.1.md`).

Loading this template does not ratify anything. Ratification is a deliberate user act (see `CGS_CfW_v1.0.1.md` §6).

---

# [PROJECT NAME] — Project Profile

**Package identifier:** [project-owned identifier, e.g., `MyProject_v0.1.0`]
**Profile version:** 0.1.0
**Authoring timestamp:** [YYYY-MM-DD]
**Status:** Proposed — pending user ratification

## 1. Identity

- **Project name:** [name]
- **Project package identifier:** [identifier]
- **Profile version:** [version]

## 2. Constitutional Inheritance Declaration

- This project inherits **CGS v15.0.1** by reference.
- This project inherits **CoSyn for Writing v1.0.1** by reference.
- This project profile creates no authority above tier 5. It does not override tiers 1–4. It does not contain workflow-scope content (workflow-scope content belongs in a workflow profile).

## 3. Roster

Enumerate every named participant. One entry per participant. Category MUST be one of the five in `FictionControlBoundaryModel_CfW_v1.0.1.md` §2.

- **Participant:** [name]
  - **Category:** [Author-Controlled character | Model-Controlled Supporting Character | Shared / NPC | External Narrator | Scene Director]
  - **Category holder:** [human name | model]
  - **Voice-and-values summary:** [short paragraph sufficient to differentiate voice from every other participant]

- **Participant:** [name]
  - **Category:** [...]
  - **Category holder:** [...]
  - **Voice-and-values summary:** [...]

*(Add rows as needed. A project may have any number of participants.)*

## 4. Accepted Canon Summary

Compact list of Established / Approved canon at the profile's ratification point. One line per item.

- [canon item] — [source-correction pointer if applicable]
- [canon item]
- [...]

## 5. Sole-Authority-Over-Resource Assignments (optional)

Delete this section if no sole-authority assignments apply.

- **Resource:** [named resource]
  - **Sole-authority holder:** [participant name from roster]
  - **Consent recorded in-turn means:** [project-owned definition of what consent looks like for this resource type]

- **Resource:** [...]
  - **Sole-authority holder:** [...]
  - **Consent recorded in-turn means:** [...]

## 6. Rejected Material List (optional)

Delete this section if no rejected material carries reintroduction risk.

- **Rejected item:** [compact identifier]
  - **Source-correction pointer:** [reference to where the rejection is recorded]
  - **One-line reason:** [...]

## 7. Intentionally-Undefined Items (optional)

Delete this section if none.

- **Item:** [identifier]
  - **Scope:** [what the item covers]
  - **Rationale:** [why the matter is designated organic or unspecified]

## 8. Initiation-Canon Reference (optional)

Delete this section if none.

- **Initiation-canon artifact name:** [name]
- **Initiation-canon artifact version:** [version]
- **Path:** [path]
- **Ratification status:** [Proposed — pending user ratification | Ratified at tier 7]

## 9. Amendments Log

- **Date:** [YYYY-MM-DD] — **Rationale:** [one line] — **PTR ratification-record reference:** [ledger sequence + record id]

*(Add rows in chronological order. The first row for a new profile is the initial ratification event; subsequent rows are amendments.)*

## 10. Prohibited-Content Reminder

This project profile MUST NOT contain:

- Any override of tiers 1–4.
- Any workflow behavior (turn shape, cadence, phase transitions, integration order, authorized-exception declarations).
- Any implementation instruction for a specific model, tool, or platform.
- Any content from another project.

## 11. Cross-References

- Constitutional ordering and ratification discipline: `CGS_CfW_v1.0.1.md`.
- Project-profile schema (authoritative field list): `FictionProjectProfileSchema_CfW_v1.0.1.md`.
- Controller categories, agency scopes, sole-authority: `FictionControlBoundaryModel_CfW_v1.0.1.md`.
- Workflow-profile template: `DefaultGenericWorkflowProfile_CfW_v1.0.1.md`.
- Session initialization: `SessionInitialization_CfW_v1.0.1.md`.

---

*End of DefaultGenericFictionProfile_CfW_v1.0.1 — Proposed — pending user ratification*
