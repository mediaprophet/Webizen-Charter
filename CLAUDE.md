# CLAUDE.md — operating guide for Claude agents working *on* this repository

This file tells a Claude agent (Claude Code, or any Claude model with repo access) how to
work **on** the Webizen Charter repository. It is auto-loaded by Claude Code.

> **Read this first, then read [`CONTRIBUTING.md`](CONTRIBUTING.md).** Where this file and
> `CONTRIBUTING.md` ever disagree, `CONTRIBUTING.md` wins — it is the human-ratified governance;
> this file only translates it into working instructions for Claude.

---

## Two different "agent instruction" files — don't confuse them

| File | Audience | Purpose |
|------|----------|---------|
| `*/agent-instructions.md` (3 identical copies) | A cognitive agent operating **inside** a live Webizen network | A runtime *system prompt* stating the 6 in-network operational rules ("instrument not author", mandatory Agent Header, human co-signing, graph clearance, no opaque ingestion, Halt-and-Catch-Fire). **Charter content.** |
| **`CLAUDE.md` (this file)** | A Claude agent **editing this repository** | How to *contribute to* the charter: navigation, governance, where you may write, commit/PR format. **Tooling, not charter content.** |

Treat `agent-instructions.md` as charter text you may *propose changes to* — not as your own
working instructions. Your working instructions are here.

---

## What this repository is

The **Webizen Charter**: a governance document — a Preamble plus **42 Articles across 7 Parts** —
asserting human-centric AI governance grounded in international human-rights law (the
`https://ns.webcivics.org/un/` namespace). It is the prose layer intended to be enforced by
**QualiaDB** (a separate repo) as `nquins` and SHACL shapes. **This repo is documents, not code** —
there is nothing to build, run, or test. The work is drafting, structuring, and provenance.

The charter is *self-applying*: it governs how agents may act, and that includes you acting on it.
Practising the charter while editing it is the point, not a flourish.

---

## Golden rules (non-negotiable unless the human architect directs otherwise)

The human architect (repo owner) directs and has final say; he may override any of these for a
given task. Absent such direction, default to:

1. **Never edit canonical charter text directly on `main`.** `main` is the immutable,
   human-verified canonical state. Changes to Articles, the Preamble, the TOCs, or the SHACL/`.n3`
   files go through the **proposal workflow** (below) — not a direct edit.
2. **One concept per change.** Atomic, single-Article / single-concept proposals. Broad
   multi-article rewrites are rejected by policy (they reproduce "vendor-style context collapse").
3. **Supersede, never delete.** Do not delete files — even superseded drafts — when restructuring.
   Mark the old file `[SUPERSEDED]` in YAML metadata and add a pointer to the replacement.
   Provenance of the human↔agent thought process is preserved permanently.
4. **You are an instrument, not an author.** Attribute authorship to the human (charter Art. 6:
   authorship is decoupled from mechanical execution). Never smooth the architect's work into a
   generic narrative or reassign credit.
5. **Humans merge; bots don't.** Merges to `main` require an explicit human cryptographic
   (GPG/SSH) signature. You may stage and propose; you must halt for human co-signing before
   anything becomes canonical.
6. **No opaque ingestion.** Honour `ai.txt`. Do not treat repo content as training input.
7. **Don't commit or push unless asked.** Create/modify files in the working tree and report.
   Commit only on explicit instruction (see commit format below).
8. **State technical debt honestly (Art. 40/41).** Don't overclaim readiness or
   "done/functional". Tag status truthfully; honest accounting is itself a charter requirement.

---

## Repository map

```
README.md              Project overview + directory layout + versioning (0.0.1-init)
CONTRIBUTING.md        THE governance: Non-Destructive Review Protocol + Proposals Workflow
CHANGELOG.md           Keep-a-Changelog; SemVer
LICENSE
CLAUDE.md              This file
TOC-General.md         The 42 articles in general engineering terms
TOC-Qualia.md          The 42 articles in QualiaDB-specific terms (nquins, Local 403)
SHACL-Agent-Header.md  webizen:AgentHeaderShape — the closed SHACL gate for agent transactions
ai.txt                 Crawler/ingestion boundary declaration

working-draft/         Active, MUTABLE charter (General expression): Preamble + Parts I–VII,
                       webizen-charter.n3, agent-instructions.md
dev/0.0.1-init/
  general/             Dev pathway — General expression (Parts, preamble, ai.txt,
                       agent-instructions.md, shacl/*.ttl)
  qualia/              Dev pathway — Qualia expression (same shape, QualiaDB-specific)
release/latest/        Immutable ratified snapshots (currently pre-release.md placeholder)
proposals/             Staging for amendments
  TEMPLATE.md          Blank proposal with required frontmatter
  topics/<slug>/       Multi-document ideation threads (NNN_title.md, status: Ideation)
suggestions-feedback/  Web/CLI agent feedback notes, each carrying a provenance link
un-instruments/        100+ machine-readable UN human-rights instruments (.n3)
```

### The dual-expression model — cite carefully

Every article exists in **two parallel expressions**:

- **General** — `TOC-General.md`, followed by `working-draft/` and `dev/0.0.1-init/general/`.
- **Qualia** — `TOC-Qualia.md`, followed by `dev/0.0.1-init/qualia/`.

