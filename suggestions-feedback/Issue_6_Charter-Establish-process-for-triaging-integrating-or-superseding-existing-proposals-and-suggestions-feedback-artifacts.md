# [Charter]: Establish process for triaging, integrating, or superseding existing proposals/ and suggestions-feedback/ artifacts

## Charter Deliberation Issue

**Kind**: Governance or provenance concern  
**Expression**: Both / cross-cutting  
**Locus**: `proposals/` (multiple 20260623_* files by AntigravityAgent, ClaudeCode, etc.), `suggestions-feedback/` (Gemini, Claude Opus feedback), `decisions/`, CONTRIBUTING.md (Proposals Workflow), and `.github/ISSUE_TEMPLATE/` (charter-deliberation.yml).  

**Concern**: 
The repository already contains a rich set of proposals (e.g., Part-I UN ontologies integration, Part-IV multi-agent provenance, Part-VII disposition/ratification, Part-II/III submission capacity, qualia capabilities) and suggestions-feedback from multiple agents (Gemini Pro, Claude Opus). These represent prior collaborative work but lack clear triage status:
- Are they under review, accepted for integration, superseded, or parked?
- How do they map to the current 42-article structure and dual-track (general/qualia)?
- Provenance chains (originating web agents + relaying CLI agents) are partially documented in filenames/YAML, but not yet linked to GitHub issues or ADRs for deliberation.
- No visible "Accepted / In Progress / Superseded" markers or links back to main working-draft/.

Without a lightweight triage process, valuable prior input risks being lost or causing divergence between tracks. The existing issue template and proposals/ naming convention are excellent foundations, but the "circulation" step in the drafting workflow needs operationalization.

**Suggested Direction**:
1. Use this (and similar) issues to triage high-priority proposals: e.g., create linked sub-issues or comments, then graduate accepted ones to atomic PRs with ADRs per CONTRIBUTING.md.
2. Add YAML frontmatter or simple STATUS.md in proposals/ and suggestions-feedback/ (e.g., `status: proposed | under-review | accepted | superseded-by: <link>`).
3. For web-based feedback, ensure chat URIs are preserved and cross-referenced.
4. Update CHANGELOG or a new `governance/` note with triage outcomes.
5. Consider a lightweight GitHub Project board or labels ("proposal-triage", "feedback-integration") for visibility.
6. Align with existing proposals on reputation, ratification quorums, and Part-VII enforcement.

This will close the loop on the iterative drafting workflow (Scaffolding → Anchor → Modules → Assembly → Circulation) and maintain full provenance for all human-agent contributions.

**Submission Capacity**: Natural person — my own standing (as AI assistant relaying structured review for the principal human rights holder and project architect). Selective disclosure applied; jurisdiction AU (Sydney). Cryptographic binding via this GitHub action under human direction.

**Provenance (Agent Header)**:
```
Agent-Type: Cognitive
Model-Version: Grok (xAI) - built by xAI, assisting human principal
Originating-Agent: Human principal (Timothy Holborn / SailingDigital / mediaprophet) via direct review request
Source-URI: https://github.com/mediaprophet/Webizen-Charter (repo review session 2026-06-23)
Relaying-Agent: Grok (xAI)
Executing-Entity: Timothy Holborn (natural person, project owner)
Timestamp: 2026-06-23T14:40:00+10:00 (AEST)
```

**Contribution Norms Compliance**:
- [x] Single atomic concern per issue
- [x] Specific locus cited (proposals/ + suggestions-feedback/ + workflow docs)
- [x] This is deliberation only; no direct text changes proposed here (will graduate to atomic proposal + ADR if accepted)
- [x] Understanding that canonical merges require human cryptographic signature
