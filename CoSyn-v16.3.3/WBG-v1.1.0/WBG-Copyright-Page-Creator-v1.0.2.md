---
wbg_artifact:
  schema_version: "1.0.1"
  artifact_family_id: "wbg.publication.copyright-page-creator"
  artifact_id: "urn:cosyn:wbg:copyright-page-creator:1.0.2"
  artifact_name: "WBG Copyright Page Creator"
  artifact_version: "1.0.2"
  filename: "WBG-Copyright-Page-Creator-v1.0.2.md"
  artifact_class: "functional_extension"
  wbg_layer: "functional_extension"
  status: "RATIFIED"
  authority_ceiling: "urn:cosyn:wbg:wbg-root-authority:1.1.0"
  minimum_wbg_root: "1.1.0"
  required_parent_cgs: "inherited_from_active_wbg_root"
  capabilities_provided:
    - "writing.publication.copyright-page-creation"
  activation:
    - "copyright page requested"
    - "publication assembly requires copyright page"
  dependencies:
    []
  handoffs:
    - "family:wbg.publication.ai-use-disclosure-creator"
    - "family:wbg.anti-plagiarism.check"
  conflicts:
    []
  supersedes_artifact_id: null
  development_predecessor: "WBG-Copyright-Page-Creator-v1.0.1 candidate"
  integrity:
    method: "external_registry_sha256"
---


# WBG Copyright Page Creator — v1.0.2

**Status:** RATIFIED / CANONICAL

## 0. Purpose

Create a publication-ready copyright page from verified writing-project metadata, rights information, provenance, and destination requirements.

The creator must not invent:
- a copyright owner;
- a publication year;
- an ISBN;
- an edition;
- a Library of Congress number;
- a registration number;
- permissions;
- publisher/imprint identity;
- cover/illustration credits;
- legal disclaimers;
- copyrightability of AI-generated material.

The creator generates the page from what the writing project actually establishes.

## 1. Governing Principle

A copyright page is a publication artifact, not a legal-fiction generator.

Use:

`verified project facts → rights/provenance check → destination requirements → modular page assembly`

Never use:

`generic book boilerplate → fill gaps by assumption`

## 2. U.S. Copyright Notice Basis

For works published on or after March 1, 1989, U.S. copyright notice is optional, but the U.S. Copyright Office identifies practical/legal benefits to using one.

A conventional notice contains:

`© + year of first publication + name of copyright owner`

Example structure:

`© 2026 [Copyright Owner]`

The copyright notice:
- does not require prior permission from the U.S. Copyright Office;
- does not itself prove registration;
- must not be presented as a registration certificate;
- does not decide whether every component of a mixed human/AI work is copyrightable.

## 3. Capability Boundary

This artifact owns the proposed WBG capability:

`writing.publication.copyright-page-creation`

It creates the copyright-page artifact.

It does not own:
- plagiarism/originality checking;
- copyright infringement analysis;
- legal advice;
- copyright registration filing;
- ISBN acquisition;
- Library of Congress registration/CIP/LCCN;
- publisher/platform AI rules;
- AI-use disclosure classification.

Those functions remain separate and must be handed off when applicable.

## 4. Source Authority for Page Creation

Use project information in this order:

1. Current explicit User instruction.
2. Ratified project-specific writing governance.
3. Canonical project provenance records.
4. Canonical manuscript/publication metadata.
5. Verified publisher/imprint metadata.
6. Verified registration/identifier records.
7. Current authoritative external requirements when the destination makes them material.
8. Model proposal only for optional wording or layout, never for factual fields.

If sources conflict:
- do not silently choose;
- surface the conflict;
- request the minimum required resolution.

## 5. Required Inputs

### 5.1 Minimum fields

Required to generate the basic copyright notice:

- copyright owner display name;
- year of first publication, or confirmed intended first-publication year;
- work title for artifact identity.

If the publication year is not yet established, the creator may produce a clearly marked draft page with `[YEAR OF FIRST PUBLICATION]`.

It must not guess the year merely from the current date.

### 5.2 Optional publication fields

Use only when established:

- author name;
- pen name;
- publisher;
- imprint;
- edition statement;
- publication location;
- publisher website;
- permissions contact;
- ISBN by format;
- Library of Congress Control Number;
- copyright registration number;
- cover design credit;
- cover art/image credit;
- illustration credit;
- editor credit when the project wants it;
- typography/design credit;
- printing/manufacturing statement;
- country of printing;
- trademark acknowledgments;
- source/quotation permissions;
- series information;
- previous-edition notice;
- translation rights/translator credit;
- AI-use disclosure block or pointer.

