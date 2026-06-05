# ai-skills

Personal collection of agent skills and commands for AI coding assistants (Claude Code, OpenCode, Cursor, etc.).

## Structure

```
skills/
  <skill-name>/
    SKILL.md          # Skill definition (frontmatter + workflow)
    scripts/          # Optional executable helpers
```

## Skills

| Skill | Description |
|-------|-------------|
| [version-bump](skills/version-bump/SKILL.md) | Analyze branch changes, bump semver, update changelog, commit, and push |

## Installation

### Claude Code

```bash
cp -r skills/<skill-name> ~/.claude/skills/
```

### OpenCode

Skills are discovered automatically when this repo is the workspace, or copy to `~/.config/opencode/skills/`.

### claude.ai

Paste the `SKILL.md` contents into project knowledge or the conversation.

## Roadmap

- Package skills as Claude plugins (`claude plugin`)
- Add more skills as they're extracted from daily work
