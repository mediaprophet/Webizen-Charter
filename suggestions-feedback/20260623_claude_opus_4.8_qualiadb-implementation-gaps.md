---
timestamp: "2026-06-23T13:05:13+10:00"
author_agent: "Human via Claude Code (Anthropic CLI)"
model: "Claude Opus 4.8 (claude-opus-4-8)"
model_setting: "Default"
chat_uri: "N/A — local Claude Code CLI session; no shareable web URI exists for this agent type"
companion_document: "proposals/topics/qualia-capabilities-and-cml/001_qualiadb_capabilities_and_cml_substrate.md"
---

# Feedback: QualiaDB Implementation Gaps Against the Charter's Claims

**Provenance note.** Unlike a web-based LLM session, this was a local Claude Code CLI session
operating on the human architect's machine, so there is no shareable `chat_uri` to link. The
provenance anchor for these insights is the companion topic document
[`proposals/topics/qualia-capabilities-and-cml/001_qualiadb_capabilities_and_cml_substrate.md`](../proposals/topics/qualia-capabilities-and-cml/001_qualiadb_capabilities_and_cml_substrate.md),
of which this is the honest "technical debt" extract (charter Art. 41).

**Scope.** These are gaps in the **QualiaDB implementation** relative to the capability claims
made for it — *not* gaps in the charter text itself. They are recorded here so that the
mapping of charter articles to running code is never oversold (charter Art. 40, and QualiaDB's
own agent-accountability rule that trust is verified conduct, not assertion). Tags:
✅ Wired · 🟡 Partial · 🔲 Mappable (path exists, not yet built).

---

## The problems (punch-list)

| # | Problem | Charter article(s) at stake | Current state | Remediation | Effort |
|---|---------|------------------------------|---------------|-------------|--------|
| 1 | **Deployed inference demos return 404.** Native/headless inference works (verified small-model decode), but several *published* browser demos fail — model weights are unhosted and one Hugging Face URL is wrong. | 26, 27 (bring model to data) | 🟡 arch ✅ / hosting broken | Host the GGUF weights at a stable URL; fix the HF link; re-verify the public demo path end-to-end. | Low (ops) |
| 2 | **Provenance-citation check is advisory, not enforced.** The `q42:InferenceIntent → provenanceCitations ≥ 1` SHACL shape runs at `Warning` severity, so ungrounded output is discouraged but not rejected on that path. | 20 (event-driven provenance), 24 (no undocumented output) | 🟡 Partial | Promote the shape from `ShaclSeverity::Warning` to a hard deny on the reject path. | Trivial (≈1 line) |
| 3 | **The charter's `webizen:AgentHeaderShape` is not shipped as such.** Every primitive exists (`executedBy`/`modelVersion`/`executionTimestamp`/`authorizedBy`/`cryptographicSignature`, `sh:closed`), but the named NodeShape is not yet registered on the firewall. | 21, 22, 23 (Agent Header + co-signing), 37/38 (rejection) | 🔲 Mappable | Register `webizen:AgentHeaderShape` as a `NodeShape` in the SHACL firewall and place it on the transaction-ingest reject path. | Low (hours) |
| 4 | **Crypto coverage is a subset.** Real: ML-DSA-65, Ed25519, X25519, AES-256-GCM, ChaCha20/XChaCha20, SHA-256/512, BLAKE3, HKDF, sound Groth16. Scaffold-only (enum variants, no backend): Kyber/NTRU/SPHINCS, RSA/ECDSA, non-Groth16 proof systems. | 5, 15, 23 (cryptographic self-determination / signing) | ✅ subset | Either implement the scaffold variants behind real backends or remove the unbacked enum variants so the surface matches reality. | Medium |
| 5 | **Some platform layers are simulated, not real.** ZNS / CSD / eBPF-firewall and a few hardware paths are simulated despite older docs implying completeness. | 26, 27 (edge architecture), 37 (perimeter enforcement) | 🟡 simulated | Correct the stale docs now; schedule real backends per target platform. | Medium–High |
| 6 | **CML is proven on a pilot, not the full corpus.** Structure, `cml.n3`, the Curation Prime-Directive SHACL shape, verbatim-text recovery, and the deontic concept pilot are wired and passing (lib 1054/1054). | 31, 32, 33 (encoding / graph topology), 20 (provenance) | ✅ pilot / 🔶 corpus | Scale CONCEPT/LOGIC across all 102 instruments; add Web-Annotation (`oa:`) realization selectors at scale, temporal (Allen/LTL) bounds, and the corpus-wide SHACL compliance firewall. | High |
| 7 | **`closeMatch` proposal heuristics are unspecified.** The Curation Directive is enforced (machine may only propose; signed human disposes), but *how* a machine proposes a `skos:closeMatch` (vector thresholds, evidence) is an intentionally separate, unwritten spec. | 42 (ratification), 40 (auditing) | 🔲 deferred | Author the "Neuro-Symbolic Sieve" spec as a distinct policy/tuning document. | Medium |

---

## Recommended next actions

1. **Quick wins first (items 2 & 3).** Promoting the provenance shape to a hard deny and
   registering `webizen:AgentHeaderShape` on the reject path together convert the two weakest
   links (Art. 20/24 and Art. 21–23/37) from "claimed" to "enforced," for a few hours of work
   on existing parts. These are the highest value-to-effort items.
2. **Fix the public face (item 1).** The 404'd demos are the most visible credibility gap for
   an initiative meant to engage outside parties; hosting the weights is ops, not engineering.
3. **Correct stale docs (item 5) immediately**, independent of the engineering schedule, so no
   reader is misled about ZNS/CSD/eBPF status.
4. **Stage the canonical CML amendment.** A separate, *atomic* `proposals/` entry should
   propose adding a CML article to `TOC-Qualia.md` Part VI — distinct from the cross-cutting
   ideation doc — so the encoding mechanism (Art. 32) is named in the charter itself.

---

## What these gaps do *not* undercut

None of the above changes the central claim of the companion document: the substrate the
charter names already exists, runs on a person's own affordable hardware, and enforces
governance in-process. The remaining work is **wiring and hosting, not invention** — and
recording it honestly here is itself the behaviour the charter (Art. 40/41) and QualiaDB's
agent-accountability layer require.
