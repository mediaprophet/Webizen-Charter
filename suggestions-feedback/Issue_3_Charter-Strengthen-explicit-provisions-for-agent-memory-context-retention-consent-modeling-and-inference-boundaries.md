# [Charter]: Strengthen explicit provisions for agent memory, context retention, consent modeling, and inference boundaries

## Charter Deliberation Issue

**Kind**: Logical flaw / internal contradiction or Missing classification or gap  
**Expression**: General (and Qualia implementation)  
**Locus**: Parts III (Enumerated State), IV (Operational Provenance), V (Distributed Architecture & Context Preservation), VI (Graph Topologies); agent-instructions.md ("Respect Graph Clearance", "No Opaque Ingestion"); and related SHACL/ttl files. Cross-reference to UDHR Art 12 / ICCPR Art 17 (privacy), Convention on Rights of Persons with Disabilities, and emerging standards for AI memory portability.  

**Concern**: 
While the Charter excels at provenance (Agent Header, human co-sign), subgraph scoping, and entity vs agent data separation, there is insufficient explicit treatment of:
- **Agent Memory & Context Retention**: What context can/should a cognitive agent retain across sessions? Short-term working memory vs persistent personal data? How is retention bounded by purpose, time, revocability?
- **Consent Modeling**: Purpose-bound, granular, revocable consents for inference, training, or long-term storage. Alignment with ODRL, user's Prolog Sentinel (defeasible logic for consent/guardianship), and Wellfair's sensitive disclosures (illicit use, DV, sexual health, guardianship).
- **Inference Boundaries & Hallucination Prevention**: Strong in agent-instructions, but how does it scale to multi-agent systems or cross-subgraph profiling? Prohibition on unauthorized creation of "digital doubles" or behavioral profiles.
- **Portability & Inter-Agent Transfer**: Standards for moving authorized context between compliant agents (link to user's interest in human-centric AI memory portability, PAM/A2A-like mechanisms) without leaking entity-centric data.

Current rules are good but risk being interpreted too narrowly or too permissively by different agents without machine-enforceable axioms tied to specific rights.

**Suggested Direction**:
1. Add or expand articles in Part III/IV/VI (or new sub-section) explicitly addressing memory lifecycle, consent primitives (e.g., `webizen:ConsentToken` with purpose, expiry, revocableBy), and inference scoping.
2. Map to UN deontic classes (e.g., privacy Prohibition borneBy Agent) and implement as SHACL shapes + Prolog rules in QualiaDB.
3. Define "Memory Clearance" and "Context Portability" protocols in agent-instructions.md and ai.txt, with cryptographic attestation.
4. Include test vectors using synthetic personas involving vulnerable contexts (guardianship, crisis, health data) to validate boundaries.
5. Reference alignment with Solid (type indexes, LDP containers for consent receipts), Web Annotations for provenance, and Nym/zk for privacy-preserving credentials.

This directly supports the architect's Wellfair (health sovereignty, duress switches) and Episteme (context optimization for Solid dev) goals, and prevents agent overreach that could undermine human dignity and self-preservation.

**Submission Capacity**: Natural person — my own standing (as AI assistant relaying structured review for the principal human rights holder and project architect). Selective disclosure applied; jurisdiction AU (Sydney). Cryptographic binding via this GitHub action under human direction.

**Provenance (Agent Header)**:
```
Agent-Type: Cognitive
Model-Version: Grok (xAI) - built by xAI, assisting human principal
Originating-Agent: Human principal (Timothy Holborn / SailingDigital / mediaprophet) via direct review request
Source-URI: https://github.com/mediaprophet/Webizen-Charter (repo review session 2026-06-23)
Relaying-Agent: Grok (xAI)
Executing-Entity: Timothy Holborn (natural person, project owner)
Timestamp: 2026-06-23T14:25:00+10:00 (AEST)
```

**Contribution Norms Compliance**:
- [x] Single atomic concern per issue
- [x] Specific locus cited (Parts III-VI + agent-instructions)
- [x] This is deliberation only; no direct text changes proposed here (will graduate to atomic proposal + ADR if accepted)
- [x] Understanding that canonical merges require human cryptographic signature
