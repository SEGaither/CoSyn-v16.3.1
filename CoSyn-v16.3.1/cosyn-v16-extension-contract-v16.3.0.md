# CoSyn v16 Extension and Composition Contract

**Artifact:** `cosyn-v16-extension-contract-v16.3.0.md`
**Version:** 16.3.0
**Tier:** Core (Tier 1)
**Role:** Universal composition and extension contract for CoSyn v16 packages
**Authority ceiling:** Core-owned (bolt-ons subordinate)
**Status:** PROPOSED / UNDER REFINEMENT
**Generated:** 2026-08-13

---

## 0. Scope

This artifact defines the minimum deterministic composition architecture that binds:

```text
CoSyn v16 Core
+ optional Tier-2 User Profile package (binding position reserved; package not built this task)
+ zero or more applicable task-specific bolt-ons
+ Tier-3 project-specific controls
```

into a coherent governance stack for a single governed project.

Composition is deterministic. Conflicting governance fails closed. Silent merges are prohibited.

This document defines the contract every conforming package MUST satisfy. Instances of the contract are provided in `cosyn-v16-bind-template-v16.3.0.json` and in each bolt-on's own bind template.

## 1. Governing Rules

1. A lower layer MAY extend a higher layer but MUST NOT restate, weaken, fork, or compete with higher governance.
2. Each governing capability has exactly one authoritative owner (see `capability-ownership-map-v16.3.0.json`).
3. Where a bolt-on extends a Core capability, it MUST declare the extended capability by identifier, MUST NOT restate the base semantics, and MUST NOT override the base authority ceiling.
4. When two or more bolt-ons claim authoritative ownership of the same governing capability, and higher governance does not deterministically resolve ownership, composition MUST fail closed with a package-composition-failure record.
5. Filename alone does not confer authority. Every declared authority MUST be substantiated by the package manifest and by capability-ownership records.
6. Legacy CGS v15 and CoSyn-for-Writing artifacts have no implicit runtime compatibility with CoSyn v16. Any compatibility mechanism MUST be explicit and MUST be declared as an adapter package.
7. In-chat CoSyn v16 is interpreted governance context — not an executable runtime.

## 2. Package Manifest Requirements

Every conforming CoSyn v16 package (Core, Tier-2, bolt-on, Tier-3) MUST ship a manifest that declares:

| Field | Requirement |
|---|---|
| `package_identity` | Human-readable package identifier |
| `package_version` | semver aligned to Core generation (see §7 Naming) |
| `package_tier` | `1_core`, `2_user_profile`, `bolt_on`, or `3_project` |
| `package_role` | Short description of role in the stack |
| `authority_level` | Exactly one of: `constitutional_root`, `subordinate_specification`, `subordinate_enforcement`, `subordinate_routing`, `subordinate_registry`, `subordinate_discipline`, `task_specific_bolt_on`, `task_specific_bolt_on_extension`, `informative_reference`, or `project_specific`. No other values are valid. |
| `authority_ceiling` | For non-Core packages: identifies the higher authority that governs this package |
| `required_core_generation` | Minimum Core generation (e.g., `16.0.0`) |
| `required_core_subordinate_versions` | Minimum versions for each Core subordinate spec this package depends on |
| `dependencies` | Explicit list of other packages required |
| `capabilities_supplied` | Enumerated capability identifiers (see capability-ownership-map) that this package authoritatively owns |
| `capabilities_extended` | Enumerated capability identifiers that this package extends; each MUST resolve to a single authoritative owner elsewhere |
| `applicability_declaration` | For bolt-ons: condition under which the bolt-on is applicable (e.g., "project involves creative writing") |
| `compatibility` | Cross-package version compatibility statements |
| `manifest_files` | List of all files that MUST be present in the package |
| `integrity_hashes` or `integrity_hashes_reference` | SHA-256 hashes of all `manifest_files` entries. Either: (a) an inline object keyed by filename with SHA-256 values (`integrity_hashes` field), or (b) a named reference to a dedicated integrity manifest artifact within the package (`integrity_hashes_reference` field containing the filename). When using a dedicated integrity manifest: it MUST cover all `manifest_files` entries except itself; it MUST NOT hash itself (non-circular design); its own integrity is anchored externally by the package ZIP SHA-256. Missing, malformed, or stale hash data fails closed. |
| `provenance_pointer` | Path to migration-provenance-map (or equivalent) that records source basis for every derived artifact |
| `mandatory_statements` | Non-runtime disclaimers, scope disclaimers, ratification-status disclaimers |

