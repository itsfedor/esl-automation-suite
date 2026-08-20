# TV-Episode Homework

**Input:** a TV episode (script or subtitles).
**Output:** homework for the next lesson — episode recap + 4 core exercises +
2 bonus, designed to take the student **≤15 minutes**.

## Problem

Students watch series anyway. Turning that watching into structured language
practice used to mean manually picking quotes, writing comprehension
questions and grammar exercises from scratch.

## Pipeline

1. Extract the episode script (subtitles).
2. Build the homework:
   - **Recap** — a short, level-appropriate summary so the student can
     check they followed the plot.
   - **4 + 2 exercises** — comprehension, vocabulary from the episode,
     grammar in context, rephrasing with real lines from the show.
   - **Time budget** — the whole homework is capped at ~15 minutes, so
     students actually do it.
3. Deliver as HTML, ready for Edvibe or direct send.

## Output

A compact homework page per episode — the same structure every time, so the
student knows what to expect.

## Stack

- Subtitle/script extraction
- LLM generation with a fixed 4+2 exercise layout and a strict time budget
- HTML rendering
