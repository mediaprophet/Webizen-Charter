---
timestamp: "2026-06-23T13:42:13+10:00"
originating_agent: "Human-originated concept (Timothy Charles Holborn) — no upstream cognitive agent"
originating_source: "N/A — concept raised directly by the human architect in a local Claude Code session"
relaying_agent: "Claude Opus 4.8 (Claude Code, claude-opus-4-8)"
model_setting: "Default"
agent_jurisdiction: "AU (operator / local edge node) · US (Anthropic model inference)"
executing_human: "Timothy Charles Holborn"
target: "Part-VII / Article 42 (General & Qualia); references Art. 7, Art. 23, Art. 37"
proposal_type: "addition"
---

# Proposal: Release Ratification by Quorum + Rough Consensus (subject to human rule)

## Rationale

Accepting an individual proposal (the `decisions/` layer) is not the same as making a **permanent
update to the release version**. The latter is a collective act and must clear a higher bar: a
**quorum** of ratifying stakeholders and **rough consensus** (RFC 7282 — objections addressed on
merit, not vote-counting). Stakeholders may include bots, but ratification is **subject to human
rule**: only humans count toward quorum and sign; agents are advisory. This proposal supplies the
canonical, enforceable form of the working procedure now in `CONTRIBUTING.md` (*Release Ratification*)
and `decisions/STAKEHOLDERS.md` / `RATIFICATION-TEMPLATE.md`. It is the collective counterpart to the
Agent Header: just as an unsigned transaction is dropped, an under-quorum or unresolved-objection
release ratification is void.

## Proposed Text (General expression)

### [ADD] Article 42.y — Collective Ratification of Releases

> 42.y. **Quorum and Rough Consensus:** A permanent update to a released version must be ratified by
> a quorum of ratifying stakeholders under rough consensus. **Ratifying stakeholders are humans**
> bearing cryptographic identifiers; they alone count toward quorum and sign the ratification. Other
> stakeholders, including cognitive and mechanical agents, are advisory: they may propose, endorse,
> and raise objections — which must be addressed on their merits — but hold no ratifying standing and
> are never counted toward quorum (Art. 7). Rough consensus is the human steward's determination that
> substantive objections have been addressed and no blocking objection remains open; it is not a
> majority vote. Absent quorum or with an unresolved blocking objection, no permanent update occurs.

## Ontology

```turtle
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix webizen: <https://w3id.org/webizen/ontology#> .

webizen:Stakeholder          a rdfs:Class .
webizen:RatifyingStakeholder rdfs:subClassOf webizen:Stakeholder .   # a webizen:Human
webizen:AdvisoryStakeholder  rdfs:subClassOf webizen:Stakeholder .   # an agent or unverified party

webizen:Ratification a rdfs:Class .
#   webizen:ratifiesVersion   -> the SemVer being cut (string)
#   webizen:includesProposal  -> each bundled proposal (must hold an Accepted disposition)
#   webizen:quorumRequired    -> integer (from the registry)
#   webizen:quorumPresent     -> integer (ratifying humans who participated)
#   webizen:consensusMethod   -> webizen:RoughConsensus
#   webizen:objection         -> webizen:Objection (0..n)
#   webizen:steward           -> webizen:Human
#   webizen:ratifiedBy        -> webizen:Human (>= quorumRequired; each with a signature)
#   webizen:cryptographicSignature -> per-ratifier signature

webizen:Objection a rdfs:Class .
#   webizen:severity -> webizen:Blocking | webizen:Substantive | webizen:Minor
#   webizen:status   -> webizen:Open | webizen:Addressed | webizen:Withdrawn
#   webizen:raisedBy -> any webizen:Stakeholder (agents included)
```

## SHACL Delta — release-gate enforcement

```turtle
webizen:RatificationShape a sh:NodeShape ;
    sh:targetClass webizen:Ratification ;
    sh:property [ sh:path webizen:ratifiesVersion ; sh:minCount 1 ; sh:maxCount 1 ; sh:datatype xsd:string ] ;
    sh:property [
        sh:path webizen:ratifiedBy ;
        sh:class webizen:Human ;      # only humans may appear as ratifiers
        sh:minCount 1 ;
        sh:message "Subject to human rule: only humans may ratify (Art. 7, 42)." ;
    ] ;

    # Quorum: humans present must meet the required threshold.
    sh:sparql [
        sh:message "Local 403: quorum not met (quorumPresent < quorumRequired)." ;
        sh:select """
            SELECT $this WHERE {
                $this webizen:quorumRequired ?req ; webizen:quorumPresent ?pres .
                FILTER (?pres < ?req)
            }
        """ ;
    ] ;

    # Rough consensus: no blocking objection may remain open.
    sh:sparql [
        sh:message "Local 403: rough consensus not established — a blocking objection is still open." ;
        sh:select """
            SELECT $this WHERE {
                $this webizen:objection ?o .
                ?o webizen:severity webizen:Blocking ; webizen:status webizen:Open .
            }
        """ ;
    ] .

# Belt-and-braces: an agent in ratifiedBy voids the ratification (humans rule).
webizen:RatifierHumanOnlyShape a sh:NodeShape ;
    sh:targetClass webizen:Ratification ;
    sh:sparql [
        sh:message "Local 403: a cognitive/mechanical agent may not ratify a release." ;
        sh:select """
            SELECT $this WHERE {
                $this webizen:ratifiedBy ?r .
                ?r a webizen:CognitiveAgent .
            }
        """ ;
    ] .
```

> The structural half of rough consensus is enforceable (quorum arithmetic; no open blocking
> objection; human-only ratifiers). The *judgement* — whether a given objection has truly been
> addressed on merit — remains a human steward act (RFC 7282); SHACL guards that the record cannot
> claim consensus while a blocking objection is still flagged open.

## QualiaDB expression (Part VI/VII)

- A `webizen:Ratification` is a signed `NQuin` subgraph. An under-quorum ratification, one with an
  open blocking objection, or one naming an agent in `ratifiedBy`, is rejected at the **Local 403**
  path (Art. 37) — the same firewall, now gating version promotion.
- Quorum is counted over human principal DIDs; advisory agents' objections are first-class nquins
  (`raisedBy` a sub-agent DID) that must be `Addressed`/`Withdrawn` before consensus — so a bot's
  valid objection genuinely blocks a bad release, while never granting the bot a ratifying vote.
- Endorsements (the advisory disposition) accrue as attestation nquins; a future amendment may make
  `quorumRequired` a function of endorsement density (the reputation model), kept out of scope here.

## Honest open items (Art. 41)

- **Bootstrap = single ratifier.** At `0.0.1-init`, `quorum_required: 1` (the architect); the
  mechanism is defined to scale as human stakeholders register. The thresholds in
  `decisions/STAKEHOLDERS.md` are **architect-set parameters**, not fixed by this proposal.
- **Steward judgement is human and not fully formalizable.** SHACL enforces the structural
  guards, not the merit determination — by design.
- **Endorsement-weighted quorum and trusted-peer metrics** are deferred to the
  reputation/accountability topic.
- Working procedure is live (`CONTRIBUTING.md` + `decisions/`); this proposal is the canonical layer
  and requires a human-signed merge to `main`.
