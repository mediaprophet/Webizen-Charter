---
timestamp: "2026-06-23T14:20:20+10:00"
relaying_agent: "Codex (GPT-5)"
model_setting: "Default"
agent_jurisdiction: "Local workspace timezone Australia/Sydney; OpenAI inference jurisdiction undisclosed"
executing_human: "Timothy Charles Holborn (Charter Architect)"
submission_capacity: "natural-person"
target: "Cross-cutting repository review: README, CONTRIBUTING, working-draft, dev tracks, proposals, decisions, issue templates, and sampled UN instruments"
topic_scope: "Repository architecture; charter governance; dual-expression parity; validation readiness; human-rights grounding"
status: "Ideation"
---

# 001: Comprehensive Repository Review

> This is an ideation review staged under `proposals/topics/`. It is not a binding disposition and
> does not change canonical charter text. Concrete amendment candidates are split into atomic
> proposal files.

## Review method

I reviewed the repository structure and the governing instructions first: `README.md`,
`CONTRIBUTING.md`, `CLAUDE.md`, `ai.txt`, the issue templates, `decisions/`, `proposals/`, and
`suggestions-feedback/`.

I then read the charter spine: both TOCs, the working-draft preamble and Parts I-VII, the
`working-draft/webizen-charter.n3` ontology stub, the standalone Agent Header shape, and a sample of
the General/Qualia SHACL files. For the UN corpus, I sampled `udhr.n3`, `international-covenant-
civil-and-political-rights.n3`, `international-covenant-economic-social-and-cultural-rights.n3`,
and `convention-rights-persons-disabilities.n3`, then checked namespace usage across the corpus
without loading every instrument into context.

## High-level assessment

The repository has a strong architecture for a human-centric AI charter because it is not just a
normative document. It is already becoming a governance substrate:

- The drafting process mirrors the charter's own principles: agents propose, humans dispose.
- Provenance is treated as a first-class requirement rather than a commit-message afterthought.
- The split between working drafts, proposals, decisions, release material, and UN instruments is
  conceptually sound.
- The charter has a real enforcement theory: Agent Headers, graph clearance, SHACL rejection,
  ratification records, and human cryptographic co-signing.
- The UN corpus is practical RDF/N3 material rather than symbolic citation furniture.

The main risk is not lack of ambition. It is traceability drift: the project now has several
parallel surfaces that must stay synchronized as the charter matures.

## Strengths

1. **Human/instrument boundary is load-bearing.** Articles 1-7, 19-24, and the proposal workflow all
   reinforce the same theory: software agents can execute but cannot become authors, rights-bearers,
   ratifiers, or liability sinks.

2. **The governance workflow is unusually coherent.** `proposals/`, `decisions/`, issue templates,
   ratification templates, stakeholder records, and the non-deletion rule create a durable audit
   path for human-agent drafting.

3. **The dual-track model is the right architectural direction.** A General expression lets the
   charter apply beyond QualiaDB; a Qualia expression can become the reference implementation for
   nquin/SHACL enforcement.

4. **The UN instruments can support real semantic grounding.** The sampled files carry instrument
   nodes, article fragment IRIs, source URLs, article text, and heuristic deontic classes such as
   `values:Right`, `values:Prohibition`, `values:Obligation`, and `values:Undertaking`.

5. **Existing proposals cover the obvious first hardening layer.** Multi-agent provenance, selective
   disclosure, UN corpus binding, dispositions, and ratification quorums are already staged.

## Priority findings

1. **Dual-expression parity is currently scaffolded, not expressed.** The General and Qualia TOCs
   describe intentionally different expressions, but the Markdown files under `working-draft/`,
   `dev/0.0.1-init/general/`, and `dev/0.0.1-init/qualia/` are byte-identical. The General and
   Qualia SHACL files are also byte-identical. That is fine for `0.0.1-init`, but it should be made
   explicit: either the Qualia track is a synchronized placeholder, or each article needs a
   machine-readable crosswalk explaining where Qualia-specific terms differ.

2. **The charter still references `/un/` while the corpus uses `/values/`.** The sampled UN files
   consistently publish instrument terms under `https://ns.webcivics.org/values/`. The charter,
   README, agent instructions, and ontology stub still cite `https://ns.webcivics.org/un/`. Existing
   proposal `20260623_132940_*_Bind-And-Map-UN-Instrument-Corpus.md` correctly identifies this; it
   should be high-priority because it affects imports, trust boundaries, and graph resolution.

