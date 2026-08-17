---
wbg_artifact:
  schema_version: "1.0.1"
  artifact_family_id: "wbg.anti-plagiarism.gate"
  artifact_id: "urn:cosyn:wbg:anti-plagiarism-gate:1.0.3"
  artifact_name: "WBG Anti-Plagiarism Gate"
  artifact_version: "1.0.3"
  filename: "WBG-Anti-Plagiarism-Gate-v1.0.3.md"
  artifact_class: "functional_extension"
  wbg_layer: "functional_extension"
  status: "RATIFIED"
  authority_ceiling: "urn:cosyn:wbg:wbg-root-authority:1.1.0"
  minimum_wbg_root: "1.1.0"
  required_parent_cgs: "inherited_from_active_wbg_root"
  capabilities_provided:
    - "writing.originality.pre-emission-gate"
  activation:
    - "companion Check requires a disposition"
    - "finalization requires originality assurance"
  dependencies:
    - "family:wbg.anti-plagiarism.check"
  handoffs:
    []
  conflicts:
    []
  supersedes_artifact_id: null
  development_predecessor: "WBG-Anti-Plagiarism-Gate-v1.0.2 candidate"
  integrity:
    method: "external_registry_sha256"
---


# WBG Anti-Plagiarism Gate — v1.0.3

**Status:** RATIFIED / CANONICAL

## 0. Purpose

Prevent CoSyn-governed output from being represented as original authored work when available evidence shows material unattributed copying, too-close paraphrase, or unresolved high-risk source overlap.

The gate enforces the findings of the Anti-Plagiarism Check.

It does not perform universal plagiarism detection by itself.

## 1. Core Rule

No output may be represented as original merely because no obvious copied phrase was noticed.

The gate must have:

1. an applicable Anti-Plagiarism Check result;
2. a declared comparison set;
3. a source/provenance classification for material overlap;
4. a deterministic disposition.

If evidence is insufficient for the requested originality claim, downgrade the claim or halt for verification.

## 2. Capability Boundary

This artifact owns the proposed capability:

`writing.originality.pre-emission-gate`

It decides whether candidate output may:

- PASS;
- PASS-WITH-ATTRIBUTION;
- REVISE;
- VERIFY-HALT.

The companion Check owns source comparison and risk classification.

This gate must not silently reinterpret a C2 or C3 finding as harmless.

## 3. Activation

Activate when the companion Check activates.

The gate is especially mandatory before finalizing content intended to be represented as original in:
- publication;
- manuscript delivery;
- article/essay submission;
- academic or professional submission;
- commercial copy;
- public-facing reports;
- speeches;
- grant/proposal narrative;
- externally distributed authored material;
- any artifact where the user explicitly requests originality assurance.

Project or task-specific governance may add stricter triggers.

## 4. Required Input

Minimum gate input:
- candidate output;
- Anti-Plagiarism Check risk class;
- overlap findings;
- source classifications;
- attribution status;
- comparison set;
- blind spots;
- intended use when material to the disposition.

If the check was required but not performed, the gate cannot PASS.

## 5. Deterministic Outcomes

### G0 — PASS

Requirements:
- Check result = C0 CLEAR; or
- only non-material explained overlap exists;
- no unresolved attribution defect;
- no material source-provenance uncertainty affecting the requested originality claim.

Permitted statement:

> Anti-plagiarism check passed against the declared comparison set.

Prohibited statement:

> This is guaranteed 100% original everywhere.

### G1 — PASS-WITH-ATTRIBUTION

Requirements:
- Check result = C1 EXPLAINED / ATTRIBUTED;
- any required quotation/attribution is visibly preserved;
- the user is not being misled about authorship.

Examples:
- properly quoted source passage;
- user-owned prior text reused with provenance;
- licensed material reused under applicable conditions;
- standardized language that is not being claimed as novel expression.

### G2 — REVISE

Trigger when:
- Check result = C2 REVISION REQUIRED;
- material third-party wording is unattributed;
- paraphrase is source-tracing/cosmetic;
- distinctive expression has been borrowed without adequate attribution;
- translated third-party expression is presented as original;
- attribution repair alone cannot cure the misleading authorship presentation.

Required behavior:
1. Block original-form emission as publication-ready/original.
2. Revise the affected passage or convert necessary language to properly attributed quotation.
3. Preserve user-authored content and factual meaning.
4. Re-run the Anti-Plagiarism Check on the revised passage.
5. PASS only after the blocking condition is cleared.

### G3 — VERIFY-HALT

Trigger when:
- Check result = C3 UNRESOLVED HIGH RISK;
- provenance cannot be established;
- suspicious overlap exists with an unknown source;
- required external verification cannot be performed;
- the user requests an originality assurance broader than the available comparison set supports.

Required behavior:
- do not certify originality;
- identify the unresolved overlap/provenance issue;
- identify the missing verification channel;
- stop the originality certification path until evidence resolves it.