Manifests MUST parse as valid JSON. Any manifest that fails schema conformance is rejected at composition time.

## 3. Extension Contract for Bolt-Ons

A bolt-on that extends a Core capability MUST declare:

```json
{
  "capabilities_extended": [
    {
      "capability_id": "<Core capability identifier>",
      "core_owner_reference": "<Core artifact filename@version>",
      "extension_type": "scope_extension | mode_addition | trigger_addition | schema_specialization | protocol_specialization",
      "extension_scope": "<free text describing exactly what is added>",
      "does_not_modify": [
        "<Core section identifiers that the extension does not modify>"
      ]
    }
  ]
}
```

Prohibited extension patterns:

- Declaring an extension of a capability that is not authoritatively owned by the higher package.
- Restating base semantics inside the bolt-on.
- Adding a field to a Core-owned schema (schema extensions require a subsequent Core version).
- Weakening a base gate, base rule, base recovery acceptance criterion, or base failure classification.
- Granting a bypass, exemption, override, or gate-suppression against any Core-owned gate.

## 4. Composition Algorithm (Deterministic)

Composition proceeds in this exact order:

1. **Load Core.** Verify Core manifest integrity (files present, hashes match). Verify Core self-consistency (all subordinate specs bound, no stale version pins). If any check fails, composition fails closed.
2. **Load Tier-2 User Profile if present.** Verify manifest. Verify that Tier-2 supplies only capabilities in the Tier-2 reserved space (user-response, user-voice-style, user-editing-preference, user-memory-context-control). Verify that Tier-2's `required_core_generation` matches loaded Core. Reject Tier-2 packages that supply Core-owned capabilities.
3. **Enumerate applicable bolt-ons.** For each bolt-on in the project's bolt-on load list, verify manifest, verify `required_core_generation`, verify each `capabilities_extended` entry resolves to a Core-owned capability.
4. **Cross-bolt-on conflict scan.** If two or more bolt-ons declare authoritative ownership of the same capability, and higher governance does not resolve, composition fails closed.
5. **Cross-bolt-on extension scan.** If two or more bolt-ons extend the same Core capability in mutually contradictory ways, composition fails closed unless the Core-owned capability explicitly documents deterministic merge behavior for that extension type.
6. **Load Tier-3 project controls.** Verify manifest. Verify that Tier-3 supplies only project-specific capabilities. Reject Tier-3 packages that attempt to override Core, Tier-2, or applicable bolt-on authority.
7. **Freeze composition.** Emit a composition record listing every loaded package, resolved capability owners, extension declarations, and integrity hashes.

If any step fails, composition MUST halt and emit a composition-failure record. Silent reconciliation is a Class 0 governance failure per Core Constitution.

## 5. Conflict Detection Categories (Fail-Closed)

