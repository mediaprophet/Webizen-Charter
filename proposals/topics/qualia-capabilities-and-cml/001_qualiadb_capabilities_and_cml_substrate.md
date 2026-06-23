---
timestamp: "2026-06-23T13:00:48+10:00"
author_agent: "Claude Code (Anthropic CLI)"
model: "Claude Opus 4.8 (claude-opus-4-8)"
model_setting: "Default"
agent_jurisdiction: "AU (operator / local edge node) · US (Anthropic model inference)"
executing_human: "Timothy Charles Holborn (Charter Architect)"
target: "Cross-cutting — Parts I–VII; flagship Art. 31–33 (nquins / encoding), plus Art. 20, 23, 40, 42"
topic_scope: "QualiaDB engine capabilities; Context Markup Language (CML); the not-otherwise-available substrate for charter enforcement"
status: "Ideation"
---

> [!NOTE]
> **Provenance & authorship (charter Art. 6).** This document was *executed* by a cognitive
> agent (the tool named above) and *authored* under the direction of the human named in
> `executing_human`, who is the author of both QualiaDB and the Webizen Charter. The split
> between `author_agent` (mechanical execution) and `executing_human` (rights-bearing
> authorship) is itself the charter's Article 6 made literal. Code paths cited below (e.g.
> `crates/…`, `core-ontologies/CML_CONCEPT_GRAPH.md`) refer to the **QualiaDB repository**,
> not this charter repository.
>
> **Workflow status.** This is an *ideation* contribution staged in `proposals/topics/` per
> CONTRIBUTING.md. It is not a merge to `main`. If concepts here are approved, they should be
> spun out into atomic, single-Article Pull Requests with human cryptographic co-signature.

# 001: QualiaDB Capabilities & the CML Substrate — the Not-Otherwise-Available Layer

