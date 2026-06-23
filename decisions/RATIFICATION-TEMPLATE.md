---
timestamp: "YYYY-MM-DDTHH:MM:SS±hh:mm"
record_type: "ratification"
ratifies_version: "[the SemVer being cut, e.g. 0.0.2]"
supersedes_version: "[the prior release version, if any]"
consensus_method: "rough-consensus"
quorum_required: "[from decisions/STAKEHOLDERS.md]"
quorum_present: "[count of ratifying human stakeholders who participated]"
includes_proposals:
  - "proposals/<file>.md   # each must already hold an `accepted` disposition"
steward: "[the human who judged rough consensus]"
ratified_by:               # humans only; >= quorum_required; each with a signature
  - human: "[name / DID]"
    signature: "[GPG/SSH/Ed25519 reference]"
relaying_agent: "[agent that compiled/recorded this record, if any]"
---

# Ratification of release [version]

## Bundle
[List the accepted proposals being promoted, each with its `decisions/` acceptance record.]

## Quorum
[quorum_required vs quorum_present — state plainly whether quorum was met.]

## Objection log (rough consensus)
| # | Objection | Raised by (human/agent) | Severity | Status |
|---|-----------|-------------------------|----------|--------|
| 1 | … | … | blocking / substantive / minor | addressed / withdrawn / open |

Rough consensus requires that **no blocking objection remains `open`** — objections are resolved on
merit (RFC 7282 style), not out-voted. A valid technical objection from an *advisory* stakeholder
(including a bot) must still be addressed.

## Determination
[The steward's recorded determination that rough consensus is established and quorum met.]

## Action authorized
[Cut `release/<version>/` (immutable), bump SemVer, update `CHANGELOG.md`. This is the permanent update.]
