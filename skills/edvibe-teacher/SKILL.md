---
name: edvibe-teacher
description: "Use when a teacher wants to create, build or publish lessons on Edvibe (edvibe.com) from chat: first-time setup and login, building a full lesson (sections, exercises, answer keys, wordlists with audio) from a JSON spec, importing an HTML handout, or giving homework to a student. Works in Hermes, Claude Code and Codex."
---

# Edvibe Teacher — build lessons in chat

This skill turns the assistant into a lesson-building co-pilot for a teacher who uses **Edvibe** (edvibe.com). Everything runs **locally on the teacher's machine** through a small CLI (`cli-anything-edvibe`); this skill teaches you how to set it up, keep it healthy, and build lessons with it.

The teacher's experience: they describe what they want → you draft a lesson plan → you confirm it with them → the CLI builds the lesson in their own Edvibe account → they review and publish.

## Hard rules (never break these)

1. **Login is one local step, done by the teacher.** Default (recommended) way: the teacher runs `cli-anything-edvibe login` once in their own terminal - the password is typed hidden and never stored anywhere; only the session token is cached locally at `~/.edvibe/session.json`, so all later runs (and future chats) just work. Ask the teacher to run it, then verify with `doctor`. Keep passwords out of chat logs; how the teacher handles their own credentials is their call.
2. **Additive only.** The CLI cannot delete or modify existing materials — keep it that way. If the teacher wants something removed, they do it themselves in the Edvibe UI.
3. **Never claim students can see a lesson.** After a build, the teacher reviews it and publishes: «Проверь урок и публикуй, когда готова».
4. **Give homework only when the teacher asks for it.** Assigning homework pins the lesson as the class's current unit and provisions the pupil's material (details below). Never do it "to be safe", and never touch a class's current lesson as a side effect of building.
5. **No tech jargon with the teacher.** No RPC/WebSocket/API/pip words. Say «собираю урок», «переношу материалы», «делаю паузы».
6. **Answer in the teacher's language** (Russian for RU/KZ teachers).

## Step 0 — readiness check (first thing, every session)

```bash
command -v cli-anything-edvibe || sh "<this skill folder>/scripts/setup.sh"
cli-anything-edvibe doctor --json
```

- CLI missing → run the skill's `scripts/setup.sh` (installs it locally; no sudo, harmless).
- `doctor` fails on `login` → tell the teacher: «Напиши в своём терминале одну команду: `cli-anything-edvibe login` — пароль вводишь только ты, я его не вижу. Напиши, когда готово». Wait, then re-run `doctor`.
- Proceed only when `doctor` is green.

## Step 1 — understand the request

| Ask | Path |
|---|---|
| «Сделай урок по теме Present Perfect для 7 класса» | build from a topic — `references/workflows.md` |
| «У меня есть готовая методичка (HTML)» | fast path: `import --html` (notes only); full path: build a spec with interactive exercises |
| «Урок по этому видео / сериалу» | video-lesson recipe in `references/workflows.md` |
| «Серия за серией, как курс по сериалу» | serial-course recipe in `references/workflows.md` + the `tv-episode-homework` skill (script sourcing, episode exercises) |
| «Домашка к этому уроку» | build with a section named `Homework` — it lands in the lesson's built-in homework section |
| «Выдай домашку ученику» | homework flow below (`homework give`) |
| «Добавь упражнения в мой урок» | `lesson show --lesson <id>` first, then `lesson build --lesson <id>` with only the new material |

Find or create the target material:

```bash
cli-anything-edvibe materials list                       # teacher picks an existing one
cli-anything-edvibe materials create "New course name"   # or a fresh one -> id
```

## Step 2 — draft the spec, dry-run, confirm

READ `references/lesson-spec.md` before writing your first spec — exact format with examples for every exercise type. READ `references/workflows.md` for lesson design (stages, levels, recipes).

1. Write the spec JSON to a local file (e.g. `lesson.json` in the teacher's working folder).
2. Validate without touching the platform:
   ```bash
   cli-anything-edvibe lesson build --file lesson.json --dry-run
   ```
   Fix everything the validator reports.
3. Show the teacher a short plan in their language («Соберу: Warm-Up, Vocabulary, Practice, Homework — 12 упражнений, ключи скрытые. Ок?») and wait for a yes.

## Step 3 — build

```bash
# new lesson inside a material:
cli-anything-edvibe --json lesson build --file lesson.json --material <material_id> [--name "Lesson title"]

# or append into an existing lesson:
cli-anything-edvibe --json lesson build --file lesson.json --lesson <lesson_id>
```

Note: `--json` always goes BEFORE the subcommand. The JSON output lists `lesson_id`, section ids and exercise ids.

Builds are paced on purpose: the CLI adds human-like pauses and caps requests per hour, so a lesson of ~15 exercises takes 30–60 seconds. That's normal and keeps the account healthy.

## Step 4 — verify and hand off

```bash
cli-anything-edvibe lesson show --lesson <lesson_id>
```

Confirm sections and exercise counts match the plan, then tell the teacher (their language): what was built, where to find it in Edvibe, and to review + publish. Offer fixes: small text tweaks in the Edvibe UI, or you can add more material by building into the same lesson again.

## Students, classroom and homework

Only for teachers who have students in the school account. Everything is read-only until the teacher asks to give homework.

```bash
# find the student and the class
cli-anything-edvibe students list --search "Name"
cli-anything-edvibe students show <pupil_id>

# what the class is doing now + the student's homework overview
cli-anything-edvibe classroom show --student "Name"

# give homework for a lesson (one command)
cli-anything-edvibe homework give --lesson <lesson_id> --class-id <class_id> --pupil <pupil_id>
cli-anything-edvibe homework show --lesson <lesson_id> --pupil <pupil_id> --class-id <class_id>
```

What `homework give` does, in order: it pins the lesson as the class's current unit (the same "pin this unit" action the teacher would do in the classroom UI; the first pin also provisions the student's copy of the material and the homework sheet), then attaches the lesson's exercises to the student's homework in lesson order. Repeating it on the same lesson is safe (nothing is attached twice).

Use it only on an explicit request («выдай домашку»). Before running it, say what it will change: «Закреплю урок в классе и отправлю упражнения в домашку <имя>. Ок?». After it, verify with `classroom show --student` and report what the student now sees.

Extras:

```bash
# append extra exercises to an existing homework sheet (own spec, homework section format)
cli-anything-edvibe homework add --file homework.json

# attach only some exercises of a lesson section
cli-anything-edvibe homework give --lesson <id> --class-id <id> --pupil <id> --section <section_id> --exercises 3,4,5
```

## Pacing & limits (explain gently when it matters)

The CLI enforces jittered pauses (0.8–2.0 s between calls) and ≤150 requests/hour. If the teacher hits the limiter or the platform slows down: stop for the day and resume later. Phrase it as «делаю паузы, как обычная работа руками — так твой аккаунт в порядке».

## References
- `references/lesson-spec.md` — every exercise type + example JSON
- `references/workflows.md` — lesson-design recipes (topic / video / serial course / HTML / homework)
- `references/troubleshooting.md` — errors and fixes
