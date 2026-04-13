# Set PATH, MANPATH, etc., for Homebrew when available.
if command -v brew >/dev/null 2>&1; then
  eval "$(brew shellenv)"
fi
