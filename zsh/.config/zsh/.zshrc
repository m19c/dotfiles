# 3p tools
source ~/.config/zsh/lib/aliases.zsh
source ~/.config/zsh/lib/func.zsh
source ~/.config/zsh/lib/gpg.zsh
source ~/.config/zsh/lib/homebrew.zsh

source ~/.config/zsh/lib/3p/omzsh.zsh
source ~/.config/zsh/lib/3p/tmux.zsh
source ~/.config/zsh/lib/3p/terminal.zsh
source ~/.config/zsh/lib/3p/google.zsh
source ~/.config/zsh/lib/3p/nvm.zsh
source ~/.config/zsh/lib/3p/mcfly.zsh
source ~/.config/zsh/lib/3p/gh.zsh
source ~/.config/zsh/lib/3p/zoxide.zsh
source ~/.config/zsh/lib/3p/tmuxinator.zsh

source ~/.config/zsh/lib/lang/go.zsh
source ~/.config/zsh/lib/lang/rust.zsh
source ~/.config/zsh/lib/lang/js.zsh
source ~/.config/zsh/lib/lang/python.zsh

source ~/.config/zsh/lib/fzf.zsh

eval $(thefuck --alias)
eval $(thefuck --alias fk)

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

if [[ -o interactive ]]; then
    fastfetch --config default
fi
