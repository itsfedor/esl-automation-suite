# C1 Exercise Builder: personalized academic writing

**Input:** raw topic material (IELTS-style charts, tables, topic notes).
**Output:** a personalized C1 writing exercise ("Describing Visual Data")
as a single interactive HTML file, deployed to GitHub Pages.

## Problem

Academic writing at C1 needs practice with real data descriptions (IELTS
Task 1 style). Generic worksheets don't fit a student's level or interests;
hand-building charts and tasks takes hours.

## Pipeline

1. Collect the source material (charts, tables, useful language).
2. Build the exercise for the specific student:
   - **Cheat sheet**: the functional language for describing data
     (trends, proportions, comparisons).
   - **3 tasks**: pie chart, bar chart, table, each with a clear
     writing prompt and word budget.
3. Render as a single self-contained HTML file (no build step).
4. Deploy to GitHub Pages via a workflow, and the student gets a link.

## Output

[Live example: Describing Visual Data: C1](https://itsfedor.github.io/student-materials)
([repo](https://github.com/itsfedor/student-materials))

## Stack

- LLM generation level-tuned to C1
- Single-file HTML/CSS
- GitHub Pages + Actions
