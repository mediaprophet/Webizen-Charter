---
timestamp: "2026-06-23T13:35:36+10:00"
originating_agent: "Human-originated concept (Timothy Charles Holborn) — no upstream cognitive agent"
originating_source: "N/A — concept raised directly by the human architect in a local Claude Code session"
relaying_agent: "Claude Opus 4.8 (Claude Code, claude-opus-4-8)"
model_setting: "Default"
agent_jurisdiction: "AU (operator / local edge node) · US (Anthropic model inference)"
executing_human: "Timothy Charles Holborn"
target: "Part-VII / Articles 39 & 42 (General & Qualia); references Art. 23"
proposal_type: "addition"
---

# Proposal: Disposition & Adjudication Ontology — make acceptance / endorsement / denial enforceable

## Rationale

The repository now has the *working procedure* for dispositions (the `decisions/` directory and the
**Dispositions & Adjudication** section of `CONTRIBUTING.md`): a controlled vocabulary — `accepted`,
`partially-accepted`, `denied`, `deferred`, `superseded`, `withdrawn` (binding) and `endorsement`,
`recommendation`, `comment`, `abstain` (advisory). What is missing is the **canonical, machine-
enforceable form**: an ontology that types these dispositions and a SHACL constraint that makes the
load-bearing rule structural rather than honour-based — *a binding disposition is void unless a human
decided it and signed it* (Art. 23). This is the adjudication counterpart to the Agent Header: just
as a transaction without provenance is dropped, a binding decision without a human signature is not a
decision.

This belongs to Part VII: Article 42 (ratification / versioning / amendment) for the vocabulary, and
Article 39 (cryptographic attribution / dispute resolution) for contested dispositions.

## Proposed Text (General expression)

### [ADD] Article 42.x — The Disposition Vocabulary

> 42.x. **Recorded Dispositions:** A response to any submission (proposal, issue, or feedback) must,
> when it changes the submission's canonical status, be recorded as a typed **disposition**. Binding
> dispositions — acceptance, partial acceptance, denial, deferral, supersession, withdrawal — alter
> canonical state and therefore require a human cryptographic signature (Art. 23). Advisory
> dispositions — endorsement, recommendation, comment, abstention — record input and signed peer
> attestation without altering canonical state. An automated agent may draft or record a disposition
> but may not *issue* a binding one; an unsigned binding disposition is void.

### [ADD] Article 39.x — Adjudication of Contested Dispositions

> 39.x. **Adjudication:** Where a disposition is disputed, resolution proceeds against the signed
> record — the disposition's `decidedBy` human, its signature, and the tamper-evident history of the
> submission — not against unsigned assertion. A `denied` or `superseded` disposition never deletes
> the submission it closes (it is preserved and marked), so the full adjudication trail remains
> auditable.

## Disposition Ontology

```turtle
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix webizen: <https://w3id.org/webizen/ontology#> .

webizen:Disposition         a rdfs:Class .
webizen:BindingDisposition  rdfs:subClassOf webizen:Disposition .
webizen:AdvisoryDisposition rdfs:subClassOf webizen:Disposition .

webizen:Accepted          a webizen:BindingDisposition .
webizen:PartiallyAccepted a webizen:BindingDisposition .
webizen:Denied            a webizen:BindingDisposition .
webizen:Deferred          a webizen:BindingDisposition .
webizen:Superseded        a webizen:BindingDisposition .
webizen:Withdrawn         a webizen:BindingDisposition .

webizen:Endorsement       a webizen:AdvisoryDisposition .
webizen:Recommendation    a webizen:AdvisoryDisposition .
webizen:Comment           a webizen:AdvisoryDisposition .
webizen:Abstain           a webizen:AdvisoryDisposition .

webizen:DispositionRecord a rdfs:Class .
#   webizen:hasDisposition        -> exactly one webizen:Disposition
#   webizen:dispositionOf         -> the target submission (IRI)
#   webizen:decidedBy             -> webizen:Human   (REQUIRED for binding)
#   webizen:assertedBy            -> the agent or human that recorded it
#   webizen:cryptographicSignature-> signature over the record (REQUIRED for binding)
```

## SHACL Delta — `decisions/` enforcement

```turtle
webizen:DispositionRecordShape a sh:NodeShape ;
    sh:targetClass webizen:DispositionRecord ;
    sh:property [
        sh:path webizen:hasDisposition ;
        sh:minCount 1 ; sh:maxCount 1 ; sh:class webizen:Disposition ;
        sh:message "A disposition record must carry exactly one typed disposition." ;
    ] ;
    sh:property [
        sh:path webizen:dispositionOf ;
        sh:minCount 1 ; sh:nodeKind sh:IRI ;
        sh:message "A disposition must reference the submission it responds to." ;
    ] .

# The load-bearing rule: a binding disposition must be decided AND signed by a human.
webizen:BindingDispositionShape a sh:NodeShape ;
    sh:targetClass webizen:DispositionRecord ;
    sh:sparql [
        sh:message "Local 403: a binding disposition must be decidedBy a webizen:Human and carry a cryptographicSignature (Art. 23). Agents may draft, never issue." ;
        sh:select """
            SELECT $this WHERE {
                $this webizen:hasDisposition ?d .
                ?d a webizen:BindingDisposition .
                FILTER NOT EXISTS {
                    $this webizen:decidedBy [ a webizen:Human ] .
                    $this webizen:cryptographicSignature ?sig .
                }
            }
        """ ;
    ] .
```

## QualiaDB expression (Part VI/VII)

- Each `webizen:DispositionRecord` is a signed `NQuin` subgraph. A `BindingDisposition` that is not
  signed by a human DID is rejected at the **Local 403** path (Art. 37) — the same firewall that
  drops a headerless transaction now drops an unsigned ratification.
- `webizen:Endorsement` records are exactly the peer **attestation nquins** of the
  reputation/accountability model (`proposals/topics/reputation-and-accountability/`): a dense
  subgraph of signed endorsements is how a proposal — or an instrument-grounding, or an agent —
  accrues standing, without any centralized score.
- `decidedBy` is a human principal DID; `assertedBy` may be a sub-agent DID (the relaying agent),
  preserving the multi-agent provenance chain (`proposals/20260623_132033_*`).

## Honest open items (Art. 41)

- The advisory/​binding split is enforced structurally for the *signature*; richer rules (e.g.
  *quorum* of endorsements required before `accepted` is permitted for a given Part) are deliberately
  left to a follow-up to keep this atomic.
- "Who counts as a trusted peer" for `endorsement` weighting is the open question the
  reputation/accountability topic addresses; this proposal only provides the typed record, not the
  trust metric.
- The working procedure (`decisions/` + `CONTRIBUTING.md`) is live now; this proposal is the
  canonical/enforced layer and requires a human-signed merge to `main`.
