# Changelog

All notable changes to the Webizen Charter will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.0.1-init] - 2026-06-23

### Added
- **Initial Charter Draft:** Completed the drafting of the Preamble and all 42 articles across 7 Parts.
- **Agent Enforcement Layer:** Added `ai.txt` to govern external crawlers and `agent-instructions.md` to provide strict system prompts for cognitive agents.
- **SHACL Constraints:** Generated initial SHACL `.ttl` files for all 7 Parts to mathematically enforce the Charter's boundaries at the database layer.
- **UN Instrument Integration:** Bound the definitions of human rights directly to the `https://ns.webcivics.org/un/` namespace, integrating over 100 machine-readable UN human rights instruments.
- **Proposals Framework:** Created a `proposals/` directory with a strict YAML metadata template for machine-readable tracking of suggested amendments.
- **Release Structure:** Established `working-draft/` for ongoing edits and `release/` directories (`0.0.1-init` and `latest`) for immutable version snapshots.

### Changed (Baseline Hardening Sprint)
- **Dual-Track Divergence:** Split the `dev/` environment into `general/` and `qualia/` tracks to isolate the Universal Standard from the Reference Implementation. Added the Dual-Track Parity Rule to `CONTRIBUTING.md`.
- **Closed-World Firewall:** Swept all 14 `.ttl` files across both tracks to enforce `sh:closed true` and `sh:ignoredProperties ( rdf:type )`, blocking unmapped vendor telemetry.
- **Perimeter Severity:** Upgraded all structural constraints in `Part-VII-Perimeter-Enforcement.ttl` to `sh:severity sh:Violation`, forcing immediate graph aborts for malformed payloads.
- **Cognitive Routing:** Rewrote `ai.txt` to strictly route generic web crawlers to the `general/` track and edge MCP modules to the `qualia/` track.

### Added (Baseline Hardening Sprint)
- **Agent Reputation Framework:** Established the `proposals/topics/reputation-and-accountability/` sandbox, drafting the initial blueprint for a decentralized, nquin-based attestation ecosystem.
- **Sybil Defense:** Hardened `Part-III-Enumerated-State.ttl` to require a Verifiable Credential (`hasPeerQuorumCredential`) for a `webizen:NaturalPerson` to claim Selective Disclosure privacy.
- **Ratification Quorums:** Added `webizen:RatificationShape` to enforce human-only voting power in release quorums, mathematically restricting `EntityAgent` and `CognitiveAgent` signatures.
- **Provenance Cryptography:** Split origination in `Part-IV` into `AttestedOrigination` (hearsay) and `ProvenOrigination` (cryptographically signed), preventing relayers from forging origin chains.
- **Architectural Decision Records (ADR):** Integrated the `decisions/` directory and updated `CONTRIBUTING.md` to mandate ADR drafts for all major proposals.
- **UN Instrument Ingestion Pipeline:** Created `scripts/Generate-Manifest.ps1` to calculate SHA-256 hashes of all 101 instruments, mathematically binding them to the `qualiaDB` graph via `un-instruments/MANIFEST.n3`. Established `un-instruments/CHANGELOG-INSTRUMENTS.md` and added Rule 9 to `CONTRIBUTING.md` to mandate version-pinned tracking of the legal substrate.
- **Manifest Hardening & Text Review:** Stabilized UN manifest generation order, added generation-method metadata, normalized the Grok UN analysis archive provenance, and staged a clause-level charter text review in `proposals/topics/repository-architecture-review/`.
