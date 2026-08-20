# Lesson Guide Generator

**Input:** a YouTube video / transcript URL (any level, B1–C1 typical).
**Output:** a complete teacher's guide: vocabulary, comprehension, 4
exercises + 2 bonus, discussion questions.

## Problem

Preparing a one-hour lesson from a video used to take 45–60 minutes: watching
the video, extracting vocabulary, writing exercises, matching the level,
formatting for Edvibe. With 20+ lessons a week that's a full workday.

## Pipeline

1. Extract the transcript from the video (auto-generated captions are fine).
2. Read the source material first, then build the guide:
   - **Vocabulary**: 8–12 items from the actual transcript, with
     definitions and example sentences from the source.
   - **Comprehension**: questions that check real understanding of the
     video, not generic fill-ins.
   - **Exercises**: 4 core + 2 bonus: gap-fill, matching, rephrasing,
     discussion prompts. All content drawn from the transcript.
   - **Level check**: language kept at the student's level (B1+ material
     stays B1+, no register policing outside academic contexts).
3. Output as HTML, ready to paste into Edvibe.

## Output

A single self-contained HTML file per lesson:

- Teacher's guide with answer keys
- Student-facing copy (no instructions to the teacher inside)
- Minimal time for the student: homework stays under ~15 minutes

See a real output in [examples/](../examples/).

## Stack

- YouTube transcript extraction (auto-generated captions)
- LLM generation with a strict exercise schema
- HTML/CSS rendering, no dependencies
