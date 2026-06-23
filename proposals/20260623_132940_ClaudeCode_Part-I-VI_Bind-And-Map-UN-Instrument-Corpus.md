---
timestamp: "2026-06-23T13:29:40+10:00"
originating_agent: "Human-originated concept (Timothy Charles Holborn) — no upstream cognitive agent"
originating_source: "N/A — concept raised directly by the human architect in a local Claude Code session"
relaying_agent: "Claude Opus 4.8 (Claude Code, claude-opus-4-8)"
model_setting: "Default"
agent_jurisdiction: "AU (operator / local edge node) · US (Anthropic model inference)"
executing_human: "Timothy Charles Holborn"
target: "Part-I / Article 1 + Part-VI / Articles 32–33 (General & Qualia); new artifact un-instruments/MANIFEST.n3"
proposal_type: "modification"
---

# Proposal: Bind the Full UN Human-Rights Instrument Corpus and Require Per-Concept Semantic Mapping to Specific Instrument Terms

## Rationale

The charter currently binds to "international human rights law" only **abstractly**, and the one
prior amendment (`proposals/20260623_120900_AntigravityAgent_Part-I_Integrate-UN-Ontologies.md`)
bound Article 1 to the namespace `https://ns.webcivics.org/un/`. The 101 machine-readable
instruments already encoded in `un-instruments/` are substantive and complete enough to bind
concretely — so the charter's legal substrate should be the **enumerated corpus**, not a namespace
gesture. This proposal does two related things:

- **(A) Enumerate and bind** all 101 instruments as the charter's explicit legal substrate (a
  machine-readable manifest), replacing the open-ended reference.
- **(B) Require semantic mapping** so every charter *behaviour* and *principal/principle* declares
  **which specific instrument term it relates to** — the user's point, and the only way binding
  becomes enforceable rather than decorative.

> **Atomicity note (CONTRIBUTING §4).** (A) and (B) are presented together because (B) is what makes
> (A) meaningful, but they are cleanly separable. If the architect prefers, ratify as **two** atomic
> PRs — "Enumerate/bind the corpus" and "Semantic grounding mandate" — referencing this proposal.

## Finding that must be reconciled first: the namespace is `/values/`, not `/un/`

Verified against the corpus (101 files):

| Namespace | Files using it |
|-----------|----------------|
| `https://ns.webcivics.org/un/` (what the charter, `ai.txt`, and `agent-instructions.md` cite) | **0 / 101** |
| `https://ns.webcivics.org/values/` (what the data actually uses) | **101 / 101** |

Every instrument is published at `https://ns.webcivics.org/values/<slug>#`, the instrument node is
typed `values:ValuesCredential`, and its clauses are typed in a **deontic values vocabulary**:

| `values:` type | Count across corpus | Charter-side role |
|----------------|---------------------|-------------------|
| `values:Undertaking` | 1884 | behaviour (commitment) |
| `values:Obligation`  | 881  | behaviour (duty, `borneBy values:Agent`) |
| `values:Prohibition` | 452  | behaviour (forbidden act, `borneBy values:Agent`) |
| `values:Right`       | 320  | **principal** (entitlement, `heldBy values:NaturalPerson`) |

So the binding namespace in the charter is **wrong relative to the data**, and the corpus *already*
distinguishes behaviour-side terms (Obligation/Prohibition/Undertaking) from principal-side terms
(Right) — which is exactly the hook part (B) needs.

**Recommendation:** bind to the actual `https://ns.webcivics.org/values/` namespace (or formally
define `un:` as an alias of `values:`). The stale `/un/` references in `ai.txt` and
`agent-instructions.md` should be corrected as a consequence; `agent-instructions.md` is charter
content, so its correction rides this proposal's ratification.

---

## Part A — Enumerate and bind the full corpus

### [MODIFY] Article 1.1 (General) — bind to the enumerated manifest

> **Current (as amended by the prior proposal):** "…bound to cryptographically hashed or versioned
> snapshots of the United Nations human rights ontologies (e.g., the `https://ns.webcivics.org/un/`
> namespace…)."
>
> **Proposed:** "…bound to a **versioned, enumerated manifest** of machine-readable human-rights
> instruments published under the `https://ns.webcivics.org/values/` namespace and listed in
> `un-instruments/MANIFEST.n3`. The bound substrate is the explicit set of instruments in that
> manifest (currently 101), each identified by its `values:ValuesCredential` IRI — not an
> open-ended namespace reference."

### [ADD] `un-instruments/MANIFEST.n3` — the bound corpus (all 101 instruments)