**How the QualiaDB engine provides capabilities — not otherwise available in a general
software stack — that the [Webizen Charter](https://github.com/mediaprophet/Webizen-Charter)
requires in order to mean what it says.**

This document is a companion to the charter's `TOC-Qualia.md`; it explains, article by
article, which existing QualiaDB mechanisms turn the charter from prose into enforced
behaviour.

---

## Why a general stack cannot carry this charter

The obvious way to "implement" the charter is: GitHub for provenance, an RDF triplestore
for the ontology, GPG for signing, and a hosted LLM API for the cognitive agents. That
arrangement satisfies the *letter* of several articles and **breaks the spirit of all of
them**, because every load-bearing decision is made on someone else's machine:

- The model runs in a vendor datacenter, so "bring the model to the data" (Art. 27) is
  inverted — the data is shipped to the model.
- The triplestore stores text/dictionary triples, so the charter's `nquin` substrate
  (Art. 31) is a metaphor, not a structure the machine can enforce on.
- SHACL runs as an offline linter, so "automated graph rejection / Local 403" (Art. 37)
  is advisory, not a firewall.
- Signing covers Git commits, not graph transactions or governance decisions, so
  "cryptographic self-determination" (Art. 5) stops at the repository boundary.

QualiaDB is built the other way around. The graph substrate, the inference engine, the
SHACL enforcement firewall, and the signing layer are **one in-process system on the
person's own device**. That co-location is the capability that is "not otherwise available
generally," and it is what the charter's enforcement articles actually need.

The clearest single proof: the charter's term **`nquin`** (Art. 31) is QualiaDB's
**`NQuin`** — the 48-byte, six-`u64`, bit-packed semantic record that is already the unit
of storage *and* the unit the GPU evaluates. The charter is not describing a structure to
be built; it is naming the structure QualiaDB already runs on.

### Two layers of consideration: general application vs. QualiaDB-specific

The charter deliberately maintains two tables of contents — `TOC-General.md` (the same 42
articles expressed in **general engineering terms**, implementable on any Git / RDF-OWL /
decentralized-DB stack) and `TOC-Qualia.md` (the **QualiaDB-specific** expression:
`nquins`, the graph substrate, Local-403 rejection). This document addresses the second
layer: the capabilities that are *not otherwise available generally* because they depend on
mechanisms QualiaDB already implements. The flagship of that layer — and the one most
under-represented until now — is **CML (the Context Markup Language)**, which is given its
own section after Part VI. CML is what lets a charter article be, simultaneously, a
human-legible document and an enforced graph; no general stack does this in one artifact.

---

## How to read the status tags

Per the charter's own Article 41 (honest accounting of MVP-stage technical debt), every
mapping below is tagged:

| Tag | Meaning |
|-----|---------|
| ✅ **Wired** | Implemented and exercised by tests / live in the engine today. |
| 🟡 **Partial** | Mechanism exists but is narrower than the article, or runs at advisory severity. |
| 🔲 **Mappable** | No code yet, but a direct, low-friction path on existing primitives. The charter artifact (e.g. the Agent-Header SHACL shape) drops straight onto QualiaDB's firewall. |

These are marked honestly rather than flatteringly; overclaiming readiness would itself
violate the charter (Art. 40) and QualiaDB's own agent-accountability rules.

---

## Capability → Article map (summary)

| QualiaDB capability | Charter articles it carries | Status |
|---------------------|------------------------------|--------|
| In-process GGUF inference, no external daemon, zero outbound in Local mode | 11, 26, 27, 30 | ✅ arch / 🟡 hosting |
| Webizen VM gates *every* inference (`validate_intent → infer → validate_output`) | 19, 20, 24 | ✅ |
| SHACL as a live enforcement firewall (deny, not lint) | 37, 38, 20, 24 | 🟡 |
| `NQuin` = the charter's `nquin` (48-byte, GPU-enumerable) | 31, 32, 33, 36 | ✅ |
| **CML** — document-as-query; verbatim-text → concept → logic in one substrate | 20, 23, 31, 32, 33, 40, 42 | ✅ pilot / 🔶 corpus |
| Native signing in-process: ML-DSA-65, Ed25519, X25519, AES-GCM, HKDF, BLAKE3 | 5, 15, 23 | ✅ (subset) |
| Credential-gated subgraphs (per-recipient ECDH-wrapped keys) | 34, 35 | ✅ |
| Agents bound to human principals; backend typology in code | 2, 3, 7, 8, 9, 10, 11 | ✅ |
| Event-driven provenance + WAL→Merkle-DAG delta chain | 20, 36 | ✅ |
| Engine audits overclaiming agents (incl. its own) | 40 | ✅ |
| Deontic / logic modalities VM-active (FORBID → Deny) | 32, 33, 37 | ✅ |
| Runs inside a 512 MB cell / 42 MB arena (affordable, edge) | 26, 27, 30 | ✅ |
| Decentralized transport: Nym mixnet, WebTorrent, DNSSEC/WireGuard | 13, 28, 29 | ✅ (subset) |

The article-by-article detail follows the charter's seven parts.

---

## Part I — Fundamental Principles & the Digital Modality

**Art. 2/3 (no personhood for software), Art. 6 (decouple authorship from execution),
Art. 7 (human as sole locus of rights).**

QualiaDB encodes this at the level of *who an agent is allowed to be*. In
`crates/qualia-client-core/src/chat_agents.rs`, every sub-agent is constructed against a
`principal_did` and the engine states plainly that *"sub-agents are not independent
participants — they act on behalf of their human principal."* A cognitive agent has no
standing of its own; its actions are always attributed to a human DID. This is the charter's
"absolute instrumentality of code" (Art. 3) as a data-model invariant, not a policy
reminder. **Status: ✅ Wired.**

**Art. 5 (cryptographic self-determination).** Signing is in-process and real:
`fiduciary_crypto.rs` provides **ML-DSA-65 (FIPS-204)** post-quantum signatures, and the
engine uses **Ed25519** for conduct/governance records and **X25519 ECDH** for key
encapsulation (`key_vault.rs`). A person's presence is rooted in keys they hold on their
own device, never in a vendor account. (Scaffold-only variants — Kyber/NTRU/SPHINCS,
RSA/ECDSA — are not yet backed; see Gaps.) **Status: ✅ Wired (subset).**

---

## Part II — The Webizen Ontology & Typology of Agents

**Art. 8/9/10 (Mechanical / Cognitive / Broker), Art. 11 (Edge vs Hosted).**

The typology is structural, not documentary:

- **Cognitive agents** run through `AgentBackend` in `llm_agent.rs`, whose three variants
  *are* the charter's edge/hosted distinction:
  `Local` (GGUF on-disk → wgpu → in-process, no outbound traffic),
  `Remote` (API via Nym mixnet, requires a signed VC), and
  `Hybrid` (local-first, falls back only with explicit principal consent).
- **Broker agents** (Art. 10) are the MCP layer (`mcp_server.rs`) — exactly the
  "MCP Clients/Hosts" the charter names.
- **Mechanical agents** (Art. 8) are the deterministic graph/logic operations.

Edge-local processing (Art. 11) is the *default*, not an option: the `Local` backend caps
at 128 MB and emits no network traffic. **Status: ✅ Wired.**

---

## Part III — The Enumerated State & Cryptographic Binding

**Art. 13 (reject centralized identity), Art. 14/15 (enumerated state from multiple
cryptographic identifiers), Art. 16/17 (agent-centric vs entity-centric datasets).**

QualiaDB's identity model is *identifiers, not identity*: an identifier is a pure handle,
and identity is the relational structure built **over** many identifiers — never a single
issued root key. This is the "enumerated state" (Art. 14): presence is the enumerable set
of a person's relations and credentials, not a row in a provider's user table. Sub-agent
DIDs are deterministically derived from `principal_did + session` (`compile_sub_agent_did`),
which is precisely the agent-centric vs entity-centric split of Art. 16/17 — the executing
mechanism gets its own derived identifier, bound to but distinct from the human entity.
**Status: ✅ Wired** for the binding primitives; the full multi-identifier "fabric of
identifiers" recovery model is an ongoing build.

**Art. 18 (temporal / ephemeral credentials).** Subgraph keys are derived per-layer and can
be wrapped per-recipient (below), giving short-lived, scoped credentials rather than
standing grants. **Status: 🟡 Partial** (issuance primitives exist; full temporal lifecycle
is in progress).

---

## Part IV — Actuation, Provenance & the Agent Header

This is the heart of the charter, and the part a general stack cannot do, because it
requires the provenance check to sit **inside** the inference call.

**Art. 19/20 (event-driven provenance), Art. 24 (no opaque modifications / no undocumented
output).** `orchestrator.rs::orchestrate_inference()` runs a mandatory three-stage cycle
for *every* model call:

1. `validate_intent(intent)` — pre-flight against the N3Logic Rights Ontology. On `Deny`,
   a conduct-violation `Quin` is written to the WAL (Ed25519-signed) and **the model is
   never invoked**.
2. `agent.infer(...)` — the actual GPU inference.
3. `validate_output(output)` — post-flight; committed output carries `provenance_quins`,
   and ungrounded output is rejected.

The result type makes this visible: an inference only reaches `OrchestrationResult::Committed`
with its `provenance_quins` attached. This is "continuous, event-driven provenance" (Art. 20)
as control flow, not telemetry bolted on afterward. **Status: ✅ Wired** for the gate;
the provenance-citation SHACL shape (`q42:InferenceIntent` → `q42:provenanceCitations ≥ 1`)
currently runs at **Warning** severity, so this specific check is advisory today — promoting
it to a hard deny is a one-line severity change. **Status of that sub-check: 🟡 Partial.**

**Art. 21/22 (the Agent Header), Art. 23 (human cryptographic co-signing).** The charter's
`SHACL-Agent-Header.md` defines a `webizen:AgentHeaderShape` requiring `executedBy`,
`modelVersion`, `executionTimestamp`, `authorizedBy`, and `cryptographicSignature`, with
`sh:closed true`. QualiaDB already has every ingredient: the SHACL compiler/firewall
(`orchestrator.rs`, `logic_modalities_shacl.rs`), the model-version/timestamp metadata on
inference, the principal-DID binding (`authorizedBy`), and in-process Ed25519/ML-DSA signing
(`cryptographicSignature`). The charter's shape is therefore **directly droppable** onto the
firewall as a `NodeShape` validated at transaction ingest. It is not yet shipped *as that
named shape*. **Status: 🔲 Mappable** (this is the single highest-value next step — see
"Implementing the Agent Header" below).

**Art. 24 (prohibition of silent upstream merging).** This is also the policy in the
charter's `ai.txt`: no ingestion for closed-model training without cryptographic human
authorization, and SHACL-gated access to ecosystem data. QualiaDB enforces the same posture
at runtime — outputs without provenance are rejected, and the engine refuses to treat a bot
action as a human merge. **Status: ✅ Wired** (runtime); repository-side enforcement is the
charter repo's Git workflow.

---

## Part V — Human-Centric Architecture & Interoperability

**Art. 25 (MCP as stateless intermediary).** `mcp_server.rs` exposes ~40 tools as a broker
surface; the broker holds no rights and no standing state of its own. **✅ Wired.**

**Art. 26/27 (decouple compute from data monopolies / bring the model to the data).** This
is QualiaDB's foundational stance and its biggest "not otherwise available" claim. The
inference stack maps GGUF weights into the OS page cache (`gguf_bridge.rs`, `memmap2`,
zero heap) and dispatches fused transformer blocks to local GPU via `wgpu`
(`shaders/fused_tensor_contraction.wgsl`) — **in the same process as the graph engine**.
The model comes to the data on the person's device; the data never leaves. There is no
Ollama, no llama.cpp server, no Python, no external daemon. **Status: ✅ Wired
(architecture); 🟡 hosting** — note honestly that some *deployed* browser demos currently
404 because model files are unhosted; the native/headless path works, the public demo path
needs the weights served. (See Gaps.)

**Art. 30 (inference as a commoditized, interchangeable utility).** The `Remote` backend
meters inference over the Nym mixnet with ILP, treating compute as a swappable utility
rather than a lock-in. The `Hybrid` backend makes the local↔remote choice the principal's,
not the vendor's. **✅ Wired.**

**Art. 28/29 (interoperability, portability of the enumerated state).** QualiaDB runs the
same engine across native, WASM/browser, and edge targets within a 512 MB "Fractal Shard"
cell and a 42 MB `SlgArena`. The enumerated state is portable because it is bit-packed
`NQuin`s plus signed credentials, not a provider-bound schema. Ontologies distribute over
**WebTorrent** webseeds and transport hardens with **DNSSEC/WireGuard**. The affordability
floor is deliberate: it runs on a phone or a camper laptop, which is what makes the
charter's anti-monopoly intent real for ordinary people rather than rhetorical. **✅ Wired
(subset).**

---

## Part VI — Qualia Encoding, nquins & the Graph Substrate

**Art. 31 (structural definition of nquins).** The `NQuin` is the canonical 48-byte record:
six `u64` fields, bit-packed, with a frame-layout registry (`frame_layout.rs`) governing the
computational bytes. URIs are interned via compile-time `q_hash()` (FNV-1a) so there is no
runtime string allocation. This is the substrate the charter's Art. 31 specifies. **✅ Wired.**

**Art. 32 (encode the charter into foundational nquins).** Because charter rules compile to
`NQuin`s and SHACL shapes, the charter is not merely *about* the system — it can be *loaded
into* it as enforced data. QualiaDB already does this for UN human-rights instruments
(`core-ontologies/`, N3 → CML → q42), the same pipeline the charter's `/un-instruments/`
anticipates. **✅ Wired** (pipeline); encoding the charter text itself is a content task.

**Art. 33 (map the ontology to graph topologies).** The Webizen ontology, deontic rules,
and rights ontology are evaluated by the VM (`webizen.rs`, `deontic_logic.rs`) — including
operational clearances expressed as SHACL/ODRL. **✅ Wired.**

**Art. 34 (bidirectional attestation handshake), Art. 35 (authorize subgraphs for bounded
cognitive processing).** This is a capability essentially absent from general RDF stacks. A
cognitive agent is handed a **cryptographically bounded slice** of the graph, not the whole
store: `key_vault.rs` derives a per-layer `SubgraphKey` (AES-256-GCM via HKDF-SHA-256) and
`encapsulate_for_recipient()` wraps that key for a specific recipient DID using ephemeral
X25519 ECDH; the recipient `decapsulate()`s it. That *is* the bidirectional attestation
handshake (Art. 34) and the bounded-subgraph authorization (Art. 35). **✅ Wired.**

**Art. 36 (state reconciliation / delta updates via nquins).** The WAL carries a 32-byte
header with `prev_dag_hash` and `checkpoint_to_dag()`, linking the write-ahead log into a
Merkle-DAG. State changes are signed, append-only deltas — exactly the delta-tracking
reconciliation Art. 36 calls for. **✅ Wired.**

---

## CML — the Context Markup Language layer (the encoding the charter needs)

This is the QualiaDB-specific capability the charter's Art. 32 ("encode the charter into
foundational nquins") actually depends on, and it has no equivalent in a general stack. Its
detailed architecture lives in the QualiaDB repository at `core-ontologies/CML_CONCEPT_GRAPH.md`;
the relevant points for the charter:

**The core move: a document *is* a query for all quins that share a context hash.** In the
`NQuin`, the fourth `u64` is the **`context`** field — a 56-bit concept/graph id. A *concept*
is simply a context hash, and a concept's sub-graph is "every quin whose `context` equals
that hash." This is the engine's native named-graph mechanism, not new machinery. The
consequence for the charter: an article does not have a separate "machine version" stored
elsewhere — the human-readable text and the enforceable graph are **the same object, masked
by one context hash**. The Sentinel VM (`webizen.rs`) evaluates a modality by masking on that
hash and firing the rules registered for it (Deontic, Temporal, Defeasible) — without loading
the rest of the graph. This is what makes the 512 MB-floor, edge-device promise (Art. 26/27)
hold for governance, not just for storage.

**The three-layer model (nanopublication-aligned) is exactly the charter's provenance
requirement.** CML separates:

- **TEXT** — the *verbatim* article text, stored cold and immutable in the front-of-file
  lexicon, recoverable from the `.q42` archive alone (verified: text round-trips verbatim).
  This is legal/admissibility fidelity and the unit of provenance — it answers Art. 20/24's
  demand that the source is never silently rewritten. **✅ Wired.**
- **CONCEPT** — a first-class node *represented natively as the context hash*, carrying SKOS
  labels and relations (`broader`/`narrower`/`closeMatch`/`exactMatch`). One concept may be
  `realized-by` many text fragments — across articles, instruments, languages. **✅** (`cml.n3`
  authored; pilot built).
- **LOGIC** — per-concept modality sub-graphs (deontic, temporal, defeasible…) bound to the
  concept's context and executed by the VM. The charter's articles become *executable norms*,
  not annotations. **✅** for the deontic path (pilot runs Active → Defeated on a defeater;
  full lib 1054/1054).

So an article like the charter's Art. 24 ("prohibition of opaque modification") can be
authored once, keep its exact wording in TEXT, bind to a CONCEPT, and carry a LOGIC sub-graph
that the firewall enforces — one CML artifact, human-legible and machine-binding. A general
Markdown-plus-triplestore stack needs (at least) two divergent files and an offline linter;
CML collapses that to one self-contained, signed, range-fetchable archive.

**The Curation Prime Directive maps 1:1 onto charter Art. 23/42 (human ratification).** CML's
load-bearing rule: *automated systems may assert only `skos:closeMatch`/`related`; only a
cryptographically-signed human action may assert `skos:exactMatch`.* "Machine proposes, human
disposes" — the machine writes a provisional, confidence-tagged proposal; a signed human
action (routed through the governance tier) is required before identity is fixed. And it is
**self-policing on the engine that already exists**: a machine-written `exactMatch` without a
ratifying signature is, by `agent-accountability.n3` (`UnsubstantiatedClaimFlag` +
`fire_guard_rules`), a conduct violation. This is the charter's "humans co-sign, bots don't
merge" (Art. 23) and "collective ratification" (Art. 42) as an enforced engine rule, not a
repository convention. **✅ Wired** (the enforcement); the proposal *heuristics* (the
Neuro-Symbolic Sieve) are a deliberately separate, later spec.

**Why this is a restoration, not an invention** — and why it matters to the charter's intent.
Typed, semantic links were *original* to the web (ENQUIRE, 1989) and dropped when the web
scaled for mass adoption; the ~2000 OWL/FOAF stack re-added semantics but with a
commercial/organizational telos baked into the *ontology* (the canonical example:
`schema:Physician` is modelled under `Place`/`LocalBusiness`, not `Person` — a doctor as a
findable location, because the paying use case was local search). Harmless as page metadata;
**structural harm** once access to healthcare, identity, and rights is mediated *through* those
definitions. CML's man-made/natural boundary (`owl:` fenced to constructed kinds;
`q42:Principal` is `rdfs:Class`, never `owl:Thing`; SHACL as the enforcement firewall) is the
one discipline that vision lacked — exactly what stops a commercial taxonomy from redefining
the given world. That is the same anti-capture, anti-flattening commitment the charter exists
to encode (Preamble; Art. 4) — CML is where it becomes mechanical.