The underlying content may still be discussable or editable. What halts is the unsupported claim that it is cleared as original.

## 6. Hard Blocking Conditions

Block PASS when any of the following remains unresolved:

1. Material verbatim third-party text presented as the user's/model's original prose.
2. Sentence-level or passage-level copying concealed through trivial edits.
3. Too-close paraphrase that follows source expression line-by-line.
4. Deliberate removal of attribution from source-dependent language.
5. Translation used to conceal copied expression.
6. Unknown-provenance passage with substantial distinctive overlap where originality is material.
7. A required plagiarism check was skipped.
8. The comparison set is concealed or falsely represented as exhaustive.
9. A detector score is treated as proof of originality without source review.
10. A revision is designed to evade detection rather than create independently expressed work.

## 7. Non-Blocking Conditions

Do not block solely because of:
- short common phrases;
- names and titles;
- facts, dates, or ordinary terminology;
- technical syntax;
- required standard language;
- user-authored text reused with known provenance;
- properly attributed quotation;
- authorized reusable text where conditions are satisfied;
- broad thematic similarity without copied expression or source-dependent structure.

If uncertainty remains, route to the companion Check rather than guessing.

## 8. Attribution Repair Rule

If attribution alone is sufficient to cure the issue:

1. preserve only the language genuinely needed;
2. mark verbatim language as quotation;
3. identify the source according to applicable citation/project rules;
4. avoid implying the quoted expression is original;
5. re-run the Check;
6. route to PASS-WITH-ATTRIBUTION if cleared.

Do not use attribution as a blanket excuse for copying excessive source text.

## 9. Independent Rewrite Rule

When G2 requires rewriting:

- rewrite from the underlying facts/ideas, not from the source sentence surface;
- reorganize the explanation where appropriate;
- use the user's/project's natural voice;
- remove borrowed distinctive analogies/examples unless attributed;
- preserve necessary factual accuracy;
- do not introduce unsupported facts while escaping source wording.

A rewrite that merely changes synonyms fails.

## 10. Anti-Evasion Rule

The following are prohibited as “plagiarism remediation”:
- synonym spinning;
- punctuation-only changes;
- word-order scrambling that preserves the source construction;
- inserting/removing filler to break phrase matches;
- hidden/invisible characters;
- deliberate misspelling;
- translation and back-translation for concealment;
- detector-targeted rewriting whose purpose is to lower a similarity score without establishing independent expression.

If anti-evasion behavior is requested, the gate must refuse that method and route to legitimate independent rewriting/attribution.

## 11. Evidence-Bounded Certification

Every user-visible plagiarism clearance must be bounded to the evidence.

Preferred form:

> Checked against: [comparison set]. No blocking overlap found.

When no external search/database was used:

> Source-bound check only; no exhaustive external plagiarism database was queried.

When external search was used:

> External phrase/source search was performed, but web search is not an exhaustive plagiarism database.

When a dedicated service was used:

> Dedicated service results were included as evidence; the result still depends on that service's corpus and matching method.

Never use “plagiarism-free” as an unqualified universal claim unless an applicable external authority actually supports that exact claim.

## 12. User-Authored Reuse

Known user-authored prior material does not trigger a third-party plagiarism block.

However, when the intended destination may impose rules about prior publication, exclusivity, duplicate submission, or self-reuse:
- preserve provenance;
- state that the plagiarism gate is not deciding those destination-specific rules;
- route to applicable publication/submission governance if available.

Do not turn the gate into a rights/licensing opinion.

## 13. Legal/IP Separation and Handoff

This gate controls plagiarism/originality representation only.

It must not collapse the following into one decision:
- plagiarism;
- copyright infringement;
- copyrightability of AI-assisted or AI-generated material;
- legality of AI training;
- publisher/platform/contest/client AI disclosure requirements.

### 13.1 Copyrightability handoff

A PASS under this gate does not certify that the work is copyrightable.

For U.S. copyright questions involving AI-generated material, current Copyright Office guidance centers copyright protection on sufficient human-authored expressive contribution. AI assistance does not automatically defeat copyrightability, but mere prompting alone does not automatically establish human authorship.

When copyright ownership/registration matters:
- preserve available human-authorship provenance;
- route to current authoritative copyright guidance or qualified legal review;
- do not turn a plagiarism result into a copyrightability conclusion.

### 13.2 Training-data handoff

Do not block a particular output solely because the model may have been trained on copyrighted works.

Training legality is separate from output plagiarism. If output overlap is found, evaluate the output itself. If the question is whether training was lawful, route to separate current legal analysis.

### 13.3 Destination compliance handoff

A plagiarism PASS does not mean a publisher, platform, school, contest, client, or other destination permits the AI use involved.

Before submission where material:
- verify current destination AI-generation/AI-assistance disclosure rules;
- preserve required disclosures;
- route violations to the applicable compliance workflow.

### 13.4 Style-only claims

