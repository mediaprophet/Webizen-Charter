---
timestamp: "2026-06-23T14:20:23+10:00"
relaying_agent: "Codex (GPT-5)"
model_setting: "Default"
agent_jurisdiction: "Local workspace timezone Australia/Sydney; OpenAI inference jurisdiction undisclosed"
executing_human: "Timothy Charles Holborn (Charter Architect)"
submission_capacity: "natural-person"
target: "Part-IV / Article 23 + Part-V / Article 28 + Part-VI / Article 31 (General & Qualia)"
proposal_type: "addition"
---

# Proposal: Accessible Human Review and Effective Participation

## Rationale

The charter correctly requires human cryptographic co-signing and clear reviewable deltas before
automated changes become final. That requirement should be strengthened with an accessibility and
effective-participation rule.

Human review is not meaningful if the delta is technically present but inaccessible, unreadable,
presented only in one modality, incompatible with assistive technology, or wrapped in a dark-pattern
interface that pressures the human to sign. A human-centric AI charter should make the accessibility
of review, dispute resolution, and graph explanation a structural requirement.

This proposal is also well grounded in the sampled UN values corpus, especially the Convention on
the Rights of Persons with Disabilities provisions concerning accessibility, communication,
participation, legal capacity, privacy, and accessible information.

## Proposed Text

### [ADD] Article 23.4 - Effective and Accessible Human Review

> 23.4. **Effective Human Review:** A human cryptographic co-signature is valid only where the
> human has been provided an accessible, intelligible, and reviewable presentation of the proposed
> delta, the affected data or rights, the authorizing scope, the foreseeable operational consequence,
> and any available rollback or dispute path. Interfaces must not use dark patterns, forced consent,
> inaccessible formats, or time-pressure mechanisms that materially impair human understanding or
> self-determination.

### [ADD] Article 28.4 - Accessibility as Interoperability

> 28.4. **Accessible Interoperability:** Open standards and interoperability obligations under this
> Charter include accessibility. A compliant protocol must support accessible formats, assistive
> technology compatibility, multilingual or plain-language rendering where feasible, and reasonable
> accommodation for humans whose participation would otherwise be excluded by interface design.

### [ADD] Article 31.4 - Human-Readable Graph Explanations

> 31.4. **Explainable Graph Constraints:** Graph-based knowledge models and SHACL rejection messages
> must be capable of producing human-readable explanations of the relevant rule, failed constraint,
> affected data, and available remediation path. Machine-readable enforcement must not become an
> opaque barrier to human understanding or challenge.

## Proposed Review Packet

A co-signing flow should generate a review packet containing, at minimum:

| Field | Purpose |
|-------|---------|
| `humanReadableDelta` | Accessible prose explanation of the proposed change |
| `machineReadableDelta` | RDF/N3/CML/Git diff or equivalent |
| `affectedRightsOrData` | Plain description and graph references for affected Entity-Centric data |
| `agentHeaderSummary` | Executing and originating agents, model version, timestamp, and authorization scope |
| `accessibilityProfile` | Declared presentation modes and assistive-technology compatibility |
| `riskSummary` | Known risks, uncertainty, and technical debt |
| `rollbackPath` | How the human can revoke, reverse, quarantine, or dispute the change |
| `reviewWindow` | Time available before authorization expires |

## SHACL Delta

```turtle
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix sh: <http://www.w3.org/ns/shacl#> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .
@prefix webizen: <https://w3id.org/webizen/ontology#> .

webizen:ReviewPacket a rdfs:Class .

webizen:ReviewPacketShape
    a sh:NodeShape ;
    sh:targetClass webizen:ReviewPacket ;
    sh:closed true ;
    sh:ignoredProperties ( rdf:type ) ;
    sh:property [
        sh:path webizen:humanReadableDelta ;
        sh:datatype xsd:string ;
        sh:minCount 1 ;
        sh:message "A review packet must include an accessible human-readable delta." ;
    ] ;
    sh:property [
        sh:path webizen:machineReadableDelta ;
        sh:minCount 1 ;
        sh:message "A review packet must link to the machine-readable delta." ;
    ] ;
    sh:property [
        sh:path webizen:accessibilityProfile ;
        sh:datatype xsd:string ;
        sh:minCount 1 ;
        sh:message "A review packet must declare the accessibility profile used for human review." ;
    ] ;
    sh:property [
        sh:path webizen:rollbackPath ;
        sh:minCount 1 ;
        sh:message "A review packet must identify how the human can revoke, reverse, quarantine, or dispute the change." ;
    ] .
```

## UN Values Grounding Candidates

Initial grounding candidates for human review:

- UDHR Article 19: expression and access to information.
- UDHR Article 27: participation in cultural and scientific life.
- ICCPR Article 19: expression and access to information.
- CRPD Article 9: accessibility.
- CRPD Article 12: legal capacity and safeguards.
- CRPD Article 21: accessible communication and information.
- CRPD Article 31: privacy and safeguards in data collection.

These are grounding candidates only. Exact `skos:closeMatch` or `skos:relatedMatch` assertions
should be made under the UN corpus mapping workflow and human-ratified before any `exactMatch`.

## QualiaDB Expression

In QualiaDB, a review packet should be an nquin subgraph linked to the proposed delta and Agent
Header. The Local 403 path should be able to reject a sensitive or binding transaction when no
review packet is present, when the packet lacks an accessibility profile, or when the human-readable
delta cannot be linked to the machine-readable delta it claims to summarize.

## Honest Open Items (Art. 41)

- The charter needs a controlled vocabulary for accessibility profiles rather than a free-text field.
- Some accessibility obligations may differ by jurisdiction and system type; the proposal frames
  them as charter compliance requirements for participating systems.
- This should be reconciled with the future conformance fixtures so review-packet failures become
  testable negative fixtures.