**For the charter repo specifically:** the `un-instruments/` directory the charter stages for
machine-readable human-rights ontologies is the *same pipeline* QualiaDB already runs — 102
instruments ingested as verbatim-TEXT → CONCEPT → deontic LOGIC via the CML layer. Authoring
the charter's own articles in CML (TEXT kept verbatim, concepts curated by signed humans,
logic enforced by the VM) is the concrete realization of Art. 32, and it reuses machinery that
exists today rather than requiring anything new.

---

## Part VII — Enforcement, Compliance & Graph Rejection

**Art. 37 (automated graph rejection / Local 403), Art. 38 (malformed/unverified headers).**
The charter's "Local 403 Forbidden" is QualiaDB's deny path. SHACL is the **sole enforcement
language** and it is VM-wired: shapes produce violation reports and the deontic layer turns
an active `FORBID` into a `Deny` (verified live in `deontic_smoke.rs`). The Phase-8
bifurcated compute path can even reject *mid-generation*: a sentinel thread reading the logit
stream injects a `DenyRollback` when it detects an anomaly, so a non-compliant transaction is
stopped before resource consumption — which is the strong form of Art. 37. **Status: ✅ Wired**
for the deny mechanism; wiring the *Agent-Header* shape specifically into the reject path is
the 🔲 Mappable step.

