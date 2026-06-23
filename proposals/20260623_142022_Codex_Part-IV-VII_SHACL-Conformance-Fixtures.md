---
timestamp: "2026-06-23T14:20:22+10:00"
relaying_agent: "Codex (GPT-5)"
model_setting: "Default"
agent_jurisdiction: "Local workspace timezone Australia/Sydney; OpenAI inference jurisdiction undisclosed"
executing_human: "Timothy Charles Holborn (Charter Architect)"
submission_capacity: "natural-person"
target: "Part-IV / Articles 21-24 + Part-VII / Articles 37-39 and 42 (General & Qualia)"
proposal_type: "addition"
---

# Proposal: SHACL Conformance Fixtures and Validation Manifest

## Rationale

The charter's enforcement model depends on closed SHACL shapes, Agent Headers, Local 403 rejection,
quarantine, and human-only ratification. Those rules are now described in prose, sample SHACL, dev
track shapes, and staged proposals. The next hardening step is a conformance layer: small positive
and negative RDF fixtures that prove validators accept compliant transactions and reject malformed
ones.

Without fixtures, a future agent can update a shape and accidentally break the enforcement promise
without noticing. With fixtures, the charter can say, "This is what a valid Agent Header looks like;
this is what must be rejected."

## Proposed Text

### [ADD] Article 21.5 - Agent Header Conformance Class

> 21.5. **Conformance Class:** The Agent Header protocol must define a public conformance class
> consisting of canonical shapes, valid example transactions, invalid example transactions, and
> expected validation results. A system claiming Agent Header compliance must be able to validate the
> conformance fixtures without relaxing closed-world constraints or omitting mandatory provenance.

### [ADD] Article 37.4 - Reproducible Rejection Fixtures

> 37.4. **Reproducible Rejection:** Automated transaction rejection must be testable through
> reproducible fixtures. Missing human authorization, missing model identity, missing signature,
> malformed timestamp, unauthorized extra vendor telemetry, agent ratification, and insufficient
> graph clearance must each have a negative fixture that a compliant implementation rejects.

### [ADD] Article 42.4 - Ratification Fixture

> 42.4. **Ratification Validation:** Release ratification records must include validation examples
> demonstrating quorum satisfaction, human-only ratifier checks, accepted-proposal linkage, and the
> rejection of any ratification record that substitutes a software agent or incorporated legal
> personality for a ratifying human.

## Proposed Artifact Layout

Add a future `validation/` directory:

```text
validation/
  README.md
  manifest.ttl
  shapes/
    agent-header.canonical.ttl
    ratification.canonical.ttl
    disposition.canonical.ttl
  fixtures/
    agent-header.valid.ttl
    agent-header.invalid-missing-authorized-by.ttl
    agent-header.invalid-extra-vendor-telemetry.ttl
    agent-header.invalid-missing-signature.ttl
    ratification.valid-bootstrap-human.ttl
    ratification.invalid-agent-ratifier.ttl
    ratification.invalid-under-quorum.ttl
    disposition.valid-recommendation-agent-drafted.ttl
    disposition.invalid-binding-without-human-signature.ttl
```

The fixture names are illustrative. The important rule is that every load-bearing SHACL claim in
Parts IV and VII receives at least one accepted and one rejected example.

## Validation Manifest Shape

```turtle
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix sh: <http://www.w3.org/ns/shacl#> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .
@prefix webizen: <https://w3id.org/webizen/ontology#> .

webizen:ConformanceFixture a rdfs:Class .
webizen:Accepted a webizen:ExpectedValidationResult .
webizen:Rejected a webizen:ExpectedValidationResult .

webizen:ConformanceFixtureShape
    a sh:NodeShape ;
    sh:targetClass webizen:ConformanceFixture ;
    sh:closed true ;
    sh:ignoredProperties ( rdf:type ) ;
    sh:property [
        sh:path webizen:fixturePath ;
        sh:datatype xsd:string ;
        sh:minCount 1 ;
        sh:maxCount 1 ;
        sh:message "Each conformance fixture must identify the file under validation/fixtures." ;
    ] ;
    sh:property [
        sh:path webizen:shapePath ;
        sh:datatype xsd:string ;
        sh:minCount 1 ;
        sh:message "Each conformance fixture must identify the shape or shapes it validates." ;
    ] ;
    sh:property [
        sh:path webizen:expectedResult ;
        sh:minCount 1 ;
        sh:maxCount 1 ;
        sh:in ( webizen:Accepted webizen:Rejected ) ;
        sh:message "Each fixture must declare whether a compliant validator accepts or rejects it." ;
    ] ;
    sh:property [
        sh:path webizen:articleGrounding ;
        sh:datatype xsd:string ;
        sh:minCount 1 ;
        sh:message "Each fixture must cite the Charter Article it tests." ;
    ] .
```

## Minimum Fixture Matrix

| Area | Valid fixture | Invalid fixture |
|------|---------------|-----------------|
| Agent Header | executedBy, modelVersion, timestamp, authorizedBy, signature | missing `authorizedBy` |
| Closed-world telemetry | approved properties only | extra proprietary telemetry property |
| Multi-agent provenance | relaying agent with optional originating agent and source | originating agent present without source |
| Quarantine | quarantined payload cannot touch core graph | quarantined payload can interact with graph |
| Disposition | advisory recommendation drafted by agent | binding acceptance without human signature |
| Ratification | human ratifier with quorum met | cognitive agent or legal personality in `ratifiedBy` |

## QualiaDB Expression

In QualiaDB, each fixture should be a small nquin/RDF graph with an expected Local 403 or accepted
ingest result. The same fixtures should exercise both the General conformance shape and the
Qualia-specific reference implementation shape.

## Honest Open Items (Art. 41)

- The repository currently has documents rather than a build/test toolchain. A validation directory
  can be added before choosing the runner.
- The canonical Agent Header shape should be consolidated before fixture paths are frozen.
- The fixture manifest should eventually be included in release ratification records.
