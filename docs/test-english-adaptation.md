# Test-English Adaptation: any exercise, personalized for a student

**Input:** a test-english.com exercise (URL or exercise type) + a student profile.
**Output:** a personalized exercise at the student's level (A1 through C1)
in the teacher's preferred format: Edvibe text, single-file HTML, or a
deployed link.

## Problem

test-english.com has solid, level-appropriate exercises: grammar, vocabulary,
listening, reading, use of English, writing. But they are generic. Strangers'
names, random topics, nothing that connects to the student. Personalizing
each one by hand takes as long as writing new material from scratch.

## Pipeline

1. **Pick the source**: the URL the teacher gives, or the right lesson for
   the student's gap (e.g. present perfect vs past simple for an A2 student
   who keeps mixing them).
2. **Extract**: exercise text with all answer options, the explanation, the
   grammar chart. The correct answers are not in the page HTML (test-english
   marks them in JS); grammar and vocabulary answers are known, listening
   and reading answers are derived from the transcription/text, and
   anything unverifiable gets flagged for the teacher.
3. **Profile the student**: level (CEFR), ceiling, interests, L1, weak
   spots. Russian speakers get Russian error patterns (articles, verb
   patterns, prepositions).
4. **Adapt the content**: keep the exercise type and structure. Swap names,
   topics, numbers, examples. Never raise the level, never switch the
   format silently.
5. **Charts for data tasks**: writing lessons that describe data (IELTS
   Task 1 style) get generated chart images, one palette across the set.
6. **Render**: Edvibe homework as plain text in chat (content only, no
   instructions, no file); full lessons as single-file HTML; interactive
   HTML as a Pages link (messenger previewers block JavaScript in files).
7. **Audit** all student-facing prose with avoid-ai-writing.
8. **Follow up**: the student's writing goes through the writing-analysis
   pipeline for color-coded feedback.

## Formats that get adapted

| test-english format | Adaptation | Output |
|---|---|---|
| Grammar MCQ in dialogues | New dialogue with student-adjacent situations, same tense contrast and option structure | Text or HTML |
| Gap-fill (text with 15 gaps) | New text on the student's topic, same gap pattern and target words | Text or HTML |
| Vocabulary quiz | Same words, new example sentences, L1-friendly hints where needed | Text or HTML |
| Listening test | Keep the audio when shareable; otherwise a shorter read-aloud version of the transcription, same questions, honestly labeled | HTML |
| Reading test | New text at the same level on the student's topic, same question types | HTML or text |
| Use of English (15 MCQs) | Same grammar mix, fresh text, same answer count | Text |
| Writing: data description (charts) | Cheat sheet + 3 chart tasks + generated images | HTML |
| Writing: reports, emails, essays | Same genre and structure, personalized topic, word budget | HTML or text |

## Levels

- **A1–A2**: short sentences, familiar words, one target structure per
  exercise
- **B1**: full sentences, natural collocations, 1-2 target structures
- **B1+/B2**: authentic-ish texts, less support, more inference
- **C1**: full academic register where the source uses it, complex texts,
  data description with precise functional language
- **"A2+ with B1 ceiling"**: A2 sources; B1 sources only when the target
  structure is isolated and the rest of the language is simplified

## The chart case: C1 Describing Visual Data

The flagship example of the writing branch. A C1 student gets a complete
exercise: a cheat sheet of functional language (accounts for, whereas,
levelled off, roughly) plus three tasks (pie chart, bar chart, table) with
word budgets, all built with generated chart images in one consistent
style.

- [Full example: examples/c1-visual-data-exercise.html](../examples/c1-visual-data-exercise.html)
- [Chart images: examples/charts/](../examples/charts/)

## The skill

The complete how-to lives in the `test-english-adapt` Hermes skill:
site research (sections, URL patterns, exercise formats), the image
generation prompts, the HTML template, level rules, pitfalls, and a
ready-to-paste prompt for any agent.
