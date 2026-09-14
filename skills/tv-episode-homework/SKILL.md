---
name: tv-episode-homework
description: "Use when a teacher wants homework or a lesson from a TV series episode: finding the episode script, writing the recap, building 4+2 exercises for chat, or a per-episode lesson series inside Edvibe."
---

# TV Episode Homework and Lesson Series

Turns one TV episode into language practice: a recap the student can check against, exercises built from real lines of the script, and a hard time budget so the homework actually gets done.

## When to use

- The teacher shares a series or episode (link, title, or just "make homework from this episode").
- The teacher runs a course where the class watches a series episode by episode.
- No trivia, no questions about actors or release years. Everything comes from the episode itself.

## Two delivery modes

| Mode | Result | Where |
|---|---|---|
| **Chat homework** | recap + 4 core exercises + 2 bonus, plain text the teacher copies | plain text in chat, never a file |
| **Edvibe lesson series** | one unit per episode inside the teacher's material, interactive and self-grading | built by the `edvibe-teacher` skill and its CLI |

Both modes use the same raw material (the episode script) and the same rules (level-capped language, quotes verify the tasks).

## Step 1: get the script

Streaming sites are usually behind bot protection. Use script sites instead:

1. **Scriptslug** (shooting scripts, best quality): search `site:scriptslug.com <series> <season>x<episode>`; the page links a PDF, `pdftotext -layout` it.
2. **tvshowtranscripts.ourboard.org**: forum transcripts, dialogue only, needs a normal browser User-Agent header.
3. **subslikescript.com**: `https://subslikescript.com/series/<Title>-<imdbID>/1,1-<Episode_Title>`.
4. **springfieldspringfield.co.uk**: `view_episode_scripts.php?tv-show=<series-slug>&episode=s01eNN` (needs a User-Agent header; take the text out of the `scrolling-script-container` div).
5. **Fandom wiki plot summary** to cross-check the story. When a page fetch fails, pull the wikitext instead:
   ```bash
   curl -sL -A "<browser UA>" "https://<series>.fandom.com/api.php?action=parse&page=<Episode_Title>&prop=wikitext&format=json&formatversion=2"
   ```

Read the whole script before writing anything. Dialogue-only transcripts mix scenes together, and the wiki recap is what tells you who says which line.

## Step 2: recap (for the chat mode)

8–12 sentences at the student's level: who, where, the problem, the key scenes, the ending. It is teacher material and does not count toward the homework time.

## Step 3a: chat homework, 4 core + 2 bonus

Whole homework ≤15 minutes; watching the episode does not count.

| Block | Size (A2) | Size (B1+) | Time |
|---|---|---|---|
| 1 Vocabulary | 8 pairs, `word -- simple definition` | 10 pairs | 2–3 min |
| 2 Fill the gaps | short article on a related theme, 6–8 gaps | 8–10 gaps | 2–3 min |
| 3 Video | the episode (student watches first) | same | — |
| 4 True / False / Not Stated | 6 statements | 8–10 | 5–6 min |
| Bonus 1 Choose the best reply | 4 situations | 4 | 2–3 min |
| Bonus 2 Your turn (speaking) | 1–2 min recording | 2 min | 1–2 min |

Rules that keep it honest:

- The fill-the-gaps article is about the episode's **theme**, never a retelling of the plot. Reuse the vocabulary words **in the exact form** they were taught.
- T/F/NS: roughly 3 true / 3 false / 1 not stated; "Not Stated" must be genuinely absent, not a reword. Keep the evidence quote for each statement.
- Choose the best reply: exactly one option follows the episode's lesson and keeps the conversation going; the other two contradict the episode or end the conversation. Never two defensible options.
- Speaking: 2 opinion questions tied to the student's own life. Depth comes from the reasoning, not from harder grammar.

## Step 3b: Edvibe lesson series (one unit per episode)

Structure and build steps live in the `edvibe-teacher` skill (`references/workflows.md`, recipe "serial course"). The shape per episode: vocabulary match (8 pairs) → fillbox article on a related theme → "Watch the episode" button → 7 True/False/Not Stated statements → hidden note with the teacher key and script quotes → test with 4 best-reply situations → voice with 2 questions.

```bash
cli-anything-edvibe lesson build --file episode-spec.json --material <series_book_id>
```

Build ahead of time if that is what the teacher asked for. Giving the homework to a student is a separate step (`homework give`) and only on request.

## Level scaling

| Level | Vocabulary | T/F count | Language |
|---|---|---|---|
| A1–A2 | 8 concrete words | 6 (chat) / 7 (lesson) | one idea per sentence, present and past simple, no idioms |
| B1 | 10 words plus 2 collocations | 8 | modals (should, can), because-clauses |
| B2+ | 10–12 including idioms | 10 | conditionals, reported speech, opinion questions |

Never push the language above the student's level to make a task "deeper". Depth comes from the question, not the grammar.

## Pitfalls

1. Answer options that are all defensible. The right answer must be objectively right and tied to the episode.
2. Gap words written in a different form than the vocabulary pair (breaks drag-and-drop and looks sloppy).
3. Statements with no source line. If the script does not support it, the statement goes.
4. "Not Stated" that is actually false, or a trick reword of a true line.
5. Turning the extra article into a plot summary.
6. Reusing the same episode for two lessons, or building the next episode's lesson over the previous one: one material, one unit per episode, numbered in order.

## Verification checklist

- [ ] Script found and read in full; plot cross-checked against the wiki summary
- [ ] Every statement, quote and situation traceable to the episode
- [ ] Vocabulary level-matched; gap forms identical to the pairs
- [ ] T/F balanced, "Not Stated" genuinely absent
- [ ] Homework minutes within budget (chat mode)
- [ ] Lesson built with `--dry-run` clean, then `lesson show` confirms the structure