**Art. 39 (cryptographic attribution disputes).** Attribution failures resolve against signed
records, not assertions: conduct violations are Ed25519-signed Quins in the WAL, and the
Merkle-DAG gives a tamper-evident history to adjudicate against. **🟡 Partial** — the records
exist; a formal dispute-resolution flow over them is design-stage.

**Art. 40 (auditing of model workflows / closed-box compliance).** QualiaDB does something
unusual and on-point: the engine **audits its own agents**. The agent-accountability layer
(`agent-accountability.n3`, `UnsubstantiatedClaimFlag`) flags an agent that overclaims
("done / functional / zero-heap" without proof), and trust is treated as *verified conduct,
not self-assertion*. The honesty tags in this very document are an instance of that rule.
**✅ Wired.**

**Art. 41 (technical debt in MVP standards).** Covered by the Gaps section below, in the
spirit the article asks for.

**Art. 42 (ratification, versioning, amendment).** Governance is relational and human-ratified:
the machine may *propose* (e.g. `closeMatch`), but a signed human ratifies (`exactMatch`).
QualiaDB never self-merges a governance change; ratification is a human cryptographic act.
This aligns with the charter repo's own rule that **only humans co-sign merges to `main`**.
**✅ Wired** (principle); the charter's repository ratification is its Git/GPG workflow.

