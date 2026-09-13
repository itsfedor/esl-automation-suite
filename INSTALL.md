# Install Edvibe Teacher - instructions for AI agents

If a user asked you to install the Edvibe Teacher skill, follow these steps.
End state: the `edvibe-teacher` skill is in YOUR skills directory, the local
`cli-anything-edvibe` CLI is installed, and the user is logged in to their own
Edvibe account.

## 1. Get the skill into your skills directory

Try in this order:

1. **Node / npx available:**
   ```bash
   npx skills add itsfedor/esl-automation-suite --skill edvibe-teacher -g -y
   ```
2. **Hermes Agent** (installs into the active profile):
   ```bash
   hermes skills install itsfedor/esl-automation-suite/skills/edvibe-teacher
   ```
   If the identifier is rejected, add the repo as a tap first and install the
   id shown by search:
   ```bash
   hermes skills tap add itsfedor/esl-automation-suite
   hermes skills search edvibe
   ```
3. **Manual copy** (works everywhere): fetch the repo and copy the skill
   folder into your own skills directory (`~/.hermes/skills/` for Hermes,
   `~/.claude/skills/` for Claude Code, `~/.codex/skills/` for Codex):
   ```bash
   git clone --depth 1 https://github.com/itsfedor/esl-automation-suite.git /tmp/esl-suite
   cp -r /tmp/esl-suite/skills/edvibe-teacher <your skills dir>/
   ```
   No git? Use curl + tar:
   ```bash
   curl -L https://github.com/itsfedor/esl-automation-suite/archive/refs/heads/main.tar.gz | tar xz -C /tmp
   cp -r /tmp/esl-automation-suite-main/skills/edvibe-teacher <your skills dir>/
   ```

Start a fresh session (or reload skills) so the new skill is picked up.

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
Do not ask the user to paste credentials into the chat.

## 4. Verify

```bash
cli-anything-edvibe doctor
```

All checks green = ready.

## 5. Hand off

Tell the user it's ready and offer to build their first lesson: ask for a
topic, level and class (or a video / article), then follow the
`edvibe-teacher` skill itself - it contains the lesson-spec format for every
exercise type and the design recipes.
