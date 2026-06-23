# `decisions/` — Dispositions & Adjudication

This directory is the structured space for recording **dispositions** — the formal responses to a
proposal, issue, or feedback note: *acceptance, endorsement, recommendation, partial acceptance,
denial, deferral,* and the like.

Inbound channels (`proposals/`, `suggestions-feedback/`, GitHub Issues) capture what is *submitted*.
This directory captures what is *decided or attested about it*, with provenance, so the spectrum
between "merged" and "rejected" is recorded rather than lost in a binary git merge.

> The **canonical rules** live in [`../CONTRIBUTING.md`](../CONTRIBUTING.md) → *Dispositions &
> Adjudication*. This README is the operational summary. The **machine-enforceable** ontology/SHACL
> for binding dispositions is staged as a proposal (see `proposals/*_Disposition-and-Adjudication-*`)
> and is not yet canonical.

## The disposition vocabulary

**Binding** dispositions change a proposal's canonical status and therefore **require a human
cryptographic signature** (Art. 23). A cognitive agent may *draft* or *record* one, but may **not
issue** it — machine proposes, human disposes.

| Disposition | Binding? | Meaning |
|-------------|----------|---------|
| `accepted` | ✅ binding | Accepted in full; authorizes a human-signed merge to `main` / inclusion in a release (Art. 42). |
| `partially-accepted` | ✅ binding | Named clauses accepted, others denied/deferred; must enumerate which. Usually spawns a revised atomic proposal. |
| `denied` | ✅ binding | Rejected, with reason. The proposal file remains (supersede, never delete — §7), marked. |
| `deferred` | ✅ binding | Parked, with a revisit condition or date. |
| `superseded` | ✅ binding | Replaced by a newer proposal; include the pointer. |
| `withdrawn` | ✅ binding | The originating human retracts the submission. |
| `endorsement` | ⚪ advisory | A trusted human peer/node cryptographically signs *support*. Multiple endorsements form the web of attestations (see `proposals/topics/reputation-and-accountability/`). Not itself acceptance. |
| `recommendation` | ⚪ advisory | "Request changes" — proposes modifications before a binding decision. |
| `comment` | ⚪ advisory | A recorded note (prefer the Issue thread; record here only when attached to a disposition). |
| `abstain` | ⚪ advisory | Recorded non-participation / recusal / conflict of interest. |

## How to record a disposition

1. Copy [`TEMPLATE.md`](TEMPLATE.md) into this directory.
2. **Filename:** `YYYYMMDD_HHMMSS_[Disposition]_[Target]_[Brief].md`
   e.g. `20260623_140000_Accepted_Part-IV-Multi-Agent-Provenance_ratify.md`
3. Fill the frontmatter: the `target` (proposal path / issue # / feedback file), the `disposition`
   and `binding` flag, the **provenance chain** (`originating_agent` / `relaying_agent` if an agent
   drafted or recorded it), the `deciding_human`, and — for any **binding** disposition — a
   `signature` reference.
4. Body: rationale; for `partially-accepted`, list exactly which clauses; for `deferred`, the
   revisit condition; for `superseded`, the pointer.

## Lifecycle

```
proposals/ | Issue | suggestions-feedback/   →   decisions/ (disposition)   →   human-signed merge to main / release
```

- A binding `accepted` / `partially-accepted` is what authorizes the human-signed merge (§5).
- `denied` / `deferred` / `superseded` close or park the item **without deleting it** (§7).
- `endorsement` / `recommendation` accumulate as advisory input and (for endorsements) as signed
  peer attestations feeding the reputation model.

## Collective ratification (releases)

Per-item dispositions accept *individual* proposals. Promoting accepted work into a **permanent
release** (`release/<version>/`) is a *collective* act requiring a **quorum of ratifying
stakeholders** and **rough consensus** (Art. 42). Stakeholder standing and parameters live in
[`STAKEHOLDERS.md`](STAKEHOLDERS.md); a release ratification is recorded with
[`RATIFICATION-TEMPLATE.md`](RATIFICATION-TEMPLATE.md). Only humans count toward quorum and sign;
bots participate (propose, endorse, object on merit) but never ratify. Full procedure in
[`../CONTRIBUTING.md`](../CONTRIBUTING.md) → *Release Ratification — Quorum & Rough Consensus*.

## Agent rule

An automated agent may **draft** a `recommendation` or a *provisional* `endorsement`, and may
**record** a human's decision (as `relaying_agent`). It may **not issue a binding disposition**, and
may **not ratify a release or count toward quorum**; those require a human signature (Art. 23, Art.
42). An agent-issued binding disposition or ratification without a human signature is a conduct
violation.
