# Lesson design recipes

## Default stage layout (proven in real lessons)

`Warm-Up → Vocabulary → Watching and Questions` (video) or `Reading` (text) `→ Speaking → Extra` (+ `Homework`)

Sizes: 9–15 exercises total for a 45–60 min lesson. Homework: 1–2 short tasks, ≤15 minutes of student work.

## Recipe: lesson from a topic / grammar point

1. **Warm-Up** — 2–3 conversational questions (`note`) and/or a light `match`.
2. **Vocabulary** — 6–10 items: `match` + `wordlist` (word + translation; voice-over comes free).
3. **Controlled practice** — `filltyped` / `chooseoption` / `fillbox` (all autocheck).
4. **Freer practice** — `wordorder` / `ordersentences`.
5. **Speaking** — `voice` or `writing`.
6. **Answer keys** — `note` with `hidden: true` (students never see it).
7. **Homework** — short: one autocheck + one `writing` or `voice`.

## Recipe: lesson from a video / series episode

1. **Warm-Up** — prediction questions about the video.
2. **Vocabulary** — 5–8 key phrases from the video (`match` + `wordlist`).
3. **Watching and Questions** — the `video` exercise, then gist questions (`test`) + details (`truefalse`, `filltyped`).
4. **Speaking** — `voice` or discussion questions in a `note`.
5. **Extra** — optional deeper task (retelling, summary writing).
6. **Homework** — a short follow-up (e.g. write a review of the episode).

If the teacher provides a transcript: base comprehension questions on real lines. If not: keep questions general.

## Recipe: serial course (one lesson per TV episode)

For a class that watches a series episode by episode. Each lesson lives in its own unit inside one material (a book like `Series: <Name>`), named `N <Episode Title>`. Seven blocks, always in this order, so the student knows what to expect:

1. **Vocabulary** — `match`, 8 pairs for A2+ (`word -- simple definition`, level-capped).
2. **A related-theme article** — `fillbox`: a short 3-paragraph story on the same theme as the episode (hospital life, family, honesty), NOT a retelling of the plot. Reuse the 8 vocab words as gaps **in the exact same form** as in the pair (`fix` stays `fix`, never `fixed`). `autocheck: false` when the article is graded by hand.
3. **Watch the episode** — `button` with the streaming link the teacher gives, text `Season N, Episode M — "Title"`. (`video` also works when the source is YouTube; a `button` keeps non-YouTube players clickable.)
4. **True / False / Not Stated** — `truefalse`, 7 statements, roughly 3 true / 3 false / 1 not stated, `show_number: false`.
5. **Teacher key** — `note` with `hidden: true`: each statement + `True`/`False`/`Not Stated` + a verbatim quote from the script that proves it.
6. **Choose the best reply** — `test`, 4 situations built on the episode's moral conflicts (honesty, rules vs people, asking for help). One option follows the episode's lesson and keeps the conversation going; the other two contradict it or kill the conversation. Never two defensible options. Vary the correct position.
7. **Speaking** — `voice`, 2 opinion questions about the episode, 2–3 min, each tied to the student's own life, language inside the level (A2+: present/past simple, no conditionals).

Verification before handing the lesson over: every statement traceable to a quoted line of the script, every gap word present in the vocab list, quotes checked twice against the transcript.

Script sourcing, recap writing and the level table live in the `tv-episode-homework` skill. Build with:

```bash
cli-anything-edvibe lesson build --file episode-spec.json --material <series_book_id>
```

## Recipe: teacher's ready handout (HTML)

- **Fast path:** `cli-anything-edvibe import --html «file.html»` — creates a material + lesson with one note per section. Good for reference materials and keys.
- **Full path:** convert the handout into a spec with interactive exercises (recipes above). Prefer this for actual lessons and homework.

## Recipe: homework

- Section `Homework` lands in the lesson's built-in homework section automatically.
- Keep ≤15 min: 1 autocheck exercise + 1 `writing` / `voice` task.
- Content only — no platform instructions.
- To send homework to a student, use the classroom flow, not a second build:

```bash
cli-anything-edvibe classroom show --student "Name"          # class id + current unit
cli-anything-edvibe homework give --lesson <id> --class-id <id> --pupil <id>
```

`homework give` pins the lesson as the class's current unit and attaches its exercises to the student's homework sheet. Ask the teacher first, then verify with `classroom show`.

## Levels (quick guidance)

- **A1–A2:** short sentences, 5–8 items, lots of autocheck, translation support in wordlist.
- **B1–B2:** longer texts, gap sentences with hints, discussion questions.
- **C1–C2:** authentic video/articles, nuanced vocabulary, freer speaking tasks.

## Quality checklist before building

- [ ] Plan confirmed with the teacher («собираю вот это — ок?»).
- [ ] `--dry-run` passes without errors.
- [ ] Every autocheck exercise has unambiguous answers.
- [ ] Answer keys in `hidden: true` notes; nothing revealing in visible blocks.
- [ ] Homework included when asked; tasks short and student-facing.
- [ ] Section names short and in the teacher's language.
- [ ] For episode lessons: quotes verified against the script, gap forms match vocab forms.
