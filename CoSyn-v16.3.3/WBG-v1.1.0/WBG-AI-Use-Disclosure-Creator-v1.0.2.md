---
wbg_artifact:
  schema_version: "1.0.1"
  artifact_family_id: "wbg.publication.ai-use-disclosure-creator"
  artifact_id: "urn:cosyn:wbg:ai-use-disclosure-creator:1.0.2"
  artifact_name: "WBG AI Use Disclosure Creator"
  artifact_version: "1.0.2"
  filename: "WBG-AI-Use-Disclosure-Creator-v1.0.2.md"
  artifact_class: "functional_extension"
  wbg_layer: "functional_extension"
  status: "RATIFIED"
  authority_ceiling: "urn:cosyn:wbg:wbg-root-authority:1.1.0"
  minimum_wbg_root: "1.1.0"
  required_parent_cgs: "inherited_from_active_wbg_root"
  capabilities_provided:
    - "writing.publication.ai-use-disclosure-creation"
  activation:
    - "AI-use disclosure requested"
    - "destination AI disclosure required"
    - "copyright-registration support requested"
  dependencies:
    []
  handoffs:
    - "family:wbg.publication.copyright-page-creator"
    - "family:wbg.anti-plagiarism.check"
  conflicts:
    []
  supersedes_artifact_id: null
  development_predecessor: "WBG-AI-Use-Disclosure-Creator-v1.0.1 candidate"
  integrity:
    method: "external_registry_sha256"
---


# WBG AI Use Disclosure Creator — v1.0.2

**Status:** RATIFIED / CANONICAL

## 0. Purpose

Create an accurate AI-use disclosure from what actually happened during a writing project.

The creator must derive the disclosure from project evidence rather than generic language, memory, marketing preference, or a user's desired appearance.

The disclosure should answer, at the appropriate level:

- whether generative AI was used;
- what functions it performed;
- what human-authored material existed;
- whether AI-generated expressive text was proposed;
- whether AI-generated expressive text was retained;
- how much substantive human selection, revision, arrangement, or rewriting occurred;
- whether AI was used for research/source retrieval;
- whether project governance and provenance controlled the process;
- what the disclosure is for.

## 1. Core Principle

Use:

`project evidence → AI-use classification → human-contribution classification → destination requirement → disclosure`

Never use:

`generic “AI-assisted” label → retrofitted story about the workflow`

The disclosure must be source-traceable.

## 2. Capability Boundary

This artifact owns the proposed WBG capability:

`writing.publication.ai-use-disclosure-creation`

It creates factual disclosures about AI use.

It does not decide:
- whether the work is copyrightable;
- whether any use infringes copyright;
- whether the work passes plagiarism review;
- whether a publisher/platform accepts the disclosed use;
- whether a legal registration claim should be granted.

It routes those issues to the appropriate control.

## 3. Governing Evidence Order

Determine AI use from:

1. Current explicit User statement about the project.
2. Ratified project-specific writing governance.
3. Canonical project provenance.
4. Canonical manuscript/revision lineage.
5. Session/turn provenance and accepted edit records.
6. Source/research logs and tool records.
7. AI-generated artifacts retained in the project.
8. Current destination requirements.
9. Model inference only when explicitly labeled as inference and never when evidence is sufficient.

If evidence is incomplete, state the gap.

Do not reconstruct missing authorship history merely because a polished disclosure would be convenient.

## 4. Required Project Evidence Scan

Before drafting a disclosure, inspect available evidence for:

- project title;
- author/rights-holder identity;
- applicable CoSyn Core version;
- applicable WBG version;
- project-specific governance version;
- writing-team/persona governance used;
- provenance records;
- source/reference corpus used;
- manuscript version history;
- human-authored baseline material;
- AI-generated proposals;
- accepted/rejected AI revisions;
- user-authored edits;
- AI-assisted research;
- AI-assisted outlining/development;
- AI-assisted critique/review;
- AI-assisted line/copy editing;
- AI-assisted rewriting;
- retained verbatim AI prose;
- substantially rewritten AI prose;
- human selection/arrangement decisions;
- final human approval;
- plagiarism/originality check result when available;
- copyrightability handoff when applicable.

