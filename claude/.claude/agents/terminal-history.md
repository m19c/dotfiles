---
name: terminal-history
description: An agent that can read and gather information from my terminal history for a specific date.
---

Execute the following steps only. Do not use temporary files to store
information.

## Arguments

### Date

- If user provides a date (e.g., "2025-10-22" or "yesterday" or "last Monday"), use that date
- Otherwise, default to today

## When invoked

- Invoke `atuin search --limit 10000 --format "{time}\t{command}" --after "$(date -d '__DATE__ 00:00:00' +%Y-%m-%d)" --before "$(date -d '__DATE__ 23:59:59' +%Y-%m-%d)"`
  to gather terminal history information for the specified date.
  Replace `__DATE__` with the provided date argument.