## 6. Rights and Provenance Check Before Assembly

Before rendering the page, consume verified project/legal evidence establishing:

- who is asserting copyright ownership;
- any established ownership basis relevant to the page.

The creator must not independently classify a work as work-made-for-hire, transferred ownership, entity-owned, jointly owned, or otherwise legally assigned. If that classification is not already established by authoritative project/legal evidence, mark ownership status unresolved and request the minimum required input.
- whether the project includes material from third parties;
- whether permissions/attributions must appear;
- whether substantial AI-generated expressive material is present;
- whether the project has a current AI-use disclosure artifact;
- whether any registration facts have actually been verified.

If ownership is unresolved, do not fabricate a rights notice.

If the project contains AI-generated material and copyrightability is material, route to current copyrightability guidance rather than claiming that all material is protected.

## 7. AI-Generated Material Boundary

A copyright page and an AI-use disclosure solve different problems.

The copyright page may state a copyright claim in the copyrightable work or human-authored portions, but it must not imply that an ordinary © notice resolves the legal status of AI-generated expressive material.

When project provenance shows material AI-generated content:

1. preserve the human-authorship provenance;
2. invoke the WBG AI Use Disclosure Creator when required or desired;
3. route copyright-registration questions to current U.S. Copyright Office guidance;
4. do not name an AI system as an author or co-author merely because it was used.

For U.S. copyright registration, a separate registration disclosure may be required for AI-generated material. That registration disclosure is not automatically the same text as the reader-facing copyright page disclosure.

## 8. Modular Copyright Page Components

The creator assembles only applicable modules.

### M1 — Copyright notice

Preferred structure:

`© [YEAR] [COPYRIGHT OWNER]`

### M2 — Rights reservation statement

Optional conventional wording.

Example:

`All rights reserved.`

Do not present this phrase as a prerequisite for copyright protection.

### M3 — Reproduction/permissions statement

Optional.

Use project/publisher-approved language.

Do not create an absolute prohibition that contradicts statutory exceptions or granted permissions.

### M4 — Edition/publication statement

Examples:

`First edition`

`First published [YEAR] by [IMPRINT]`

Only use established facts.

### M5 — Publisher/imprint block

Use verified publisher identity and contact/website information.

### M6 — ISBN block

List only assigned ISBNs, labeled by format when applicable.

Example structure:

`ISBN [NUMBER] (paperback)`

`ISBN [NUMBER] (ebook)`

### M7 — Library/registration identifiers

Include only when verified.

Possible fields:
- Library of Congress Control Number;
- copyright registration number.

Never invent pending or anticipated identifiers.

### M8 — Credits

Include project-authorized credits such as:
- cover design;
- cover art;
- illustrations;
- maps;
- photography;
- typography;
- editing;
- translation.

### M9 — Permissions/third-party acknowledgments

Use when source permissions, licensed material, or required notices belong on the copyright page.

### M10 — Fiction/nonfiction disclaimer

Use only when appropriate to the project and approved.

Do not automatically add the standard “all persons fictitious” language to nonfiction, memoir, history, journalism, or other fact-based work.

Do not invent medical, legal, financial, or other professional disclaimers merely because the book concerns those subjects.

### M11 — AI-use disclosure

Insert only when:
- the project requires it;
- the publisher/platform requires it;
- the User chooses to place it here; or
- project governance specifies copyright-page placement.

The wording must come from the WBG AI Use Disclosure Creator, not from generic boilerplate.

### M12 — Manufacturing/printing statement

Optional and factual only.

## 9. Default Assembly Order

Unless publisher/project requirements specify otherwise:

1. Copyright notice.
2. Rights statement.
3. Reproduction/permissions statement.
4. Edition/publication statement.
5. Publisher/imprint information.
6. ISBN/identifier block.
7. Credits.
8. Third-party notices/permissions.
9. Project-specific disclaimer, if applicable.
10. AI-use disclosure, if assigned to this page.
11. Printing/manufacturing statement.

The creator may adapt order for house style without changing meaning.

## 10. Output Modes

### O1 — Draft copyright page

Use when one or more publication fields remain unresolved.

Unknown fields remain visibly marked.

