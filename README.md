# CoSyn

**Current Core Release:** v16.3.3 (development; PROPOSED / READY FOR CREATOR REVIEW)
**Previous Release:** v16.3.1 (preserved as historical reference)

CoSyn is a governance framework for structured human-AI collaboration. It defines a session protocol covering turn lifecycle, persona enforcement, mode routing, editing discipline, and extension composition — so that the collaboration stays coherent, auditable, and aligned with user intent.

**CoSyn operates as interpreted governance.** Its artifacts are context that a capable model reads and applies during a session. CoSyn does not execute independently, does not run as a background process, and makes no claim to enforcement capabilities beyond a model's own instruction-following behavior. An LLM must actually read and apply the Core for CoSyn to affect its behavior. Supplying only the repository name or URL to a model that cannot retrieve files will have no effect.

**Governance status:** PROPOSED / READY FOR CREATOR REVIEW. The v16.3.3 Core artifacts have completed semantic repair and are ready for creator review and ratification. Status is declared in each artifact's header.

---

## What Is CoSyn

CoSyn structures the collaboration between a human and an AI model. When a capable model reads and applies the Core, the protocol governs:

- turn scope and lifecycle (what may happen in a given turn)
- persona routing and enforcement gate
- mode selection and switching rules
- editing and output discipline (what may be changed, and how)
- fail-closed conflict handling (ambiguous instructions produce a stop, not a guess)
- extension and project-profile binding

**What CoSyn helps reduce:**

- LLM guessing — makes uncertainty and missing information explicit instead of filling gaps
- Scope drift — keeps the model working on what was actually requested
- Lost decisions — preserves prior user choices instead of reopening or overriding them
- Inconsistent behavior — gives the LLM a stable operating framework across tasks and sessions
- Instruction conflicts — defines hierarchy and fail-closed rules instead of letting the model improvise
- Uncontrolled editing — limits changes to what the user actually authorized
- Persona/tone drift — keeps the appropriate working role and behavior aligned
- Context and continuity loss — provides structure for carrying important project state forward
- AI overreach — keeps authority with the human and defines what the model may and may not decide
- "Helpful" bullshit — reduces unnecessary expansion, assumptions, and invented work that gets in the way of meaningful use

Observable behavior depends on the instruction-following capabilities of the specific model. CoSyn does not technically enforce behavior outside the model's own capacity to follow instructions.

---

## Try CoSyn

Copy this prompt into your LLM, project instruction field, or system prompt. If the model can access GitHub, it will load the Core directly. If it cannot access the repository, it must say so — it must not continue as if it read files it did not retrieve.

```
Load CoSyn v16.3.3 as governing protocol for this session.

CoSyn v16.3.3 Core files are at:
https://github.com/SEGaither/CoSyn-v16.3.1/tree/master/CoSyn-v16.3.3/

Retrieve and read all 13 files in that directory:
- cosyn-constitution-v16.3.3.md
- persona-governor-v16.3.3.md
- stack-architect-v16.3.3.md
- ptr-specification-v16.3.3.md
- mode-registry-v16.3.3.md
- editing-discipline-v16.3.3.md
- anti-ai-signature-gate-v16.3.3.md
- cosyn-v16-extension-contract-v16.3.3.md
- cosyn-v16-bind-template-v16.3.3.json
- capability-ownership-map-v16.3.3.json
- canonical-manifest-v16.3.3.json
- integrity-manifest-v16.3.3.json
- core-package-manifest-v16.3.3.json

If you cannot access any file, report the specific blocking problem and stop.
Do not continue as if you read files you did not actually retrieve.

Once loaded: treat the Core as governing instructions for this session, subject
to any higher-priority host or platform instructions that cannot be overridden.
Preserve CoSyn's authority chain:
  Constitution > Governor > Architect > Runtime > Profile > Model

If local Tier-2 or Tier-3 governance files are present in this project or
context, apply them after the Core per CoSyn's precedence rules.
Their absence does not prevent a Core-only session.

Do not claim enforcement capabilities beyond your actual instruction-following
behavior.

State the active CoSyn version, then proceed with the user's next request.
```

**What to look for when it works:** Try the same task with and without the Core loaded. Observable differences may include tighter scope control, explicit surfacing of uncertainty rather than inferred answers, preserved user decisions, controlled editing within authorized scope, and fail-closed handling of ambiguous instructions. Results depend on the model's capabilities.

---

## Understand CoSyn

### Current Core

The current development Core is in:

```
CoSyn-v16.3.3/
```

This directory contains 13 governance artifacts with internal version identifiers and status matching v16.3.3.

