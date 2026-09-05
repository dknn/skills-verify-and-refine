# Verify and Refine

A reusable agent skill for iterative quality review of projects, code, plans, and conversation outcomes.

The skill identifies concrete defects and relevant security risks, applies authorized fixes, verifies the result, and reviews again. It produces one consolidated final plan with explicit findings and verification limits.

## Install

Clone or download this repository, then copy the `verify-and-refine` directory into your agent's skills directory.

For Codex, use `$CODEX_HOME/skills` when configured, or `~/.codex/skills` otherwise. The installed entry point should be `skills/verify-and-refine/SKILL.md`.

The skill requires no runtime packages, scripts, or external services of its own. Code verification uses the tools and tests available in the target project. Other agents need support for the `SKILL.md` format; the `agents/openai.yaml` file provides optional Codex interface metadata.

## Use

### Review and fix code

```text
Use $verify-and-refine on the current project changes. Identify and fix
concrete problems within the authorized scope, verify the fixes, and repeat
until the stopping criteria are met. Deliver the final status and plan.
```

### Refine a plan without changing code

```text
Use $verify-and-refine on the latest agreed plan in this conversation.
Resolve gaps, contradictions, and evidence-backed risks. Repeat the review
and deliver the consolidated final plan. Do not modify project files.
```

### Review a specific area

```text
Use $verify-and-refine to review the authentication changes in this branch.
Report findings and proposed fixes only. Do not implement changes.
```

## How it works

1. Establish the scope, current decisions, applicable instructions, and authority to make changes.
2. Record evidence-backed findings and their consequences.
3. Apply authorized fixes or improve the plan.
4. Verify the result and review it from another relevant perspective.
5. Report completed work, unresolved issues, verification results, and the final plan.

Completion requires two consecutive substantive reviews without new concrete defects or material risks, passing relevant checks, and no unresolved required work within scope. Material changes reset the clean-review count.

Missing access, required approvals, unavailable verification, agreed resource limits, or repeated lack of progress can prevent completion. The skill must report that status honestly. Two clean reviews do not guarantee a defect-free result or replace a dedicated audit when one is needed.

## Scope and language

The skill follows the target project's instructions and approval requirements. Plan review does not authorize implementation, and review findings do not authorize unrelated refactoring, publishing, or deployment.

The instructions are in English for reuse. Responses follow the user's language, while edits follow the project's language conventions.

## Files

- [`verify-and-refine/SKILL.md`](verify-and-refine/SKILL.md): the complete workflow.
- [`verify-and-refine/agents/openai.yaml`](verify-and-refine/agents/openai.yaml): Codex display metadata and a suggested starting prompt.

## Versions and releases

This repository is versioned independently with stable SemVer tags
`vMAJOR.MINOR.PATCH`. All skills in the repository share that release. Skill
Markdown and PowerShell are distributed as validated source, without compilation.

Use a patch release for compatible corrections, a minor release for compatible
features, and a major release for breaking instructions, interfaces, or packaging.
The initial release is `v1.0.0`; do not edit a published tag to fix a release.

Merge a pull request after both `Validate (windows-latest)` and
`Validate (ubuntu-latest)` pass. Then run **Actions > Release > Run workflow**
on `main` with the new version. The workflow validates that exact commit again,
requires immutable releases, creates a new tag, prepares a draft, and publishes
it. A failed publication can leave a tag or draft for manual inspection; the
workflow never overwrites an existing tag. Publish a new version for corrections.

Repository rules require PRs, passing checks, an up-to-date branch, and resolved
review conversations on main. Force pushes and deletion are blocked. There are
no bypass actors and no required external approvals, permitting solo maintenance.
Version tags cannot be updated or deleted; releases are immutable after publication.

Use `$update-dknn-skills` from [skills-utils](https://github.com/dknn/skills-utils)
to install or update. New installations use Stable; Latest explicitly follows
the default branch. Installed source choices and pinned versions persist.
Commit SHAs and managed-file hashes identify installed content, not timestamps.
