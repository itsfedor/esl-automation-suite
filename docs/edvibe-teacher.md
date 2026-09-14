# Edvibe Teacher: build lessons in chat

**Input:** a lesson plan or a topic ("Present Perfect for a 7th grader") → **Output:** a finished lesson inside [Edvibe](https://edvibe.com): sections, exercises, answer keys, wordlists with audio.

Unlike the other pipelines, this one does not produce a file to paste. It writes directly into your Edvibe account from chat, through a local CLI that your AI agent drives.

## What it builds

16 exercise types are supported: Match, Fill in the gaps (typed and from the box), Choose the correct option, True or False, Word order, Put the text in order, Sort into columns, multiple-choice Tests, Wordlists with auto voice-over, video blocks, writing and voice tasks, notes with hidden answer keys. A lesson is described in a small JSON spec, validated in a dry run, then built section by section.

The same CLI works with your students when you need it: `students list` and `classroom show` are read-only views of your school account, and `homework give --lesson <id> --class-id <id> --pupil <id>` pins a lesson to the class and sends its exercises to that student's homework sheet. It runs only when you ask for it.

## Install

```bash
npx skills add itsfedor/esl-automation-suite --skill edvibe-teacher -g -y
```

Works with Hermes Agent, Claude Code, Codex CLI, and any agent that reads SKILL.md. The skill ships the CLI itself (a wheel in `skills/edvibe-teacher/assets/`), so there is nothing else to download.

## First run

1. Ask your agent: "connect Edvibe".
2. The agent installs the local CLI and asks you to run one command in your own terminal: `cli-anything-edvibe login`. Your password is typed there, never stored, and never seen by anyone.
3. Then just describe the lesson you need. The agent shows a plan, you approve, and the lesson appears in Edvibe. You review and publish.

## How it works

- Everything runs locally, under your own account. The tool has no servers, collects nothing, and cannot delete anything. It only creates.
- Requests are paced with human-like pauses (jittered 0.8–2.0 s, capped at 150 per hour), so the account sees normal manual work.
- Lesson specs are plain JSON: [skills/edvibe-teacher/references/lesson-spec.md](../skills/edvibe-teacher/references/lesson-spec.md) documents every exercise type with examples.
- Design recipes (stage layouts, levels, video lessons, homework): [skills/edvibe-teacher/references/workflows.md](../skills/edvibe-teacher/references/workflows.md).

## Requirements

- Python 3.9+ on the teacher's machine. The setup script handles the rest: it prefers uv or pipx, with a private venv as fallback.
- An Edvibe account with teacher rights.

## License

MIT, same as the suite.