- **Duplicate capability ownership.** Two packages claim authoritative ownership of the same capability id. → fail closed.
- **Unauthorized extension.** A bolt-on declares extension of a capability that is not authoritatively owned by a higher layer, or the extension does not conform to the declared extension_type. → fail closed.
- **Missing dependency.** A package declares a dependency that is not present in the composition. → fail closed.
- **Version incompatibility.** A package's `required_core_generation` or `required_core_subordinate_versions` is not satisfied by loaded Core. → fail closed.
- **Manifest/actual-file mismatch.** A file listed in `manifest_files` is not present, or a present file is not listed. → fail closed.
- **Hash mismatch.** Any file's actual SHA-256 does not match the declared `integrity_hashes` entry. → fail closed.
- **Legacy governance injection.** A CGS v15 or CoSyn-for-Writing v1.x artifact is loaded outside an explicitly authorized adapter package. → fail closed.
- **Stale version declaration.** A package's internal cross-references point to a version that is not the loaded version. → fail closed.
- **Conflicting bolt-ons.** Two bolt-ons extend the same Core capability with mutually contradictory rules and Core does not define deterministic merge behavior. → fail closed.
- **Tier-3 authority escalation.** A Tier-3 package attempts to override Core, Tier-2, or applicable bolt-on governance. → fail closed.
- **Wrong-context bolt-on load.** A bolt-on is loaded into a project whose applicability declaration is not satisfied (e.g., creative-writing bolt-on loaded into a non-writing project). → fail closed unless the project explicitly declares the bolt-on applicable.
- **Missing provenance.** A derived artifact lacks a provenance-pointer to its source basis. → fail closed.

## 6. Reserved Binding Positions

Core reserves the following binding positions for future or optional attachment:

- **Tier-2 User Profile:** Attached below Core, above applicable bolt-ons. Reserved capability categories: `user-response`, `user-voice-style`, `user-editing-preference`, `user-memory-context-control`. This task does NOT build the Tier-2 package; the position is defined so that later introduction does not require Core redesign.
- **Bolt-on layer:** Zero or more task-specific bolt-ons, each supplying task-specific capabilities. Each bolt-on binds Core and optionally Tier-2. Bolt-ons load only when their applicability declaration is satisfied by the project.
- **Tier-3 Project layer:** Attached below applicable bolt-ons. Reserved capability categories: `project_canon`, `project_instructions`, `project_authoritative_decisions`, `project_pcr_state`, `project_specific_artifacts`.

## 7. Naming Convention

- Tier-1 / Core artifacts: `<purpose>-v16.y.z` (e.g., `cosyn-constitution-v16.0.0.md`).
- Task-specific bolt-ons: `<specific-expertise>-v16.y.z`.
- Tier-2 / Tier-3 artifacts: `<purpose>16-X.y.z` where `X = 2` for Tier 2 and `X = 3` for Tier 3.
- Package manifests: `<package_identifier>-manifest-v16.y.z.json`.

Filename alone does not establish authority. The manifest MUST declare `package_tier` and `authority_level` explicitly.

## 8. Failure Response and Reporting

On any composition-time failure:

1. Halt composition. Do not load any subsequent package.
2. Emit a composition-failure record with: failure category (per §5), offending packages, offending capability identifiers, expected vs actual values, timestamp.
3. Do not present the partial composition to the user as usable.
4. Route to explicit user direction to correct the composition inputs.

## 9. Provenance and Integrity Requirements

Every derived v16 artifact MUST have a provenance record that identifies:

- Source artifact filename (immutable)
- Source artifact version (as declared in source)
- Source artifact SHA-256 hash (from source-freeze-manifest)
- Content retained (section identifiers or content categories preserved)
- Content excluded (with reason: redundant / out-of-layer / obsolete / user-specific / project-specific)
- Content moved to another package (with target package and reason)
- Semantic changes made during derivation (each material change enumerated)
- Reason for each material change (design decision or plan reference)

Provenance for every derived artifact is stored in `build/provenance/migration-provenance-map.json`.

## 10. Non-Runtime Statement

CoSyn v16 is interpreted in-chat governance context. This contract defines governance composition semantics that a governed process (whether the model, a validator, or a future runtime) MUST honor. It does not claim transactional persistence, atomic storage, exactly-once delivery, rollback guarantees, or executable enforcement outside the response-construction protocol.

---

*End of `cosyn-v16-extension-contract-v16.3.0.md` — PROPOSED / UNDER REFINEMENT*
