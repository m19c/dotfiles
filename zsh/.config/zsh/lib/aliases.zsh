# fast access
alias dev='cd ~/Development'

alias vi='nvim'
alias vim='nvim'

alias cd="z"

# git
alias gs="git status"
alias gc="git commit"
alias ga="git add"

# configure default search engine for s
alias s="s -p google"

# replace ping
alias ping=gping

# alias du
alias du="dust"

# alias for top
alias top="btm"

# devops / sre
alias k=kubectl
alias t=tmux
alias ktx=kubectx
alias kns=kubens

# claudi <3
alias claudi=claude
# for my east-german gspusi
alias claudy=claudi

# replacement ls
alias l="eza -a --icons=always --group-directories-first --long --git "
alias ls="eza -a --icons=always --group-directories-first --long --git "
alias ll="eza -a --icons=always --group-directories-first -l "

# enforce grep colorful output
alias grep="grep --color"

# override cat
alias cat="bat"

# other utilities
alias lg="lazygit"

source-a() { set -a; for arg; do source $arg; done; set +a; }
