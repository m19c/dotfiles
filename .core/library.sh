#!/bin/bash

PRIVATE_ENV_FILE=~/.privateenv

stow_common_dotfiles() {
  stow -t "$HOME" \
    gh \
    tmux \
    tmuxinator \
    vscode \
    zsh \
    nvim \
    oh-my-posh \
    git \
    htop \
    fastfetch \
    atuin \
    claude \
    newsboat \
    asdf
}

stow_linux_only_dotfiles() {
  stow -t "$HOME" \
    ghostty-linux
}

stow_macos_only_dotfiles() {
  stow -t "$HOME" \
    alacritty \
    ghostty-mac \
    kitty \
    skhd
}

install_vscode_plugins() {
  local script_path
  script_path="${REPO_ROOT}/.core/vscode.sh"

  if [[ ! -f "$script_path" ]]; then
    echo "VS Code plugin script not found at ${script_path}; skipping."
    return 0
  fi

  echo "Installing VS Code extensions..."
  bash "$script_path"
}

require_private_env() {
  local prompt=$1
  local env=$2

  touch "$PRIVATE_ENV_FILE"
  source "$PRIVATE_ENV_FILE"

  if grep -q "$env" "${PRIVATE_ENV_FILE}"; then
    echo "${env} already present in ${PRIVATE_ENV_FILE}"
  else
    echo "$prompt"
    read -r value
    echo "${env}=${value}" >> "$PRIVATE_ENV_FILE"
  fi
}
