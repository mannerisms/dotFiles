[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh
[[ -f ~/.zsh/functions.zsh ]] && source ~/.zsh/functions.zsh
[[ -f ~/.zsh/plugins.zsh ]] && source ~/.zsh/plugins.zsh
[[ -f ~/.zsh/starship.zsh ]] && source ~/.zsh/starship.zsh


# Set vim as the default editor
VISUAL=vim; export VISUAL EDITOR=vim; export EDITOR=vim

# switch caps and escape permanently if on linux with setxbmap
if [[ -f /usr/bin/setxbmap ]]; then
    setxkbmap -option caps:escape
fi



# open multiple files in vim as tabs
alias vim="vim -p"



bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
bindkey '^n' clear-screen

eval "$(starship init zsh)"