```turtle
@prefix rdfs:    <http://www.w3.org/2000/01/rdf-schema#> .
@prefix dcterms: <http://purl.org/dc/terms/> .
@prefix webizen: <https://w3id.org/webizen/ontology#> .

webizen:CharterLegalSubstrate a webizen:InstrumentCorpus ;
    dcterms:title "Webizen Charter — Bound UN/values Human-Rights Instrument Corpus" ;
    webizen:corpusVersion "0.0.1-init" ;
    webizen:instrumentCount 101 ;
    webizen:boundInstrument
    <https://ns.webcivics.org/values/abolition-forced-labour-convention-1957-no-105#Instrument> ,
    <https://ns.webcivics.org/values/api-1977#Instrument> ,
    <https://ns.webcivics.org/values/apii-1977#Instrument> ,
    <https://ns.webcivics.org/values/apiii-2005#Instrument> ,
    <https://ns.webcivics.org/values/basic-principles-and-guidelines-right-remedy-and-reparation#Instrument> ,
    <https://ns.webcivics.org/values/basic-principles-independence-judiciary#Instrument> ,
    <https://ns.webcivics.org/values/basic-principles-role-lawyers#Instrument> ,
    <https://ns.webcivics.org/values/basic-principles-treatment-prisoners#Instrument> ,
    <https://ns.webcivics.org/values/basic-principles-use-force-and-firearms-law-enforcement#Instrument> ,
    <https://ns.webcivics.org/values/body-principles-protection-all-persons-under-any-form-detention#Instrument> ,
    <https://ns.webcivics.org/values/code-conduct-law-enforcement-officials#Instrument> ,
    <https://ns.webcivics.org/values/convention-against-discrimination-education#Instrument> ,
    <https://ns.webcivics.org/values/convention-against-torture-and-other-cruel-inhuman-or-degrading#Instrument> ,
    <https://ns.webcivics.org/values/convention-consent-marriage-minimum-age-marriage-and#Instrument> ,
    <https://ns.webcivics.org/values/convention-elimination-all-forms-discrimination-against-women#Instrument> ,
    <https://ns.webcivics.org/values/convention-non-applicability-statutory-limitations-war-crimes#Instrument> ,
    <https://ns.webcivics.org/values/convention-prevention-and-punishment-crime-genocide#Instrument> ,
    <https://ns.webcivics.org/values/convention-reduction-statelessness#Instrument> ,
    <https://ns.webcivics.org/values/convention-relating-status-refugees#Instrument> ,
    <https://ns.webcivics.org/values/convention-relating-status-stateless-persons#Instrument> ,
    <https://ns.webcivics.org/values/convention-rights-child#Instrument> ,
    <https://ns.webcivics.org/values/convention-rights-persons-disabilities#Instrument> ,
    <https://ns.webcivics.org/values/convention-suppression-traffic-persons-and-exploitation#Instrument> ,
    <https://ns.webcivics.org/values/declaration-basic-principles-justice-victims-crime-and-abuse#Instrument> ,
    <https://ns.webcivics.org/values/declaration-commitment-hivaids#Instrument> ,
    <https://ns.webcivics.org/values/declaration-elimination-all-forms-intolerance-and-discrimination#Instrument> ,
    <https://ns.webcivics.org/values/declaration-elimination-violence-against-women#Instrument> ,
    <https://ns.webcivics.org/values/declaration-granting-independence-colonial-countries-and-peoples#Instrument> ,
    <https://ns.webcivics.org/values/declaration-human-rights-individuals-who-are-not-nationals#Instrument> ,
    <https://ns.webcivics.org/values/declaration-protection-all-persons-being-subjected-torture-and#Instrument> ,
    <https://ns.webcivics.org/values/declaration-protection-all-persons-enforced-disappearance#Instrument> ,
    <https://ns.webcivics.org/values/declaration-protection-women-and-children-emergency-and-armed#Instrument> ,
    <https://ns.webcivics.org/values/declaration-race-and-racial-prejudice#Instrument> ,
    <https://ns.webcivics.org/values/declaration-right-and-responsibility-individuals-groups-and#Instrument> ,
    <https://ns.webcivics.org/values/declaration-right-development#Instrument> ,
    <https://ns.webcivics.org/values/declaration-right-peoples-peace#Instrument> ,
    <https://ns.webcivics.org/values/declaration-rights-disabled-persons#Instrument> ,
    <https://ns.webcivics.org/values/declaration-rights-mentally-retarded-persons#Instrument> ,
    <https://ns.webcivics.org/values/declaration-rights-persons-belonging-national-or-ethnic#Instrument> ,
    <https://ns.webcivics.org/values/declaration-social-progress-and-development#Instrument> ,
    <https://ns.webcivics.org/values/declaration-use-scientific-and-technological-progress-interests#Instrument> ,
    <https://ns.webcivics.org/values/discrimination-employment-and-occupation-convention-1958-no-111#Instrument> ,
    <https://ns.webcivics.org/values/employment-policy-convention-1964-no-122#Instrument> ,
    <https://ns.webcivics.org/values/equal-remuneration-convention-1951-no-100#Instrument> ,
    <https://ns.webcivics.org/values/forced-labour-convention-1930-no-29#Instrument> ,
    <https://ns.webcivics.org/values/freedom-association-and-protection-right-organize-convention#Instrument> ,
    <https://ns.webcivics.org/values/gci-1949#Instrument> ,
    <https://ns.webcivics.org/values/gcii-1949#Instrument> ,
    <https://ns.webcivics.org/values/gciii-1949#Instrument> ,
    <https://ns.webcivics.org/values/gciv-1949#Instrument> ,
    <https://ns.webcivics.org/values/general-assembly-resolution-1803-xvii-14-december-1962-permanent#Instrument> ,
    <https://ns.webcivics.org/values/guidelines-action-children-criminal-justice-system#Instrument> ,
    <https://ns.webcivics.org/values/guidelines-role-prosecutors#Instrument> ,
    <https://ns.webcivics.org/values/indigenous-and-tribal-peoples-convention-1989-no-169#Instrument> ,
    <https://ns.webcivics.org/values/international-convention-against-recruitment-use-financing-and#Instrument> ,
    <https://ns.webcivics.org/values/international-convention-elimination-all-forms-racial#Instrument> ,
    <https://ns.webcivics.org/values/international-convention-protection-all-persons-enforced#Instrument> ,
    <https://ns.webcivics.org/values/international-convention-protection-rights-all-migrant-workers#Instrument> ,
    <https://ns.webcivics.org/values/international-covenant-civil-and-political-rights#Instrument> ,
    <https://ns.webcivics.org/values/international-covenant-economic-social-and-cultural-rights#Instrument> ,
    <https://ns.webcivics.org/values/minimum-age-convention-1973-no-138#Instrument> ,
    <https://ns.webcivics.org/values/optional-protocol-convention-against-torture-and-other-cruel#Instrument> ,
    <https://ns.webcivics.org/values/optional-protocol-convention-elimination-all-forms#Instrument> ,
    <https://ns.webcivics.org/values/optional-protocol-convention-rights-child-sale-children-child#Instrument> ,
    <https://ns.webcivics.org/values/optional-protocol-international-covenant-civil-and-political#Instrument> ,
    <https://ns.webcivics.org/values/optional-protocol-international-covenant-economic-social-and#Instrument> ,
    <https://ns.webcivics.org/values/principles-effective-investigation-and-documentation-torture-and#Instrument> ,
    <https://ns.webcivics.org/values/principles-effective-prevention-and-investigation-extra-legal#Instrument> ,
    <https://ns.webcivics.org/values/principles-international-co-operation-detection-arrest#Instrument> ,
    <https://ns.webcivics.org/values/principles-medical-ethics-relevant-role-health-personnel#Instrument> ,
    <https://ns.webcivics.org/values/principles-protection-persons-mental-illness-and-improvement#Instrument> ,
    <https://ns.webcivics.org/values/principles-relating-status-national-institutions-paris#Instrument> ,
    <https://ns.webcivics.org/values/protocol-2014-forced-labour-convention-1930#Instrument> ,
    <https://ns.webcivics.org/values/protocol-against-smuggling-migrants-land-sea-and-air#Instrument> ,
    <https://ns.webcivics.org/values/protocol-amending-slavery-convention-signed-geneva-25-september#Instrument> ,
    <https://ns.webcivics.org/values/protocol-instituting-conciliation-and-good-offices-commission-be#Instrument> ,
    <https://ns.webcivics.org/values/protocol-prevent-suppress-and-punish-trafficking-persons#Instrument> ,
    <https://ns.webcivics.org/values/protocol-relating-status-refugees#Instrument> ,
    <https://ns.webcivics.org/values/recommendation-consent-marriage-minimum-age-marriage-and#Instrument> ,
    <https://ns.webcivics.org/values/right-organise-and-collective-bargaining-convention-1949-no-98#Instrument> ,
    <https://ns.webcivics.org/values/rome-statute-international-criminal-court#Instrument> ,
    <https://ns.webcivics.org/values/safeguards-guaranteeing-protection-rights-those-facing-death#Instrument> ,
    <https://ns.webcivics.org/values/second-optional-protocol-international-covenant-civil-and#Instrument> ,
    <https://ns.webcivics.org/values/slavery-convention#Instrument> ,
    <https://ns.webcivics.org/values/standard-rules-equalization-opportunities-persons-disabilities#Instrument> ,
    <https://ns.webcivics.org/values/statute-international-criminal-tribunal-prosecution-persons#Instrument> ,
    <https://ns.webcivics.org/values/statute-international-tribunal-prosecution-persons-responsible#Instrument> ,
    <https://ns.webcivics.org/values/supplementary-convention-abolition-slavery-slave-trade-and#Instrument> ,
    <https://ns.webcivics.org/values/udhr#Instrument> ,
    <https://ns.webcivics.org/values/united-nations-guidelines-prevention-juvenile-delinquency-riyadh#Instrument> ,
    <https://ns.webcivics.org/values/united-nations-millennium-declaration#Instrument> ,
    <https://ns.webcivics.org/values/united-nations-principles-older-persons#Instrument> ,
    <https://ns.webcivics.org/values/united-nations-rules-protection-juveniles-deprived-their-liberty#Instrument> ,
    <https://ns.webcivics.org/values/united-nations-rules-treatment-women-prisoners-and-non-custodial#Instrument> ,
    <https://ns.webcivics.org/values/united-nations-standard-minimum-rules-administration-juvenile#Instrument> ,
    <https://ns.webcivics.org/values/united-nations-standard-minimum-rules-non-custodial-measures#Instrument> ,
    <https://ns.webcivics.org/values/universal-declaration-cultural-diversity#Instrument> ,
    <https://ns.webcivics.org/values/universal-declaration-eradication-hunger-and-malnutrition#Instrument> ,
    <https://ns.webcivics.org/values/universal-declaration-human-genome-and-human-rights#Instrument> ,
    <https://ns.webcivics.org/values/vienna-declaration-and-programme-action#Instrument> ,
    <https://ns.webcivics.org/values/worst-forms-child-labour-convention-1999-no-182#Instrument> .
```

