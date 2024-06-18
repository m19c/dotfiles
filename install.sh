#!/bin/bash

source ./library.sh

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
  zsh \
  nvim

require_private_env "1Password Account ID" "OP_ACCOUNT"

BACKGROUND_IMAGE=future.png
LOCAL_IMAGE_PATH=$(realpath ./background/${BACKGROUND_IMAGE})
osascript -e 'tell application "Finder" to set desktop picture to POSIX file "'"$LOCAL_IMAGE_PATH"'"'
BACKGROUND_RESULT=$?
if [ $BACKGROUND_RESULT == "0" ]; then
  echo "wallpaper set successfully"
else
  echo "unable to set wallpaper"
fi
