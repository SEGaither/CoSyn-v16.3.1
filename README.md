# CoSyn

**Current Core Release:** v16.3.1

CoSyn is a governance framework for structured human-AI collaboration. It defines a protocol the human and AI model follow during a session — covering turn lifecycle, persona enforcement, mode routing, editing discipline, and extension composition — so that the collaboration stays coherent, auditable, and aligned with user intent.

## Quick Start — Testing CoSyn with an LLM

Simply knowing this repository exists is not enough. To use CoSyn, the Core files must be read into your LLM's context and applied as governing instructions. Here is how:

**Step 1 — Load the Core**

Point your LLM at this repository and instruct it to read the files in `CoSyn-v16.3.1/`. You can do this by pasting the files directly, using a tool that reads from URLs, or supplying them via a system prompt. Then give the model an instruction like:

> "Read the CoSyn v16.3.1 Core files in this repository and operate under them as the governing instructions for this session. Preserve their hierarchy and conflict rules. Then proceed with my request."

**Step 2 — Compare behavior**

Try the same task or question with and without the Core loaded. Observable effects may include:

- Tighter scope control — the model stays within what was actually requested
- Less guessing — uncertain or missing information is surfaced rather than filled in
- Stronger uncertainty handling — the model flags what it doesn't know rather than inferring
- Preservation of user decisions — the model does not override choices already made
- More controlled editing — edits stay within authorized scope
- Fail-closed conflict handling — ambiguous or conflicting instructions produce a stop rather than a guess

**Important:** Results depend on the instruction-following capabilities of the specific LLM. CoSyn does not technically enforce behavior outside the model's own ability to follow instructions. It is a structured protocol that a capable model applies — not an external enforcement layer.

## How CoSyn Works

CoSyn v16 operates as **interpreted governance** in conversational use. Its artifacts are context that a capable model applies during response construction. CoSyn does not execute independently, does not run as a background process, and does not claim transactional persistence, atomic storage, rollback guarantees, or external API integration. It is a protocol, not an executable runtime.

## Current Core

The current published Core is in:

```
CoSyn-v16.3.1/
```

This directory contains the 13 governance artifacts that constitute the CoSyn v16.3 Core. Internal artifact version identifiers carry the v16.3.0 label; the CoSyn-v16.3.1 directory represents the corrected packaging of those artifacts.

**Governance artifact status:** PROPOSED / UNDER REFINEMENT. These artifacts have not been formally ratified by the CoSyn creator. Status is declared in each artifact's header.

Core artifacts:
- `cosyn-constitution-v16.3.0.md` — constitutional root; highest authority
- `persona-governor-v16.3.0.md` — enforcement gate
- `stack-architect-v16.3.0.md` — topology and routing
- `ptr-specification-v16.3.0.md` — Probabilistic Turn Record schema and lifecycle
- `mode-registry-v16.3.0.md` — mode definitions
- `editing-discipline-v16.3.0.md` — editing and output discipline
- `anti-ai-signature-gate-v16.3.0.md` — naturalness enforcement
- `cosyn-v16-extension-contract-v16.3.0.md` — extension binding contract
- `cosyn-v16-bind-template-v16.3.0.json` — bind template
- `capability-ownership-map-v16.3.0.json` — capability ownership index
- `canonical-manifest-v16.3.0.json` — canonical artifact index
- `integrity-manifest-v16.3.0.json` — integrity hashes
- `core-package-manifest-v16.3.0.json` — package composition manifest

## Prior Versions and Development Provenance

Prior versions and development records are retained for traceability:

- `CoSyn-v16.1.0/` — v16.1.0 Core artifacts
- `CoSyn-v16.2.0/` — v16.2.0 Core artifacts
- `CoSyn-v16.3.0/` — v16.3.0 working directory with preflight records and baseline
- `CoSyn-v16.0.0.zip` — v16.0.0 archived release
- `CoSyn-v16.0.0-FINAL-REPORT.md`, `CoSyn-v16.1.0-FINAL-REPORT.md`, etc. — version reports
- `build/` — derived artifacts, validation records, and provenance maps

## Using CoSyn

Projects that use CoSyn Core should **pin a specific release tag or commit** rather than depending on HEAD.

Tier-2 (project-profile) and Tier-3 (task-specific bolt-on) material is project-local and is not distributed from this repository. Projects retrieve the shared Core from this repository and supply their own Tier-2/Tier-3 layers.

Authority precedence within CoSyn: `Constitution > Governor > Architect > Runtime > Profile > Model`.

## License

MIT — see [LICENSE](LICENSE).