---

## Implementing the charter's Agent Header on QualiaDB (the next concrete step)

The charter's `SHACL-Agent-Header.md` is the cleanest hand-off point, because QualiaDB
already has every primitive it names. Direct mapping:

| Charter field (`webizen:`) | QualiaDB source |
|----------------------------|-----------------|
| `executedBy` → `CognitiveAgent` | `AgentBackend` instance / sub-agent DID (`chat_agents.rs`) |
| `modelVersion` | model metadata carried on the inference intent |
| `executionTimestamp` (`xsd:dateTime`) | timestamp on the orchestrated call |
| `authorizedBy` → `Human` | `principal_did` binding |
| `cryptographicSignature` | Ed25519 / ML-DSA-65 over the transaction delta (`fiduciary_crypto.rs`) |
| `sh:closed true` | SHACL firewall closed-shape mode (`logic_modalities_shacl.rs`) |

The work is to register `webizen:AgentHeaderShape` as a `NodeShape` in the firewall and put
it on the transaction-ingest reject path (Art. 37). When `sh:closed` plus the five required
properties fail, the existing deny path returns the local equivalent of `403 Forbidden`
before the transaction is processed. This is hours of wiring on existing parts, not new
infrastructure — which is exactly the point of building the charter on QualiaDB.

---