No factual placeholder may be silently converted into a claim.

### O2 — Publication-ready copyright page

Requirements:
- all included factual fields verified;
- no unresolved ownership conflict;
- no invented identifier;
- required credits/permissions accounted for;
- AI disclosure disposition resolved when applicable.

### O3 — Copyright-page field report

When requested, output the fields used, omitted, unresolved, and their source provenance.

## 11. Deterministic Missing-Input Handling

If the basic notice cannot be completed, request only the missing blocking fields.

Example:

`Missing: copyright owner display name; year of first publication.`

Do not respond with a long publishing questionnaire when only two fields block the page.

## 12. Registration Status Discipline

Copyright protection, copyright notice, and copyright registration are distinct.

The creator must never infer registration from:
- presence of ©;
- manuscript completion;
- publication;
- an ISBN;
- a Library of Congress number;
- a publisher name.

Only state “registered” or include a registration number when verified from authoritative project evidence.

## 13. Anti-Plagiarism / Source-Fidelity Handoff

If the project contains third-party text, quotations, adapted material, uncertain provenance, or licensed expression:

- route to the applicable anti-plagiarism/source-fidelity controls;
- ensure required attribution/permissions language survives page assembly;
- do not use copyright-page boilerplate to conceal third-party source dependence.

## 14. Example Skeleton

This is a structural example only. Bracketed values must come from verified project facts.

© [YEAR] [COPYRIGHT OWNER]

All rights reserved.

[PROJECT-APPROVED REPRODUCTION/PERMISSIONS STATEMENT]

[EDITION / FIRST-PUBLICATION STATEMENT]

Published by [PUBLISHER / IMPRINT]  
[WEBSITE OR CONTACT]

ISBN [NUMBER] ([FORMAT])  
[OTHER VERIFIED IDENTIFIERS]

Cover design: [CREDIT]  
[OTHER APPLICABLE CREDITS]

[REQUIRED THIRD-PARTY / PERMISSIONS NOTICE]

[PROJECT-SPECIFIC DISCLAIMER, IF APPLICABLE]

[AI-USE DISCLOSURE, IF ASSIGNED TO COPYRIGHT PAGE]

[PRINTING / MANUFACTURING STATEMENT]

## 15. Validation Gate

A publication-ready copyright page fails if any of the following is true:

- copyright owner is guessed;
- publication year is guessed;
- registration is implied without evidence;
- ISBN/LCCN/registration number is invented;
- third-party credit or required attribution is dropped;
- AI-generated material is treated as automatically copyrightable;
- a destination-specific disclaimer is invented;
- a generic AI disclosure is substituted for project-derived provenance;
- unresolved placeholders remain while the artifact is labeled final.

## 16. Reference Basis

Current U.S. Copyright Office sources used in designing this artifact:

- Circular 3 — Copyright Notice.
- Circular 1 — Copyright Basics.
- Copyright Registration Guidance: Works Containing Material Generated by Artificial Intelligence.
- Copyright and Artificial Intelligence, Part 2: Copyrightability.

Legal and registration requirements can change. Re-verify current authoritative guidance when registration, disputed ownership, or material AI-generated content makes legal accuracy outcome-determinative.

## 17. WBG Registration Requirements

Required registration:
- artifact ID: `wbg.publication.copyright-page-creator`
- capability: `writing.publication.copyright-page-creation`
- WBG layer: `functional_extension`
- minimum WBG root: `1.1.0`
- AI disclosure handoff: `wbg.publication.ai-use-disclosure-creator`

The artifact may be independently versioned. Updating this creator does not require unrelated WBG base artifacts to be re-versioned.

Registration must fail closed on duplicate capability ownership or incompatible WBG root.

### v1.0.1 delta

- separated copyright-owner identity from registration claimant terminology;
- prohibited this creator from independently determining work-made-for-hire, transferred-ownership, or similar legal classifications;
- converted package-wide integration instructions to WBG self-registration requirements.

### v1.0.2 delta

- aligned canonical artifact identity with the ratified WBG URN convention;
- added stable `artifact_family_id`;
- classified AI-disclosure and anti-plagiarism relationships as handoffs rather than required registration dependencies;
- validated publication-role boundaries against the actual WBG v1.0.0 Publisher persona and diagnostic artifacts; no capability collision found.

## 18. One-Line Standard

**Build the copyright page from verified rights and publication facts; never let boilerplate manufacture ownership.**
