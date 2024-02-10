#!/bin/bash
apt-get install tree
apt-get install yt-dlp
apt-get install nvm
apt-get install bat
apt-get install stow
apt-get install trash
apt-get install fzf

# ask user if they want to install zsh
read -p "Do you want to install zsh? (y/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Installing zsh"
    apt-get install zsh
    apt-get install zsh-syntax-highlighting
    apt-get install zsh-autosuggestions
    apt-get install zsh-you-should-use
else
    echo "Skipping zsh installation"
fi