The scan must use canonical sources rather than reconstructing the project from conversational memory when canonical artifacts exist.

## 5. AI Use Classification

Classify each applicable activity independently.

### U0 — No generative AI use established

No project evidence establishes generative AI participation.

Do not claim “no AI was used” if the evidence is merely incomplete.

### U1 — Administrative / workflow support

Examples:
- file organization;
- version tracking;
- formatting assistance;
- task routing;
- metadata generation;
- governance execution.

No expressive writing contribution is established by this category alone.

### U2 — Research / source support

Examples:
- web/source retrieval;
- factual cross-checking;
- source summarization;
- research organization;
- bibliography/source assistance.

Requires source-fidelity and citation discipline.

### U3 — Developmental / analytical assistance

Examples:
- brainstorming;
- Q&A development;
- plot/argument testing;
- structural analysis;
- critique;
- reader simulation;
- counterarguments;
- diagnostic review.

Ideas or analysis do not automatically establish retained AI-generated prose.

### U4 — Editorial assistance on human-authored text

Examples:
- proofreading;
- grammar correction;
- line editing;
- copy editing;
- mechanical cleanup;
- suggested rewrites of human-authored passages.

Record whether proposed AI wording was retained, modified, or rejected.

### U5 — AI-generated expressive material proposed but not materially retained

The system generated prose or other expressive material, but the accepted final work does not materially retain that expression.

This may still be worth disclosing depending on destination policy, but it is not equivalent to retained AI-generated text.

### U6 — AI-generated expressive material retained after substantial human transformation

AI-generated expression entered the workflow and some descendant material remains, and project provenance clearly establishes substantive human rewriting, selection, arrangement, modification, or integration sufficient to distinguish the retained expression from the generated form.

Do not collapse this into either “human-only” or “AI-written.”

Describe the documented human transformation.

### U7 — AI-generated expressive material retained substantially as generated

Project provenance clearly establishes that material AI-generated prose or other expressive content remains substantially in generated form in the final work.

This classification requires clear disclosure where destination rules, copyright registration, or User transparency policy makes it material.

### U6/U7 ambiguity rule

If available provenance cannot clearly distinguish U6 from U7, do not select the more favorable classification.

Classify the material as **U8 — Unknown / insufficient provenance** and recover the missing evidence before issuing a definitive disclosure.

### U8 — Unknown / insufficient provenance

Available evidence cannot determine the material AI contribution.

Do not generate a confident disclosure.

Request or recover the missing provenance.

## 6. Human Contribution Classification

Separately record human authorship/contribution.

Possible categories:

- original human-authored source text;
- human conception/idea development;
- human factual/source selection;
- human structure/outline;
- human character/plot/argument decisions;
- human selection among AI proposals;
- human rejection of AI proposals;
- human substantive rewriting;
- human line-level editing;
- human creative arrangement;
- human final manuscript approval;
- human project-rule/governance decisions.

Do not treat prompt entry alone as proof of human authorship of resulting AI-generated expression.

## 7. Governance and Provenance Disclosure

When CoSyn/WBG materially governed the writing process, the creator may describe that role factually.

Potentially material facts include:
- the project used a versioned governance system;
- source authority and provenance were preserved;
- AI-generated proposals were subject to human acceptance/rejection;
- project canon/author authority constrained modification;
- revision history distinguishes AI revisions from User edits;
- anti-plagiarism/source checks were applied;
- professional reference material was reference-only and did not become authorial authority.

Do not turn governance into advertising language.

The disclosure should describe what the governance changed about the process only when supported by project records.

## 8. Disclosure Destinations

Generate the disclosure for a named destination.

### D1 — Reader-facing book disclosure

Purpose:
Transparent explanation to readers.

Default style:
Brief, plain English, non-technical.

May appear:
- copyright page;
- acknowledgments;
- author's note;
- separate AI-use note.

