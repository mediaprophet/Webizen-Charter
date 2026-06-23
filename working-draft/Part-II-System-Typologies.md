---
version: "0.0.1-init"
status: "Draft"
---

# Part II: System Typologies & Agent Boundaries

This section defines the objective boundaries between human actors and varying classes of software to prevent the obfuscation of responsibility.

## Article 7: The Human Actor as the Sole Locus of Accountability and Rights

7.1. **Exclusivity of Locus:** The human actor remains the singular and indivisible locus of all legal accountability, liability, and rights within any computational interaction.
7.2. **Indivisible Responsibility:** No boundary or layer of abstraction between a human and an automated system can sever the human's ultimate responsibility for the system's execution or consequences.
7.3. **Tracing Accountability:** All actions initiated, facilitated, or completed by an automated agent must maintain a clear, auditable path back to the authorizing human actor or the human entity operating the infrastructure.

## Article 8: Classification of Deterministic Agents (Procedural and Rule-Based Software)

8.1. **Definition:** Deterministic Agents are defined as software systems operating on strictly procedural, rule-based, or explicitly programmed logic, where a given input predictably results in a specific output without deviation.
8.2. **Functional Scope:** These agents serve as direct extensions of human instruction and execute predefined tasks. They are incapable of spontaneous context generation or probabilistic inference.
8.3. **Attribution:** Errors or harm resulting from Deterministic Agents are strictly attributed to the human programmers, deployers, or the authorizing operators, as dictated by standard legal mechanisms of product liability and negligence.

## Article 9: Classification of Cognitive Agents (Probabilistic and Inference-Based Systems)

9.1. **Definition:** Cognitive Agents encompass systems employing probabilistic inference, machine learning, large language models, and other non-deterministic architectures capable of generating novel outputs from training data and contextual input.
9.2. **Containment of Scope:** Despite their complexity, Cognitive Agents are classified strictly as sophisticated instruments. Their outputs are considered mechanically generated artifacts, devoid of original authorship.
9.3. **Liability Transference:** The probabilistic nature of a Cognitive Agent shall not serve as a defense against liability. Unpredictable or emergent behavior remains the responsibility of the human entity that deployed or parameterized the agent within a specific context.

## Article 10: Classification of Broker Agents (Interfaces, Connection Protocols, and Orchestrators)

10.1. **Definition:** Broker Agents are intermediaries—such as APIs, connection protocols, orchestrators, and network interfaces—that facilitate communication, state management, and data exchange between different systems or between humans and agents.
10.2. **Stateless Expectation:** Broker Agents must be designed to operate as structurally neutral and stateless conduits whenever feasible, prioritizing the faithful transmission of data over active content moderation or obfuscation.
10.3. **Transparency of Brokering:** Any transformation, routing decision, or filtering performed by a Broker Agent must be explicitly logged and visible to the connected human actors to prevent silent interference in data flows.

## Article 11: Differentiation of Edge-Localized Processing vs. Centralized Hosted Environments

11.1. **Edge-Localized Processing:** Systems where computational execution occurs locally on hardware controlled by the user are recognized as providing the highest degree of user autonomy, privacy, and sovereignty over the Enumerated State.
11.2. **Centralized Environments:** Systems operating within centralized, hosted infrastructure inherently introduce third-party risk and must be subject to heightened transparency regarding data access, model intervention, and state custody.
11.3. **Symmetric Rights:** The legal rights to privacy, data ownership, and self-determination must not be diminished simply because an individual relies on centralized infrastructure rather than edge-localized processing.

## Article 12: Inter-Agent Communication Standards and Boundary Isolation Protocols

12.1. **Boundary Isolation:** Distinct software agents—especially those belonging to different typologies or different human owners—must operate within clearly defined, cryptographically isolated boundaries to prevent unauthorized cross-contamination of state or data.
12.2. **Communication Standards:** Inter-agent communication must adhere to open, standardized protocols that require mutual authentication and explicit human-authorized clearance before data exchange or state alteration can occur.
12.3. **Failure Containment:** Architecture must ensure that the failure, compromise, or hallucination of one agent cannot cascade uncontrollably across agent boundaries without triggering explicit safeguards or requiring human intervention.

