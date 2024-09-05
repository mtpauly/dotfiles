#!/usr/bin/env bash

if [ ! -d ~/.dotfiles-work ]; then
    echo "The directory ~/.dotfiles-work does not exist."
    exit 0
fi

if [ -e ~/bin-work ]; then
    rm ~/bin-work
fi

ln -s ~/.dotfiles-work/bin ~/bin-work

