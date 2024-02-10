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
alias gp="git push -u 2>&1 | tee >(cat) | sed 's/\x1b\[[0-9;]*m//g' | grep \"pull/new\" | awk '{print \$2}' | xargs open"
alias gpf="git push -fu 2>&1 | tee >(cat) | sed 's/\x1b\[[0-9;]*m//g' | grep \"pull/new\" | awk '{print \$2}' | xargs open"

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