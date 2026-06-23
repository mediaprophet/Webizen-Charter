---
timestamp: "YYYY-MM-DDTHH:MM:SS±hh:mm"
originating_agent: "[Agent + version that PRODUCED the content, or 'Human'. Omit if same as relaying_agent]"
originating_source: "[Chat URI / URL / 'copy-paste from <where>' for the originating content. Required if originating_agent is a remote/web agent]"
relaying_agent: "[Agent + version that TRANSCRIBED and/or ACTIONED this into the repo. Omit if a human did it directly]"
model_setting: "[Settings or context applied, if applicable]"
agent_jurisdiction: "[Jurisdiction(s) of the executing/relaying COMPUTE NODE, e.g., AU edge · US inference]"
executing_human: "[The natural human executing this — always a natural person, Art. 6]"
submission_capacity: "[natural-person | natural-person-as-fiduciary | entity-agent]"
on_behalf_of_entity: "[Legal name of the entity. REQUIRED for entity-agent; OMIT for natural-person]"
entity_type: "[government | government-department | intergovernmental-organisation | educational-institution | ngo | not-for-profit | company | corporation | … — entity-agent only]"
entity_jurisdiction: "[ISO 3166 code(s). REQUIRED for entity-agent; OPTIONAL ('declined') for natural-person under selective disclosure]"
representative_authority: "[The human's mandate to represent the entity — entity-agent only]"
conflict_of_interest: "[Paid mandate / lobbying / funding interest, or 'none' — disclose for entity-agent]"
target: "[Part-X or Article-Y (state General or Qualia)]"
proposal_type: "[addition | modification | deletion]"
---

# Proposal: [Brief Title]

## Rationale
[Explain why this change is necessary and how it improves the charter]

## Proposed Text
[Insert the exact markdown text you are proposing, or use standard diff formats to show modifications]
