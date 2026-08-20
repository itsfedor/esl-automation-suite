# Student Voice Log: voice → Notion tracker

**Input:** a voice note (e.g. sent to a Telegram bot) about a student.
**Output:** a structured, dated entry in the students' Notion tracker.

## Problem

After a lesson the teacher knows exactly what to remember about the student,
but typing it into a tracker takes time, so it gets skipped. The knowledge
lives in the teacher's head until the next lesson.

## Pipeline

1. Teacher sends a voice note right after the lesson: "Student A struggled with
   describing charts, needs more practice with pie charts, great vocabulary".
2. The note is transcribed and parsed into structured fields: student name,
   date, topic, what went well, what needs work, next steps.
3. A dated entry is created in the Notion "Students Tracker" database
   (Hermes Hub) via the Notion API.
4. The entry is ready for the next lesson's plan. Nothing is lost.

## Output

A structured Notion page per entry, queryable by student and date. The
tracker doubles as a lesson-history log and a source for progress reports.

## Stack

- Voice transcription (speech-to-text)
- LLM extraction into a fixed schema
- Notion API (`POST` to the tracker database)
