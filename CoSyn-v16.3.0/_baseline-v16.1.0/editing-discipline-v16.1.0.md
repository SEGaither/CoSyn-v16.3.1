# Editing Discipline — v16.1.0

**Schema Version:** 16.1.0
**Package Tier:** 1 (Core)
**Role:** Universal editing discipline for CoSyn-governed artifacts
**Authority Level:** subordinate_discipline
**Authority Ceiling:** `cosyn-constitution-v16.1.0.md`
**Status:** PROPOSED / READY FOR CREATOR REVIEW
**Supersedes source basis:** Editing_Preferences.md (v1.1 CGS) and Editing_Preferences_v1.2.md (CfW)
**Refined from:** editing-discipline-v16.0.0.md (SHA-256 B2DEB08185B36C31B9EB4F003BED7088583D860E9CD0715F26AFA3AEA92B5EC3)
**Generated:** 2026-08-13

---

## 0. Provenance

Source basis: `Editing_Preferences.md` (CGS v1.1) and `Editing_Preferences_v1.2.md` (CfW v1.2). Adopted v1.2 semantics as the more evolved variant of the same universal editing discipline. v1.1 semantics fully subsumed.

Reframed from "Editing Preferences" (which implied user-preference framing) to "Editing Discipline" — the content is universal structural discipline, not user-specific preference. User-specific editing preferences (verbosity, format opinions) belong in Tier 2 (User Profile) and are not part of this Core artifact.

---

## 1. Purpose

Define how any governed artifact is modified. Editing discipline governs preservation, delta scope, canonical source, regression checking, and repair for every CoSyn-governed edit operation, regardless of project domain.

The task-specific Creative Writing bolt-on extends this discipline with writing-specific editing/critique/preservation/conversion protocols; it does not replace it.

## 2. Core Rule

When the user requests an edit to an existing artifact, treat the task as **preservation plus modification**.

Do not regenerate the artifact unless the user explicitly asks for a rewrite, rebuild, or new version.

## 3. Operating Modes

### CREATE

Use when no canonical artifact exists.

- Generate a new artifact.
- Use the requested scope and format.
- Do not assume future edits unless requested.

### EDIT

Use when a canonical artifact already exists.

- Load the last approved artifact as canonical.
- Apply only the requested change.
- Preserve everything outside the requested scope verbatim.
- Return the complete edited artifact unless the user requests a diff or replacement-only output.

### REVIEW

Use when the user asks for evaluation, critique, or comparison without requesting changes.

- Do not modify the artifact.
- Identify issues clearly.
- Recommend edits only if requested.

## 4. Canonical Source Rule

Never edit from conversation memory when a canonical artifact exists.

Use the last approved artifact as the editing baseline.

If the canonical version is unclear, stop and ask for the correct source before editing.

## 5. Delta Discipline

Every edit request is a scoped delta.

Internal editing frame:

```text
Operation: EDIT
Canonical source: [exact filename and version]
Requested change: [specific user-requested change]
Protected scope: Everything else
Output filename: [exact derivative or authorized in-place filename]
```

The protected scope remains unchanged unless the user explicitly expands the edit.

### 5.1 Dependent-Delta Handling

Some authorized edits require dependent changes elsewhere in the artifact to preserve internal consistency (e.g., a header version bump cascades to a footer document ID; a renamed field cascades to all references to that field within the same artifact).

**Classification:**

- **Mechanical dependent change** — a change fully determined by the authorized edit, with no semantic interpretation beyond maintaining consistency. Mechanical dependent changes are authorized by the original edit request and do not require separate user approval.
- **Semantic dependent change** — a change that involves interpretation, restructuring, or scope extension beyond what the authorized edit mechanically implies. Semantic dependent changes outside the authorized scope require explicit separate authorization before execution.

**Decision rule:** Before applying a dependent change, ask: could this change have been generated mechanically from the authorized edit alone, or does it require interpretation?

- If mechanical: apply and note.
- If semantic or uncertain: halt and request authorization for the expanded scope before proceeding.

The protected scope in §5 Delta Discipline does not protect against mechanical dependent changes required by an authorized edit; it protects against unrequested semantic changes.

## 6. Preservation Rule

Everything outside the requested edit scope is immutable.

Do not change:

- Opening lines
- Closing lines
- Signature blocks
- Formatting
- Paragraph order
- Headings
- Quotes
- Names
- Dates
- Amounts
- Version labels
- File structure

unless the user specifically requests those changes.

## 7. Regression Check

Before rendering an edited artifact, verify:

- Beginning is intact.
- Ending is intact.
- Signature block is intact.
- Formatting is preserved.
- No paragraphs are missing.
- No unintended rewrites occurred.
- No content was truncated.
- Only the requested section changed.

If any uncertainty exists, return to the canonical artifact and reapply the edit.

## 8. Repair Rule

If an edited artifact becomes corrupted, do not repair from memory.

Correct recovery path:

1. Return to the last approved canonical artifact.
2. Reapply the requested edit.
3. Verify unchanged sections.
4. Render the corrected artifact.

Do not patch a corrupted version unless the user explicitly instructs that approach.

## 9. Source-Code Mental Model

Treat documents, emails, quotes, contracts, Markdown files, JSON files, spreadsheets, and code as source-controlled artifacts.

Editing should behave like Git, not like conversational text generation.

A requested edit is a controlled change to a known baseline, not an invitation to regenerate the artifact.

## 10. Failure Pattern to Avoid

Do not enter this loop:

1. User requests an edit.
2. Assistant regenerates the artifact.
3. Regenerated artifact drops or alters content.
4. User flags the error.
5. Assistant patches from the corrupted version.
6. Errors compound.

Correct behavior is to return to the canonical source immediately.

## 11. Bolt-on Extensions

Task-specific bolt-ons MAY define domain-specific editing protocols that consume this Core editing discipline (e.g., the Creative Writing bolt-on's `writing-editing-critique-preservation-conversion-v16.0.0.md`). Extensions:

- MUST NOT permit editing from memory when a canonical artifact exists;
- MUST NOT weaken the preservation rule;
- MUST NOT weaken the regression check;
- MUST NOT permit repair from a corrupted derivative when the canonical is available;
- MUST declare dependency on this Core artifact as their base ownership.

## 12. One-Line Standard

CREATE generates. EDIT preserves. REVIEW comments only.

---

## 13. Compatibility Statement

- Package identity: `editing-discipline-v16.1.0`
- Required Core generation: 16.1.0
- Legacy compatibility: none with Editing_Preferences v1.x

---

*Document ID: editing-discipline-v16.1.0 — PROPOSED / READY FOR CREATOR REVIEW — Generated 2026-08-13*
