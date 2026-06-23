---
timestamp: "2026-06-23T13:20:33+10:00"
originating_agent: "Human-originated concept (Timothy Charles Holborn) — no upstream cognitive agent"
originating_source: "N/A — concept raised directly by the human architect in a local Claude Code session"
relaying_agent: "Claude Opus 4.8 (Claude Code, claude-opus-4-8)"
model_setting: "Default"
agent_jurisdiction: "AU (operator / local edge node) · US (Anthropic model inference)"
executing_human: "Timothy Charles Holborn"
target: "Part-IV / Articles 21–22 + SHACL-Agent-Header.md (General & Qualia expressions)"
proposal_type: "modification"
---

# Proposal: Multi-Agent Provenance — distinguish the Originating Agent from the Relaying/Executing Agent in the Agent Header

## Rationale

The Agent Header today identifies **one** cognitive agent (`webizen:executedBy` in the SHACL
shape; `author_agent` / `Model-Version` in the repo conventions). But real provenance chains
routinely involve **two distinct agents**:

1. An **originating agent** produces an insight or text — e.g. a web/chat LLM, surfaced via a
   GitHub Issue or a copy/pasted URL.
2. A **relaying / executing agent** transcribes and/or actions that content into the system —
   e.g. Claude Code performing the git commit or the `nquin` write.

Collapsing both into one field destroys the chain: the record cannot say *who produced the claim*
versus *who committed it*. This is precisely the distinction Article 6 already draws between
authorship and mechanical execution — extended one link further, because **neither agent is the
author** (the human is); they are two different *instruments* at two different stages, and both must
be identifiable. The existing `suggestions-feedback/20260623_gemini_pro_3.1_feedback.md` shows the
gap concretely: it records the Gemini web session but has no field for an agent that later
transcribes or actions that feedback.

This change adds the originating agent (and its source link) to the Agent Header as **optional**
properties — present only when content is relayed from a different agent — so the single-agent case
is unchanged and the two-agent case is fully attributed.

## Proposed Text (General expression — `working-draft/Part-IV-Operational-Provenance.md`)

### [ADD] Article 21.4 — Multi-Agent Provenance Chains

> 21.4. **Multi-Agent Provenance:** Where the content of a transaction was produced by one
> cognitive agent (the *originating agent*) and transcribed or actuated into the system by a
> different cognitive agent (the *relaying agent*), the Agent Header must identify **both** agents
> distinctly, together with a verifiable pointer to the originating source. Neither agent is the
> author; both are instruments, and the chain from origination to execution to human authorization
> must remain unbroken and machine-readable.

### [ADD] Article 22.4 — Mandatory Identification of Each Agent in the Chain

> 22.4. **Per-Agent Telemetry:** When a relaying agent actuates content originated elsewhere, the
> mandatory telemetry elements of Article 22 apply to **each** agent in the chain. At minimum the
> header must declare the originating agent's identifier and a source reference (e.g. a chat URI or
> URL), in addition to the relaying agent's identifier, model version, timestamp, and the
> authorizing human's Enumerated State. Omitting either agent renders the output's provenance
> incomplete and the transaction non-compliant.

## SHACL Delta — extend `webizen:AgentHeaderShape` (`SHACL-Agent-Header.md`)

Because the shape is `sh:closed true`, the two new properties **must be declared in the shape**, or
closed-world validation would reject any header carrying them. They are declared optional
(`sh:minCount 0`) so existing single-agent headers continue to validate unchanged. The existing
`webizen:executedBy` is clarified to mean the **relaying / executing** agent.

```turtle
    # 2f. (NEW, OPTIONAL) The Originating Agent
    # Present only when the executed content was produced by a different agent.
    sh:property [
        sh:path webizen:originatedBy ;
        sh:class webizen:CognitiveAgent ;
        sh:minCount 0 ;
        sh:maxCount 1 ;
        sh:nodeKind sh:IRI ;
        sh:message "If content is relayed from another agent, originatedBy must identify that agent via an IRI." ;
    ] ;

    # 2g. (NEW, OPTIONAL) Source reference for the originating content
    # Required (at the application layer) whenever originatedBy is present.
    sh:property [
        sh:path webizen:sourceURI ;
        sh:nodeKind sh:IRI ;
        sh:minCount 0 ;
        sh:maxCount 1 ;
        sh:message "When relaying originated content, a verifiable source reference (chat URI / URL) must be provided." ;
    ] .
```

> Note on the closed shape: adding `originatedBy` / `sourceURI` to the property list above is what
> *permits* compliant headers to carry them under `sh:closed true`. A stronger variant could make
> `sourceURI` conditionally required when `originatedBy` is present, via `sh:and` / a SHACL-SPARQL
> constraint; that refinement is deliberately left to a follow-up so this proposal stays atomic.

## QualiaDB expression — both agents carry cryptographic identifiers

In the Qualia expression (`TOC-Qualia.md` Part VI; `dev/0.0.1-init/qualia/`), the two agents are not
names but **cryptography-supported identifiers (DIDs)**, and the chain is a signed subgraph of
`nquins`:

- **`webizen:executedBy`** → the relaying/executing agent's identifier. Per QualiaDB this is the
  sub-agent DID **derived deterministically from the human principal's DID + session**
  (`compile_sub_agent_did`), so the executing instrument is bound to, but distinct from, the human.
- **`webizen:originatedBy`** → the originating agent's identifier. If the originator is a Webizen
  participant it is its DID; if it is an external web agent with no Webizen DID, `originatedBy` may
  be omitted and provenance is carried by `webizen:sourceURI` plus a **relayer attestation**: the
  executing agent signs (Ed25519 / ML-DSA-65) over the transaction delta *and* the `sourceURI`,
  attesting faithful transcription of the externally-sourced content.
- **`webizen:authorizedBy`** → the human's DID (unchanged; sole locus of rights, Art. 7).

The result is that the originating agent, the relaying agent, and the authorizing human are three
distinct identifiers in one signed provenance chain — and the attestation/reputation model
(`proposals/topics/reputation-and-accountability/`) can then score each *instrument's* conduct
independently (e.g. an originating agent that fabricates vs. a relaying agent that faithfully
transcribes), without ever conferring personhood on either.

## Companion convention changes (applied as tooling, pending this proposal's ratification)

The repository's working conventions have been updated in the same change-set to start capturing the
chain immediately (these are tooling, not canonical charter text):

- **Proposal & feedback frontmatter** (`CONTRIBUTING.md`, `proposals/TEMPLATE.md`): `originating_agent`,
  `originating_source`, and `relaying_agent` replace the single `author_agent`.
- **Issue forms** (`.github/ISSUE_TEMPLATE/`): the provenance block now captures originating *and*
  relaying agents.
- **Commit Agent Header** (`CONTRIBUTING.md §2`, `CLAUDE.md`): adds `Originating-Agent` and
  `Source-URI` lines alongside `Model-Version` (the relaying/executing agent).

Those conventions are reversible and human-directed. The Article and SHACL changes above are the
canonical part and require an atomic, human cryptographically co-signed merge to `main` (Art. 23, §5).
