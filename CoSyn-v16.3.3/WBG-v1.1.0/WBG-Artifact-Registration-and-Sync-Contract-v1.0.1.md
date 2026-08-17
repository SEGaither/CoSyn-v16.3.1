---
wbg_artifact:
  schema_version: "1.0.1"
  artifact_family_id: "wbg.sync.registration-contract"
  artifact_id: "urn:cosyn:wbg:artifact-registration-and-sync-contract:1.0.1"
  artifact_name: "WBG Artifact Registration and Sync Contract"
  artifact_version: "1.0.1"
  filename: "WBG-Artifact-Registration-and-Sync-Contract-v1.0.1.md"
  artifact_class: "subordinate_specification"
  wbg_layer: "root_support"
  status: "RATIFIED"
  authority_ceiling: "urn:cosyn:wbg:wbg-root-authority:1.1.0"
  minimum_wbg_root: "1.1.0"
  required_parent_cgs: "inherited_from_active_wbg_root"
  capabilities_provided:
    - "writing.wbg.artifact-registration-schema"
    - "writing.wbg.independent-extension-versioning"
  activation:
    - "WBG extension discovery or registration"
  dependencies:
    - "family:wbg.root.authority"
  handoffs:
    []
  conflicts:
    []
  supersedes_artifact_id: null
  development_predecessor: "WBG-Artifact-Registration-and-Sync-Contract-v1.0.0 candidate"
  integrity:
    method: "external_registry_sha256"
---

# WBG Artifact Registration and Sync Contract — v1.0.1

**Status:** RATIFIED / CANONICAL

## 1. Purpose

Define the identity, authority, compatibility, discovery, integrity, dependency, and activation information required for a WBG artifact to register without package-wide re-versioning.

## 2. Existing WBG Identifier Convention

This contract inherits the ratified v1.0.0 convention:

`artifact_id = urn:cosyn:wbg:<artifact-slug>:<version>`

The artifact ID is **version-specific**.

To support independent extension evolution, this contract adds:

`artifact_family_id`

The family ID is stable across versions and is used for dependency, supersession, and discovery relationships.

Example:

`artifact_family_id = wbg.anti-plagiarism.check`

`artifact_id = urn:cosyn:wbg:anti-plagiarism-check:1.0.3`

This resolves versioned canonical identity without losing a stable family identity.

## 3. Mandatory Self-Declaration

Every new WBG artifact must declare:

- `schema_version`
- `artifact_family_id`
- `artifact_id`
- `artifact_name`
- `artifact_version`
- `filename`
- `artifact_class`
- `wbg_layer`
- `status`
- `authority_ceiling`
- `minimum_wbg_root`
- `required_parent_cgs`
- `capabilities_provided`
- `activation`
- `dependencies`
- `handoffs`
- `conflicts`
- `supersedes_artifact_id`
- `integrity.method`

## 4. Identity Rules

`artifact_id`, `artifact_version`, filename version, and the version segment inside the URN must agree.

`artifact_family_id` must remain stable when a later version is still the same logical artifact family.

A material capability that is genuinely a new artifact family receives a new family ID.

## 5. Relationship References

Dependencies and handoffs should normally reference:

- `family:<artifact_family_id>`; or
- `capability:<capability_id>`.

This prevents unnecessary pinning to a particular extension version.

Exact `artifact_id` dependencies are permitted only when exact-version coupling is required.

## 6. Dependency Rule

A dependency means the artifact cannot perform its owned capability without the dependency.

A handoff means another artifact may receive work but is not required for the current artifact to register.

Do not create circular required dependencies.

If two artifacts must be co-activated, use an explicit registration group or make only the true downstream artifact depend on the upstream capability.

## 7. Status

Allowed:

- `PROPOSED`
- `RATIFIED`
- `SUPERSEDED`
- `RETIRED`

Only RATIFIED artifacts auto-activate in a ratified environment.

PROPOSED artifacts may be evaluated explicitly but do not silently become active governance.

The registered WBG v1.0.0 baseline is grandfathered by the Root's documented external-ratification exception.

## 8. Integrity

An artifact must not embed its own SHA-256 as its own verification anchor.

Integrity belongs in:

- the WBG Extension Index;
- a WBG integrity manifest;
- a baseline content registry;
- or a bind-time byte hash.

Container ZIP hashes are provenance/integrity evidence but are not sufficient as the only compatibility identity because re-compression can change container bytes without changing member bytes.

## 9. Registration Sequence

1. Read self-declaration.
2. Validate schema.
3. Validate versioned URN/filename/version agreement.
4. Validate family identity.
5. Validate WBG Root compatibility.
6. Validate parent-CGS inheritance/direct dependency.
7. Validate status.
8. Validate external integrity.
9. Resolve required dependencies.
10. Check duplicate functional capability ownership.
11. Check declared conflicts.
12. Evaluate activation.
13. Register as ACTIVE or DORMANT.

## 10. Self-Announcement

A conforming available artifact can announce:

`who I am → what I own → what I require → when I activate`

It cannot:

- self-load from an unavailable source;
- self-ratify;
- bypass integrity;
- override the Root;
- take another artifact's capability.

## 11. Base Artifact Grandfathering

Pre-contract WBG artifacts may be registered without byte modification through a Base Artifact Registry.

The registry supplies:

- family mapping;
- hierarchy layer;
- capability mapping;
- verified content hashes;
- effective ratification status;
- any documented legacy exceptions.

## 12. Extension Index

The Extension Index is discovery/integrity metadata only.

Updating the index does not alter substantive governance and does not require unrelated artifact version bumps.

A directly supplied conforming artifact may register without an index entry when its integrity and compatibility are independently established.

## 13. Sync Trigger Matrix

Root bump:
- hierarchy;
- authority;
- registration semantics;
- compatibility;
- required parent CGS.

Individual artifact bump:
- owned behavior;
- artifact-local metadata contract;
- dependencies/handoffs with operational effect.

Index bump:
- discovery/integrity entry changes.

No unrelated artifact bump:
- new extension added;
- another extension revised;
- optional extension removed.

## 14. Fail-Closed Conditions

Fail registration when:

- required metadata is missing;
- versioned identity disagrees;
- family identity is malformed;
- required Root is incompatible;
- a required dependency is absent;
- integrity fails;
- duplicate functional ownership is unresolved;
- authority ceiling exceeds WBG;
- the artifact attempts an undeclared override;
- an unresolved conflict remains.

## 15. One-Line Standard

**Versioned URNs identify the exact artifact; stable family IDs let the WBG hierarchy evolve without dragging every file with it.**
