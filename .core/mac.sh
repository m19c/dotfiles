#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
# shellcheck disable=SC1091
source "$SCRIPT_DIR/library.sh"

if ! command -v brew >/dev/null 2>&1; then
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

if ! command -v claude >/dev/null 2>&1; then
  echo "install claude"
  curl -fsSL https://claude.ai/install.sh | bash
else
  echo "claude is already installed"
fi

echo "installing homebrew packages"
brew bundle --file "$REPO_ROOT/Brewfile"

if ! kubectl view-secret -h >/dev/null 2>&1; then
  echo "installing kubectl-view-secret plugin"
  kubectl krew install view-secret
else
  echo "kubectl-view-secret is already installed"
fi

stow_common_dotfiles
stow_macos_only_dotfiles
install_vscode_plugins

# ensure that skhd is up & running
skhd --install-service
skhd --start-service

if [ ! -f "/usr/local/bin/config-connector" ]; then
  echo "installing config-connector"

  CCT=$(mktemp -d)
  pushd "$CCT" || exit

  gcloud storage cp gs://cnrm/latest/cli.tar.gz .
  tar zxf cli.tar.gz
  sudo mv darwin/amd64/config-connector /usr/local/bin

  popd || exit
fi

require_private_env "1Password Account ID" "OP_ACCOUNT"

BACKGROUND_IMAGE=future.png
LOCAL_IMAGE_PATH=$(realpath "$REPO_ROOT/background/${BACKGROUND_IMAGE}")
osascript -e 'tell application "Finder" to set desktop picture to POSIX file "'"$LOCAL_IMAGE_PATH"'"'
BACKGROUND_RESULT=$?
if [ "$BACKGROUND_RESULT" == "0" ]; then
  echo "wallpaper set successfully"
else
  echo "unable to set wallpaper"
fi