## Gaps and honest technical debt (per Art. 41)

State plainly what is *not* yet true, so the charter's enforcement claims are not oversold:

- **Deployed inference demos 404.** The native/headless inference path works (verified
  small-model decode); several *published* browser demos fail because model weights are
  unhosted and one HF URL is wrong. The architecture realizes Art. 26/27; the public
  deployment does not yet.
- **Provenance-citation check is advisory.** The `q42:InferenceIntent → provenanceCitations`
  SHACL shape runs at `Warning` severity, so Art. 20's grounding requirement is currently
  encouraged, not enforced, on that path. Promotable to a hard deny.
- **Agent-Header SHACL shape not yet shipped.** All primitives exist (table above); the
  named `webizen:AgentHeaderShape` is not yet registered on the firewall.
- **Crypto subset.** Real: ML-DSA-65, Ed25519, X25519, AES-256-GCM, ChaCha20/XChaCha20,
  SHA-256/512, BLAKE3, HKDF, and a sound Groth16 ZK path. Scaffold-only:
  Kyber/NTRU/SPHINCS, RSA/ECDSA, and non-Groth16 proof systems.
- **Some platform layers simulated.** ZNS/CSD/eBPF-firewall and a few hardware paths are
  simulated, not real, despite older docs implying completeness.
