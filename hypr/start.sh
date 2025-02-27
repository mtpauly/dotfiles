#!/usr/bin/env bash

# Wallpaper
swww init &
swww img ~/wallpapers/beach.jpg

#nm-applet --indicator &

waybar &

dunst

# Clipboard manager
# https://wiki.hyprland.org/Useful-Utilities/Clipboard-Managers/#copyq
copyq --start-server
