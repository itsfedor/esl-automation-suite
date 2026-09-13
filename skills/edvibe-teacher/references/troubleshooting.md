# Troubleshooting

## Readiness

- `cli-anything-edvibe` not found → run the skill's `scripts/setup.sh` (installs locally, no sudo). If it still isn't found, open a new terminal.
- `doctor` shows `login: FAIL` → the teacher runs `cli-anything-edvibe login` in their own terminal. Never ask for the password and never run login on their behalf. Then re-run `doctor`.

## During work

- **«Лимит N запросов в час»** (pace limiter) → intentional account protection. Stop for now; continue later. Explain gently.
- **"WS transport failure" / timeouts** → check the internet; wait 5–10 minutes and try once. If it repeats, stop and tell the teacher.
- **"Book X has no course"** → wrong material id. Re-check with `materials list` or create a fresh material.
- **`spec invalid: ...`** → fix exactly what it lists (unknown type, missing field); the message names the section and exercise index. Re-run `--dry-run`.
- **A build failed halfway** → already-saved exercises stay in the lesson. Run `lesson show`, then build a spec that contains ONLY the missing part into the same lesson (additive — no duplicates). Never re-run the full spec, it would duplicate the saved exercises.

## Boundaries

- **No delete commands** — by design. Removing content = doing it in the Edvibe UI.
- **Wrong account** → `logout`, then `login` again.
- **Editing existing exercises** — v1 commands only add. Small text fixes are done in the Edvibe UI; or add a corrected exercise and the teacher removes the wrong one in the UI.
- **Publishing** — always the teacher's manual action in Edvibe.