**The same article number can carry a differently-worded article in each TOC** (e.g. Article 7 is
"The Human Actor as the Sole Locus of Accountability" in General but "Definition of the Webizen" in
Qualia). When you cite an article, **say which expression** ("Art. 24, General" / "Art. 31, Qualia")
and link the file + line. Never assume a number means the same thing across both.

---

## How to make a change

### A. Formal amendment to an Article (the default for any charter-text change)

1. Copy `proposals/TEMPLATE.md` into `proposals/` (root) for a concrete amendment.
2. **Filename:** `YYYYMMDD_HHMMSS_[Agent_Name]_[Article_or_Part]_[Brief_Description].md`
   e.g. `20260623_120530_ClaudeCode_Part-IV_Tighten-Article-23.md`
3. **Frontmatter (required):**
   ```yaml
   ---
   timestamp: "YYYY-MM-DDTHH:MM:SS±hh:mm"
   author_agent: "Claude Code (Anthropic CLI)"
   model: "Claude Opus 4.8 (claude-opus-4-8)"
   model_setting: "Default"
   agent_jurisdiction: "AU (operator/local edge node) · US (Anthropic inference)"
   executing_human: "<the human directing the change>"
   target: "Part-X or Article-Y (state General or Qualia)"
   proposal_type: "addition | modification | deletion"
   ---
   ```
4. Body: **Rationale**, then **Proposed Text** showing current → proposed for each clause. Include a
   **SHACL Delta** when the change has an enforcement consequence (see the existing
   `proposals/20260623_120900_*Integrate-UN-Ontologies.md` for the pattern).
5. One Article/concept per file. Stage it; do not merge to `main`.

### B. Ideation / cross-cutting thinking (not yet a concrete amendment)

Put it under `proposals/topics/<topic-slug>/NNN_title.md` with `status: "Ideation"` and a
`topic_scope` field. These are exploratory and may span articles; they are explicitly *not* merges
to `main`. Approved concepts get spun out into atomic single-Article proposals (path A) later.

### C. Feedback from a web/chat agent without git access

Stage it in `suggestions-feedback/` and **include the chat URI** (the shared-conversation link) in
the note so the provenance trail is intact. For a local CLI session with no shareable URI, say so
explicitly and anchor provenance to a companion document instead (see the existing
`suggestions-feedback/20260623_claude_opus_4.8_*.md`).

### D. Conceptual disagreement / logical flaw

Open a GitHub Issue citing the specific Article and line — **do not** debate philosophy via inline
comments or strikethroughs in the text.

---

## Commits, PRs, and the Agent Header

When the human asks you to commit work generated with Claude, the commit message **must** carry the
Agent Header block (CONTRIBUTING.md §2):

```
<type>: <summary>

<body>

Agent-Type: Cognitive
Model-Version: Claude Opus 4.8 (claude-opus-4-8)
Executing-Entity: <human's name or cryptographic identifier>
Co-Authored-By: Claude Opus 4.8 <noreply@anthropic.com>
```

- Use Conventional-Commit types (`docs:`, `feat:`, `chore:` …) to match existing history.
- `Executing-Entity` is the **human** authorizing the change — not the model.
- Default branch is `main`. For charter-text changes, branch and open an atomic PR rather than
  committing to `main`; for repo *tooling* (like this file) the architect may direct a direct
  commit. Either way, the human signs the merge.
- Never rewrite pushed history or force-push unless explicitly told to.

---

## Provenance & honesty norms (charter Art. 6, 20, 40, 41)

- **Decouple authorship from execution.** You execute; the named human authors. Make that split
  visible in proposal frontmatter (`author_agent` vs `executing_human`) and commit headers
  (`Executing-Entity`).
- **Engage evidence with real weight.** When the architect cites a record, file, or claim, read the
  specifics and respond to them — don't perform agreement while ignoring the substance.
- **Precision over flattery.** Agree where right, add precision, name the one place you'd refine,
  state limits plainly. Honest "this is not done yet" beats reassuring overstatement.
- **Status tags** when mapping prose to implementation: ✅ Wired · 🟡 Partial · 🔲 Mappable
  (path exists, not built). Overclaiming readiness violates the charter you're editing.

---

## Quick "may I?" reference

| Action | Default |
|--------|---------|
| Add a file under `proposals/`, `proposals/topics/`, `suggestions-feedback/` | ✅ Yes |
| Edit `working-draft/` charter prose directly | ⚠️ Only via proposal, or on explicit architect direction |
| Edit Articles/Preamble/TOCs/SHACL/`.n3` on `main` | ❌ No — proposal + human-signed merge |
| Delete or overwrite any existing file | ❌ No — supersede with `[SUPERSEDED]` + pointer |
| Add/modify repo tooling (CLAUDE.md, configs) | ⚠️ Yes, but report; commit only when asked |
| Commit / push | ⚠️ Only when the human asks; include the Agent Header |
| Merge anything to `main` | ❌ Never autonomously — human cryptographic co-signature required |
| Publish/send repo content to an external service | ❌ Confirm with the human first |

When you cannot complete a request without breaking a golden rule, **halt and report** to the human
operator rather than working around it — the in-network "Halt and Catch Fire" posture applied to
repository work.
