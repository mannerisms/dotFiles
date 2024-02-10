# ALIASES ---------------------------------------------------------------------

# open multiple files in vim as tabs
alias vim="vim -p"

# Use vim for editing config files
alias dotconfig="vim $HOME/dotfiles/"
alias zshconfig="vim $HOME/dotfiles/zsh/zshrc"

alias s='source ~/.zshrc'

# Git aliases
alias gst='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -am'
alias gp="git push"
alias gpd="git push --dry-run"
alias gpf="git push --force"
alias gl="git pull"

# set list commands
alias la='ls -lGa'
alias ls='ls -lG'

# Python3 as default python
alias python='python3'

# Docker aliases
alias d=docker
alias dc=docker-compose
alias dkill="pgrep \"Docker\" | xargs kill -9"

# tmux aliases
alias ta='tmux attach -t'

# Misc aliases
alias hcat='highlight -O ansi'
alias c='clear'
alias rm=trash
alias trim="awk '{\$1=\$1;print}'"
alias cat='bat'
alias chx='chmod +x'

# check if current shell is zsh or bash
if [ -n "$ZSH_VERSION" ]; then
  alias s="source ~/.zshrc"
elif [ -n "$BASH_VERSION" ]; then
  alias s="source ~/.bashrc"
fi