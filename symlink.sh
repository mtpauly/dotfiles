#!/bin/zsh

# home
ln -sf $HOME/.dotfiles/.zshrc $HOME/.zshrc
ln -sf $HOME/.dotfiles/.gitconfig $HOME/.gitconfig
ln -sf $HOME/.dotfiles/.yabairc $HOME/.yabairc
ln -sf $HOME/.dotfiles/.skhdrc $HOME/.skhdrc
ln -sf $HOME/.dotfiles/.p10k.zsh $HOME/.p10k.zsh

# .config
ln -sf $HOME/.dotfiles/nvim $HOME/.config
ln -sf $HOME/.dotfiles/tmux $HOME/.config

# bin
ln -sf $HOME/.dotfiles/bin $HOME

