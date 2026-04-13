#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
# shellcheck disable=SC1091
source "$SCRIPT_DIR/library.sh"

read_package_file() {
  local file_path="$1"
  local -n out_packages=$2
  local line

  if [[ ! -f "$file_path" ]]; then
    echo "Error: package file not found: $file_path" >&2
    exit 1
  fi

  out_packages=()
  while IFS= read -r line || [[ -n "$line" ]]; do
    [[ -z "$line" ]] && continue
    [[ "$line" =~ ^[[:space:]]*# ]] && continue
    out_packages+=("$line")
  done < "$file_path"
}

ensure_pacman_packages() {
  local packages=()
  if ! command -v pacman >/dev/null 2>&1; then
    echo "Error: pacman not found. This installer expects Arch Linux." >&2
    exit 1
  fi

  read_package_file "$REPO_ROOT/pacman.txt" packages
  if [[ ${#packages[@]} -eq 0 ]]; then
    echo "No pacman packages found in pacman.txt; skipping."
    return 0
  fi

  echo "Installing Arch dependencies via pacman..."
  sudo pacman -S --needed "${packages[@]}"
}

ensure_aur_packages() {
  local packages=()
  local aur_helper=""

  read_package_file "$REPO_ROOT/aur.txt" packages
  if [[ ${#packages[@]} -eq 0 ]]; then
    echo "No AUR packages found in aur.txt; skipping."
    return 0
  fi

  if command -v yay >/dev/null 2>&1; then
    aur_helper="yay"
  elif command -v paru >/dev/null 2>&1; then
    aur_helper="paru"
  else
    echo "AUR packages requested but no helper found (yay/paru). Skipping AUR install." >&2
    return 0
  fi

  echo "Installing AUR dependencies via ${aur_helper}..."
  "$aur_helper" -S --needed "${packages[@]}"
}

ensure_pacman_packages
ensure_aur_packages
stow_common_dotfiles
stow_linux_only_dotfiles
install_vscode_plugins
