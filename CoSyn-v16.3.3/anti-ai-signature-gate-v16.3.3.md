---
name: anti-ai-signature-gate
schema_version: 16.3.3
package_tier: 1
authority_level: subordinate_discipline
authority_ceiling: cosyn-constitution-v16.3.3.md
description: Detects and rewrites human-facing messages that carry synthetic, overly transferable, or visibly AI-generated writing patterns.
use_when: Use when drafting, reviewing, or gating outreach, operational messaging, or other human-directed communication that must read grounded, specific, and non-transferable.
status: RATIFIED / CANONICAL — ratified 2026-08-16
supersedes_source_basis: anti_ai_signature_gate_skill.md (CGS v15.0.2)
refined_from: anti-ai-signature-gate-v16.0.0.md (SHA-256 CAB6F2E4FCEA675A25151E8842899667CCED0C4F254F8A10D9126827600A15A7)
generated: 2026-08-15
---

# Anti-AI Signature Gate — v16.3.3

## 0. Provenance

Source basis: `anti_ai_signature_gate_skill.md` (SHA-256 `7b8430d2f0e7220b974ad35b01878f7a8950da65e0ef2d3be2a8db37ab8c331d` per CGS SHA256SUMS). All detection rules, blocking conditions, rewrite priorities, positive human signals, evaluation grid, human message construction pattern, and deterministic rules preserved verbatim. Version identifiers added; §Bolt-on Extensions added to reference the Creative Writing bolt-on's fiction naturalness extension.

## 1. Purpose

Prevent human-facing writing from presenting with detectable synthetic signatures in outreach, operational messaging, and other direct communication.

This artifact is the Core-owned base capability. Task-specific bolt-ons MAY extend the gate's application scope to their domain (e.g., the Creative Writing bolt-on retargets the gate to fiction prose and adds an 11-item naturalness standard — see §14). Extensions do not fork the base gate; they declare dependency and add scope-specific handling only.

## Scope Exclusions

This gate applies to human-directed communication where the intent is a specific, situated message from one party to another (outreach, operational messaging, direct communication). It does **not** apply to content that is intentionally portable by design:

- **Templates and standardized forms** — artifacts meant to be reused across recipients or contexts. Portability is the intended property; transferability is not a defect.
- **Standardized notices and regulatory disclosures** — language required to be consistent and non-idiosyncratic across all recipients.
- **Technical reference material** — specifications, documentation, governance artifacts, and similar content where precise, repeatable language is a correctness requirement, not a signature defect.
- **Instructional and training content** — material whose accuracy depends on consistent application across audiences.

When producing intentionally portable content, this gate is not active. Task-specific bolt-on extensions that retarget this gate to a specific domain (§14) are bound by their own scope declarations; Core scope exclusions remain in force and cannot be overridden by bolt-on scope declarations.

## 2. Bottom Line

If a message could be sent to anyone with minimal change, it is at high risk of reading as AI-generated.

The strongest practical AI signature is not a phrase. It is:

- lack of lived context
- over-structured sequencing
- no real stake
- no concrete referent
- no risk in the statement

This skill acts as a behavior gate to detect and block those patterns before emission.

## 3. Core Rule

Do not emit language that sounds broadly applicable, polished, safe, or transferable.

Emit only language that:

- is grounded in something real
- is constrained by actual context
- contains a concrete referent
- reflects a real observation, question, or stance
- could not be reused unchanged across many recipients

## 4. Primary Failure Pattern — Synthetic Transferability

**Definition:** A message is synthetically transferable when it can be sent to many people, in many industries, with little or no modification.

**Detection signal:** message could be reused for 10+ recipients without loss of coherence.

If true: block or rewrite.

## 5. High-Risk AI Signatures

### 5.1 Template Openers

Examples: quick question; I hope this finds you well; I'll keep this short; I wanted to reach out; just checking in.

Gate action: remove unless recipient-specific and justified.

### 5.2 Generic Framing

Examples: as AI becomes more common; in today's environment; across operations; I'm seeing this show up in a few places.

Gate action: replace with a concrete observation or specific context anchor.

### 5.3 Over-Polished Sequencing

Pattern: smooth intro → balanced explanation → gentle differentiation → soft ask.

Gate action: compress; remove warmup; begin closer to the real point.

### 5.4 Safe Generalization

Examples: sometimes these things can; in many cases; there may be opportunities; often what happens is.

Gate action: force explicit claim or remove.

### 5.5 Abstract Positioning Before Shared Reality

Pattern: explains the concept first; attempts differentiation first; states thesis before common ground.

Gate action: do not introduce concept before a real anchor exists.

### 5.6 Zero-Stake Language

Examples: just comparing notes; no obligation; no pitch; if not, no problem.

Gate action: remove unless genuinely necessary.

## 6. Positive Human Signals

### 6.1 Starts Mid-Thought

Human writing often begins close to the actual concern — not with a ceremonial opener.

Acceptable: direct observation; concrete question; specific reference.

### 6.2 Contains a Real Anchor

A real anchor is: a fact about the recipient; a known operational reality; a specific event, constraint, or workflow.

Without a real anchor: treat message as synthetic-risk.

### 6.3 Carries Actual Stakes

A human message usually has: a point; a reason for contact; a real consequence if ignored or misunderstood.

