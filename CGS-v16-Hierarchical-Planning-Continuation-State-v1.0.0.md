# CGS v16 Hierarchical Planning — Continuation State

**Version:** 1.0.0  
**Session close:** 2026-08-12  
**Status:** Approved architecture and implementation plan; implementation pending

## Current Objective

Use CCT to build a modular CGS v16 governance architecture that prevents overlap, redundancy, and authority conflict by separating universal governance from user-specific controls, task-specific bolt-ons, and project-specific controls.

## Approved Hierarchy

1. **Tier 1 — CGS v16 Core**
   - Universal governance only.
   - Contains the extension/binding mechanism and Anti-AI Signature Gate.
   - Does not contain writing-specific personas or other domain-specific governance.

2. **Tier 2 — User / Secondary Controls**
   - User preferences, response/render preferences, editing preferences where user-specific, voice/style preferences, and memory/context preferences.
   - Complete User Profile package is a future task; Core must support the layer structurally.

3. **Task-Specific Bolt-Ons**
   - Loaded only when the expertise applies to the project.
   - Example: Creative Writing / CfW.
   - A bolt-on extends Core but may not restate, weaken, fork, or compete with higher governance.
   - Conflicting bolt-ons fail closed unless higher-authority governance deterministically resolves the conflict.

4. **Tier 3 — Project-Specific Controls**
   - Project canon, project instructions, approved decisions, PCR/continuation state, and other project-specific artifacts.

## Creative Writing / CfW Bolt-On

The Creative Writing bolt-on is built from the CfW source directory and contains only writing-specific governance.

The **full Writing Team Personas governance instructions** belong in the Creative Writing bolt-on. They are not part of CGS v16 Core and are not loaded into non-writing projects.

The embedded Bookfox Batch 03 material is subordinate reference material. Separate it from active persona governance and retain it in the bolt-on reference area rather than treating it as governing runtime context.

## Capability Ownership Rule

Each governing capability has one authoritative owner. CCT must generate a capability-ownership map before final packaging.

Conceptual ownership already approved:

- general assumption control → Core
- general persona architecture → Core
- extension/binding rules → Core
- Anti-AI enforcement → Core
- writing professional personas → Creative Writing bolt-on
- fiction canon framework → Creative Writing bolt-on
- character/POV writing controls → Creative Writing bolt-on
- user response/style preferences → Tier 2 / User Profile
- specific project canon and decisions → Tier 3 / Project

## Naming Rules

### Tier 1 / Core
`<purpose>-v16.y.z`

- `16` = CGS governance generation
- `y` = major refinement
- `z` = minor refinement initiated by the CGS creator

### Task-Specific Bolt-Ons
`<specific area of expertise>-v16.y.z`

### Tier 2 and Tier 3 Artifacts
`<purpose>16-X.y.z`

- `X = 2` → Tier 2
- `X = 3` → Tier 3

Manifests must also declare tier/authority; filenames alone do not establish authority.

## CCT Development Authority

CCT is authorized to:

- inspect and classify source artifacts;
- build the capability-ownership map;
- design the minimum Core extension/interface contract;
- derive modular v16 artifacts;
- rename derived artifacts to the v16 convention;
- build the modular binding design;
- package the Core and Creative Writing bolt-on;
- run semantic, structural, dependency, authority, and adversarial validation.

CCT may **not** ratify CGS v16.

Successful build status must remain:

`PROPOSED / READY FOR CREATOR REVIEW`

until the CGS creator separately ratifies it.

## Source Directories

CGS migration source:

`D:\cosyn-gov\Chat-gov-files\cosyn-latest-update-cgs-v15\CoSyn-v15-2`

Creative Writing / CfW migration source:

`D:\cosyn-gov\Chat-gov-files\Cosyn-for-writing-cfw\CoSyn_for_Writing_v1.0.0_InSession\package\package-v2`

The Writing Team Personas source has been placed in the CfW reference directory.

## Output Directory

`D:\cosyn-gov\Chat-gov-files\CGS-v16`

Expected primary outputs:

- CGS v16 Core ZIP
- Creative Writing v16 bolt-on ZIP

Both must be placed in the output directory above.

## Source Preservation

The source directories are immutable migration/reference sources for this task. CCT must not modify them.

Derived v16 artifacts must retain traceability to source artifact, source version/hash, retained content, excluded/moved content, semantic changes, and reason for each material change.

## Compatibility and Composition

- Legacy CGS v15 and CfW governance have no implicit compatibility with CGS v16.
- Legacy artifacts are migration/reference sources only.
- Future compatibility requires explicit migration or an authorized adapter.
- Core defines extension authority; a bolt-on does not define its own authority over Core.
- In-chat CGS v16 is interpreted governance/context, not an executable runtime.

## Required Validation

CCT must validate:

- package/file integrity;
- naming compliance;
- hierarchy compliance;
- semantic synchronization;
- capability ownership;
- dependency resolution;
- authority consistency;
- duplicate-governance detection;
- version compatibility;
- binding validity;
- adversarial composition behavior.

Negative tests must include attempted Core override, duplicate capability ownership, Tier-3 authority escalation, incompatible bolt-on, missing dependency, legacy-governance injection, stale version declarations, and conflicting bolt-ons.

## Completed This Session

- CGS v16 hierarchical concept refined into an approved architecture.
- CCT development authority granted.
- Naming/versioning rules established.
- Anti-AI classified as Core hierarchy.
- Bolt-on conflict handling approved as fail-closed.
- No implicit legacy compatibility approved.
- Separate creator ratification gate approved.
- Writing Team Personas placement resolved: full governance in Creative Writing bolt-on; Bookfox appendix/reference separated as subordinate reference.
- Confirmed bolt-ons are included only in projects where they apply.
- Confirmed Writing Team Personas are not needed in CGS v16 Core.
- Full hierarchical plan approved.
- Provenance record created: `add-prov-record-cgsv16-hierarchical-plan-v1.1.0.md`.

## Pending Work

1. Write the CCT execution prompt from the approved plan.
2. Run CCT against both source directories.
3. Review CCT capability-ownership map and derived architecture.
4. Validate generated packages and adversarial tests.
5. Creator review.
6. Ratify only after explicit creator approval.

No CGS v16 package has yet been implemented or ratified.
