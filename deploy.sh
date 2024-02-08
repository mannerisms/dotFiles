#!/usr/bin/env bash

prompt_yes_no() {
    while true; do
        echo -n "$1 (y/n) "
        read -r answer </dev/tty
        case "$answer" in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

install_package() {
    echo "$1 is not installed. Would you like to install it?"
    if prompt_yes_no; then
        if command -v apt-get >/dev/null; then
            sudo apt-get install "$1" -y
        elif command -v brew >/dev/null; then
            brew install "$1"
        elif command -v pkg >/dev/null; then
            sudo pkg install "$1"
        elif command -v pacman >/dev/null; then
            sudo pacman -S "$1"
        else
            echo "Package manager is unknown. Please install $1 manually."
        fi
    fi
}

check_for_software() {
    echo "Checking to see if $1 is installed..."
    if ! command -v "$1" >/dev/null; then
        install_package "$1"
    else
        echo "$1 is installed."
    fi
}

check_default_shell() {
    if [[ "$SHELL" != */zsh ]]; then
        echo "Default shell is not zsh. Do you want to change it to zsh?"
        if prompt_yes_no; then
            chsh -s "$(which zsh)"
        else
            echo "Warning: Configuration may not work properly without zsh."
        fi
    else
        echo "Default shell is zsh."
    fi
}

backup_and_link() {
    local src="$1" dest="$2"
    if prompt_yes_no "Would you like to backup $dest?"; then
        if [[ -e "$dest" ]]; then
            echo "Backing up $dest to ${dest}.old"
            mv "$dest" "${dest}.old"
        fi
    fi
    echo "Linking $src to $dest"
    ln -sf "$src" "$dest"
}

main() {
    if ! prompt_yes_no "Let's get started?"; then
        echo "Quitting, nothing was changed."
        exit 0
    fi

    check_for_software zsh
    check_for_software vim
    check_for_software tmux

    check_default_shell

    backup_and_link "$HOME/dotfiles/zsh/zshenv" "$HOME/.zshenv"
    backup_and_link "$HOME/dotfiles/vim/vimrc.vim" "$HOME/.vimrc"
    backup_and_link "$HOME/dotfiles/tmux/tmux.conf" "$HOME/.tmux.conf"

    # Looping through dotfiles/config for linking
    for configfile in "$HOME/dotfiles/config/"*; do
        fname=$(basename "$configfile")
        dest="$HOME/.config/$fname"
        echo "Processing $fname for linking..."
        backup_and_link "$configfile" "$dest"
    done

    echo "Please log out and log back in for the default shell to be initialized."
}

main "$@"
