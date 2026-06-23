---
timestamp: "2026-06-23T13:47:20+10:00"
originating_agent: "Human-originated concept (Timothy Charles Holborn) — no upstream cognitive agent"
originating_source: "N/A — concept raised directly by the human architect in a local Claude Code session"
relaying_agent: "Claude Opus 4.8 (Claude Code, claude-opus-4-8)"
model_setting: "Default"
agent_jurisdiction: "AU (operator / local edge node) · US (Anthropic model inference)"
executing_human: "Timothy Charles Holborn"
submission_capacity: "natural-person"
target: "Part-II / Article 7 + Part-III / Articles 15 & 18 (General & Qualia); references Art. 4, 5"
proposal_type: "addition"
---

# Proposal: Submission Capacity (Natural Person vs Legal Personality) with Selective Disclosure

## Rationale

Every submission has a **principal** — the party whose authority and accountability stand behind it.
The charter must let that principal declare their **capacity**:

- a **natural legal person acting in their own standing** (a rights-bearing Webizen, Art. 7); or
- a natural person acting **as agent for an incorporated entity / legal personality** — a government
  or department, intergovernmental organisation, educational/research body, NGO, NFP/charity,
  company, corporation, cooperative, trust, etc.

These are not symmetric. A natural person holds rights, including **privacy and data-minimization**
(Art. 4) and **cryptographic self-determination** (Art. 5); they must be able to submit under
**selective disclosure** — e.g. *without* declaring jurisdiction — proving only enough (a stable,
possibly pseudonymous identifier, or a credential attesting natural-personhood) to bind authorship
(Art. 6). A legal personality is **not** a rights-bearing Webizen; it owes **transparency**: when it
seeks to influence the charter, the entity, its type, its jurisdiction, the representative's mandate,
and any conflict of interest must be disclosed. Hiding that is precisely the capture the charter
exists to resist (Preamble; Art. 28).

> **Terminology guard.** "Entity" here means an *incorporated legal personality*. This is distinct
> from the charter's existing "**entity-centric** datasets" (Art. 16/17), where "entity" means a
> *human or asset*. This proposal uses **legal personality** for the corporate sense throughout.

## Proposed Text (General expression)

### [ADD] Article 7.x — Capacity of the Principal

> 7.x. **Declared Capacity:** Every submission must declare the capacity of its principal: a natural
> legal person acting in their own standing; a natural person acting as fiduciary for another natural
> person; or a natural person acting as agent for an incorporated legal personality. Rights vest in
> natural persons (Art. 7); a legal personality bears accountability and transparency obligations but
> is not a rights-bearing Webizen. The natural human who executes a submission is always identified
> (Art. 6); where they act for a legal personality, that personality is additionally named as the
> accountable principal.

### [ADD] Article 18.x — Selective Disclosure for Natural Persons

> 18.x. **Selective Disclosure:** A natural person acting in their own standing may submit without
> disclosing jurisdiction or further identifying detail, consistent with the inviolability of personal
> data (Art. 4) and cryptographic self-determination (Art. 5). The system must not require such
> disclosure from them; it may require only a cryptographic identifier sufficient to bind authorship,
> which may be pseudonymous or a verifiable credential attesting natural-personhood. Conversely, a
> submission made on behalf of an incorporated legal personality must disclose the entity, its type,
> its jurisdiction, the representative's authority, and any conflict of interest; selective disclosure
> is not available to legal personalities.

## Ontology

```turtle
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix webizen: <https://w3id.org/webizen/ontology#> .

webizen:SubmissionCapacity a rdfs:Class .
webizen:NaturalPerson          a webizen:SubmissionCapacity .   # own standing — the rights-bearer
webizen:NaturalPersonFiduciary a webizen:SubmissionCapacity .   # for another natural person
webizen:EntityAgent            a webizen:SubmissionCapacity .   # for a legal personality

webizen:LegalPersonality a rdfs:Class .   # NOT a webizen:Human / not rights-bearing (Art. 7)
#   webizen:entityType   -> webizen:Government | webizen:GovernmentDepartment |
#                           webizen:IntergovernmentalOrg | webizen:PublicBody |
#                           webizen:EducationalInstitution | webizen:ResearchInstitution |
#                           webizen:NGO | webizen:CivilSociety | webizen:NotForProfit |
#                           webizen:Charity | webizen:Company | webizen:Corporation |
#                           webizen:Cooperative | webizen:Trust | webizen:ReligiousOrganisation |
#                           webizen:PoliticalParty | webizen:TradeUnion | webizen:OtherLegalPersonality
#   webizen:jurisdiction -> ISO 3166 code(s)

# On a submission:
#   webizen:executedBy            -> the natural human (always; Art. 6)
#   webizen:submissionCapacity    -> one webizen:SubmissionCapacity
#   webizen:onBehalfOf            -> a webizen:LegalPersonality   (REQUIRED iff EntityAgent)
#   webizen:representativeAuthority-> mandate string             (REQUIRED iff EntityAgent)
#   webizen:conflictOfInterest    -> string                      (disclose iff EntityAgent)
#   webizen:principalIdentifier   -> a cryptographic id (REQUIRED; may be pseudonymous for NaturalPerson)
```

