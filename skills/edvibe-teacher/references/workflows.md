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

## Recipe: teacher's ready handout (HTML)

- **Fast path:** `cli-anything-edvibe import --html «file.html»` — creates a material + lesson with one note per section. Good for reference materials and keys.
- **Full path:** convert the handout into a spec with interactive exercises (recipes above). Prefer this for actual lessons and homework.

## Recipe: homework

- Section `Homework` lands in the lesson's built-in homework section automatically.
- Keep ≤15 min: 1 autocheck exercise + 1 `writing` / `voice` task.
- Content only — no platform instructions.

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
