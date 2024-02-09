[[ -f $STARTUPDIR/generate_container_user ]] && source $STARTUPDIR/generate_container_user
[[ -f ~/dotfiles/zsh/aliases.zsh ]] && source ~/dotfiles/zsh/aliases.zsh
[[ -f ~/dotfiles/zsh/functions.zsh ]] && source ~/dotfiles/zsh/functions.zsh

eval "$(starship init bash)"

