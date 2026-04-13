#!/usr/bin/env bash

link() {
    src="$1"
    dst="$2"

    if [ -e "$dst" ] && [ ! -L "$dst" ]; then
        echo "WARNING: $dst already exists, skipping"
        return
    fi

    ln -sfn "$src" "$dst"
}

# Shell and git
link $HOME/.dotfiles/.zshrc $HOME/.zshrc
link $HOME/.dotfiles/.bashrc $HOME/.bashrc
link $HOME/.dotfiles/.bash_profile $HOME/.bash_profile
link $HOME/.dotfiles/.gitconfig $HOME/.gitconfig

# Config
link $HOME/.dotfiles/nvim $HOME/.config/nvim
link $HOME/.dotfiles/tmux $HOME/.config/tmux
link $HOME/.dotfiles/kitty $HOME/.config/kitty
link $HOME/.dotfiles/aerospace $HOME/.config/aerospace
link $HOME/.dotfiles/skhd $HOME/.config/skhd
link $HOME/.dotfiles/lazygit $HOME/.config/lazygit

# Bin scripts
mkdir -p $HOME/bin
link $HOME/.dotfiles/bin/open-or-search $HOME/bin/open-or-search
link $HOME/.dotfiles/bin/query-claude $HOME/bin/query-claude
link $HOME/.dotfiles/bin/query-websearch $HOME/bin/query-websearch
link $HOME/.dotfiles/bin/tmux-sessionizer $HOME/bin/tmux-sessionizer

