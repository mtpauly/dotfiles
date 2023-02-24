#!/bin/zsh

# to user root
ln -s $HOME/.dotfiles/.gitconfig $HOME/.gitconfig
ln -s $HOME/.dotfiles/.skhdrc $HOME/.skhdrc
ln -s $HOME/.dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/.dotfiles/.yabairc $HOME/.yabairc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# to .config
ln -s $HOME/.dotfiles/nvim $HOME/.config/nvim

