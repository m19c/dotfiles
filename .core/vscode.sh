#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
VSCODE_LIST_FILE="$REPO_ROOT/vscode.txt"

if ! command -v code >/dev/null 2>&1; then
  echo "VS Code CLI ('code') not found; skipping extension installation."
  exit 0
fi

if [[ ! -f "$VSCODE_LIST_FILE" ]]; then
  echo "VS Code extension list not found at ${VSCODE_LIST_FILE}; skipping."
  exit 0
fi

echo "Installing VS Code extensions from ${VSCODE_LIST_FILE}..."
while IFS= read -r extension || [[ -n "$extension" ]]; do
  [[ -z "$extension" ]] && continue
  [[ "$extension" =~ ^[[:space:]]*# ]] && continue
  code --install-extension "$extension"
done < "$VSCODE_LIST_FILE"