- **CML proven on a pilot, not the full corpus.** The CML structure, `cml.n3`, the
  Curation Prime-Directive SHACL shape, verbatim-text recovery, and the deontic concept
  pilot are wired and passing. Not yet done: scale-out of the CONCEPT/LOGIC layers across
  all 102 instruments, the Web-Annotation (`oa:`) realization selectors at scale, temporal
  (Allen/LTL) bounds, and the SHACL compliance-shape firewall over the whole corpus. The
  `closeMatch` proposal heuristics (Neuro-Symbolic Sieve) are an intentionally separate spec.

None of these undercut the central claim: the substrate the charter names already exists,
runs on a person's own affordable hardware, and enforces governance in-process. The
remaining work is wiring and hosting, not invention.

---

## A note on governance and this file

This document was *executed* by a cognitive agent under Timothy Holborn's direction; he is the
author of QualiaDB and the Webizen Charter. In keeping with charter Art. 42 and the charter
repository's contribution rules, this file is **staged as an ideation contribution in
`proposals/topics/`** — it has not been merged or pushed to `main` by an agent. Promotion of
any concept here into the canonical charter should follow the charter's own workflow:
fork → atomic, single-Article pull request → human cryptographic co-signature on merge to
`main`. That is the charter governing the act of describing it — which is the whole idea.