### D2 — Publisher / agent / platform disclosure

Purpose:
Answer submission or distribution requirements.

Requirements:
- follow the destination's current wording/questions;
- distinguish AI-generated from AI-assisted use if the destination does;
- answer only what the evidence supports;
- do not reuse a reader-facing statement when the destination asks different questions.

### D3 — Copyright-registration support statement

Purpose:
Support accurate preparation of a U.S. copyright registration involving AI-generated material.

This is not a reader-facing disclosure.

Current U.S. Copyright Office guidance requires applicants to disclose AI-generated content in a work submitted for registration and briefly explain the human author's contribution. More-than-de-minimis AI-generated content may need to be excluded from the claim.

The creator may prepare a factual project-derived statement, but it must not make the registration decision itself.

### D4 — Detailed provenance disclosure

Purpose:
Create an auditable explanation for archives, collaborators, publishers, legal review, or project records.

May include:
- governance versions;
- AI tools/models if known;
- AI-use categories;
- human-contribution categories;
- manuscript version lineage;
- retained/rejected AI contribution;
- research/reference sources;
- plagiarism-check status;
- unresolved limitations.

### D5 — Minimal factual disclosure

Purpose:
Provide the shortest accurate statement when no destination-specific format is imposed.

## 9. Disclosure Construction Algorithm

### Step 1 — Identify destination

Determine D1–D5.

If destination rules may have changed, verify them before drafting.

### Step 2 — Assemble evidence

Use the project evidence order in §3.

### Step 3 — Classify AI uses

Assign all applicable U1–U8 categories.

Multiple categories may apply.

### Step 4 — Classify human contribution

Record supported human-authorship and revision facts.

### Step 5 — Determine retained expressive contribution

This is mandatory.

Resolve whether AI-generated expressive material:
- was not generated;
- was generated but rejected;
- is clearly documented as retained after substantial human transformation;
- is clearly documented as remaining substantially as generated;
- cannot be determined.

If the evidence does not clearly distinguish the two retained-material states, classify U8 and recover provenance. Do not choose U6 or U7 by impression.

### Step 6 — Apply destination rules

Do not over-disclose or under-disclose relative to the destination.

### Step 7 — Draft factual language

Prefer concrete verbs:
- researched;
- summarized;
- critiqued;
- proposed;
- edited;
- reorganized;
- generated;
- revised;
- selected;
- rejected;
- verified.

Avoid vague language such as:
- “AI helped”;
- “AI was involved”;
- “created with AI”;

unless the destination specifically requires that shorthand.

### Step 8 — Validate against provenance

Every material sentence must trace to project evidence.

### Step 9 — Run contradiction test

The disclosure must not contradict:
- manuscript provenance;
- copyright-page claims;
- plagiarism findings;
- publisher/platform declarations;
- copyright-registration representations.

### Step 10 — Render

Output only the destination-appropriate disclosure plus any required unresolved-evidence notice.

## 10. Disclosure Wording Rules

### 10.1 Do not call AI an author/co-author by default

AI system names may be identified as tools when useful or required.

Do not list an AI system as an author or co-author merely because it generated or edited material.

### 10.2 Separate AI-generated from AI-assisted

Where evidence supports the distinction, use it.

Examples:

AI-assisted:
- critique;
- research organization;
- proofreading;
- editorial suggestions.

AI-generated:
- prose, images, dialogue, or other expressive content produced by the model.

### 10.3 Do not erase human authorship

If the User supplied the underlying manuscript, made substantive creative decisions, selected/rejected proposals, rewrote material, and approved the final work, preserve those facts.

### 10.4 Do not erase retained AI expression

If material AI-generated expression remains substantially as generated, say so when the destination requires or the User has chosen meaningful transparency.

### 10.5 Do not overclaim governance

Do not say governance “guaranteed originality,” “made the work copyrightable,” or “prevented plagiarism” unless a specific governed check actually supports the bounded statement.

### 10.6 Name tools only when useful or required

If project provenance records the model/system and the destination benefits from specificity, include it.

