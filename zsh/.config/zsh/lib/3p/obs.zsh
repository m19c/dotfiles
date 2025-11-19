obs set-default "Marc"

obs_cd() {
  local result=$(obs print-default --path-only)
  [ -n "$result" ] && cd -- "$result"
}
