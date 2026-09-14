# Video Review Summary: recording → student-facing summary HTML

**Input:** a recorded homework review — the teacher on screen, speaking
English with Russian grammar explanations (e.g. an Edvibe homework review,
~16 min).
**Output:** a student-facing HTML recap: one section per homework task,
color-coded fixes, strengths, practice tips at the student's level, and the
next homework.

## Problem

A 16-minute review recording is hard for a student to revisit. The audio is
there, but nothing is structured, searchable, or readable. The knowledge
stays in the video instead of becoming a document the student uses all week.

## Pipeline

1. **Extract audio** — ffmpeg stream copy, instant.
2. **Transcribe** — Deepgram `nova-3` with `detect_language` (handles the
   EN/RU mix); raw-body request.
3. **Locate tasks** — word timestamps map each homework task and correction
   to a moment in the video; screenshots are never embedded.
4. **Build the HTML** — one section per task with a status pill
   ("All correct" / "N fixes"), fix cards (original → suggestion → why,
   color-coded), a strengths box, test-english practice tips at the
   student's level, and a next-homework callout.
5. **Save** — `{student}-{topic}-{YYYYMMDD}.html`; existing files are never
   overwritten.

## Stack

- ffmpeg (audio extraction)
- Deepgram API (nova-3, raw-body request)
- agent-generated HTML following the design system inside the skill

## Try it

Install the suite (one command, see the README), send your agent the
recording, and ask for a "homework summary" — the skill does the rest.
