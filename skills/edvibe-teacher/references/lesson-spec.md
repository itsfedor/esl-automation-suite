# Lesson spec — full format (v1)

A lesson spec is one JSON file. `cli-anything-edvibe lesson build` turns it into a real lesson: sections + exercises, numbered automatically per section.

## Skeleton

```json
{
  "lesson_name": "Present Perfect — Life experience",
  "description": "Optional short text shown with the lesson",
  "sections": [
    {"name": "Warm-Up",  "exercises": [ ... ]},
    {"name": "Practice", "exercises": [ ... ]},
    {"name": "Homework", "exercises": [ ... ]}
  ]
}
```

Rules:

- Section named `Homework` (or «Домашка» / «ДЗ») is saved into the lesson's built-in homework section automatically.
- Section names become the lesson stages; keep them short: `Warm-Up`, `Vocabulary`, `Watching and Questions`, `Reading`, `Speaking`, `Extra`.
- `instruction` (or `name`) on an exercise becomes its label in the lesson.
- HTML in `note` / `text` / `topic` is minified automatically — still keep it compact: only `<p>`, `<b>`, `<i>`, `<ul>/<li>`, `<br>`. No styles, scripts or images.
- Numbers and ids are automatic — don't specify them anywhere.

## Exercise types

### note — content block (the workhorse)

```json
{"type": "note", "html": "<p>Grammar reminder...</p>", "name": "Warm-Up"}
{"type": "note", "html": "<p>1. have 2. went</p>", "name": "Keys", "hidden": true}
```

`hidden: true` → invisible for students (use for answer keys and teacher notes).

### topic — big stage header

```json
{"type": "topic", "html": "Warm-Up", "name": "Warm-Up"}
```

### text — article / reading block

```json
{"type": "text", "html": "<p>Long reading text...</p>", "name": "Reading"}
```

### video

```json
{"type": "video", "link": "https://www.youtube.com/watch?v=XXXXXXXXXXX", "name": "Watch"}
```

### wordlist — vocabulary with translations (the platform adds voice-over automatically)

```json
{"type": "wordlist", "name": "Vocabulary", "entries": [["journey", "путешествие"], ["achieve", "достигать"]]}
```

### match — Match the words

```json
{"type": "match", "instruction": "Match the words", "pairs": [["make", "a decision"], ["take", "a break"]]}
```

### filltyped — Fill in the gaps (typed), autocheck

```json
{"type": "filltyped", "instruction": "Fill in the gaps",
 "sentences": ["I [have] finished already.", "She has [gone/been] to Paris twice."]}
```

Gap syntax inside `[ ... ]`:

- `[answer]` — one correct answer
- `[hint/answer]` — hint before the slash
- `[a1/a2]` — several accepted answers
- `[hint/a1/a2]` — hint + several accepted
- `[/a1/a2]` — several accepted, no hint

### fillbox — Fill in the gaps from the box, autocheck

```json
{"type": "fillbox", "instruction": "Fill in the gaps from the box",
 "sentences": ["He [drinks] coffee every morning.", "They [are] from Spain."]}
```

The answer box is built automatically from all gap answers.

### chooseoption — Choose the correct option, autocheck

```json
{"type": "chooseoption", "instruction": "Choose the correct option",
 "lines": ["She [go/went*/gone] home."]}
```

`*` marks the correct option — exactly one per gap.

### wordorder — Put the words in order, autocheck

```json
{"type": "wordorder", "instruction": "Put the words in order",
 "sentences": ["have/you/been/to/London"]}
```

Tokens joined by `/` **in the correct order**; the display order is shuffled automatically.

### sortcolumns — Sort the words into columns, autocheck

```json
{"type": "sortcolumns", "instruction": "Sort into columns",
 "columns": [{"title": "for", "words": ["a year", "ages"]},
             {"title": "since", "words": ["2020", "Monday"]}]}
```

Words must not repeat across columns.

### ordersentences — Put the text in order, autocheck

```json
{"type": "ordersentences", "instruction": "Put the sentences in order",
 "sentences": ["First the hero leaves home.", "Then he meets a stranger.", "Finally he returns."]}
```

### truefalse — True or False, autocheck

```json
{"type": "truefalse", "instruction": "True or False",
 "statements": [["Moscow is in Russia", true], ["It snows in July", false]]}
```

Use `"notstated"` as a value only when the task should include a "Not stated" option.

### test — multiple-choice quiz, autocheck

```json
{"type": "test", "instruction": "Quick test",
 "questions": [{"q": "I ___ been to Spain.", "options": ["have", "has"], "correct": [0]}]}
```

`correct` = array of indexes of the right options (usually one).

### writing

```json
{"type": "writing", "instruction": "Write 5 sentences about your week"}
```

### voice — voice recording task

```json
{"type": "voice", "html": "Describe your last holiday (1-2 minutes)", "seconds": 120}
```

## Pitfalls

- Don't put `[` `]` in plain sentence text unless it's meant to be a gap.
- One language point per exercise; keep sentences short.
- Answer keys always go in `hidden: true` notes — never in visible blocks.
- `test` options are plain strings (no HTML needs).
- For a video lesson put the `video` exercise first in its stage, then the questions.
