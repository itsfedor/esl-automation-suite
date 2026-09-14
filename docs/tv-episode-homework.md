# TV-Episode Homework and Lesson Series

**Input:** a TV series episode (script or subtitles).
**Output:** either homework for the next lesson (recap + 4 core exercises + 2 bonus, capped at **15 minutes** of student work), or a full interactive lesson in Edvibe as part of a per-episode course.

## Problem

Students watch series anyway. Turning that watching into structured language
practice used to mean manually picking quotes, writing comprehension
questions and grammar exercises from scratch, one episode at a time.

## Pipeline

1. Extract the episode script (script sites; subtitles as a fallback) and cross-check the plot against the show's wiki summary.
2. Read the whole episode before writing anything. Every task is then built from real lines.
3. Build the homework or the lesson:
   - **Recap**: a short, level-appropriate summary so the student can check they followed the plot.
   - **4 + 2 exercises** (chat homework): vocabulary from the episode, a themed gap-fill article, comprehension, rephrasing with real lines from the show.
   - **7-block lesson** (Edvibe course): vocabulary match, themed article, "watch the episode" button, True/False/Not Stated with a hidden teacher key, "choose the best reply" situations, speaking questions.
4. Deliver: homework as plain text for chat, lessons straight into the teacher's Edvibe account through the `edvibe-teacher` CLI.

## Time budget (homework mode)

| Block | Size | Time |
|---|---|---|
| Vocabulary | 8 pairs | 2-3 min |
| Fill the gaps | 6-8 gaps | 2-3 min |
| Watching the episode | not counted | - |
| True/False/Not Stated | 6-7 statements | 5-6 min |
| Choose the best reply | 4 situations | 2-3 min |
| Speaking (voice) | 1-2 min recording | 1-2 min |

## Output

Homework: a compact copy-ready block per episode, same structure every time.
Lesson series: one unit per episode inside the teacher's material, numbered in
order, self-grading exercises, answer keys hidden from students.

## Stack

- Script extraction (script sites, browser User-Agent, wiki wikitext for cross-checks)
- LLM generation with a fixed exercise layout, verbatim quotes and a strict time budget
- Edvibe build through `cli-anything-edvibe lesson build` (see [docs/edvibe-teacher.md](edvibe-teacher.md))

Skill: [skills/tv-episode-homework/SKILL.md](../skills/tv-episode-homework/SKILL.md)