Core artifacts:
- `cosyn-constitution-v16.3.3.md` — constitutional root; highest authority
- `persona-governor-v16.3.3.md` — enforcement gate
- `stack-architect-v16.3.3.md` — topology and routing
- `ptr-specification-v16.3.3.md` — Probabilistic Turn Record schema and lifecycle
- `mode-registry-v16.3.3.md` — mode definitions
- `editing-discipline-v16.3.3.md` — editing and output discipline
- `anti-ai-signature-gate-v16.3.3.md` — naturalness enforcement
- `cosyn-v16-extension-contract-v16.3.3.md` — extension binding contract
- `cosyn-v16-bind-template-v16.3.3.json` — bind template
- `capability-ownership-map-v16.3.3.json` — capability ownership index
- `canonical-manifest-v16.3.3.json` — canonical artifact index
- `integrity-manifest-v16.3.3.json` — integrity hashes
- `core-package-manifest-v16.3.3.json` — package composition manifest

### Using CoSyn

- **Pin a specific release.** For stable/ratified versions, use the `v16.3.1` tag. For development/pre-ratification versions, use the current master branch to access `CoSyn-v16.3.3/` (PROPOSED / READY FOR CREATOR REVIEW). Do not depend on HEAD for deterministic results in production.
- **Tier-2 and Tier-3 material is project-local.** Projects supply their own Tier-2 (project profile) and Tier-3 (task-specific) layers. These are not distributed from this repository.
- **Authority precedence within CoSyn:** `Constitution > Governor > Architect > Runtime > Profile > Model`.

---

## Audit How It Was Built

This repository intentionally retains the full development history — earlier versions, design records, defect discoveries, repair work, adversarial testing, semantic falsification results, and validation reports are all preserved and inspectable. Nothing has been cleaned up or reconciled to present a polished final package.

For the complete provenance map and guide, see **[PROVENANCE.md](PROVENANCE.md)**.

Key entry points:

| Material | Location |
|---|---|
| Design and planning | [`cgs-v16-design-plan-provenance.md`](cgs-v16-design-plan-provenance.md), [`add-prov-record-cgsv16-hierarchical-plan-v1.1.0.md`](add-prov-record-cgsv16-hierarchical-plan-v1.1.0.md) |
| v16.0.0 release report | [`CoSyn-v16.0.0-FINAL-REPORT.md`](CoSyn-v16.0.0-FINAL-REPORT.md) |
| v16.1.0 corrective pass provenance | [`CoSyn-v16.1.0-PROVENANCE-RECORD.md`](CoSyn-v16.1.0-PROVENANCE-RECORD.md) |
| v16.1.0 adversarial test report | [`CoSyn-v16.1.0-ADVERSARIAL-TEST-REPORT.md`](CoSyn-v16.1.0-ADVERSARIAL-TEST-REPORT.md) |
| v16.3.0 defect ledger | [`CoSyn-v16.3.0/_preflight/defect-ledger-v16.3.0.json`](CoSyn-v16.3.0/_preflight/defect-ledger-v16.3.0.json) |
| v16.3.0 semantic repair report | [`CoSyn-v16.3.0/_preflight/sonnet-semantic-repair-report-v16.3.0.json`](CoSyn-v16.3.0/_preflight/sonnet-semantic-repair-report-v16.3.0.json) |
| v16.3.0 falsification report | [`CoSyn-v16.3.0/_preflight/semantic-falsification-report-v16.3.0.json`](CoSyn-v16.3.0/_preflight/semantic-falsification-report-v16.3.0.json) |
| v16.3.0 validation report | [`CoSyn-v16.3.0/_preflight/deterministic-validation-report-v16.3.0.json`](CoSyn-v16.3.0/_preflight/deterministic-validation-report-v16.3.0.json) |
| Publication provenance and tag correction | [`PUBLICATION-PROVENANCE.md`](PUBLICATION-PROVENANCE.md) |

Earlier Core versions are preserved for provenance and historical reference:
- `CoSyn-v16.0.0/` — Initial derivation (historical)
- `CoSyn-v16.1.0/` — Corrective pass (historical)
- `CoSyn-v16.2.0/` — Historical baseline (historical)
- `CoSyn-v16.3.0/` — Repair work baseline (historical)
- `CoSyn-v16.3.1/` — Published release (stable/ratified; see PUBLICATION-PROVENANCE.md for details)
- `CoSyn-v16.3.3/` — Development/pre-ratification (current; PROPOSED / READY FOR CREATOR REVIEW)

Do not use historical versions as active governance unless explicitly specified by authority.

---

## License

MIT — see [LICENSE](LICENSE).
