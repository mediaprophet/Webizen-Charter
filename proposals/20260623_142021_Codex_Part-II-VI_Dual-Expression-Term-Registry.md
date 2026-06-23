---
timestamp: "2026-06-23T14:20:21+10:00"
relaying_agent: "Codex (GPT-5)"
model_setting: "Default"
agent_jurisdiction: "Local workspace timezone Australia/Sydney; OpenAI inference jurisdiction undisclosed"
executing_human: "Timothy Charles Holborn (Charter Architect)"
submission_capacity: "natural-person"
target: "Part-II / Articles 7-12 + Part-VI / Articles 31-33 (General & Qualia)"
proposal_type: "addition"
---

# Proposal: Dual-Expression Term Registry and Crosswalk

## Rationale

The repository has two table-of-contents expressions:

- `TOC-General.md`, framed in portable engineering terms.
- `TOC-Qualia.md`, framed around QualiaDB, nquins, CML, and Local 403 enforcement.

That split is architecturally sound. The current draft files, however, are still byte-identical
across `working-draft/`, `dev/0.0.1-init/general/`, and `dev/0.0.1-init/qualia/`. The SHACL files in
both dev tracks are also byte-identical. This is a reasonable bootstrap state, but it should be
declared and governed before future changes create hidden divergence.

There is a second terminology risk. The charter uses `Human`, `NaturalPerson`, `Webizen`,
`LegalPersonality`, `EntityAgent`, `CognitiveAgent`, `BrokerAgent`, and `SoftwareSystem`. The UN
instrument corpus uses `values:Agent` for rights-instrument duty bearers. Without a controlled term
registry, a graph reasoner or cognitive agent could flatten these into one "agent" concept and
accidentally weaken the anti-personhood rule.

## Proposed Text

### [ADD] Article 12.4 - Controlled Agent and Actor Vocabulary

> 12.4. **Controlled Actor Vocabulary:** Any compliant implementation must maintain a controlled
> vocabulary that distinguishes rights-bearing human actors, incorporated legal personalities,
> software agents, broker interfaces, and treaty duty-bearers. A term used for a duty-bearer under a
> human-rights instrument must not be inferred to confer personhood, rights-bearing status, authorship,
> or ratifying standing on a software agent.

### [ADD] Article 33.4 - Dual-Expression Crosswalk

> 33.4. **Dual-Expression Crosswalk:** Where the Charter is maintained in both General and
> implementation-specific expressions, each Article must carry a machine-readable crosswalk
> identifying the corresponding General article, implementation article, normative status,
> implementation binding, semantic groundings, and parity status. An implementation expression may
> specialize terminology for a reference implementation, but it must not silently alter the
> underlying human-rights obligation without a proposal and human-ratified disposition.

## Proposed Artifact

Add a new controlled registry, such as `working-draft/term-registry.md` plus an N3/Turtle expression
under the dev tracks. The registry should minimally define:

| Term | Meaning | May hold rights? | May ratify? | Notes |
|------|---------|------------------|-------------|-------|
| `webizen:Human` | Rights-bearing human actor | yes | yes, if ratifying stakeholder | Core legal locus |
| `webizen:NaturalPerson` | Natural-person capacity or credentialed natural person | yes | yes, if ratifying stakeholder | Must not be collapsed into legal personality |
| `webizen:Webizen` | The human actor acting through the digital modality | yes | yes, if ratifying stakeholder | Qualia-facing term |
| `webizen:LegalPersonality` | Incorporated entity or legal personality | no | no | Owes transparency, not privacy |
| `webizen:DeterministicAgent` | Rule-based software instrument | no | no | Tool only |
| `webizen:CognitiveAgent` | Probabilistic inference software instrument | no | no | Tool only |
| `webizen:BrokerAgent` | Interface, protocol, client, host, or orchestrator | no | no | Tool or conduit |
| `values:Agent` | Duty-bearer or actor in the UN values corpus | no automatic mapping | no automatic mapping | Requires explicit crosswalk |

## Ontology Delta

```turtle
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix sh: <http://www.w3.org/ns/shacl#> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .
@prefix webizen: <https://w3id.org/webizen/ontology#> .
@prefix values: <https://ns.webcivics.org/values/> .

webizen:DualExpressionMap a rdfs:Class .
webizen:TermRegistryEntry a rdfs:Class .

webizen:rightsBearing a rdfs:Property .
webizen:ratificationStanding a rdfs:Property .
webizen:generalExpression a rdfs:Property .
webizen:implementationExpression a rdfs:Property .
webizen:parityStatus a rdfs:Property .
webizen:normativeStatus a rdfs:Property .
webizen:implementationBinding a rdfs:Property .

webizen:Human a rdfs:Class .
webizen:LegalPersonality a rdfs:Class .
webizen:SoftwareAgent a rdfs:Class .
webizen:TreatyDutyBearer a rdfs:Class .
```

## SHACL Delta

```turtle
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix sh: <http://www.w3.org/ns/shacl#> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .
@prefix webizen: <https://w3id.org/webizen/ontology#> .

webizen:LegalPersonalityNotHumanShape
    a sh:NodeShape ;
    sh:targetClass webizen:LegalPersonality ;
    sh:not [ sh:class webizen:Human ] ;
    sh:message "A LegalPersonality is not a rights-bearing Human under the Charter." .

webizen:SoftwareAgentNotHumanShape
    a sh:NodeShape ;
    sh:targetClass webizen:SoftwareAgent ;
    sh:not [ sh:class webizen:Human ] ;
    sh:message "Software agents are instruments and must not be typed as rights-bearing Humans." .

webizen:DualExpressionMapShape
    a sh:NodeShape ;
    sh:targetClass webizen:DualExpressionMap ;
    sh:closed true ;
    sh:ignoredProperties ( rdf:type ) ;
    sh:property [
        sh:path webizen:generalExpression ;
        sh:minCount 1 ;
        sh:maxCount 1 ;
        sh:nodeKind sh:IRI ;
        sh:message "Each map must point to exactly one General expression." ;
    ] ;
    sh:property [
        sh:path webizen:implementationExpression ;
        sh:minCount 1 ;
        sh:nodeKind sh:IRI ;
        sh:message "Each map must point to one or more implementation expressions." ;
    ] ;
    sh:property [
        sh:path webizen:parityStatus ;
        sh:minCount 1 ;
        sh:maxCount 1 ;
        sh:datatype xsd:string ;
        sh:message "Each map must declare whether the implementation is identical, specialized, divergent, or not required." ;
    ] .
```

## QualiaDB Expression

In QualiaDB, each `webizen:DualExpressionMap` should be encoded as an nquin-backed subgraph linking:

- the General article IRI;
- the Qualia article IRI;
- any CML concept node used to enforce the article;
- any SHACL shape or Local 403 rejection path bound to that article;
- one or more UN values terms once the UN corpus binding proposal is ratified.

## Honest Open Items (Art. 41)

- The registry should be reconciled with the existing selective-disclosure proposal so
  `NaturalPerson`, `Human`, and `LegalPersonality` do not split into incompatible class systems.
- The registry should decide whether `values:Agent` maps to `webizen:TreatyDutyBearer`, remains
  external-only, or is handled through SKOS mapping.
- Existing article files can remain identical if their parity status is explicitly marked
  `identical-bootstrap`.
