#!/bin/bash

brew update 

# ask if brew should be upgraded
read -p "Do you want to upgrade existing brew packages? (y/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Upgrading brew"
    brew upgrade
else
    echo "Skipping brew upgrade"
fi

brew install alacritty
brew install alfred
brew install alt-tab
brew install bat
brew install docker
brew install docker-compose
brew install fzf
brew install istat-menus
brew install logseq
brew install nvim
brew install stow
brew install tmux
brew install trash
brew install tree
brew install whatsapp
brew install yt-dlp
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install zsh-you-should-use