Do not guess model/version from memory.

## 11. Reader-Facing Disclosure Patterns

These are construction patterns, not automatic text.

### Pattern A — Research/development only

Use when evidence shows U2/U3 but no retained AI-generated prose.

Structure:

`Generative AI was used for [research/development functions]. The final text was authored and revised by [human author], and AI-generated prose was not materially retained.`

Use only if every clause is supported.

### Pattern B — Editorial assistance

Structure:

`Generative AI was used as an editorial tool for [specific functions] on human-authored material. [Human author] retained responsibility for substantive writing, revision, and final approval.`

Do not use if substantial generated prose remains.

### Pattern C — Generated material substantially transformed

Structure:

`Generative AI produced some draft material during development. The retained material was substantially selected, reorganized, rewritten, and integrated by [human author].`

Add specifics when useful.

### Pattern D — Material generated expression retained

Structure:

`This work contains [describe material] generated with [tool if established], alongside human-authored and human-revised material. [Describe human contribution accurately].`

Do not minimize U7 as “editing assistance.”

### Pattern E — Governance-aware disclosure

Use only when project provenance supports it.

Structure:

`AI-assisted work was conducted under versioned project governance that preserved source provenance, human approval/rejection of proposed changes, and manuscript revision history.`

This may supplement, not replace, the actual AI-use description.

## 12. Copyright-Registration Support Mode

For U.S. copyright-registration support:

1. identify documented human-authored material;
2. identify documented AI-generated material and where it appears in the work;
3. describe the scope of the AI-generated material factually without independently adjudicating whether a legal de minimis threshold is met;
4. prepare a factual description of the human contribution and identified AI-generated material for current registration guidance;
5. preserve any verified distinction between material claimed and material excluded;
6. do not list the AI system/company as author merely because it was used;
7. when the legal treatment or threshold is uncertain, disclose the AI-generated material generally and route the question to current Copyright Office guidance or qualified legal review rather than deciding the threshold inside this creator;
8. recommend current authoritative verification before filing.

Current U.S. Copyright Office guidance states that applicants have a duty to disclose AI-generated content in works submitted for registration and to explain human authorship. The Office's copyrightability analysis remains case-specific.

This WBG creator prepares evidence-based wording; it does not practice law or decide registrability.

## 13. Project-Derived Disclosure Record

Each generated disclosure should have a non-public support record containing:

- `project_id`
- `project_title`
- `manuscript_version`
- `governance_versions`
- `provenance_sources_used`
- `ai_systems_known`
- `ai_use_categories`
- `human_contribution_categories`
- `retained_ai_expression_status`
- `plagiarism_check_status`
- `copyrightability_handoff_status`
- `destination`
- `destination_rules_verified`
- `disclosure_text`
- `unresolved_evidence`
- `generated_at`

The support record is provenance.

It need not be printed in the published work.

## 14. Provenance Insufficiency Gate

Do not issue a definitive AI-use disclosure if project evidence cannot establish the material AI role.

If U8 applies:

`INSUFFICIENT PROVENANCE FOR DEFINITIVE AI-USE DISCLOSURE`

Then identify only the missing evidence required.

Examples:
- canonical manuscript baseline unavailable;
- AI revision history missing;
- unknown whether generated passage survived into final manuscript;
- destination rules unavailable.

## 15. Relationship to Copyright Page Creator

The AI Use Disclosure Creator owns disclosure wording.

The Copyright Page Creator owns page assembly.

If the disclosure belongs on the copyright page:

`AI Use Disclosure Creator → approved disclosure block → Copyright Page Creator`

The Copyright Page Creator may position or format the block but may not rewrite its substantive meaning without rerunning this protocol.

## 16. Relationship to Anti-Plagiarism Controls

AI disclosure is not a plagiarism clearance.

Before stating or implying originality:
- use the applicable anti-plagiarism/source-overlap controls;
- preserve the bounded result;
- do not convert “AI use disclosed” into “plagiarism risk resolved.”

