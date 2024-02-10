# Default PATH
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

[[ -f $STARTUPDIR/generate_container_user ]] && source $STARTUPDIR/generate_container_user
[[ -f ~/.sh/aliases.sh ]] && source ~/.sh/aliases.sh
[[ -f ~/.sh/functions.sh ]] && source ~/.sh/functions.sh

# Starship config
export STARSHIP_CONFIG=~/.config/starship/starship.toml 

eval "$(starship init bash)"