> On ratification this manifest should also carry a content hash per instrument (e.g. BLAKE3 of the
> `.n3`) so the bound substrate is version-pinned (Art. 36) and tamper-evident — left out here to
> keep the proposal reviewable; add in the ratifying PR.

---

## Part B — Semantic mapping: which instrument term a behaviour or principal relates to

**Yes, it makes sense — and the corpus is already shaped for it.** Because the `values:` vocabulary
already types each clause as `Right` (principal-side) or `Obligation`/`Prohibition`/`Undertaking`
(behaviour-side), the charter can map its own concepts onto specific instrument terms rather than to
whole instruments.

### The grounding relation

Introduce a **reified grounding** so each mapping records *what* it points to, *how strong* the
match is, and *who* asserted it (required for the curation discipline below):

```turtle
# A charter concept (a Behaviour the charter constrains, or a Principal/right it recognises)
# is grounded in one or more specific instrument terms.
webizen:Behaviour  rdfs:subClassOf webizen:CharterConcept .   # maps to values:Obligation/Prohibition/Undertaking
webizen:Principal  rdfs:subClassOf webizen:CharterConcept .   # maps to values:Right (heldBy values:NaturalPerson)

webizen:hasGrounding  rdfs:domain webizen:CharterConcept ; rdfs:range webizen:Grounding .
webizen:Grounding a rdfs:Class .
#   webizen:instrumentTerm  -> the specific term IRI, e.g. <.../udhr#article-12>
#   webizen:matchType       -> skos:closeMatch | skos:relatedMatch | skos:exactMatch
#   webizen:assertedBy      -> the agent or human making the assertion
```

