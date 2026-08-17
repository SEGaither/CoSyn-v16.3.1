---
wbg_artifact:
  schema_version: "1.0.1"
  artifact_family_id: "wbg.anti-plagiarism.check"
  artifact_id: "urn:cosyn:wbg:anti-plagiarism-check:1.0.3"
  artifact_name: "WBG Anti-Plagiarism Check"
  artifact_version: "1.0.3"
  filename: "WBG-Anti-Plagiarism-Check-v1.0.3.md"
  artifact_class: "functional_extension"
  wbg_layer: "functional_extension"
  status: "RATIFIED"
  authority_ceiling: "urn:cosyn:wbg:wbg-root-authority:1.1.0"
  minimum_wbg_root: "1.1.0"
  required_parent_cgs: "inherited_from_active_wbg_root"
  capabilities_provided:
    - "writing.originality.source-comparison-check"
  activation:
    - "explicit originality/plagiarism check"
    - "publication/submission originality review"
    - "suspicious source overlap"
  dependencies:
    []
  handoffs:
    - "family:wbg.anti-plagiarism.gate"
  conflicts:
    []
  supersedes_artifact_id: null
  development_predecessor: "WBG-Anti-Plagiarism-Check-v1.0.2 candidate"
  integrity:
    method: "external_registry_sha256"
---


# WBG Anti-Plagiarism Check — v1.0.3

**Status:** RATIFIED / CANONICAL

## 0. Purpose

Detect and classify material reuse, copying, too-close paraphrase, unattributed quotation, and uncertain source provenance in human-facing authored output before that output is represented as original work.

This protocol is an evidence-bounded originality check.

A PASS means:

> No blocking plagiarism condition was found in the sources and evidence actually available to the check.

A PASS does not mean that no matching language exists anywhere on the internet, in private databases, books, model training data, or sources unavailable to the system.

## 1. Core Principle

Plagiarism control must be based on:

`source exposure → textual/structural comparison → provenance classification → attribution status → action`

not on:

`AI intuition → plagiarism percentage`

No unsupported “plagiarism score” may be emitted.

## 2. Capability Boundary

This artifact owns the proposed capability:

`writing.originality.source-comparison-check`

It determines what overlap exists and how that overlap should be classified.

It does not decide whether final output may be emitted as original work. That enforcement decision belongs to the companion Anti-Plagiarism Gate.

It does not replace source-fidelity requirements, citation requirements, copyright/legal review, the Anti-AI Signature Gate, project canon or author-ownership rules, or external plagiarism services.

## 3. Activation

Run this check when any of the following is true:

1. The user explicitly requests a plagiarism, originality, source-overlap, citation, or copying check.
2. The output is intended for publication, submission, commercial distribution, academic/professional delivery, or another context where it will be represented as original authored work.
3. Third-party sources, web research, reference corpora, uploaded books/articles, transcripts, or other external prose materially informed the drafted output.
4. A writing/project bolt-on explicitly requires this check.
5. A suspicious phrase, sentence, passage, structure, or unattributed quotation is detected during drafting or review.
6. The output translates or closely adapts third-party expressive text.
7. The user asks the system to preserve or prove provenance/originality.

Do not run a full plagiarism check merely because ordinary conversation contains common phrases.

## 4. Source Classification

### S1 — User-authored / user-owned source

Material the user identifies as their own prior work or as material they have authority to reuse.

Handling:
- reuse is not classified as third-party plagiarism;
- preserve provenance;
- flag possible self-reuse only when publication/submission rules may make prior reuse material;
- do not invent ownership if it is unknown.

### S2 — Explicitly authorized reusable source

Material identified as public domain, licensed for reuse, permission-granted, or otherwise explicitly authorized.

Handling:
- verify the authorization basis when available;
- attribution may still be required by license, project rule, or user instruction;
- authorized reuse is not automatically original authorship.

### S3 — Properly quoted and attributed third-party source

Verbatim material visibly presented as quotation with adequate source attribution for the task.

Handling:
- not treated as hidden plagiarism;
- still check quotation length/scope under applicable policy or project constraints.

### S4 — Third-party source

Material authored by another party with no established reuse authorization.

Handling:
- exact or too-close reuse is plagiarism risk unless clearly quoted/attributed or otherwise justified.

### S5 — Common / standardized / constrained language

Examples:
- titles;
- names;
- technical terms;
- short conventional phrases;
- required legal/regulatory wording;
- standardized definitions where exact wording is necessary;
- unavoidable domain language;
- formulas, identifiers, commands, or syntax.

Handling:
- overlap alone is not evidence of plagiarism;
- evaluate distinctiveness and necessity.

### S6 — Unknown provenance

Material whose authorship or reuse authority cannot be established.

