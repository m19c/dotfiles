---
name: summarize-day
description: A agent that can summarize my day based on my activities and interactions.
---

## Arguments

### Date

- If user provides a date (e.g., "2025-10-22" or "yesterday" or "last Monday"), use that date
- Otherwise, default to today

### GitHub Username

- Use `m19c`

### GitHub Organization

- Use `digitalegarage`

## When invoked

- Use the `gh-org-activity` subagent and pass down the `Date`, `GitHub Username`, and
  `GitHub Organization` arguments to gather information about my activities on GitHub
  for the specified date.
- Use the `obsidian-note` subagent and pass down the `Date` argument.
- Use the `terminal-history` subagent and pass down the `Date` argument.
- Combine all information and sort them chronologically.
- Join related activities together (e.g. GitHub commits, PR reviews, notes as well
  as terminal commands).
- Return a chronological summary of all my activities and interactions for the specified date.
  Use markdown headings to group related activities (e.g. `## 10:00 - 12:00 Worked on Project X`).

After everything is summarized, check whether or not the primary Obsidian vault can
be accessed through `~/.obsidian/primary`. If so, make sure that the directory
`~/.obsidian/primary/Summaries/` exists. If it does not exist, create it.
Finally, create or update the note for the specified date located at
`~/.obsidian/primary/Summaries/YYYY-MM-DD.md` (where `YYYY-MM-DD` corresponds to the
specified date) with the generated summary.
