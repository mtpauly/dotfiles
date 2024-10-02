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
link $HOME/.dotfiles/kitty $HOME/.config/kitty
link $HOME/.dotfiles/sway $HOME/.config/sway
link $HOME/.dotfiles/i3 $HOME/.config/i3
link $HOME/.dotfiles/i3status $HOME/.config/i3status
link $HOME/.dotfiles/redshift $HOME/.config/redshift
link $HOME/.dotfiles/aerospace $HOME/.config/aerospace

# directories
link $HOME/.dotfiles/zshrc_private $HOME/.zshrc_private
link $HOME/.dotfiles/bin $HOME/bin-personal

