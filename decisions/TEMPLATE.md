---
timestamp: "YYYY-MM-DDTHH:MM:SS±hh:mm"
disposition: "[accepted | partially-accepted | denied | deferred | superseded | withdrawn | endorsement | recommendation | comment | abstain]"
binding: "[true | false]"   # true for accepted/partially-accepted/denied/deferred/superseded/withdrawn — requires a human signature
target: "[proposals/<file>.md | issue #N | suggestions-feedback/<file>.md]"
target_concept: "[Part-X / Article-Y (General | Qualia)]"
originating_agent: "[Agent + version that DRAFTED this disposition text, or 'Human'. Omit if same as relaying_agent]"
originating_source: "[Chat URI / URL for the originating content, if any]"
relaying_agent: "[Agent + version that RECORDED this into the repo. Omit if a human did it directly]"
deciding_human: "[Human issuing the disposition — REQUIRED for any binding disposition]"
signature: "[GPG/SSH/Ed25519 signature reference over this disposition — REQUIRED for any binding disposition]"
supersedes: "[path to a prior disposition this replaces, if any]"
---

# Disposition: [accepted | denied | …] — [target title]

## Decision
[State the disposition plainly. For `partially-accepted`, enumerate exactly which clauses are
accepted, denied, or deferred. For `endorsement`/`recommendation`, state the scope of support or the
changes requested.]

## Rationale
[Why. Cite the specific Article/clause and expression (General / Qualia) where relevant.]

## Conditions / Next step
[For `deferred`: the revisit condition or date. For `partially-accepted`: the revised atomic proposal
to be raised. For `superseded`: the pointer to the replacement. Otherwise: the merge/release action
authorized, or "none".]