Handling:
- do not guess ownership;
- escalate when material overlap is significant or publication stakes are high.

### S7 — AI-generated / AI-assisted material with known workflow provenance

Material generated or materially transformed through an AI system where the project can identify the relevant session, source inputs, prompts/instructions, or human revision history.

Handling:
- do not classify AI origin itself as plagiarism;
- subject the material to the same overlap and attribution checks as other candidate prose;
- preserve available human-authorship provenance separately from plagiarism status;
- do not imply that known AI workflow provenance proves copyrightability or absence of infringement;
- route copyrightability or disclosure questions to the appropriate legal/platform compliance layer.

## 5. Comparison Set Record

Every completed check must identify the comparison set actually used.

Minimum record:
- user-provided sources checked;
- uploaded/reference-corpus sources checked;
- web/retrieved sources checked;
- prior project artifacts checked when applicable;
- external plagiarism service used, if any;
- unavailable source domains or blind spots.

If no external search or plagiarism database was used, state that explicitly.

## 6. Inspection Sequence

### 6.1 Provenance pass

Determine which sources materially informed the output, which passages originated from user-authored text, which material came from third-party sources, and which material has unknown origin.

Do not compare user-authored source text against its own revision and then accuse the user of plagiarizing themselves.

### 6.2 Exact-overlap pass

Look for identical or substantially identical sequences between the candidate output and comparison sources.

High-risk signals include:
- a distinctive phrase reproduced verbatim;
- sentence-level verbatim reuse;
- multiple exact fragments from the same source;
- an exact passage with only punctuation/capitalization changes;
- translated output that preserves the source's distinctive expression without attribution.

Operational review trigger:
- an exact sequence of roughly 8 or more words should be inspected when it is distinctive;
- a sentence-level or longer exact match should receive mandatory source/provenance review.

These are review triggers, not legal thresholds.

### 6.3 Near-verbatim pass

Look for source expression retained through cosmetic modification.

Signals:
- synonym substitution with the same sentence skeleton;
- same clause order and distinctive wording;
- deletion/addition of a few words around an otherwise copied passage;
- repeated uncommon phrase combinations;
- source sentence recast while preserving its distinctive rhetorical construction.

A synonym swap is not an independent paraphrase.

### 6.4 Structural-derivation pass

Inspect whether the output reproduces a source's unusually specific expressive architecture even when wording changes.

Signals:
- same unusual sequence of examples;
- same distinctive analogy followed by the same conclusion;
- same uncommon section progression;
- same non-obvious ordering of arguments plus matching examples;
- same narrative beat sequence when directly derived from a source.

Structural similarity alone is not automatically plagiarism. It triggers provenance review.

### 6.4.1 Style-versus-expression distinction

Similarity to an author's general style, genre conventions, tone, cadence, or broad technique is not by itself enough for this protocol to classify plagiarism.

The check must look for concrete source-dependent expression or unusually specific expressive structure.

If the output was intentionally prompted to imitate a named author, work, or supplied sample:
- record that source exposure;
- inspect for copied or near-copied expression;
- inspect for distinctive examples, metaphors, characters, passages, or sequence carried over from the source;
- route separate right-of-publicity, trademark, unfair-competition, publisher-policy, or other legal questions elsewhere when applicable.

Do not convert “sounds like X” into a plagiarism finding without evidence of source-dependent copying.

### 6.5 Attribution pass

For every source-dependent passage, ask:
- Is the source visibly identified where attribution is required?
- Is verbatim text clearly marked as quotation?
- Does the paraphrase still depend closely enough on the source that attribution is necessary?
- Is the output implying original discovery or phrasing when the source supplied it?

### 6.6 Independent-expression pass

A strong independent paraphrase:
- preserves the underlying fact or idea;
- uses a materially different sentence structure;
- uses the current author's natural vocabulary;
- reorganizes explanation where useful;
- does not trace the source line-by-line;
- retains attribution when the idea/source relationship requires it.

A weak paraphrase:
- follows the source sentence-by-sentence;
- replaces nouns/verbs with synonyms;
- preserves distinctive metaphors or examples;
- keeps the same rhetorical progression while hiding verbatim overlap.

### 6.7 Common-language exclusion pass

Before escalating an overlap, test whether it is reasonably explained by common usage, standardized terminology, fixed nomenclature, required wording, factual names/dates, technical syntax, or short non-distinctive phrasing.

Do not manufacture plagiarism findings from unavoidable language.

## 7. External Verification Protocol

Source-bound comparison against the sources actually used in the writing project is mandatory whenever this check is triggered.

