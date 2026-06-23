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
