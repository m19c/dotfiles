#!/bin/bash

PRIVATE_ENV_FILE=~/.privateenv


if test ! $(which brew); then
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "brew is already installed"
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "oh-my-zsh is already installed"
fi

echo "installing homebrew packages"
brew bundle

stow -t $HOME \
  alacritty \
  gh \
  starship \
  tmux \
  tmuxinator \
  vscode \
  zsh

require_private_env() {
  local prompt=$1
  local env=$2

  touch $PRIVATE_ENV_FILE
  source $PRIVATE_ENV_FILE

  if grep -q $env "${PRIVATE_ENV_FILE}"; then
    echo "${env} already present in ${PRIVATE_ENV_FILE}"
  else
    echo $prompt
    read value
    echo "${env}=${value}" >> $PRIVATE_ENV_FILE
  fi
}

require_private_env "1Password Account ID" "OP_ACCOUNT"
