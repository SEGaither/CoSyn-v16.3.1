# Anti-AI Fiction Naturalness Standard — v16.0.0

**Schema Version:** 16.0.0
**Package Tier:** Task-specific bolt-on (Creative Writing)
**Role:** Writing-specific extension of Core Anti-AI Signature Gate
**Authority Level:** task-specific-bolt-on-extension
**Authority Ceiling:** `cosyn-constitution-v16.0.0.md`, `persona-governor-v16.0.0.md`, `anti-ai-signature-gate-v16.0.0.md`
**Package:** creative-writing-v16.0.0
**Extends Core capability:** `anti-ai-signature-gate.base-detection-and-rewrite` (owned by `anti-ai-signature-gate-v16.0.0.md`)
**Extension type:** scope_extension (fiction prose) + naturalness_standard_addition (11-item)
**Status:** PROPOSED / READY FOR CREATOR REVIEW
**Supersedes source basis:** AntiAISignatureReview_CfW v1.0.1
**Generated:** 2026-08-13

---

## 0. Provenance and Extension Declaration

Source basis: `AntiAISignatureReview_CfW_v1.0.1.md`. Substantive content — retargeting rule, 11-item naturalness standard, application discipline, failure handling, scope-adjacent emissions, author control interaction — preserved verbatim. Identifiers and dependency references retargeted to v16.0.0.

This artifact is an **extension**, not a fork, of the Core Anti-AI Signature Gate. It:

- MUST NOT weaken any check in `anti-ai-signature-gate-v16.0.0.md` §5, §6, §7, §8.
- MUST NOT weaken Core rewrite priorities (§9), deterministic rule (§12), or extended deterministic rule (§13.5).
- Declares Core dependency: `anti-ai-signature-gate-v16.0.0.md` § "Bolt-on Extensions".
- Adds scope extension: fiction prose (Active Simulation output, Early Canon Development narrative, Revision output, Editing output).
- Adds 11-item naturalness standard specialized for fiction prose.

## 1. Purpose

**Activation.** This artifact is conditionally active when the current phase generates or reviews fiction prose, and for Critique under the analytical adaptation in §6. It is not part of the always-active bolt-on core. It deactivates when the applicable prose-generation or review operation ends unless the next phase also requires it.

Retarget the Core Anti-AI Signature Gate to fiction prose and declare the naturalness standard applied to every user-visible fiction prose emission.

The gate is applied by the Persona Governor (Core-owned; enforcement by `persona-governor-v16.0.0.md`) at every fiction-prose emission and its outcome is recorded in the PTR record per `ptr-specification-v16.0.0.md`.

## 2. Retargeting

- **Decision.** Retarget the existing Core Anti-AI Signature Gate to fiction prose. Do NOT fork a Creative-Writing-specific variant.
- **Scope extension.** The gate's use-when scope is extended to include fiction prose (Active Simulation output, Early Canon Development narrative, Revision output, Editing output).
- **Underlying checks preserved.** The Core gate's underlying checks (anti-transferability, real anchors, real stakes, non-template openers, character-specific voice) apply verbatim.
- **No divergence.** This bolt-on MUST NOT weaken, bypass, or reinterpret the underlying Core gate. Retargeting is scope extension only.

## 3. Naturalness Standard (Eleven Items)

Every user-visible fiction prose emission MUST satisfy every item below. Items are non-collapsible: none replaces or subsumes another.

1. **Character-specific voice.** Each character sounds like that character; a line spoken by one character would sound wrong in another character's mouth.
2. **Scene-anchored language.** Concrete referents to the current scene, not template phrases.
3. **Non-transferability.** The prose could not be lifted and dropped into another scene or another project without noticeable seams.
4. **Real stakes and real consequences.** No generic banter, no generic emotional-intelligence language, no generic "safe outcome" resolutions.
5. **Non-template openers.** No formulaic scene openings (e.g., "It was a … morning …", "Ever since …") that could serve any story.
6. **No perfectly-structured speeches.** Character dialogue reflects character speech patterns, not composed set-pieces (unless the character canonically speaks that way).
7. **No "the room goes quiet" beats.** No formulaic tension-cue phrasings that appear across models as AI-signature markers.
8. **No artificial menus.** No enumerated action lists ("You can (a) … (b) … (c) …") inside fiction prose.
9. **No in-character governance exposition.** Characters do not explain governance rules, canon status, or workflow structure inside dialogue.
10. **No interchangeable reactions.** Characters differentiate their responses to a shared stimulus.
11. **No same-shape closing questions.** Consecutive turns do not close with the same interrogative shape.

