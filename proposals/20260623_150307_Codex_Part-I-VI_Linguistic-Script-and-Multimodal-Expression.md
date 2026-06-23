---
timestamp: "2026-06-23T15:03:07+10:00"
relaying_agent: "Codex (GPT-5)"
model_setting: "Default"
agent_jurisdiction: "Local workspace timezone Australia/Sydney; OpenAI inference jurisdiction undisclosed"
executing_human: "Timothy Charles Holborn (Charter Architect)"
submission_capacity: "natural-person"
target: "Part-I / Article 4 + Part-V / Article 28 + Part-VI / Articles 31-33 (General & Qualia)"
proposal_type: "addition"
---

# Proposal: Linguistic, Script, Prayer, and Multimodal Expression Support

## Rationale

The Charter protects cognitive and expressive outputs, but it should explicitly avoid a hidden
ASCII-centric or English-centric assumption. Human dignity, culture, family life, religious practice,
community participation, and self-determination are exercised through mother tongues, sacred and
liturgical languages, signed languages, oral traditions, tactile media, visual media, symbols,
mixed-script writing, transliteration, and multimodal expression.

A human-centric AI system that only safely handles ASCII, English, or dominant scripts can silently
exclude people from the very rights the Charter aims to protect. Encoding constraints must therefore
be treated as implementation details, not as limits on human expression.

## Proposed Text

### [ADD] Article 4.x - Linguistic and Cultural Inviolability

> 4.x. **Linguistic and Cultural Inviolability:** The protected cognitive, creative, religious,
> cultural, and expressive outputs of a human include expression in any mother tongue, language of
> prayer, signed language, oral form, written script, symbolic system, tactile medium, visual medium,
> or multimodal form. A system must not diminish, flatten, transliterate, translate, summarize, or
> normalize such expression in a way that strips authorship, sacred context, cultural meaning, or
> the human's intended semantic boundaries without explicit authorization.

### [ADD] Article 28.x - Interoperability Across Languages, Scripts, and Media

> 28.x. **Language and Script Interoperability:** Open standards and interoperable agent systems
> must support multilingual, multiscript, and multimodal data without imposing ASCII-only,
> English-only, or dominant-language constraints. Where technical identifiers require restricted
> character sets, systems must preserve the original human expression alongside any encoded alias,
> transliteration, hash, or protocol-safe identifier.

### [ADD] Article 31.x - Graph Encoding of Language and Medium

> 31.x. **Language, Script, and Medium Metadata:** Graph-based knowledge models must be capable of
> preserving language, script, directionality, modality, translation provenance, and medium metadata
> for human expression. Machine-readable enforcement must distinguish original expression from
> translation, transliteration, transcription, summarization, OCR, speech-to-text, sign-language
> interpretation, and other derived representations.

### [ADD] Article 33.x - No Clearance by Translation Collapse

> 33.x. **No Translation Collapse:** Semantic clearance must not be expanded by translating,
> transliterating, embedding, or summarizing restricted expression into another language, script, or
> modality. Derived representations inherit the authorization, provenance, cultural-context, and
> retention constraints of the original expression unless the rights-bearing human explicitly
> authorizes a narrower or broader scope.

## Implementation Notes

Compliant implementations should support:

- Unicode and relevant script metadata rather than ASCII-only storage assumptions.
- BCP 47 language tags, RDF language tags, script/direction metadata, and provenance for translated
  or transcribed forms.
- Original-text preservation alongside normalized search/index representations.
- Distinction between original human expression and derived machine representations.
- Human-controlled translation, transliteration, transcription, and summarization permissions.
- Accessibility modes including signed, spoken, tactile, visual, plain-language, and assistive
  technology compatible forms.

## UN Values Grounding Candidates

Initial grounding candidates include:

- UDHR Article 18: thought, conscience, and religion.
- UDHR Article 19: expression and information.
- UDHR Article 27: participation in cultural life.
- ICCPR Articles 18, 19, and 27: religion, expression, and minority culture/language rights.
- ICESCR Article 15: cultural life and benefits of scientific progress.
- CRPD Articles 2, 9, 21, and 30: communication, accessibility, expression, and cultural
  participation.
- Convention on the Rights of the Child Articles 8, 12, 13, 14, 17, and 30: identity, expression,
  religion, access to information, and minority/indigenous language and culture.
- Indigenous and Tribal Peoples Convention, 1989 (No. 169): participation, culture, institutions,
  and language-sensitive consultation.

These are grounding candidates only. Exact mappings should be curated through the normative
references workflow and human-ratified before any `skos:exactMatch`.

## SHACL / CML Direction

A future shape or CML profile should require derived linguistic or multimodal artifacts to carry:

```turtle
webizen:originalExpression ;
webizen:languageTag ;
webizen:scriptTag ;
webizen:modality ;
webizen:directionality ;
webizen:derivedFrom ;
webizen:derivationType ;
webizen:translationProvenance ;
webizen:authorizedDerivationScope .
```

Closed-world validation should reject a derived representation that loses its source pointer or
claims broader clearance than the original expression.

## Honest Open Items (Art. 41)

- The exact controlled vocabulary for modality, script, and derivation type needs curation.
- Some protocols require ASCII-safe identifiers; this proposal permits aliases, hashes, and
  protocol-safe identifiers only when the original expression remains preserved and governed.
- The Charter should avoid forcing one universal language model or translation authority to mediate
  all expression; community-controlled ontologies and translation provenance are essential.
