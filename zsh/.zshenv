export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$HOME/.config/zsh"

export PATH=$PATH:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/Library/Python/3.9/bin:$HOME/.config/emacs/bin:/usr/local/bin
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

export FZF_DEFAULT_COMMAND='fd --type file --hidden --exclude .git --color=always'
export FZF_DEFAULT_OPTS="--ansi"

export EDITOR=vi
export KUBE_EDITOR=vi

export LC_ALL="en_US.UTF-8"
export LC_CTYPE=en_US.UTF-8

export GOPATH="$HOME/.local/share/go"

export USE_GKE_GCLOUD_AUTH_PLUGIN=True

test -f ~/.privateenv && source ~/.privateenv

umask 022