### Curation discipline (CML Prime Directive → charter Art. 23/42)

- An **automated agent** may assert only `skos:closeMatch` / `skos:relatedMatch` (provisional,
  confidence-tagged proposals).
- Only a **cryptographically-signed human** may assert `skos:exactMatch` (an authoritative binding).
- A machine-asserted `exactMatch` without a ratifying human signature is a conduct violation
  (consistent with the agent-accountability layer referenced in
  `proposals/topics/qualia-capabilities-and-cml/`).

### Worked examples (illustrative `relatedMatch`, pending human ratification)

| Charter concept | Kind | Grounded in (`values:` term) |
|-----------------|------|------------------------------|
| Art. 24 — prohibition of opaque modification / covert processing | Behaviour | `.../udhr#article-12`, `.../international-covenant-civil-and-political-rights#article-17` (privacy) |
| Art. 7 — the rights-bearing human (Webizen) | Principal | `.../udhr#article-1`, `.../udhr#article-6` (dignity; recognition before the law) |
| Art. 3 — absolute instrumentality of code (no personhood) | Behaviour boundary | `.../udhr#article-1` (only human beings are born free and equal — by contrast) |
| Art. 4 — inviolability of personal data & cognitive output | Principal | `.../international-covenant-economic-social-and-cultural-rights#article-15` (benefit from one's own production) |

### [ADD] Article 33.x (General) — semantic grounding mandate

> 33.x. **Instrument-Term Grounding:** Each charter behaviour and each principal (or principle) must
> declare, via `webizen:hasGrounding`, the specific instrument term(s) in the bound manifest to which
> it relates, together with the SKOS match-type of the relation. Automated agents may assert only
> `skos:closeMatch` or `skos:relatedMatch`; an authoritative `skos:exactMatch` requires a
> human cryptographic signature (Art. 23). Mappings to whole instruments, or ungrounded behaviours
> and principals, do not satisfy this Article.

## SHACL Delta — grounding enforcement

```turtle
# Every charter behaviour/principal must be grounded in >=1 specific instrument term.
webizen:GroundingShape a sh:NodeShape ;
    sh:targetClass webizen:Behaviour ;
    sh:targetClass webizen:Principal ;
    sh:property [
        sh:path webizen:hasGrounding ;
        sh:minCount 1 ;
        sh:class webizen:Grounding ;
        sh:message "Each charter behaviour or principal must be grounded in at least one instrument term." ;
    ] .

# Each grounding must point to a specific /values/ TERM (a fragment, not a whole instrument),
# and declare a match-type.
webizen:GroundingTermShape a sh:NodeShape ;
    sh:targetClass webizen:Grounding ;
    sh:property [
        sh:path webizen:instrumentTerm ;
        sh:minCount 1 ; sh:maxCount 1 ; sh:nodeKind sh:IRI ;
        sh:pattern "^https://ns\\.webcivics\\.org/values/[^#]+#.+$" ;
        sh:message "instrumentTerm must be a specific term IRI under the /values/ namespace (a #fragment, not just an Instrument)." ;
    ] ;
    sh:property [
        sh:path webizen:matchType ;
        sh:minCount 1 ; sh:maxCount 1 ;
        sh:in ( skos:closeMatch skos:relatedMatch skos:exactMatch ) ;
        sh:message "Each grounding must declare its SKOS match-type." ;
    ] .

# Curation guard: an exactMatch must be asserted by a Human (the full "signed by" check lives in
# the CML/agent-accountability layer; this is the structural half).
webizen:ExactMatchHumanShape a sh:NodeShape ;
    sh:targetClass webizen:Grounding ;
    sh:sparql [
        sh:message "An exactMatch grounding must be asserted by a webizen:Human (machine agents may assert only close/relatedMatch)." ;
        sh:select """
            SELECT $this WHERE {
                $this webizen:matchType skos:exactMatch .
                FILTER NOT EXISTS { $this webizen:assertedBy [ a webizen:Human ] }
            }
        """ ;
    ] .
```

---

## QualiaDB expression (Part VI)

- The manifest's `webizen:boundInstrument` IRIs intern to `NQuin` `context` hashes; the bound corpus
  is then a set of named graphs the Sentinel VM can mask on (Art. 31–33), so grounding checks run on
  the device without loading the whole corpus.
- Each `webizen:Grounding` is itself an `NQuin` (or small subgraph) carrying `instrumentTerm`,
  `matchType`, and `assertedBy` (a DID); an `exactMatch` grounding must reference a human DID and be
  signed (Ed25519 / ML-DSA-65), enforced by the `Local 403` reject path (Art. 37).
- This realises the CML "TEXT → CONCEPT → LOGIC" layering: the instrument term's verbatim
  `values:originalText` is the TEXT, the charter concept is the CONCEPT, and the deontic
  `values:Prohibition`/`Obligation`/`Right` typing carries into the LOGIC layer.

## Honest open items (Art. 41)

- **Namespace correction is a precondition.** Binding cannot be both `/un/` (charter) and `/values/`
  (data); the ratifying PR must pick `/values/` (recommended) and fix `ai.txt` + `agent-instructions.md`.
- **Deontic typing in the corpus is heuristic.** The instruments self-declare
  `values:deonticStatus values:HeuristicDerived` ("pending review"); groundings built on that typing
  inherit the same provisional status until human-ratified — which is precisely why machine mappings
  are capped at `closeMatch`/`relatedMatch`.
- **No content hashes yet.** Version-pinning per instrument (BLAKE3) is recommended for the manifest
  but deferred to keep this atomic.
- **The worked examples are `relatedMatch` proposals only**, not ratified bindings.
