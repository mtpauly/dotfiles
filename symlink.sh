#!/usr/bin/env zsh

link() {
    local src="$1"
    local dst="$2"

    if [[ -L $dst ]]; then
        rm $dst
    fi

    ln -s $src $dst
}

# files
link $HOME/.dotfiles/.zshrc $HOME/.zshrc
link $HOME/.dotfiles/.gitconfig $HOME/.gitconfig
link $HOME/.dotfiles/.yabairc $HOME/.yabairc
link $HOME/.dotfiles/.skhdrc $HOME/.skhdrc

# .config
link $HOME/.dotfiles/nvim $HOME/.config/nvim
link $HOME/.dotfiles/tmux $HOME/.config/tmux
link $HOME/.dotfiles/lazygit $HOME/.config/lazygit
link $HOME/.dotfiles/lf $HOME/.config/lf

# directories
link $HOME/.dotfiles/zshrc_private $HOME/.zshrc_private
link $HOME/.dotfiles/bin $HOME/bin