## SHACL Delta — conditional disclosure (the asymmetry, enforced)

```turtle
# (1) Every submission must bind authorship to a cryptographic identifier — even under selective
#     disclosure. This is the ONLY hard identity requirement for a natural person.
webizen:SubmissionIdentityShape a sh:NodeShape ;
    sh:targetClass webizen:Submission ;
    sh:property [
        sh:path webizen:submissionCapacity ;
        sh:minCount 1 ; sh:maxCount 1 ; sh:class webizen:SubmissionCapacity ;
        sh:message "A submission must declare its principal's capacity." ;
    ] ;
    sh:property [
        sh:path webizen:principalIdentifier ;
        sh:minCount 1 ;
        sh:message "A submission must bind authorship to a cryptographic identifier (may be pseudonymous for a natural person)." ;
    ] .

# (2) Entity-agent submissions MUST fully disclose the legal personality + jurisdiction + mandate.
webizen:EntityAgentDisclosureShape a sh:NodeShape ;
    sh:targetClass webizen:Submission ;
    sh:sparql [
        sh:message "Local 403: an entity-agent submission must disclose onBehalfOf (a LegalPersonality with entityType + jurisdiction) and representativeAuthority." ;
        sh:select """
            SELECT $this WHERE {
                $this webizen:submissionCapacity webizen:EntityAgent .
                FILTER NOT EXISTS {
                    $this webizen:onBehalfOf ?e .
                    ?e a webizen:LegalPersonality ; webizen:entityType ?t ; webizen:jurisdiction ?j .
                    $this webizen:representativeAuthority ?a .
                }
            }
        """ ;
    ] .

# (3) Selective disclosure is protected: NO shape may require jurisdiction or further identity from a
#     natural person in their own standing. (Expressed as the ABSENCE of such a constraint — and as a
#     guard that a LegalPersonality is never typed as a rights-bearing human.)
webizen:NoCorporatePersonhoodShape a sh:NodeShape ;
    sh:targetClass webizen:LegalPersonality ;
    sh:not [ sh:class webizen:Human ] ;
    sh:message "A legal personality is not a rights-bearing human (Art. 7)." .
```

## QualiaDB expression (Part III/VI)

- `principalIdentifier` for a natural person may be a **pseudonymous DID** or a **verifiable
  credential** proving natural-personhood, presented under **selective disclosure** — QualiaDB's ZK
  path (Groth16) and per-recipient ECDH-wrapped subgraph keys (Art. 34/35) let a person prove "I am a
  natural person acting for myself" *without* revealing jurisdiction or identity, and ephemeral
  credentials (Art. 18) bound the lifetime.
- An `EntityAgent` submission, by contrast, must carry the legal personality's DID, `entityType`, and
  `jurisdiction` as cleartext signed `NQuin`s; an undisclosed entity-agent submission is rejected at
  the **Local 403** path (Art. 37). Capture is structurally visible.
- Capacity is a first-class field on the provenance/stakeholder subgraph, so the
  ratification model (`proposals/20260623_134213_*`) can see — and the architect can weight or flag —
  when ratifying participation comes from governments or corporations rather than natural persons.

## Honest open items (Art. 41)

- **Proof-of-natural-personhood under selective disclosure is hard.** Allowing pseudonymity while
  preventing a hidden legal personality from masquerading as a natural person is an open
  research/credentialing problem; this proposal specifies the *requirement and the asymmetry*, not the
  credential scheme.
- **Conflict-of-interest taxonomy** (paid lobbying, funding, revolving-door) is stubbed as a free
  string; a controlled vocabulary is a follow-up.
- **Fiduciary chains** (a natural person for another natural person, or nested delegations) are named
  but not fully modelled here.
- Working procedure (capacity fields in `CONTRIBUTING.md`, templates, issue forms, `STAKEHOLDERS.md`)
  is live now; this proposal is the canonical layer and requires a human-signed merge to `main`.