Targeted external verification is required when:
- the user explicitly requests an internet-wide or external plagiarism check;
- distinctive or suspicious material overlap is detected and the source is unknown or unresolved;
- a publisher, platform, academic institution, client, contest, or project-specific rule requires external checking;
- the companion Gate routes the item to VERIFY-HALT.

High-stakes publication status alone does not require an open-ended internet search.

A dedicated plagiarism-service/database check is required only when the user, project governance, or destination rule specifically requires that service or class of service.

When web search is available:

1. Select distinctive phrases from the suspicious passage.
2. Search exact quoted phrases where search syntax permits.
3. Search meaningful variants if exact search fails.
4. Prefer the earliest/primary identifiable source over scraper/repost pages when possible.
5. Compare the candidate output directly against the discovered source.
6. Record what was searched.

Web search is discovery evidence, not an exhaustive plagiarism database.

If a dedicated plagiarism service is available and authorized, its report may be added to the comparison set. Its percentage or match score is evidence only; it does not replace this classification protocol.

## 8. Legal/IP Separation Rule

This protocol must keep five questions separate:

1. **Plagiarism** — whether source expression or structure is improperly presented as original.
2. **Copyright infringement** — whether protected expression has been used in a manner that violates copyright law.
3. **Copyrightability** — whether the resulting work contains sufficient human-authored expression to qualify for copyright protection.
4. **AI-training legality** — whether use of copyrighted works in model training was lawful.
5. **Publisher/platform disclosure or submission compliance** — whether a destination requires disclosure of AI-generated or AI-assisted material.

A finding on one axis does not automatically decide the others.

Examples:
- A properly attributed quotation may pass the plagiarism gate but still require copyright/fair-use analysis depending on scope and use.
- A fully original AI-generated passage may contain no detected plagiarism yet still present a separate copyrightability question.
- A model's possible training on copyrighted works does not, by itself, prove that a particular output plagiarizes or infringes a source.
- A plagiarism-clear manuscript may still violate a publisher's AI-disclosure rule.

### 8.1 Human-authorship provenance handoff

When AI materially contributes to publishable prose, preserve available evidence of human contribution where practical, including:
- user-authored source text;
- human selection and arrangement;
- substantive human revisions;
- accepted/rejected AI proposals;
- project provenance and revision history.

This check does not certify copyrightability.

Current U.S. Copyright Office guidance distinguishes the human-authored and AI-generated portions of mixed works. A work containing AI-generated material may receive copyright protection for qualifying human-authored expression, creative selection or arrangement, and human-authored modifications where those contributions independently satisfy copyright requirements. Inclusion in such a work does not make the AI-generated material itself copyrightable. Mere prompting alone does not automatically establish human authorship of the resulting expressive output.

Because this is a legal and time-sensitive area, any copyrightability determination must be independently verified against current authoritative law/guidance.

### 8.2 Training-data separation

Do not fail an output for plagiarism solely because the generating model may have been trained on copyrighted material.

Training-data legality is a separate legal question. Current U.S. Copyright Office analysis treats generative-AI training and fair-use questions as fact-dependent rather than universally lawful or unlawful.

If the candidate output itself reproduces protected or distinctive source expression, assess that output normally under this protocol.

### 8.3 Destination-compliance handoff

When the work is intended for a publisher, platform, contest, school, client, or other destination that may impose AI-use or disclosure rules:
- identify that a separate compliance check is required;
- do not treat plagiarism clearance as destination approval;
- re-verify the destination's current rules before submission when material.

## 9. Model-Training Blind Spot

The system normally cannot inspect the model's complete training corpus or identify every training example that may have influenced generated language.

Therefore:
- do not claim that a passage is guaranteed not to reproduce unseen training text;
- do not claim that absence of a web match proves the language is unprecedented;
- treat unexplained highly distinctive phrasing as a reason for additional verification when stakes justify it.

## 10. Risk Classification

### C0 — CLEAR

No material problematic overlap detected in the available comparison set.

May route to PASS.

### C1 — EXPLAINED / ATTRIBUTED

Overlap exists but is adequately explained by user authorship, authorized reuse, proper quotation/attribution, or common/standardized language.

May route to PASS or PASS-WITH-ATTRIBUTION.

### C2 — REVISION REQUIRED

Material overlap exists that appears unattributed, too close to a third-party source, cosmetically paraphrased, or misleadingly presented as original expression.

Route to REVISE.

### C3 — UNRESOLVED HIGH RISK

Material suspicious overlap or provenance uncertainty remains and cannot be resolved from the available evidence.

Route to VERIFY-HALT when originality matters to the requested use.

## 11. Check Record

A check result should be representable as:
- `check_status`
- `candidate_artifact`
- `comparison_set`
- `sources_materially_used`
- `overlap_findings`
- `source_classification`
- `attribution_status`
- `risk_class`
- `external_verification_performed`
- `blind_spots`
- `recommended_gate_route`
- `ai_origin_status`
- `human_authorship_provenance`
- `copyrightability_handoff`
- `destination_compliance_handoff`

