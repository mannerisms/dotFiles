# === Path Configuration ===
# Base PATH
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# Homebrew PATH (should come before other PATH modifications)
export PATH="/opt/homebrew/bin:$PATH"

# === Editor Configuration ===
export EDITOR=vim
export VISUAL=$EDITOR

# === Source Configuration Files ===
# Array of config files to source
local config_files=(
    ~/.sh/aliases.sh
    ~/.sh/functions.sh
    ~/.zsh/functions.zsh
    ~/.zsh/plugins.zsh
    ~/.zsh/bindkeys.zsh
)

# Source each config file if it exists
for file in $config_files; do
    [[ -f $file ]] && source $file
done

# === System Specific Configuration ===
# Remap caps lock to escape on Linux systems
if [[ -f /usr/bin/setxkbmap ]]; then
    setxkbmap -option caps:escape || echo "Failed to remap caps lock to escape"
fi

# === Starship Prompt ===
export STARSHIP_CONFIG=~/.config/starship/starship.toml 
eval "$(starship init zsh)"

# === Conda Configuration ===
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

