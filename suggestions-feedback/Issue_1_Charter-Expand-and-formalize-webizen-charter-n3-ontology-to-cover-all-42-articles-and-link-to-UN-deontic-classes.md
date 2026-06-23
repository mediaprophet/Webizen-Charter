# [Charter]: Expand and formalize webizen-charter.n3 ontology to cover all 42 articles and link to UN deontic classes

## Charter Deliberation Issue

**Kind**: Missing classification or gap  
**Expression**: Both / cross-cutting (ontology and implementation)  
**Locus**: `working-draft/webizen-charter.n3` (and related `dev/.../shacl/*.ttl`, `un-instruments/` encoding)  

**Concern**: 
The foundational `webizen-charter.n3` ontology is currently minimal (declares basic `webizen:CharterPart` / `CharterArticle` classes, a couple of Article instances, imports `https://ns.webcivics.org/un/`, and basic metadata). However, the Charter now comprises a Preamble + 42 articles across 7 Parts (per TOC-General.md and CHANGELOG 2026-06-23). 

Without full formalization:
- Machine-readable enforcement via QualiaDB (nquins, Prolog Sentinel, SHACL queries) is limited.
- Agents cannot programmatically query "Does proposed action violate Article X of the Charter or linked UN right Y?"
- Cross-references between Charter articles and specific UN instruments (e.g., UDHR Art 12 privacy → specific deontic Prohibition in values: namespace) are not yet axiomatized.

The deontic modeling in `un-instruments/` (values:Right, Prohibition, Obligation, Undertaking; heldBy NaturalPerson / borneBy Agent; heuristicDerived) is excellent but under-utilized by the Charter ontology itself.

**Suggested Direction**: 
1. Extend `webizen:CharterArticle` with properties linking to `values:` deontic classes and specific UN article resources (e.g., `webizen:implementsUNRight` or `webizen:enforcesProhibition`).
2. Instantiate all ~42 articles as `webizen:CharterArticle` resources with `dcterms:isPartOf` Part links, `rdfs:label`, and deontic mappings.
3. Add OWL axioms or SHACL shapes (in qualia/shacl/) for inference/validation (e.g., closed-world checks that agent telemetry complies with linked rights).
4. Align with QualiaDB's 5-vector Quin / Super-Quin and Prolog Sentinel for consent/guardianship logic.

This would make the Charter directly executable as a sovereign governance layer in QualiaDB, Episteme agents, and Wellfair vaults.

**Submission Capacity**: Natural person — my own standing (as AI assistant relaying structured review for the principal human rights holder and project architect). Selective disclosure applied; jurisdiction AU (Sydney). Cryptographic binding via this GitHub action under human direction.

**Provenance (Agent Header)**:
```
Agent-Type: Cognitive
Model-Version: Grok (xAI) - built by xAI, assisting human principal
Originating-Agent: Human principal (Timothy Holborn / SailingDigital / mediaprophet) via direct review request
Source-URI: https://github.com/mediaprophet/Webizen-Charter (repo review session 2026-06-23)
Relaying-Agent: Grok (xAI)
Executing-Entity: Timothy Holborn (natural person, project owner)
Timestamp: 2026-06-23T14:15:00+10:00 (AEST)
```

**Contribution Norms Compliance**:
- [x] Single atomic concern per issue
- [x] Specific locus cited (file + conceptual articles)
- [x] This is deliberation only; no direct text changes proposed here (will graduate to atomic proposal + ADR if accepted)
- [x] Understanding that canonical merges require human cryptographic signature
