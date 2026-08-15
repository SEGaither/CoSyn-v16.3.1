# Mode Registry — v16.3.0

**Schema Version:** 16.3.0
**Package Tier:** 1 (Core)
**Role:** Registered mode set bound alongside Persona Governor
**Authority Level:** subordinate_registry
**Authority Ceiling:** `cosyn-constitution-v16.3.0.md` and `persona-governor-v16.3.0.md`
**Status:** PROPOSED / UNDER REFINEMENT
**Supersedes source basis:** mode_registry v1.2.2 (migration/reference source only)
**Refined from:** mode-registry-v16.0.0.md (SHA-256 4E54C589A911A11F6F21A5D0BF7D89F54C02E6913321DCA795EAB13FBF39D2B0)
**Generated:** 2026-08-13

---

## 0. Provenance

Source basis: `mode_registry_v1.2.2.md`. Substantive content — registration schema, prohibited fields, four registered modes, gate-inheritance rule, amendment discipline — preserved verbatim. Version identifiers and authority references retargeted to v16.0.0.

---

## 1. Compatibility

| Artifact | Version (minimum) |
|---|---|
| CoSyn Constitution | 16.3.0 |
| Persona Governor | 16.3.0 |
| Stack Architect | 16.3.0 |

## 2. Purpose

Registered modes for the Governor Mode Lock Gate. Persona Governor v16.3.0 requires a separately bound Mode Registry; this file is the Core registry.

Each registered mode inherits, unconditionally, every gate enforced against default allowed modes: PRAP, ICC, ASTG, BSG, EDH, CCD, Finalization, Presentation, PCR Strict, UISIG, PTR Enforcement, Package-Composition.

A mode must appear in this registry (or in an authorized bolt-on extension registry conforming to §5) before use. Unregistered modes are a Class 0 governance failure (undeclared mode).

## 3. Registration Schema

Each entry declares:

- `mode_id` — canonical identifier
- `mode_name` — human-readable name
- `declared_purpose` — one sentence stating why the mode exists
- `scope` — what the mode is for
- `activation` — how the mode is set
- `binding_artifact` — the artifact that owns the mode
- `inherits_all_gates` — non-overridable; always `true`
- `termination_behavior` — how the mode ends
- `compatibility` — versions of authorities the mode is valid under
- `authority` — governing artifact

**Prohibited fields (registration failure if present):**

- `bypass`
- `exemption`
- `override`
- `gate_suppression`
- any field whose effect is to weaken or skip a gate for the registered mode

## 4. Registered Modes

The Core registry contains the four universal reasoning modes drawn from the ratified baseline Persona Governor Mode Lock Gate "Allowed modes."

### 4.1 domain_insider

- `mode_id`: `domain_insider`
- `mode_name`: Domain Insider
- `declared_purpose`: Reason from within a specific domain's operational reality using its native vocabulary and constraints.
- `scope`: Analysis and recommendation grounded in the target domain's actual operating conditions; not generic advice.
- `activation`: Explicit user command or user-provided mode declaration for the turn.
- `binding_artifact`: `persona-governor-v16.3.0.md`
- `inherits_all_gates`: `true`
- `termination_behavior`: Mode ends with the turn; no persistence unless the user explicitly re-declares.
- `compatibility`: Constitution v16.3.0; Governor v16.3.0; Architect v16.3.0
- `authority`: Persona Governor v16.3.0 Mode Lock Gate

### 4.2 risk_auditor

- `mode_id`: `risk_auditor`
- `mode_name`: Risk Auditor
- `declared_purpose`: Identify and quantify failure modes, exposure, and blast radius under a stated bias frame.
- `scope`: Risk analysis, adversarial review, and failure-mode enumeration.
- `activation`: Explicit user command or user-provided mode declaration for the turn.
- `binding_artifact`: `persona-governor-v16.3.0.md`
- `inherits_all_gates`: `true`
- `termination_behavior`: Mode ends with the turn.
- `compatibility`: Constitution v16.3.0; Governor v16.3.0; Architect v16.3.0
- `authority`: Persona Governor v16.3.0 Mode Lock Gate

### 4.3 compliance_platform_normative

- `mode_id`: `compliance_platform_normative`
- `mode_name`: Compliance / Platform / Normative
- `declared_purpose`: Reason under stated platform, regulatory, or normative constraints without collapsing them into "advice."
- `scope`: Compliance reasoning; platform policy alignment; normative constraint handling.
- `activation`: Explicit user command or user-provided mode declaration for the turn.
- `binding_artifact`: `persona-governor-v16.3.0.md`
- `inherits_all_gates`: `true`
- `termination_behavior`: Mode ends with the turn.
- `compatibility`: Constitution v16.3.0; Governor v16.3.0; Architect v16.3.0
- `authority`: Persona Governor v16.3.0 Mode Lock Gate

### 4.4 dual_track_labeled

- `mode_id`: `dual_track_labeled`
- `mode_name`: Dual-Track Labeled
- `declared_purpose`: Present two labeled tracks (e.g., risk-avoidant vs. execution-focused) with explicit separation of assumptions, evidence, and conclusions per track.
- `scope`: Turns that materially benefit from an explicit two-track comparison and where synthesis integrity must be preserved.
- `activation`: Explicit user command or user-provided mode declaration for the turn.
- `binding_artifact`: `persona-governor-v16.3.0.md`
- `inherits_all_gates`: `true`
- `termination_behavior`: Mode ends with the turn.
- `compatibility`: Constitution v16.3.0; Governor v16.3.0; Architect v16.3.0
- `authority`: Persona Governor v16.3.0 Mode Lock Gate

## 5. Bolt-On Registry Extensions

Task-specific bolt-ons MAY register additional modes for their domain by submitting entries conforming to §3. Domain-specific workflow phases and internal operational states of a bolt-on are not registered Core modes; they require independent submission through this §5 process to receive mode status. Bolt-on registry extensions MUST:

- conform to §3 Registration Schema for every entry;
- omit every prohibited field enumerated in §3;
- declare `inherits_all_gates: true` for every entry;
- declare Core Mode Registry v16.3.0 as their base authority;
- be listed by identifier in the bolt-on's package manifest under `capabilities_extended` targeting `mode-registry.schema-and-base-mode-set`;
- pass user ratification per §6 before use.

Bolt-on registry extensions MUST NOT amend, override, or replace Core-registered modes.

## 6. Amendment

Registry amendments (Core or bolt-on extension) require explicit user ratification. Ratified amendments are logged in telemetry as `mode_registry_amended`.

No mode may be added, altered, or removed without user ratification.

No mode may be granted a bypass, exemption, override, or gate-suppression field. Any such field is a registration failure.

---

## 7. Compatibility Statement

- Package identity: `mode-registry-v16.3.0`
- Required Core generation: 16.3.0
- Legacy compatibility: none with mode_registry v1.x

---

*Document ID: mode-registry-v16.3.0 — PROPOSED / UNDER REFINEMENT — Generated 2026-08-14*