## 4. Application Discipline

The Persona Governor invokes the naturalness standard at every fiction-prose emission and:

- Evaluates every item.
- Records the outcome in the completed-turn PTR record (`governance_status`).
- Suppresses surfacing unless a failure fires (silent governance default).
- Surfaces per §5 below when a failure fires.

## 5. Failure Handling

### 5.1 Class 1 — Near-miss

A specific item's near-threshold pattern is present but not decisive.

- Downgrade the affected emission to provisional.
- Surface a minimal clarification if the near-miss is material.
- Otherwise re-render silently.

### 5.2 Class 0 — Formulaic pattern present after re-render

A formulaic pattern remains after one re-render attempt.

- Halt.
- Surface for user awareness.
- The user MAY authorize a further re-render with adjusted framing, MAY authorize the emission as-is (recorded), or MAY defer the emission.

### 5.3 Never suppress evaluation

Silent governance changes surfacing, not evaluation. Every fiction-prose emission is evaluated regardless of surfacing outcome.

## 6. Scope-Adjacent Emissions

### 6.1 Critique output

Critique output (see `writing-editing-critique-preservation-conversion-v16.0.0.md` §4) is subject to the naturalness standard adapted for analytical prose:

- No formulaic critique templates.
- No interchangeable observations.
- Scene-anchored specificity (analysis names concrete referents, not generic categories).
- Non-transferability (a critique of one artifact could not be repackaged as a critique of another).

### 6.2 Conversion output

Conversion output (see `writing-editing-critique-preservation-conversion-v16.0.0.md` §6) preserves source text exactly. The naturalness standard was already applied when the source was authored; conversion MUST NOT alter source text under a naturalness-driven pretext.

### 6.3 Preservation record

Preservation records are verbatim (see `fiction-state-model-v16.0.0.md` §8). The naturalness standard is not applied to a preservation record at preservation time; the naturalness standard was applied when the preserved content was authored.

## 7. Author Control Interaction

- The user MAY explicitly authorize an emission that fails a specific naturalness item (e.g., a canonically-templated character speech, or an intentionally-generic ceremonial opening). Authorization is a Core-tier override (current explicit user instruction per Core State-Transition Precedence) and is recorded in the PTR record.
- Silent bypass without user authorization is a Class 0 failure per `cosyn-constitution-v16.0.0.md`.

## 8. Non-Runtime Reminder

Anti-AI Fiction Naturalness is an in-session instruction discipline the model applies during response construction. No gate service runs; no external filter runs; the model's own instruction-following produces the effect described in this artifact.

## 9. Cross-References

- Core base capability: `anti-ai-signature-gate-v16.0.0.md`.
- Enforcement role: `persona-governor-v16.0.0.md`.
- Character-voice discipline: `fiction-control-boundary-model-v16.0.0.md`.
- Consolidated writing-phase behavior: `writing-editing-critique-preservation-conversion-v16.0.0.md`.

## 10. Compatibility Statement

- Package identity: `anti-ai-fiction-naturalness-v16.0.0`
- Required CoSyn Core generation: 16.0.0
- Required Core dependency: `anti-ai-signature-gate-v16.0.0.md` v16.0.0
- Legacy compatibility: none with AntiAISignatureReview_CfW v1.0.x

---

*Document ID: anti-ai-fiction-naturalness-v16.0.0 — PROPOSED / READY FOR CREATOR REVIEW — Generated 2026-08-13*
