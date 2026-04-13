#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

usage() {
  cat <<'EOF'
Usage: ./install.sh [--target mac|arch] [--help]

Installs dotfiles for the detected platform by default.
Use --target to override automatic platform detection.
EOF
}

detect_target() {
  local uname_out
  uname_out="$(uname -s)"

  if [[ "$uname_out" == "Darwin" ]]; then
    echo "mac"
    return 0
  fi

  if [[ "$uname_out" == "Linux" ]] && [[ -f /etc/os-release ]]; then
    # shellcheck disable=SC1091
    source /etc/os-release
    if [[ "${ID:-}" == "arch" ]] || [[ "${ID_LIKE:-}" == *"arch"* ]]; then
      echo "arch"
      return 0
    fi
  fi

  return 1
}

target=""
while [[ $# -gt 0 ]]; do
  case "$1" in
    --target)
      if [[ $# -lt 2 ]]; then
        echo "Error: --target requires a value of mac or arch." >&2
        exit 1
      fi
      target="$2"
      shift 2
      ;;
    --help|-h)
      usage
      exit 0
      ;;
    *)
      echo "Error: unknown argument '$1'." >&2
      usage
      exit 1
      ;;
  esac
done

if [[ -z "$target" ]]; then
  if ! target="$(detect_target)"; then
    echo "Error: unsupported platform. Use --target mac|arch to override." >&2
    exit 1
  fi
fi

case "$target" in
  mac)
    bash "$SCRIPT_DIR/.core/mac.sh"
    ;;
  arch)
    bash "$SCRIPT_DIR/.core/arch.sh"
    ;;
  *)
    echo "Error: unsupported target '$target'. Expected 'mac' or 'arch'." >&2
    exit 1
    ;;
esac