The record may be rendered to the user when requested. Otherwise it may remain part of internal governance/telemetry subject to higher rules.

## 12. Rewrite Guidance After C2

When revision is required:

1. Preserve facts and user-authored ideas.
2. Remove copied or source-tracing expression.
3. Re-express from independently organized notes or understanding.
4. Change structure, not merely vocabulary.
5. Remove borrowed distinctive metaphors/examples unless needed and attributed.
6. Quote and attribute language that genuinely must remain verbatim.
7. Re-run the check against the same source plus the revised passage.

Do not “beat a plagiarism detector” through synonym swapping, punctuation changes, word-order tricks, invisible characters, or other evasion.

The objective is independent authorship and honest attribution, not detector avoidance.

## 13. Relationship to Anti-AI Signature Gate

Anti-AI Signature Gate asks whether human-facing prose carries synthetic/model signatures.

Anti-Plagiarism Check asks whether authored output improperly reuses source expression or structure.

A passage can sound human and still be plagiarized. A passage can be fully original and still sound synthetic.

Neither gate substitutes for the other.

## 14. WBG Extensions and Project Specialization

Project-specific writing governance or later WBG functional extensions may extend this protocol only by:
- adding domain-specific comparison sources;
- adding domain-specific attribution rules;
- adding stricter activation triggers;
- adding domain-specific provenance fields;
- adding specialized external-verification procedures.

They may not:
- redefine a third-party copy as original merely because the domain commonly copies;
- suppress an unresolved material overlap;
- claim exhaustive originality without evidence;
- weaken source classification or comparison-set disclosure.

## 15. WBG Registration Requirements

This artifact is designed for the WBG hierarchical registration model.

Required registration:
- artifact ID: `wbg.anti-plagiarism.check`
- capability: `writing.originality.source-comparison-check`
- WBG layer: `functional_extension`
- minimum WBG root: `1.1.0`
- required parent CGS: inherited through the active WBG root
- optional enforcement handoff: `family:wbg.anti-plagiarism.gate`

The artifact may be independently versioned after registration. A later version does not require unrelated WBG base artifacts to be re-versioned.

Registration must fail closed on incompatible WBG Root, duplicate capability ownership, integrity failure, or a conflicting higher-authority rule.

The Check does not require the Gate in order to perform source comparison. This avoids a circular dependency. The Gate may consume the Check result when enforcement is required.

## 16. Reference Basis and v1.0.1 Change Note

### Reference considered

K.M. Robinson, **“Can Writers Use AI To Write Novels Legally (Lawyer Tony Iliakostas)”**, YouTube video ID `99L2I1rr9ls`.

The full transcript was not retrievable through the available source-access path during this revision. No unverified quotation or specific legal claim is attributed to the speakers.

The video's identified subject matter was used as a research trigger for the legal/IP distinctions added in v1.0.1.

### Current authoritative corroboration used

- U.S. Copyright Office, **Copyright and Artificial Intelligence, Part 2: Copyrightability** (2025).
- U.S. Copyright Office, **Copyright and Artificial Intelligence, Part 3: Generative AI Training** (pre-publication version released 2025; final version pending at time of this revision).
- U.S. Copyright Office, **What Writers Should Know about Copyright**.

### v1.0.1 delta

Added:
- S7 AI-generated / AI-assisted provenance classification;
- style-versus-expression distinction;
- explicit separation of plagiarism, infringement, copyrightability, training legality, and destination compliance;
- human-authorship provenance handoff;
- training-data separation;
- destination compliance handoff;
- additional result-record fields for those handoffs.

No prior v1.0.0 plagiarism classification or enforcement semantics were weakened.

### v1.0.2 delta

- moved the artifact from proposed CoSyn Core placement into WBG;
- narrowed external verification so source-bound comparison is mandatory but open-ended external searching is targeted rather than automatic for every high-stakes manuscript;
- corrected copyrightability wording so protection attaches to qualifying human-authored portions/arrangement/modifications, not to AI-generated material merely because it appears in a mixed work;
- converted Core integration instructions to WBG self-registration requirements.

### v1.0.3 delta

- aligned canonical artifact identity with the ratified WBG URN convention;
- added stable `artifact_family_id` for independent versioning;
- aligned the body capability identifier with the registered capability;
- removed the circular required dependency on the Gate; the Gate is now a downstream handoff;
- validated against the actual 11-member WBG v1.0.0 baseline.

## 17. One-Line Standard

**Find the source relationship before judging the overlap; disclose the comparison set before claiming originality.**
