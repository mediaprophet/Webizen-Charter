# [Charter]: Article refinements – Privacy, Consent, Data Protection & Vulnerable Persons (Arts 4, 17, 18 + CRPD/UDHR mappings)

## Charter Deliberation Issue

**Kind**: Missing classification or gap + Logical enhancement  
**Expression**: Both (General + Qualia implementation)  
**Locus**: working-draft/Part-I (Art 4), Part-III (Arts 17–18), Part-IV (consent elements), and proposed new/expanded sub-provisions or mappings appendix. Cross-reference to un-instruments/ (esp. convention-rights-persons-disabilities.n3, udhr.n3, iccpr.n3, and health/privacy-related instruments).  

**Concern**: 
Current articles provide good high-level protection for human outputs (Art 4) and entity-centric data/ephemerality (Arts 17–18), but lack sufficient granularity and explicit linkage to the rich un-instruments/ corpus for:

- **Granular, purpose-bound, revocable consent** for processing cognitive outputs, health/biometric data, or sensitive personal information (Wellfair relevance: guardianship, DV, sexual health, pathology/psych reports).
- **Legal capacity, will & preferences, supported decision-making** in agent contexts (critical for guardianship/duress scenarios in synthetic testing and real deployment).
- **Heightened protections for vulnerable persons** (disability, children, older persons, crisis/homelessness, refugees) including accessibility of agent interfaces/outputs and protection from exploitation or profiling.
- **Privacy of health and rehabilitation information** on an equal basis.

Specific gaps vs. un-instruments/:
- CRPD Art 12 (legal capacity – respect will & preferences, safeguards against abuse) and Art 22 (privacy of personal/health/rehabilitation information) are not explicitly mapped.
- CRPD Art 9 (accessibility of ICT) and Art 21 (access to communication technologies) not referenced for agent design.
- UDHR Art 12 / ICCPR Art 17 (privacy) and related health data protections are only generic.
- CRC and other child/vulnerable group instruments not leveraged for age-appropriate or best-interests considerations in agent memory/consent.

**Suggested Direction**:
1. Expand Art 4.2/4.3 and Art 17.2 with explicit purpose limitation, data minimization, and revocable consent primitives (cryptographically recorded, mappable to ODRL/Prolog Sentinel in QualiaDB).
2. Add sub-provision or new article element: "Legal capacity and supported decision-making – Agents must respect the will and preferences of persons with disabilities or under guardianship arrangements, per CRPD Art 12; heightened scrutiny and human co-sign required for sensitive disclosures."
3. Strengthen Art 18 (ephemerality/right to be forgotten) with explicit safeguards against reconstruction and reference to health data privacy (CRPD 22).
4. Add accessibility/universal design obligation: "Agent interfaces, outputs (including 3D holographs), and consent mechanisms must be accessible and usable by persons with disabilities (CRPD Art 9, 21)."
5. Create or expand a short "Normative References" section/appendix that cites specific UN articles and links to the corresponding .n3 files in un-instruments/ (e.g., `convention-rights-persons-disabilities.n3#article-12`, `udhr.n3#article-12`).
6. Include test considerations for synthetic personas involving guardianship, disability, crisis, and health data sensitivity.

This directly strengthens coverage for Wellfair health sovereignty, Episteme consent modeling, and real-world vulnerable user scenarios while leveraging the comprehensive un-instruments/ corpus already present in the repo.

**Submission Capacity**: Natural person — my own standing (as AI assistant relaying structured review for the principal human rights holder and project architect). Selective disclosure applied; jurisdiction AU (Sydney). Cryptographic binding via this GitHub action under human direction.

**Provenance (Agent Header)**:
```
Agent-Type: Cognitive
Model-Version: Grok (xAI) - built by xAI, assisting human principal
Originating-Agent: Human principal (Timothy Holborn / SailingDigital / mediaprophet) via direct review request
Source-URI: https://github.com/mediaprophet/Webizen-Charter (article review + UN instruments analysis, 2026-06-23)
Relaying-Agent: Grok (xAI)
Executing-Entity: Timothy Holborn (natural person, project owner)
Timestamp: 2026-06-23T14:50:00+10:00 (AEST)
```

**Contribution Norms Compliance**:
- [x] Single atomic concern cluster per issue (privacy/consent/vulnerable + explicit UN mappings)
- [x] Specific locus cited (Arts 4, 17, 18 + un-instruments/)
- [x] This is deliberation only; no direct text changes proposed here (will graduate to atomic proposal + ADR if accepted)
- [x] Understanding that canonical merges require human cryptographic signature
