---
wbg_artifact:
  schema_version: "1.0.1"
  artifact_family_id: "wbg.root.authority"
  artifact_id: "urn:cosyn:wbg:wbg-root-authority:1.1.0"
  artifact_name: "WBG Root Authority"
  artifact_version: "1.1.0"
  filename: "WBG-Root-Authority-v1.1.0.md"
  artifact_class: "root_authority"
  wbg_layer: "root"
  status: "RATIFIED"
  authority_ceiling: "CoSyn CGS v16.3.3"
  minimum_wbg_root: "1.1.0"
  required_parent_cgs: "16.3.3"
  capabilities_provided:
    - "writing.wbg.hierarchy"
    - "writing.wbg.extension-registration-authority"
  activation:
    - "successful WBG v1.1.0 hierarchical bind"
  dependencies:
    - "family:wbg.sync.registration-contract"
    - "family:wbg.bind.hierarchical-profile"
  handoffs:
    []
  conflicts:
    []
  supersedes_artifact_id: null
  development_predecessor: "WBG-Root-Authority-v1.1.0 candidate r1"
  integrity:
    method: "external_registry_sha256"
---

# WBG Root Authority — v1.1.0

**Status:** RATIFIED / CANONICAL  
**Required parent:** CoSyn CGS v16.3.3  
**Registered baseline:** WBG v1.0.0 RATIFIED / CANONICAL by external ratification provenance

## 1. Purpose

Establish WBG's internal hierarchy and allow independently versioned writing capabilities to register without forcing unrelated WBG artifacts to be re-versioned.

## 2. Authority Hierarchy

`Platform / OpenAI authority`  
→ `CoSyn CGS v16.3.3`  
→ `WBG Root Authority`  
→ `registered WBG base governance`  
→ `registered WBG functional extensions`  
→ `project-specific writing governance`  
→ `manuscript / project artifacts`

Lower layers may extend but may not weaken, fork, bypass, or compete with higher authority.

## 3. Baseline Preservation

The ratified WBG v1.0.0 11-artifact package remains the initial WBG base.

Its files are not rewritten for this hierarchy.

The baseline is registered through:

`WBG-Base-Artifact-Registry-v1.0.1.json`

The user-supplied v1.0.0 package used for this audit contains the exact 11 expected members. All 10 files covered by its internal integrity manifest pass their declared SHA-256 values. Its integrity manifest is separately fingerprinted by WBG v1.1.0.

The uploaded ZIP container SHA-256 differs from the historical canonical ZIP hash. Therefore:

- the historical canonical ZIP hash remains provenance for the original archive container;
- WBG v1.1.0 compatibility uses the verified 11-member **content fingerprint**, not ZIP compression/container bytes;
- Creator ratification of v1.1.0 adopts that content fingerprint as the baseline compatibility anchor.

## 4. Legacy Ratification Status Exception

The actual v1.0.0 member metadata still contains the pre-ratification marker `PROPOSED / READY FOR USER REVIEW`.

External WBG v1.0.0 provenance records the later explicit User ratification and controls package status.

The registry may therefore mark those exact verified baseline bytes as RATIFIED without rewriting them.

This exception applies only to the registered v1.0.0 baseline.

## 5. Root Ownership

This Root owns:

- WBG hierarchy;
- WBG layer precedence;
- extension-registration authority;
- WBG-level capability-conflict handling;
- WBG-level independent extension versioning.

It does not take over the substantive capabilities already owned by v1.0.0 base artifacts.

## 6. Registration Contract

New WBG artifacts conform to:

`WBG-Artifact-Registration-and-Sync-Contract-v1.0.1.md`

The contract preserves the existing WBG v1.0.0 identifier rule:

`urn:cosyn:wbg:<artifact-slug>:<version>`

A separate `artifact_family_id` supplies stable cross-version registration identity.

## 7. Binding

The existing `writing-bind-template-v1.0.0.json` continues to own **baseline WBG v1.0.0 binding**.

It does not bind the v1.1.0 hierarchy or later extensions.

The v1.1.0 hierarchical wrapper is:

`WBG-Hierarchical-Bind-Profile-v1.0.0.json`

That profile:

1. validates/binds CGS v16.3.3;
2. validates the exact registered v1.0.0 baseline content;
3. loads this Root and the sync contract;
4. registers available extensions;
5. preserves the existing Project Governance Q&A handoff.

This avoids rewriting the v1.0.0 bind template.

## 8. Self-Announcement

A WBG extension may announce its identity, capabilities, activation conditions, dependencies, and authority through its metadata when it is actually available to the session.

Self-announcement is not self-loading.

No artifact may claim it can inject itself into an unavailable model context.

## 9. Capability Ownership

One active governing capability has one active owner.

If two active artifacts claim the same capability and explicit supersession/precedence does not resolve the conflict:

`WBG CAPABILITY CONFLICT — FAIL CLOSED`

Advisory persona purview does not count as functional capability ownership.

## 10. Independent Versioning

Bump the Root only for hierarchy, authority, registration semantics, compatibility, or parent-governance changes.

Bump a functional artifact when its owned functional behavior changes.

Bump the Extension Index when discovery/integrity entries change.

Do not version-bump an unchanged base artifact merely because another artifact is added.

## 11. Project Governance

Project-specific writing governance remains downstream of WBG.

It may specialize WBG but may not:

- override this Root;
- take an already owned WBG capability;
- falsify provenance/source identity;
- convert a failed mandatory gate into a PASS.

## 12. Runtime Boundary

This hierarchy is interpreted governance/context.

It does not claim executable persistence, filesystem watching, automatic network loading, or independent host enforcement.

## 13. One-Line Standard

**Keep WBG authority stable; let validated writing capabilities evolve independently.**
