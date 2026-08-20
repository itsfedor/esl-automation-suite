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
| **TV-Episode Homework** | Episode script → recap + 4+2 exercises, ≤15-minute homework | [docs/tv-episode-homework.md](docs/tv-episode-homework.md) |
| **Test-English Adaptation** | Any test-english.com exercise (grammar, vocabulary, listening, reading, use of English, writing) → personalized exercise for a student at any level, A1–C1 | [docs/test-english-adaptation.md](docs/test-english-adaptation.md) |

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

## License

[MIT](LICENSE)
