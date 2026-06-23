---
version: "0.0.1-init"
status: "Draft"
---

# Part IV: Operational Provenance & The Agent Header Protocol

This section outlines the exact engineering requirements for tracking machine intervention in data and source code without introducing legal ambiguities.

## Article 19: The Modality of Machine Actuation (Clear boundaries for autonomous execution)

19.1. **Defined Boundaries:** The scope within which any automated system (particularly Cognitive Agents) is permitted to actuate changes, generate outputs, or modify state must be explicitly and mathematically defined prior to execution.
19.2. **Prohibition of Silent Creep:** Systems are strictly prohibited from silently expanding their operational boundaries or actuating changes outside of their predefined constraints without requesting and receiving new, explicit human authorization.
19.3. **Fail-Safe Defaults:** In situations where the boundaries of machine actuation are ambiguous or the context shifts unpredictably, the system must default to halting execution and seeking human intervention.

## Article 20: The Mandate for Continuous, Event-Driven Provenance Tracking

20.1. **Continuous Provenance:** Every alteration to digital state, data structure, or content facilitated by an automated agent must be continuously tracked and logged.
20.2. **Event-Driven Architecture:** Provenance tracking must be event-driven, capturing the exact moment of modification, the initiating input, and the resulting delta, rather than relying on periodic, batch-level snapshots that obscure intermediate steps.
20.3. **Immutable Ledgers:** Provenance logs must be stored in tamper-evident or immutable data structures to guarantee the historical integrity of the system's operational history.

## Article 21: Structural Requirements for the Agent Header Telemetry Payload

21.1. **The Agent Header:** All automated interventions must be accompanied by an "Agent Header"—a standardized, cryptographically signed telemetry payload embedded within or inextricably linked to the modified data.
21.2. **Structural Integrity:** The Agent Header must be structured in a universally parsable format (e.g., specific JSON-LD schemas or equivalent verifiable data structures) to ensure cross-system compatibility.
21.3. **Inseparability:** The architecture must ensure that stripping or modifying an Agent Header from an artifact invalidates the artifact's integrity and breaks its chain of provenance.

## Article 22: Mandatory Telemetry Elements (Model specifications, operational parameters, timestamps)

22.1. **Required Metadata:** To ensure total transparency, every Agent Header must mandate the inclusion of specific telemetry elements.
22.2. **Elements Defined:** These elements must minimally include: the exact model version or deterministic software identifier utilized; a cryptographic timestamp of the execution; the parameters or prompts that initiated the action; and a reference to the authorizing human's Enumerated State.
22.3. **Omission Penalties:** The deliberate omission or obfuscation of mandatory telemetry elements constitutes a violation of the system's operational integrity and renders the resulting output legally void.

## Article 23: Mechanics for Human Cryptographic Co-Signing of Automated Changes

23.1. **Co-Signing Requirement:** When an automated agent proposes modifications to critical infrastructure, legal documents, or sensitive Entity-Centric data, the changes must remain strictly as "proposals" until cryptographically co-signed by the authorizing human.
23.2. **Reviewable Deltas:** The human actor must be presented with clear, intelligible "deltas" (differences) between the original state and the machine-proposed state before co-signing.
23.3. **Transfer of Authorship:** Only upon the application of the human's cryptographic signature does the proposed change become finalized, at which point the human legally assumes authorship and accountability for the specific execution.

## Article 24: Prohibition of Opaque Machine Modifications and Automated Content Ingestion

24.1. **No Opaque Modifications:** Software agents are expressly prohibited from executing opaque, unlogged, or obscured modifications to data or systems.
24.2. **Transparent Ingestion:** The automated ingestion of data—whether for model training, context generation, or database population—must leave a transparent, verifiable trail of the sources accessed and the criteria used for selection.
24.3. **Respect for Boundaries:** Automated ingestion protocols (e.g., crawlers, scrapers) must strictly adhere to network boundaries, respecting `robots.txt` equivalents, copyright declarations, and explicit machine-readable opt-outs (such as “no-AI” headers).

