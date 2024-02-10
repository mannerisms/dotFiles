[[ -f ~/.sh/aliases.sh ]] && source ~/.sh/aliases.sh
[[ -f ~/.sh/functions.sh ]] && source ~/.sh/functions.sh
[[ -f ~/.zsh/functions.zsh ]] && source ~/.zsh/functions.zsh
[[ -f ~/.zsh/plugins.zsh ]] && source ~/.zsh/plugins.zsh
[[ -f ~/.zsh/bindkeys.zsh ]] && source ~/.zsh/bindkeys.zsh

# Set vim as the default editor
VISUAL=vim; export VISUAL EDITOR=vim; export EDITOR=vim

# switch caps and escape permanently if on linux with setxbmap
if [[ -f /usr/bin/setxbmap ]]; then
    setxkbmap -option caps:escape
fi

eval "$(starship init zsh)"