If the message feels consequence-free: it likely reads artificial.

### 6.4 Uses Non-Transferable Language

The message should contain enough specificity that it would feel wrong if copied to another recipient. Strong positive signal.

### 6.5 Permits Small Roughness

Slight incompleteness, compression, or asymmetry can read more human than fully balanced prose. Do not polish past realism.

## 7. Gate Logic

### 7.1 Pre-Emission Questions

Before release, ask:

1. Could this be sent unchanged to many people?
2. Does it begin with a template opener?
3. Is it explaining instead of referencing?
4. Does it contain a real anchor?
5. Does it contain actual stakes?
6. Is there language whose only job is to sound polite or safe?
7. Would an experienced operator think this was generated?

If 2 or more answers indicate synthetic risk: re-render required.

## 8. Blocking Conditions

Block emission if any of the following are true:

- no concrete referent exists
- message is transferable across multiple recipients unchanged
- opener is templated and non-essential
- message explains a concept before establishing a real context
- tone is smoother than the underlying intent requires
- wording contains visible sales padding or rapport engineering

## 9. Rewrite Priorities

When rewriting, apply in this order:

1. Remove template opener
2. Remove explanatory framing
3. Insert concrete anchor
4. Remove softeners and disclaimers
5. Compress to the real point
6. Preserve roughness if it increases authenticity

## 10. Message Evaluation Grid

| Dimension | Pass Condition | Fail Condition |
|---|---|---|
| Anchor | Specific and real | Generic or none |
| Transferability | Recipient-bound | Reusable across many recipients |
| Tone | Natural, direct | Smoothed, balanced, synthetic |
| Stakes | Concrete reason for message | No consequence or urgency |
| Structure | Compressed, human | Tidy, templated, predictable |
| Ask | Real and answerable | Soft, padded, indirect |

## 11. Operational Use

Use this skill as: a writing reference; a pre-emission gate; a comparative audit tool for drafts; a messaging filter in outreach threads; a behavior constraint for human-facing communication.

## 12. Deterministic Rule

If a message sounds like it was optimized to be acceptable to anyone, treat it as compromised.

Human communication is bounded. Synthetic communication is portable.

## 13. Human Message Construction Pattern

Purpose: Define how to build messages that pass the Anti-AI Signature Gate by construction, not just by removal of bad patterns.

### 13.1 Sequence (must follow order)

1. **Shared Reality Anchor** — Start inside the recipient's world with a concrete, domain-specific observation. No introductions, no identity, no context-setting. Test: Would an operator in this role nod immediately?
2. **Observed Shift (Grounded, Not Trend-Based)** — Introduce what is changing as something you've seen, not something "happening broadly." Avoid abstract trends. Prefer: "I've been seeing X show up in Y process."
3. **System-Specific Target** — Move to a named workflow where decisions are made. Use the recipient's language. Test: Could this sentence apply to a different industry? If yes, it fails.
4. **Decision Boundary Identification** — Define where input becomes action. This is the control point. Keep it implicit; do not explain the concept.
5. **Consequence-Based Question** — Ask for a real event or failure pattern, not an opinion. Frame: "Have you seen X where it looked right but caused Y downstream?" The question should trigger memory of a specific incident.

### 13.2 Construction Constraints

- Do not explain what you do in the first contact.
- Do not introduce AI as the topic; introduce it as a factor within a real system.
- Do not include softeners or disclaimers (e.g., "no pitch," "just checking").
- Do not over-balance sentences; allow compression and slight roughness.
- Each line must have a single job; remove any line without a job.

### 13.3 Validation Checks

- **Non-Transferability Test:** Would this feel wrong if sent to a different company? If not, fail.
- **Anchor Test:** Is there at least one concrete referent tied to the recipient's operations?
- **Stake Test:** Does the message imply a real consequence if ignored?
- **Sequence Test:** Does it follow Anchor → Shift → System → Boundary → Question?
- **Surface Test:** Does it read like a thought typed and sent, not a composed artifact?

### 13.4 Minimal Template

[Shared Reality Anchor]

[Observed Shift tied to that reality, grounded]

[System-specific question targeting decision flow]

[Clarifier naming upstream inputs and boundary]

[Consequence-based question]

### 13.5 Deterministic Rule (Extended)

A message passes only if it is both:

1. Non-transferable (recipient-bound), and
2. Constructed via the defined sequence.

Failure on either condition → re-render required.

## 14. Bolt-on Extensions

Task-specific bolt-ons MAY extend the application scope of this gate. Extensions:

- MUST NOT fork the base gate;
- MUST NOT weaken any check enumerated in §5, §6, §7, §8;
- MUST NOT weaken §9 rewrite priorities;
- MUST NOT weaken §12 or §13.5 deterministic rules;
- MUST declare dependency on this Core artifact as their base ownership;
- MAY add domain-specific naturalness standards (e.g., a creative-writing bolt-on may define a fiction naturalness standard in its own extension files).

## 15. Compatibility Statement

- Package identity: `anti-ai-signature-gate-v16.3.3`
- Required Core generation: 16.3.3
- Legacy compatibility: none with anti_ai_signature_gate_skill.md (v15)

---

*Document ID: anti-ai-signature-gate-v16.3.3 — RATIFIED / CANONICAL — ratified 2026-08-16 — Generated 2026-08-15*