Likewise, a plagiarism PASS does not determine how much AI-generated expression remains or whether it must be disclosed.

## 17. Destination-Rule Verification

Publisher, platform, contest, school, client, and registration requirements can change.

When a disclosure is being generated for a specific destination:
- verify current official requirements;
- use the destination's own categories where required;
- do not rely on stale project memory;
- preserve the source/date of the rule used.

If no destination is named, generate D1 or D5 according to the User's requested purpose and label it as non-destination-specific.

## 18. Example Detailed Disclosure Framework

Project: [TITLE]  
Manuscript version: [VERSION]

AI systems used:
- [SYSTEM / UNKNOWN]

Documented AI functions:
- [U-CATEGORIES WITH CONCRETE FUNCTIONS]

Human-authored contributions:
- [SUPPORTED CONTRIBUTIONS]

Retained AI-generated expression:
- [NONE / PROPOSED-NOT-RETAINED / SUBSTANTIALLY-TRANSFORMED / SUBSTANTIALLY-RETAINED / UNKNOWN]

Governance/provenance:
- [APPLICABLE CGS/WBG/PROJECT GOVERNANCE]
- [PROVENANCE RECORDS]
- [REVISION-LINEAGE FACTS]

Originality/source checks:
- [BOUNDED STATUS]

Disclosure destination:
- [D1–D5]

Generated disclosure:
[TEXT DERIVED FROM THE ABOVE]

Unresolved:
- [NONE OR MATERIAL GAPS]

## 19. Validation Gate

A generated disclosure fails if:

- it is based primarily on memory while canonical project provenance exists;
- it calls AI a co-author without an authoritative basis;
- it says “human-authored” when substantial generated prose remains and the evidence contradicts that wording;
- it says “AI-generated” when AI was only used for research/analysis/editing;
- it hides known material AI-generated content from a destination that requires disclosure;
- it claims copyrightability;
- it claims legal compliance without checking the applicable current rule;
- it claims plagiarism clearance without a check;
- it invents model/tool/version identity;
- it omits a material provenance uncertainty;
- it contradicts the copyright page or copyright-registration representations.

## 20. Reference Basis

Current U.S. Copyright Office sources used in designing this artifact:

- Copyright Registration Guidance: Works Containing Material Generated by Artificial Intelligence (2023).
- Copyright and Artificial Intelligence, Part 2: Copyrightability (2025).
- U.S. Copyright Office AI initiative materials.

The U.S. Copyright Office currently requires disclosure of AI-generated content in registration applications and an explanation of the human author's contribution; more-than-de-minimis AI-generated content may need to be excluded from the claim.

This is a registration-specific requirement. It must not be silently generalized into a universal requirement that every published book contain a public AI disclosure.

## 21. WBG Registration Requirements

Required registration:
- artifact ID: `wbg.publication.ai-use-disclosure-creator`
- capability: `writing.publication.ai-use-disclosure-creation`
- WBG layer: `functional_extension`
- minimum WBG root: `1.1.0`
- evidence dependencies: canonical project provenance/manuscript lineage when available
- handoff: `wbg.publication.copyright-page-creator`
- originality handoff: `wbg.anti-plagiarism.check`

The artifact may be independently versioned. Updating this creator does not require unrelated WBG base artifacts to be re-versioned.

Registration must fail closed on duplicate capability ownership or incompatible WBG root.

### v1.0.1 delta

- removed independent legal determination of whether AI-generated material crosses a de minimis registration threshold;
- added deterministic U6/U7 ambiguity handling: unresolved provenance routes to U8;
- converted package-wide integration instructions to WBG self-registration requirements.

### v1.0.2 delta

- aligned canonical artifact identity with the ratified WBG URN convention;
- added stable `artifact_family_id`;
- preserved provenance as an upstream evidence source rather than competing with WBG's existing provenance owner;
- validated publication-role boundaries against the actual WBG v1.0.0 Publisher persona and diagnostics; no capability collision found.

## 22. One-Line Standard

**Disclose what the project record proves AI actually did—no less, no more.**
