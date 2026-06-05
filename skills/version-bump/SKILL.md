---
name: version-bump
description: Analyze branch changes, bump version, update changelog, commit, and push
---

# Version Bump & Changelog

## Step 1: Analyze the Branch

1. Identify the current branch and base branch:

   ```bash
   git branch --show-current
   ```

   If on `main` or `master`, STOP and report: "You must be on a feature branch, not main."

2. Determine the base branch (usually `main` or `master`):

   ```bash
   git remote show origin | grep 'HEAD branch'
   ```

3. Gather all commits since diverging from the base branch:

   ```bash
   git log --oneline <base>..HEAD
   ```

4. Gather the full diff to understand the scope of changes:

   ```bash
   git diff <base>...HEAD --stat
   ```

5. Read commit messages and the diff to classify the changes:
   - **Breaking changes** (API removals, incompatible schema changes, renamed public exports) → suggest **major**
   - **New features** (new endpoints, new commands, new config options, new public API) → suggest **minor**
   - **Bug fixes, refactors, docs, chores** → suggest **patch**

## Step 2: Suggest Version Bump

Present a summary:

```
Branch: <branch-name>
Commits: <count> commits since <base>

Changes:
  - <grouped summary of changes>

Suggested bump: <major|minor|patch>
Reason: <brief justification>
```

If `$ARGUMENTS` was provided (`major`, `minor`, or `patch`), use that instead of suggesting.
Otherwise, wait for my confirmation or override.

## Step 3: Detect Project Type & Current Version

Detect the project type and locate the version file:

### TypeScript / Node.js

- Look for `package.json` in the project root
- Read the current `version` field

### Python

- Look for `pyproject.toml` in the project root
- Read the `version` field from `[project]` or `[tool.poetry]`

### .NET

- Look for `*.csproj` or `Directory.Build.props` in the project root
- Read the `<Version>` or `<VersionPrefix>` element

If multiple indicators exist, ask which project type to use.
If none are found, STOP and ask where the version is stored.

## Step 4: Update the Version

Calculate the new version by incrementing the appropriate segment (semver):

- `major`: X.0.0
- `minor`: current_major.X.0
- `patch`: current_major.current_minor.X

Update the version in the appropriate file(s):

### TypeScript / Node.js

1. Update `version` in `package.json`
2. If `package-lock.json` exists, run:

   ```bash
   npm install --package-lock-only
   ```

### Python

1. Update `version` in `pyproject.toml`
2. Run:

   ```bash
   uv sync
   ```

### .NET

1. Update `<Version>` or `<VersionPrefix>` in the `.csproj` or `Directory.Build.props`
2. If the bump is **major**, also update `<AssemblyVersion>` to `<new-major>.0.0.0`.
   Do NOT touch `<AssemblyVersion>` for minor or patch bumps.
3. No additional sync step needed.

## Step 5: Update Changelog

1. Look for an existing `CHANGELOG.md` in the project root.
   - If it exists, read its format and follow the same conventions.
   - If it does not exist, create one using [Keep a Changelog](https://keepachangelog.com) format.

2. Add a new entry at the top (below the header) with:

   ```markdown
   ## [<new-version>] - <YYYY-MM-DD>

   ### Added

   - <new features, if any>

   ### Changed

   - <modifications to existing features, if any>

   ### Fixed

   - <bug fixes, if any>

   ### Removed

   - <removed features, if any>
   ```

   Only include sections that have entries. Write concise, user-facing descriptions —
   not raw commit messages. Group related changes into single bullet points.

## Step 6: Review

Present the full set of changes for my review:

```
Version: <old> → <new>
Files modified:
  - <list of files changed>

Changelog entry:
  <the new changelog section>
```

Wait for my approval before proceeding. If I request changes, apply them and present again.

## Step 7: Commit and Push

CRITICAL: Only execute this step AFTER I have approved.

1. Stage all version-related changes:

   ```bash
   git add -A
   ```

2. Commit with a standardized message:

   ```bash
   git commit -m "chore: bump version to <new-version>"
   ```

3. Push to the current branch:

   ```bash
   git push
   ```

4. Report the outcome:

   ```
   Version bump complete.
     Version: <old> → <new>
     Branch: <branch-name>
     Changelog: Updated

   Ready for your review.
   ```

## Important Notes

- Do NOT commit or push until I explicitly approve.
- Do NOT create or push git tags — tagging is handled separately during release.
- Do NOT modify any files beyond the version file(s), lockfiles, and CHANGELOG.md.
- If the branch has uncommitted changes before starting, warn me and ask how to proceed.
