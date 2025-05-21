#!/usr/bin/env bash

link() {
    src="$1"
    dst="$2"

    if [ -e $dst ]; then
        rm $dst || exit 1
    fi

    ln -s $src $dst
}

# Files
link $HOME/.dotfiles/.zshrc $HOME/.zshrc
link $HOME/.dotfiles/.gitconfig $HOME/.gitconfig

# Config
link $HOME/.dotfiles/nvim $HOME/.config/nvim
link $HOME/.dotfiles/tmux $HOME/.config/tmux
link $HOME/.dotfiles/kitty $HOME/.config/kitty
link $HOME/.dotfiles/aerospace $HOME/.config/aerospace
link $HOME/.dotfiles/skhd $HOME/.config/skhd
link $HOME/.dotfiles/hypr $HOME/.config/hypr
link $HOME/.dotfiles/waybar $HOME/.config/waybar

# Directories
link $HOME/.dotfiles/bin $HOME/bin-personal

