---
timestamp: "2026-06-23T14:57:49+10:00"
relaying_agent: "Codex (GPT-5)"
model_setting: "Default"
agent_jurisdiction: "Local workspace timezone Australia/Sydney; OpenAI inference jurisdiction undisclosed"
executing_human: "Timothy Charles Holborn (Charter Architect)"
submission_capacity: "natural-person"
target: "working-draft Preamble and Parts I-VII; text-level review"
topic_scope: "Specific charter wording improvements; clause-level recommendations; UN-values alignment"
status: "Ideation"
---

# 002: Specific Charter Text Review

This note reviews the proposed charter text itself, not only the repository architecture. It is
staged as ideation so each accepted idea can graduate into an atomic proposal with human-signed
disposition.

## Summary

The current draft has a coherent spine: human-rights primacy, rejection of machine personhood,
cryptographic self-determination, provenance, graph-bounded processing, and Local 403 enforcement.
The text is strongest when it speaks architecturally: "must be structurally enforced",
"cryptographically verifiable", "scoped subgraph", "reviewable delta", "semantic clearance".

The main textual improvements should sharpen terms that may otherwise become ambiguous in law,
implementation, or governance:

- distinguish natural humans from legal personalities and infrastructure operators;
- treat consent as purpose-bound, revocable, and supportable rather than one-time permission;
- add explicit accessibility, non-discrimination, child/vulnerable-person, and remedy language;
- frame strong legal claims as charter-operational effects where jurisdiction may vary;
- connect each article cluster to concrete UN values terms through a normative references layer.

## Clause-Level Suggestions

### 1. Preamble - define the Webizen once, then reuse it

Current issue: the Preamble introduces the Webizen as the "human actor within this digital
modality", which is good, but later articles use "human actor", "human entity", "human owner", and
"human operator" in ways that can blur natural persons, fiduciaries, and legal personalities.

Suggested direction:

> Add a short definitional sentence: "For this Charter, a Webizen is a natural human person acting
> in the digital modality, whether directly, pseudonymously, or through supported/fiduciary
> representation; a legal personality or software system is not a Webizen."

Why: This supports Articles 2, 3, 7, 17, 23, and 42, and aligns with the selective-disclosure
proposal.

### 2. Article 2.3 and Article 7.3 - replace "human entity" where it risks ambiguity

Current issue:

- Article 2.3 says accountability remains with the "delegating human entity".
- Article 7.3 refers to "the authorizing human actor or the human entity operating the
  infrastructure."

"Human entity" can be read as a person, company, government department, estate, trust, or
infrastructure owner. The charter's anti-capture posture needs the opposite: natural-person rights
and legal-personality transparency.

Suggested direction:

> Replace "human entity" with more precise roles: "authorizing natural person, fiduciary acting for
> a natural person, or legally accountable human representative of an incorporated legal
> personality."

Why: This preserves accountability without making corporations or governments rights-bearing
Webizens.

### 3. Article 4 - strengthen consent, context, and sensitive cognitive output

Current strength: Article 4 is one of the charter's most important clauses. It already protects
cognitive and expressive outputs and prohibits extraction.

Suggested additions:

> 4.x. **Purpose-Bound Consent:** Consent for automated ingestion, processing, training, or
> replication must be purpose-bound, time-bounded where feasible, revocable, and cryptographically
> linked to the context in which it was granted.

> 4.x. **Sensitive Cognitive Data:** Cognitive, psychological, health, disability, child-related,
> humanitarian, or legal-process data must receive heightened protection and must not be inferred,
> retained, or repurposed beyond the authorized scope.

UN values grounding candidates: UDHR Arts 12, 19, 27; ICCPR Arts 17, 19; ICESCR Art 15; CRPD Arts
12, 21, 22; CRC Arts 3, 5, 12, 16.

### 4. Article 5 - clarify pseudonymity and recovery

Current issue: cryptographic self-determination is strong, but key loss, coercion, guardianship, and
supported decision-making are not yet explicit.

Suggested additions:

> 5.x. **Pseudonymous Standing:** A natural person may use pseudonymous or context-specific
> cryptographic identifiers without surrendering rights-bearing status.

> 5.x. **Recovery and Support:** Systems must provide human-governed recovery, delegation, and
> supported decision-making mechanisms that preserve the person's will, preferences, and privacy.

Why: This makes the charter more realistic for vulnerable persons, lost keys, guardianship, and
crisis contexts without reverting to centralized identity.

### 5. Article 9 and Article 40 - add bias and disparate-impact auditing

Current issue: Cognitive Agents are classified as instruments and closed-box compliance audits are
required, but non-discrimination is only implied.

Suggested additions:

> 9.x. **Non-Discrimination Constraint:** A Cognitive Agent used in rights-affecting contexts must
> be evaluated for discriminatory outputs, disparate impact, and unauthorized proxy inference.

> 40.x. **Bias and Impact Audit:** Independent audits of closed-box models must include tests for
> bias, discriminatory routing, unequal denial of access, and rights-affecting opacity.

UN values grounding candidates: UDHR Arts 2 and 7; ICCPR Arts 2 and 26; ICERD Arts 1, 2, 5; CRPD
Art 5; ICESCR Art 2.

### 6. Article 17 - replace "absolute ownership" with custody/control language

Current issue: Article 17.2 says the human retains "absolute ownership and custody" over
Entity-Centric Datasets. The sentiment is right, but "ownership" may vary across jurisdictions and
data types. The charter can be stronger if it defines the operational rule.

