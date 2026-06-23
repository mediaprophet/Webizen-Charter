# Stakeholder Registry & Ratification Parameters

This file defines **who has standing** in release ratification and **the parameters** (quorum,
consensus method) that gate a permanent update to `release/`. It is the human-curated roster the
quorum calculation reads against. Canonical rules: [`../CONTRIBUTING.md`](../CONTRIBUTING.md) →
*Release Ratification — Quorum & Rough Consensus*.

## Standing — subject to human rule (Art. 7)

| Class | Who | Standing |
|-------|-----|----------|
| **Ratifying stakeholder** | A rights-bearing **human** with a cryptographic identifier | Counts toward **quorum**; may sign a ratification; may serve as steward. |
| **Advisory stakeholder** | A cognitive/mechanical **agent**, or an unverified party | May propose, endorse, and **raise objections** (which must be addressed on merit) — but holds **no** ratifying standing, signs nothing binding, and is never counted toward quorum. |

Bots are welcome stakeholders; they are simply not *ratifying* ones. No agent objection is ignored;
no agent signature ratifies. **Humans rule.**

## Ratification parameters (architect-set)

```yaml
consensus_method: rough-consensus      # RFC 7282 style — objections addressed on merit, not vote-counting
quorum_required: 1                     # minimum RATIFYING (human) stakeholders that must participate
blocking_objection_policy: must-be-addressed-or-withdrawn   # no open blocking objection may remain
steward_default: "Timothy Charles Holborn (Charter Architect)"
```

> **Bootstrap honesty (Art. 41).** At `0.0.1-init` there is effectively **one** ratifying human
> stakeholder (the architect), so `quorum_required: 1` and "rough consensus" degenerates to the
> architect's signed ratification. The mechanism is defined now so it *scales* as additional human
> stakeholders register — `quorum_required` should rise accordingly. Changing these parameters is
> itself a binding, human-signed decision (record it in `decisions/`).

## Ratifying stakeholders (the roster)

<!-- One human per row. Add via a human-signed disposition; never auto-add an agent here. -->

Declare each stakeholder's **capacity** (see `../CONTRIBUTING.md` → *Submission capacity & selective
disclosure*). A `natural-person` may use selective disclosure (identifier may be pseudonymous;
jurisdiction optional). An `entity-agent` **must** disclose the entity, its type, and its
jurisdiction — undisclosed government/corporate influence on ratification is exactly the capture this
roster exists to prevent.

| Stakeholder | Capacity | On behalf of (entity + type + jurisdiction) | Cryptographic identifier | Added (signed) |
|-------------|----------|---------------------------------------------|--------------------------|----------------|
| Timothy Charles Holborn (Charter Architect) | natural-person | — (own standing) | _to be recorded_ | bootstrap |

## Advisory stakeholders (agents & unverified parties)

<!-- Agents that participate. No ratifying standing. -->

| Stakeholder | Identifier / model version | Role |
|-------------|----------------------------|------|
| _(none registered yet)_ | | |
