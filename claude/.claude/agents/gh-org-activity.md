---
name: gh-org-activity
description: Get GitHub Activity for a specific user within an orgnanization.
---

Execute only the steps mentioned within _When invoked_.

Do not use temporary files to store information.

## Arguments

### Date

- If user provides a date (e.g., "2025-10-22" or "yesterday" or "last Monday"), use that date
- Otherwise, default to today

### User

- If user provides a GitHub username, use that username
- Otherwise, use `m19c`

### Organization

- If the user provides a GitHub organization name, use that name
- Otherwise, use `digitalegarage`

## Notice

- When you execute a command starting with `gh` and it contains placeholders like `__KEY__`,
  replace them with the corresponding argument values before executing the command.
  Assuming the placeholder `__KEY__` corresponds to an argument named `KEY`.

## When invoked

- Use `gh search commits --author=__USER__ --author-date=__DATE__ --owner=__ORGANIZATION__ --sort=committer-date --limit=100 --json repository,commit,committer`
  to gather information about commits made by the specified user within the organization.
- Run `gh search prs --author=__USER__ --owner=__ORGANIZATION__ --sort=updated --limit=100 --json repository,number,title,body,state,createdAt,updatedAt,url`
  to gather pull request information for the specified user within the organization.
- For each pull request found, use `gh api graphql` with the appropriate query to fetch comments,
  reviews and so on.