3. **Canonical assembly is not yet defined.** `working-draft/webizen-charter.n3` maps only the first
   two articles and says further articles will be mapped later. `release/latest/pre-release.md` is a
   placeholder. There is not yet a manifest that says which files, shapes, proposals, decisions, and
   instrument versions compose a release candidate.

4. **Agent Header enforcement is split across several surfaces.** There is a standalone
   `SHACL-Agent-Header.md`, a Part IV SHACL shape in both dev tracks, and proposals extending the
   header. A closed-world shape needs one canonical registry plus conformance fixtures, or future
   proposals may add fields that one validator accepts and another rejects.

5. **"Agent" is overloaded across namespaces.** In the UN corpus, `values:Agent` appears to mean a
   duty-bearer or actor under a rights instrument. In the charter, `webizen:CognitiveAgent`,
   `webizen:BrokerAgent`, and `webizen:DeterministicAgent` mean software instruments. This should be
   explicitly mapped to prevent accidental inference from "treaty duty-bearer" to "software
   personhood."

6. **Some legal claims should be framed as charter-operational effects.** Phrases such as "legally
   void," "absolute ownership," and "public utility" are valuable as aspirations, but they may read
   as jurisdiction-independent legal conclusions. The charter can stay strong by saying compliant
   systems must treat malformed outputs as void, must preserve human custody claims, or must expose
   inference as an interchangeable utility interface.

7. **Accessibility is implicit but not yet structural.** Article 23 requires intelligible deltas,
   and Part VI requires human-readable graph schemas, but the charter should explicitly say that
   human review, co-signing, dispute resolution, and graph explanations must be accessible to humans
   with different sensory, cognitive, linguistic, and assistive-technology needs.

8. **No visible proposal status index exists yet.** The repository has proposal files and a
   disposition vocabulary, but no dashboard or manifest showing whether each proposal is ideation,
   recommended, accepted, deferred, superseded, or ready for ratification.

9. **`ai.txt` advertises `/shacl/`, but the actual SHACL paths are nested.** The root file says
   `Allow: /shacl/`; the repository currently stores shapes under
   `dev/0.0.1-init/{general,qualia}/shacl/`. A crawler or agent following literal paths may not find
   the intended shapes.

10. **The UN corpus needs a curation status layer.** The sampled instruments state that deontic
    typing is heuristic and pending review. Some article extraction appears to include structural
    headings or preamble text inside early article nodes. That is acceptable if marked as draft, but
    semantic grounding should record curation confidence and human ratification status per mapping.

## Atomic proposal slate created from this review

1. `proposals/20260623_142021_Codex_Part-II-VI_Dual-Expression-Term-Registry.md`
   - Create a controlled term registry and a General/Qualia crosswalk so identical article numbers
     cannot drift or accidentally conflate humans, legal personalities, software agents, and treaty
     duty-bearers.

2. `proposals/20260623_142022_Codex_Part-IV-VII_SHACL-Conformance-Fixtures.md`
   - Add a conformance fixture and validation manifest layer for Agent Header, Local 403, closed
     SHACL, ratification, and malformed-header behavior.

3. `proposals/20260623_142023_Codex_Part-IV-V_Accessible-Human-Review-and-Participation.md`
   - Make accessibility and effective human review explicit requirements for co-signing, deltas,
     graph explanations, and participation.

## Suggested triage order

1. Ratify or revise the `/values/` namespace and UN corpus binding proposal first.
2. Establish the term registry and dual-expression crosswalk before substantial Qualia-specific
   wording is added.
3. Consolidate the Agent Header shape and add conformance fixtures.
4. Add accessibility/effective review requirements before formal release ratification.
5. Create a release manifest and proposal-status index before cutting a permanent SemVer release.

## Open questions for human review

- Should `dev/0.0.1-init/qualia/*.md` eventually contain Qualia-specific prose, or should Qualia
  divergence live only in TOC, SHACL, and CML/N3 artifacts?
- Should `https://ns.webcivics.org/un/` remain as an alias that imports `/values/`, or should the
  charter fully rename the normative namespace to `/values/`?
- Should the first release ratification bundle include all existing ClaudeCode proposals, or should
  namespace binding and Agent Header consolidation be handled as a smaller bootstrap release?
