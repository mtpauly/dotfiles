#!/bin/zsh

# to user root
# config files
ln -s $HOME/.dotfiles/.gitconfig $HOME/.gitconfig
ln -s $HOME/.dotfiles/.skhdrc $HOME/.skhdrc
ln -s $HOME/.dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/.dotfiles/.yabairc $HOME/.yabairc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
# bin
ln -s $HOME/.dotfiles/bin $HOME

# to .config
ln -s $HOME/.dotfiles/nvim $HOME/.config

