#!/usr/bin/env zsh

link() {
    local src="$1"
    local dst="$2"

    if [[ -L $dst ]]; then
        rm $dst
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

# Directories
link $HOME/.dotfiles/bin $HOME/bin-personal

