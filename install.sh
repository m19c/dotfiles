#!/bin/bash

source ./library.sh

if test ! $(which brew); then
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "brew is already installed"
fi

if [ ! -d "$HOME/.sdkman" ]; then
  curl -s "https://get.sdkman.io" | bash
else
  echo "sdkman is already installed"
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "oh-my-zsh is already installed"
fi

if [ ! -d "/Applications/kitty.app" ]; then
  echo "installing kitty"
  curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
else
  echo "kitty is already installed"
fi

echo "installing homebrew packages"
brew bundle

stow -t $HOME \
  alacritty \
  kitty \
  gh \
  tmux \
  tmuxinator \
  vscode \
  zsh \
  nvim \
  oh-my-posh \
  git

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
