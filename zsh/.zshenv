export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$HOME/.config/zsh"

export PATH=$PATH:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.config/emacs/bin:/usr/local/bin
if [[ "$(uname -s)" == "Darwin" ]]; then
  export PATH="$PATH:$HOME/Library/Python/3.9/bin"
  export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
fi
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

export LC_ALL="en_US.UTF-8"
export LC_CTYPE=en_US.UTF-8

export GOPATH="$HOME/.local/share/go"

export USE_GKE_GCLOUD_AUTH_PLUGIN=True

test -f ~/.privateenv && source ~/.privateenv

umask 022
. "$HOME/.cargo/env"

# asdf specific
. ${ASDF_DATA_DIR:-$HOME/.asdf}/plugins/golang/set-env.zsh
