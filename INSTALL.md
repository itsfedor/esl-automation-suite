# Install the ESL Automation Suite skills — instructions for AI agents

If a user asked you to install the Edvibe Teacher skill (the chat-driven
lesson builder for edvibe.com), follow these steps. The suite also carries
`tv-episode-homework` (TV episode → homework or a per-episode lesson series);
install it too when the user teaches with series or films.

End state: the skills are in YOUR skills directory, the local
`cli-anything-edvibe` CLI is installed, and the user is logged in to their own
Edvibe account.

## 1. Get the skills into your skills directory

Try in this order:

1. **Node / npx available:**
   ```bash
   npx skills add itsfedor/esl-automation-suite --skill edvibe-teacher --skill tv-episode-homework -g -y
   ```
   `--skill '*'` (or `--all`) installs every skill in the suite. Add `-a hermes-agent`, `-a claude-code`, `-a codex` (or any other agent id) to target one agent; without `-a` every detected agent gets the skills. `--copy` copies files instead of symlinking, which is safer on Windows.
2. **Hermes Agent** (installs into the active profile):
   ```bash
   hermes skills install itsfedor/esl-automation-suite/skills/edvibe-teacher
   hermes skills install itsfedor/esl-automation-suite/skills/tv-episode-homework
   ```
   If the identifier is rejected, add the repo as a tap first and install the
   id shown by search:
   ```bash
   hermes skills tap add itsfedor/esl-automation-suite
   hermes skills search edvibe
   ```
3. **Manual copy** (works everywhere): fetch the repo and copy the skill
   folders into your own skills directory (`~/.hermes/skills/` for Hermes,
   `~/.claude/skills/` for Claude Code, `~/.codex/skills/` for Codex):
   ```bash
   git clone --depth 1 https://github.com/itsfedor/esl-automation-suite.git /tmp/esl-suite
   cp -r /tmp/esl-suite/skills/edvibe-teacher /tmp/esl-suite/skills/tv-episode-homework <your skills dir>/
   ```
   No git? Use curl + tar:
   ```bash
   curl -L https://github.com/itsfedor/esl-automation-suite/archive/refs/heads/main.tar.gz | tar xz -C /tmp
   cp -r /tmp/esl-automation-suite-main/skills/* <your skills dir>/
   ```

Start a fresh session (or reload skills) so the new skills are picked up.

## 2. Install the local CLI

```bash
sh <skills dir>/edvibe-teacher/scripts/setup.sh
```

macOS / Linux, Python 3.9+. The script prefers `uv`, then `pipx`, then
`pip --user`, then a private venv. It installs from the wheel bundled inside
the skill (`assets/`) - nothing else to download. (Windows support is coming.)

## 3. Login - one local step, done by the user

Ask the user to run this once in their own terminal:

```
cli-anything-edvibe login
```

The password is typed hidden and never stored; the session token is cached
locally at `~/.edvibe/session.json`, so everything afterwards just works.
Do not ask the user to paste credentials into the chat. The login belongs to
whoever runs it: every teacher uses the tool with their own Edvibe account.

## 4. Verify

```bash
cli-anything-edvibe doctor
```

All checks green = ready.

## 5. Hand off

Tell the user it's ready and offer to build their first lesson: ask for a
topic, level and class (or a video / article), then follow the
`edvibe-teacher` skill itself - it contains the lesson-spec format for every
exercise type and the design recipes (including the per-episode course
recipe used for series lessons).

The CLI also works with students: `students list`, `classroom show`,
`homework show` are read-only, and `homework give --lesson <id> --class-id
<id> --pupil <id>` pins a lesson to the class and sends its exercises to that
student's homework. Run it only on an explicit request.
