# [Charter]: Article refinements – Non-Discrimination, Bias Auditing, Right to Explanation & Remedy (Parts II, IV, VII)

## Charter Deliberation Issue

**Kind**: Missing classification or gap + enhancement for enforceability  
**Expression**: Both (General + Qualia)  
**Locus**: working-draft/Part-II (Art 9 Cognitive Agents), Part-IV (provenance/auditing elements), Part-VII (Arts 37–42 enforcement & auditing), and proposed additions to Agent Header/telemetry or new sub-provisions. Cross-reference to un-instruments/ (ICERD, ICESCR, CRPD Art 5, UDHR Art 2, ICCPR Art 14/26, etc.).  

**Concern**: 
The Charter has strong structural protections but limited explicit treatment of:

- **Non-discrimination and bias prevention** in Cognitive Agent outputs/decisions (Art 9 and related).
- **Right to explanation / meaningful information** about logic and consequences of agent-mediated decisions significantly affecting individuals.
- **Accessible and effective remedy** when Charter rules (or linked human rights) are breached by agents, including independent review paths and redress.

Current text implies these via human accountability and auditing but does not make them first-class architectural requirements with clear UN instrument grounding. This creates potential gaps in high-stakes uses (health, legal, social services, guardianship) and weakens machine-enforceable SHACL/Prolog rules in the qualia track.

Relevant un-instruments/ coverage not yet leveraged:
- CRPD Art 5 (equal protection against discrimination on basis of disability) + positive obligations.
- ICERD, ICESCR Art 2, UDHR Art 2 (non-discrimination on all grounds).
- ICCPR Art 14 (fair trial/due process elements) and Art 26 (equality before the law).
- UDHR Art 8 + various procedural instruments (Basic Principles on judiciary, victims of crime, etc.) for remedy.
- CRPD Art 13 (access to justice).

**Suggested Direction**:
1. Add to Art 9 (or new 9.4): "Cognitive Agents must be designed, tested, and operated to prevent discriminatory outcomes on any prohibited ground. Disparate impact testing, bias auditing, and mitigation measures are required for high-stakes or rights-affecting uses."
2. Strengthen Part IV (e.g., Art 22 or new telemetry element): Mandate inclusion of explainability metadata or decision logic summary in Agent Headers for significant automated decisions, enabling human review.
3. Enhance Part VII (Art 40 auditing + new or expanded Art): "Individuals have the right to accessible, timely, and effective remedy, including independent human review, when agent actions breach Charter rules or linked human rights. Systems must provide clear pathways for complaint, investigation, and redress (UDHR 8, CRPD 13)."
4. Link bias/ non-discrimination and remedy obligations to semantic mappings and subgraph rules in Part VI for QualiaDB enforcement.
5. Include in the proposed Normative References appendix explicit citations to the above UN instruments and .n3 files.

These additions close important accountability and fairness gaps while remaining fully aligned with the existing provenance, human co-sign, and enforcement architecture.

**Submission Capacity**: Natural person — my own standing (as AI assistant relaying structured review for the principal human rights holder and project architect). Selective disclosure applied; jurisdiction AU (Sydney). Cryptographic binding via this GitHub action under human direction.

**Provenance (Agent Header)**:
```
Agent-Type: Cognitive
Model-Version: Grok (xAI) - built by xAI, assisting human principal
Originating-Agent: Human principal (Timothy Holborn / SailingDigital / mediaprophet) via direct review request
Source-URI: https://github.com/mediaprophet/Webizen-Charter (article review + UN instruments analysis, 2026-06-23)
Relaying-Agent: Grok (xAI)
Executing-Entity: Timothy Holborn (natural person, project owner)
Timestamp: 2026-06-23T14:55:00+10:00 (AEST)
```

**Contribution Norms Compliance**:
- [x] Single atomic concern cluster per issue (non-discrimination, explanation, remedy)
- [x] Specific locus cited (Parts II, IV, VII)
- [x] This is deliberation only; no direct text changes proposed here (will graduate to atomic proposal + ADR if accepted)
- [x] Understanding that canonical merges require human cryptographic signature
