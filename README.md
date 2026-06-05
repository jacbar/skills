# ai-skills

Personal collection of agent skills and commands for AI coding assistants (Claude Code, OpenCode, Codex, etc.).

## Skills

| Skill | Description |
|-------|-------------|
| [version-bump](skills/version-bump/SKILL.md) | Analyze branch changes, bump semver, update changelog, commit, and push |

## Installation

Run the install script to copy all skills to your preferred platform:

```bash
./install.sh <target>
```

**Targets:**

| Target | Installs to |
|--------|-------------|
| `claude` | `~/.claude/skills/` |
| `codex` | `~/.codex/skills/` |
| `opencode` | `~/.config/opencode/skills/` |
| `all` | All of the above |

**Examples:**

```bash
./install.sh all        # install everywhere
./install.sh claude     # Claude Code only
```

### claude.ai

Paste the `SKILL.md` contents into project knowledge or the conversation.
