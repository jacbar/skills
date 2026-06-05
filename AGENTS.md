# AGENTS.md

Instructions for AI agents working in this repository.

## Repository Purpose

This is a personal skills library — agent-packaged workflows and commands for AI coding assistants. Skills here are extracted from daily engineering work and refined for reuse.

## Conventions

- Skills live under `skills/<skill-name>/SKILL.md`
- Skill directories use `kebab-case`
- Each skill has YAML frontmatter with at least a `description` field
- Scripts (if any) go in `skills/<skill-name>/scripts/` and use `#!/bin/bash` with `set -e`
- `SKILL.md` is always uppercase, always this exact filename

## Creating a New Skill

1. Create `skills/<skill-name>/SKILL.md` with frontmatter and numbered workflow steps
2. Add executable scripts under `scripts/` if the skill needs them
3. Update the skills table in `README.md`
4. Keep `SKILL.md` concise — put reference material in supporting files

## SKILL.md Format

```markdown
---
description: One-sentence description of what the skill does.
---

# Skill Title

## Step 1: ...
## Step 2: ...

## Important Notes
- ...
```

## What Not to Do

- Do not commit secrets, tokens, or credentials
- Do not add skills that duplicate well-known public skills without adding personal value
- Do not modify existing skills without understanding their workflow end-to-end