Suggested direction:

> Replace or supplement "absolute ownership and custody" with: "primary human custody, control,
> portability, revocation authority, and rights-preserving governance over Entity-Centric Datasets,
> subject only to lawful, rights-compatible constraints."

Why: This avoids overclaiming while preserving the practical architecture: the human controls the
data relationship; agents receive scoped access.

### 7. Article 18 - do not reduce the right to be forgotten to ephemerality alone

Current issue: Article 18.3 says ephemerality serves as the technical mechanism for the legal "right
to be forgotten." Ephemerality is necessary, but erasure, suppression, provenance retention,
statutory records, and public-interest archives can conflict.

Suggested direction:

> Reframe ephemerality as "one technical mechanism for rights-compatible deletion, revocation,
> minimization, and retention control" rather than the sole mechanism.

Why: This preserves compatibility with multiple legal regimes and avoids turning provenance into an
accidental anti-erasure mechanism.

### 8. Article 22 - separate transparency from over-disclosure

Current issue: Article 22.2 requires prompts and parameters. That is important, but full prompt
logging may expose sensitive data, trade secrets, or third-party personal information.

Suggested addition:

> 22.x. **Protected Telemetry:** Mandatory telemetry must be sufficient for accountability while
> minimizing disclosure of sensitive Entity-Centric data. Where full prompts or inputs contain
> protected information, systems must provide hashed, redacted, escrowed, or access-controlled
> references that preserve auditability without creating a new privacy breach.

Why: The Agent Header should not become a surveillance exhaust pipe.

### 9. Article 23 - make human review accessible and non-coercive

Current strength: Article 23.2 already requires reviewable deltas.

Suggested direction:

> Adopt the accessible review packet proposal already staged in
> `20260623_142023_Codex_Part-IV-V_Accessible-Human-Review-and-Participation.md`.

Why: Human co-signing is only meaningful if the human can understand, challenge, and revoke the
proposed change.

### 10. Article 24 - distinguish ingestion, indexing, training, and transient context

Current issue: Article 24 groups model training, context generation, and database population. They
need different consent and retention rules.

Suggested addition:

> 24.x. **Processing Mode Declaration:** Automated systems must declare whether data is being used
> for transient context, durable indexing, model training, evaluation, database population, or
> downstream redistribution. Consent for one processing mode does not imply consent for another.

Why: This closes a common loophole: "we only processed it" can hide durable indexing or training.

### 11. Article 30 - reframe "public utility" as an interoperability duty

Current issue: "AI inference as a public utility" is politically and legally loaded. The intended
technical point is provider interchangeability.

Suggested direction:

> Keep the utility analogy, but clarify that compliant systems must expose inference through
> interchangeable, rights-preserving interfaces, without claiming that all inference providers are
> legally public utilities in every jurisdiction.

Why: This protects the article from avoidable legal objection while keeping the anti-lock-in rule.

### 12. Articles 35-37 - add crisis/offline enforcement language

Current strength: subgraphs, delta tracking, and Local 403 already support resilience.

Suggested addition:

> Core authorization, provenance, graph-clearance, quarantine, and rejection rules must remain
> enforceable during offline, degraded-connectivity, humanitarian, or crisis operation. A network
> outage must not silently downgrade human-rights protections.

UN values grounding candidates: Geneva Conventions and Additional Protocols for humane treatment,
family/correspondence protection, relief, and humanitarian access; refugee/statelessness instruments
for displaced-person contexts.

### 13. Article 39 - rename or define "Halt and Catch Fire"

Current issue: "Halt and Catch Fire" is vivid, but in a formal charter it needs a crisp definition
so implementers do not treat it as theatrical rather than normative.

Suggested direction:

> Define it as a named protocol: immediate suspension of automated actuation, preservation of
> evidence, quarantine of pending deltas, notification to the authorizing human, and recovery only
> through multi-factor human reauthorization.

Why: The phrase can stay, but the enforcement semantics should be impossible to miss.

### 14. Article 42 - separate local fork rights from release ratification

Current issue: Article 42 contains living document, right to fork, and decentralized ratification in
one article. Each is valid, but they are different governance acts.

Suggested direction:

> Keep Article 42 as the release-governance article, but split its subclauses into: amendment
> proposal, disposition, release ratification, local fork, and compatibility declaration.

Why: This aligns with the existing decisions/dispositions workflow and avoids conflating a local
community fork with a ratified upstream release.

## Recommended Atomic Proposal Queue

1. **Terminology cleanup:** Preamble, Articles 2 and 7; Webizen, natural person, fiduciary,
   legal personality, infrastructure operator.
2. **Consent and processing modes:** Articles 4, 17, 18, 22, 24.
3. **Vulnerable-person and supported-decision layer:** Articles 5, 17, 23, 35.
4. **Non-discrimination and bias auditing:** Articles 9, 20, 40.
5. **Remedy and explanation:** Articles 22, 23, 38, 39, 40.
6. **Crisis/offline humanitarian resilience:** Articles 29, 35, 36, 37.
7. **Article 42 governance split:** dispositions, release ratification, local fork declarations.

## What Not To Do

- Do not flatten the charter into a generic AI ethics pledge. Its strength is architectural
  enforceability.
- Do not directly merge all suggestions into the working draft. Each improvement should graduate
  into an atomic proposal with disposition.
- Do not overfit the General expression to QualiaDB terms. Keep the General track portable, and let
  Qualia carry the reference implementation.
