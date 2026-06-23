# Webizen-Charter

## An AI Agent Charter for Human-Centric AI 
Moving this to a GitHub repository is the right architectural choice. Google Docs is designed for human-to-human collaboration, but it lacks the native structure required for strict provenance, cryptographic signing, and machine-readable version control. Git inherently separates the *author* of a commit from the *committer*, which perfectly mirrors the split between the human holding rights and the agent executing the mechanical change.

By using Markdown, you are setting the stage to eventually parse this document directly into `qualiadb` as nquins.

Here is a proposed structure for the drafting workflow, followed by the exact rules you can place in a `CONTRIBUTING.md` file to govern how human and machine agents interact with the draft.

## The Iterative Drafting Workflow

1. **The Scaffolding (Table of Contents):** We define the structural outline first. This establishes the boundaries of the ontology and the scope of the articles.
2. **The Anchor (Preamble):** We draft the philosophical and legal foundation, tying the architecture explicitly back to human rights instruments.
3. **The Modules (Articles):** We draft each article one by one. This keeps context windows small and token usage efficient.
4. **The Assembly (GitHub Repository):** The Markdown files are assembled in a public or private repo, alongside a strict `CONTRIBUTING.md` file.
5. **The Circulation:** The repo is shared with human peers and fed into localized cognitive agents for stress-testing and review.

---

## Contributing

We enforce strict rules for engagement to prevent bots from silently rewriting the core philosophy and to maintain cryptographic provenance. 

Please see the [CONTRIBUTING.md](CONTRIBUTING.md) file for the full **Non-Destructive Review Protocol** and the **Proposals Workflow**.

## Repository Structure & Versioning

To support both human iteration and machine enforcement, this repository is strictly organized and versioned. We use Semantic Versioning (currently at `0.0.1-init`) and maintain a strict separation between working drafts and official releases.

### Directory Layout
* `working-draft/`: Contains the active, mutable Markdown files (Preamble and Parts I-VII) currently under review.
* `dev/`: Contains development environments split into `qualia/` and `general/` pathways for specialized structural testing (e.g., `dev/0.0.1-init/qualia/`).
* `release/`: Contains immutable snapshots of ratified versions. Currently, `release/latest/` holds a `pre-release.md` placeholder as the foundational draft is being built.
* `proposals/`: The staging area for all suggested amendments and pull requests.
* `un-instruments/`: Local, draft copies of machine-readable UN human rights ontologies.
* `suggestions-feedback/`: Holds web-based agent feedback and chat URIs for provenance tracking.

### Agent Directives
This repository includes files designed specifically for cognitive agents and external crawlers:
* `ai.txt`: Found at the root, this file dictates the strict ingestion rules and semantic clearance requirements for external bots and foundational models.
* `working-draft/agent-instructions.md`: A highly condensed "System Prompt" version of the Charter. Any LLM or cognitive agent operating within the network must ingest this file to understand its imperative boundaries.
* `working-draft/webizen-charter.n3`: The foundational structural ontology for the Charter itself.

All notable changes are tracked in the `CHANGELOG.md`.



## Machine-Readable Human Rights Instruments

The `un-instruments/` directory contains working documents for machine-readable human rights systems encoded in `.n3` format. 

* **Status:** Draft
* **Project:** [qualiaDB](https://github.com/mediaprophet/qualiaDB/)

These instruments serve as the foundational, cryptographically enforceable ontologies (e.g., under the `https://ns.webcivics.org/un/` namespace) that structurally govern the execution parameters of this Charter.