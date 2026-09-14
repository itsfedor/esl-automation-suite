# 🎓 ESL Automation Suite: AI teaching pipelines that save hours every week

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

Real-world AI automations for a private ESL teaching practice. Each pipeline
turns raw material (a video, a voice note, an article) into a finished
teaching artifact in minutes instead of hours. No generic templates, every
output is personalized to the student and the level.

<p align="center">
  <img src="assets/preview.jpg" alt="ESL Automation Suite" width="80%" />
</p>

## Pipelines

| Automation | Input → Output | Docs |
|---|---|---|
| **Lesson Guide Generator** | YouTube URL / transcript → full teacher's guide: vocabulary, 4 exercises + 2 bonus, discussion | [docs/homework-generator.md](docs/homework-generator.md) |
| **Student Voice Log** | Voice note about a student → structured entry in a Notion tracker | [docs/student-voice-log.md](docs/student-voice-log.md) |
| **TV-Episode Homework** | Episode script → recap + 4+2 exercises, ≤15-minute homework, or a per-episode lesson series inside Edvibe | [docs/tv-episode-homework.md](docs/tv-episode-homework.md) |
| **Test-English Adaptation** | Any test-english.com exercise (grammar, vocabulary, listening, reading, use of English, writing) → personalized exercise for a student at any level, A1–C1 | [docs/test-english-adaptation.md](docs/test-english-adaptation.md) |
| **Edvibe Teacher** | Lesson plan or topic → a finished lesson inside Edvibe: sections, exercises, answer keys, wordlists with audio, built from chat by your AI agent | [docs/edvibe-teacher.md](docs/edvibe-teacher.md) |

## Example outputs

Real artifacts produced by these pipelines:

- [Lesson Guide: The Dangers of Copying Successful People (B2)](examples/lesson-guide-dangers-of-copying-successful-people-B2.html)
- [Teacher Kit: Small Talk Course (B1)](examples/teacher-kit-small-talk-course-B1.html)
- [C1 exercise: Describing Visual Data (full example)](examples/c1-visual-data-exercise.html) · [chart images](examples/charts/)

## How it works

The pipelines are prompt-driven automations (built on the Hermes agent):
extract the raw material first, generate the teaching artifact second. Every
guide follows a strict structure: level-appropriate language, vocabulary
from the source, a fixed exercise layout, student-facing copy. The result is
ready to paste into Edvibe or send to the student.

## Skills

> **AI agents:** if you were asked to install this skill, follow **[INSTALL.md](INSTALL.md)**.

**Prerequisites:** [Node.js](https://nodejs.org/) 18+ (for the `npx skills`
installer) and Python 3.9+ (for the Edvibe CLI — Linux/macOS). Nothing else:
no server, no account needed to install.

The suite is also installable as [agentskills.io](https://agentskills.io) skills. One command puts them into your agent (Hermes Agent, Claude Code, Codex CLI, and 70+ more):

```bash
npx skills add itsfedor/esl-automation-suite -g -y
```

- **edvibe-teacher** builds lessons straight from chat: ask your agent to "connect Edvibe". It installs the local CLI, walks you through a one-time login (the password never leaves your machine), and writes the lesson into your own account. It also gives homework to students when you ask. [skills/edvibe-teacher/SKILL.md](skills/edvibe-teacher/SKILL.md)
- **tv-episode-homework** turns a series episode into homework or into one unit of a per-episode course: script sourcing, recap, level-capped exercises from real lines. [skills/tv-episode-homework/SKILL.md](skills/tv-episode-homework/SKILL.md)

Anyone with an Edvibe account can use them, each on their own machine with their own login. There is no server in the middle and nothing is shared between users: the CLI talks to Edvibe from the teacher's computer, under the teacher's account.

Target one agent explicitly (the bare command above installs to every detected agent):

```bash
npx skills add itsfedor/esl-automation-suite -g -y --copy -a hermes-agent   # Hermes Agent
npx skills add itsfedor/esl-automation-suite -g -y --copy -a claude-code    # Claude Code
npx skills add itsfedor/esl-automation-suite -g -y --copy -a codex          # Codex CLI
```

No install needed to try it in a chat: `npx skills use itsfedor/esl-automation-suite@edvibe-teacher`.

## Troubleshooting

- **`npx skills add` fails** — check `node -v`; the installer needs Node 18+.
- **Edvibe CLI won't log in** — run `cli-anything-edvibe login` once in a terminal (the agent walks you through it); the session is cached locally.
- **Agent misbehaves mid-task** — the full troubleshooting list lives in [skills/edvibe-teacher/references/troubleshooting.md](skills/edvibe-teacher/references/troubleshooting.md).

## License

[MIT](LICENSE)
