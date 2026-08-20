# Minecraft English Server — gamified ESL environment

**Input:** a PaperMC server + ESL lesson material.
**Output:** an English-learning Minecraft server where chat is the lesson.

## Problem

Teen students learn English faster when they forget they're studying. A
Minecraft server gives them a reason to actually use English — trading,
teamwork, asking for help — but the environment has to enforce it.

## Pipeline

1. **PaperMC 26.1.2** server with a full plugin stack:
   - **AuthMe** — login protection (Spigot-Legacy jar, API 1.16;
     `perPlayerLocale: false`, `ForceSpawnLocOnJoin: true`).
   - **LuckPerms** — ranked groups with **graded chat colors**: A0–A2
     `&b` (aqua), B1–B2 `&5` (purple), C1–C2 `&d` (pink), D1 `&6` (gold).
     Your chat color *is* your English level — visible progress.
   - **PlaceholderAPI** — dynamic placeholders for scoreboards and chat.
2. Level gates: newer students get level-locked areas and guided quests;
   higher levels unlock advanced content.
3. Server-side presence in Notion (player registry via API).
4. Presentation material for students and parents
   (PDF/PPTX deck included in the course offer).

## Output

A living English classroom: students speak English to progress, and the
teacher sees level distribution at a glance — in chat colors and in Notion.

## Stack

- PaperMC (Minecraft server)
- AuthMe, LuckPerms, PlaceholderAPI
- Notion API (player registry)
- Graded color scheme mapped to CEFR levels (A0–D1)