Do not issue a plagiarism block merely because prose resembles a named author's general style.

Require evidence of copied or too-close source expression or distinctive source-dependent structure.

If other legal, contractual, ethical, or platform restrictions may apply to style imitation, route them separately.

## 14. Relationship to Source Fidelity and Citation Governance

The gate complements source fidelity.

Source fidelity asks:

> Did we represent the source accurately?

Anti-plagiarism asks:

> Did we improperly appropriate the source's expression or structure?

Accurate copying can still require quotation and attribution.

Original paraphrase can still be factually wrong.

Both controls may apply simultaneously.

## 15. Relationship to Anti-AI Signature Gate

Order when both are triggered:

1. establish source fidelity and factual basis;
2. perform Anti-Plagiarism Check;
3. resolve plagiarism/attribution issues;
4. apply Anti-AI Signature Gate to human-facing prose when applicable;
5. re-run Anti-Plagiarism Check if the Anti-AI rewrite materially changes source-dependent passages;
6. finalization.

Anti-AI rewriting must never be used to camouflage plagiarism.

## 16. Failure Record

When the gate blocks, retain a compact record:
- `gate_status`
- `candidate_artifact`
- `check_risk_class`
- `blocking_condition`
- `affected_passage_pointer`
- `source_pointer`
- `required_resolution`
- `comparison_set`
- `external_verification_needed`
- `rerun_required`
- `copyrightability_handoff`
- `training_legality_handoff`
- `destination_compliance_handoff`

No private chain-of-thought is required or exposed.

## 16A. User Artistic Authority Boundary

User Artistic Authority may govern intentional craft choices, but it cannot convert known third-party source dependence into an originality PASS, erase required source provenance, or remove attribution required for a G1 disposition.

The User may choose not to publish, may revise, may secure permission, may quote/attribute appropriately, or may accept a destination-specific risk after separate legal review. The Gate itself must not falsify its originality disposition.

## 17. WBG Extension / Project Specialization Rule

Project-specific writing governance or later WBG functional extensions may:
- make the gate mandatory for additional artifact types;
- impose stricter attribution standards;
- require specialized databases or corpora;
- define domain-specific citation formats;
- define additional high-risk overlap patterns.

They may not:
- authorize hidden copying;
- weaken G2/G3;
- suppress comparison-set disclosure;
- turn a limited search into a universal originality claim;
- grant bypass authority against this gate.

## 18. WBG Registration Requirements

Required registration:
- artifact ID: `wbg.anti-plagiarism.gate`
- capability: `writing.originality.pre-emission-gate`
- WBG layer: `functional_extension`
- minimum WBG root: `1.1.0`
- required parent CGS: inherited through the active WBG root
- required companion: `wbg.anti-plagiarism.check`

The gate activates only after its required check is available and valid.

The artifact may be independently versioned after registration. A later version does not require unrelated WBG base artifacts to be re-versioned.

Registration must fail closed on incompatible WBG root, missing companion, duplicate capability ownership, or conflict with higher authority.

## 19. Reference Basis and v1.0.1 Change Note

### Reference considered

K.M. Robinson, **“Can Writers Use AI To Write Novels Legally (Lawyer Tony Iliakostas)”**, YouTube video ID `99L2I1rr9ls`.

The full transcript was not retrievable through the available source-access path during this revision. No unverified quotation or specific legal claim is attributed to the speakers.

The video's legal-AI-writing subject matter was used as a research trigger; operative legal distinctions below were corroborated against current U.S. Copyright Office sources.

### Current authoritative corroboration used

- U.S. Copyright Office, **Copyright and Artificial Intelligence, Part 2: Copyrightability** (2025).
- U.S. Copyright Office, **Copyright and Artificial Intelligence, Part 3: Generative AI Training** (pre-publication version released 2025; final version pending at time of this revision).
- U.S. Copyright Office, **What Writers Should Know about Copyright**.

### v1.0.1 delta

Added:
- legal/IP separation and handoff;
- copyrightability handoff;
- training-data handoff;
- destination-compliance handoff;
- style-only claim rule;
- failure-record fields for the new handoffs.

No G0–G3 disposition or hard blocking condition from v1.0.0 was weakened.

### v1.0.2 delta

- moved the artifact from proposed CoSyn Core placement into WBG;
- synchronized capability ownership with the WBG hierarchy;
- preserved the G0–G3 enforcement model while binding it to the WBG self-registration contract.

### v1.0.3 delta

- aligned canonical artifact identity with the ratified WBG URN convention;
- added stable `artifact_family_id`;
- aligned capability identifiers throughout;
- made the Gate depend one-way on the Check, removing the prior circular registration dependency;
- clarified that User Artistic Authority cannot falsify source provenance or turn known source dependence into an originality PASS;
- validated against the actual 11-member WBG v1.0.0 baseline.

## 20. One-Line Standard

**If we cannot explain where the language came from and why its reuse is legitimate, we do not certify it as original.**
