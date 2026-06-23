# [Charter]: Review licensing (CC BY-NC-ND) for broader sovereign tech adoption while preserving protections

## Charter Deliberation Issue

**Kind**: Governance or provenance concern  
**Expression**: Both / cross-cutting  
**Locus**: `LICENSE` file (root); implications for proposals/, working-draft/, implementation in QualiaDB/Episteme/Wellfair, and any future W3C CG or standards circulation.  

**Concern**: 
The repository uses Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0). This provides strong protection against commercial exploitation and unauthorized derivatives — aligning with the architect's emphasis on IP self-preservation amid years of unpaid standards work and current life challenges.

However, ND (NoDerivatives) may hinder necessary technical adaptations and implementations:
- Sovereign tech projects (QualiaDB, Solid LDP facades, Episteme prompt frameworks) often require localized forks, extensions, or "implementation profiles" to integrate Charter rules into specific codebases (e.g., custom SHACL shapes, Prolog rules, WASM modules).
- Broader adoption in the decentralized web / human-centric AI community (W3C Solid, NETmundial, IGF circles) benefits from permissive terms for compliant implementations, while the core philosophical text remains protected.
- NoDerivatives could create friction for the dual-track (general vs qualia) evolution or for generating derived artifacts like HTML renderings, test suites, or translated versions.

The protective intent is valid and important; the question is whether the current license optimally balances protection with the Charter's goal of becoming enforceable infrastructure across open ecosystems.

**Suggested Direction**:
1. Open a structured discussion (this issue or dedicated ADR) on licensing options:
   - Retain CC BY-NC-ND for the core philosophical Markdown/text.
   - Introduce a parallel "Implementation License" or exception for code/config that faithfully implements the Charter (e.g., Apache 2.0 or MIT for SHACL/ttl/n3 mappings, with strong attribution and "compliant with Webizen Charter vX" requirement).
   - Consider CC BY-SA-NC or similar for derivatives that remain non-commercial and human-centric.
2. Document clear boundaries: what constitutes a "derivative" vs. "implementation artifact" (e.g., a QualiaDB nquin import of Charter + UN n3 is implementation, not derivative of the prose).
3. Ensure any change preserves the architect's ability to protect core IP as self-preservation.
4. Align with existing proposals on reputation/accountability and ratification.

This deliberation respects the protective rationale while exploring paths to maximize impact for the sovereign, humanitarian tech the Charter is meant to govern.

**Submission Capacity**: Natural person — my own standing (as AI assistant relaying structured review for the principal human rights holder and project architect). Selective disclosure applied; jurisdiction AU (Sydney). Cryptographic binding via this GitHub action under human direction.

**Provenance (Agent Header)**:
```
Agent-Type: Cognitive
Model-Version: Grok (xAI) - built by xAI, assisting human principal
Originating-Agent: Human principal (Timothy Holborn / SailingDigital / mediaprophet) via direct review request
Source-URI: https://github.com/mediaprophet/Webizen-Charter (repo review session 2026-06-23)
Relaying-Agent: Grok (xAI)
Executing-Entity: Timothy Holborn (natural person, project owner)
Timestamp: 2026-06-23T14:35:00+10:00 (AEST)
```

**Contribution Norms Compliance**:
- [x] Single atomic concern per issue
- [x] Specific locus cited (LICENSE + governance implications)
- [x] This is deliberation only; no direct text changes proposed here (will graduate to atomic proposal + ADR if accepted)
- [x] Understanding that canonical merges require human cryptographic signature
