#!/bin/bash

backup_files() {
    if [ -f ~/.bashrc ]; then
        mv -f ~/.bashrc ~/.bashrc.bak
    fi

    if [ -f ~/.zshrc ]; then
        mv -f ~/.zshrc ~/.zshrc.bak
    fi
}

# check if operating system is linux or macos
if [ "$(uname)" == "Darwin" ]; then
    FONT_DIR="$HOME/Library/Fonts"
    # Do something under Mac OS X platform
    echo "MacOS detected"
    # install mac dependencies
    brew update && brew upgrade
    bash scripts/install/install-deps-macos.sh
    
elif [ "$(uname)" == "Linux" ]; then
    FONT_DIR="$HOME/.fonts"
    # Do something under GNU/Linux platform
    echo "Linux detected"
    # install linux dependencies
    sudo apt-get update && sudo apt-get upgrade
    sudo bash scripts/install/install-deps-linux.sh

    # install starship
    curl -sS https://starship.rs/install.sh | sh
fi


# Call the backup_files function
backup_files

# stow dotfiles
stow ~/dotfiles

# copy fonts from dotfiles to font directory
cp ~/dotfiles/fonts/* $FONT_DIR

# load new fonts
fc-cache -fv

# set zsh as default shell
chsh -s $(which zsh)
