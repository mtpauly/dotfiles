## mtp's dotfiles

### Setup Instructions

- Install the relevant requirements
- Clone this repo to `$HOME/.dotfiles`
- Run `symlink.sh`
- Use `bin/` for any scripts you want added to `$PATH`
- Use `zshrc_private/` for any environment variables and additional configuration. All files in this directory are sourced at the bottom of `.zshrc`


### Requirements

- Shell: [zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
    - Shell Config Manger: [oh my zsh](https://github.com/ohmyzsh/ohmyzsh)
        - Suggestions: [autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
        - Highlighting: [syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- Terminal Manager: [tmux](https://github.com/tmux/tmux)
- Editor: [nvim](https://github.com/neovim/neovim)
- Conda: [miniforge](https://github.com/conda-forge/miniforge)


#### Useful Command Line Tools

- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fzf](https://github.com/junegunn/fzf)
- [gh](https://github.com/cli/cli)


### Mac Setup

- Terminal Emulator: [kitty](https://sw.kovidgoyal.net/kitty/)
    - Font: [FiraCode Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode)
- Package Manager: [brew](https://brew.sh/)
- Window Manager: [AeroSpace](https://github.com/nikitabobko/AeroSpace)
- Keyboard Customizer: [Karabiner-Elements](https://karabiner-elements.pqrs.org)
- Night Shift: [flux](https://justgetflux.com/)


### Linux Setup

- Distro: [arch](https://wiki.archlinux.org/title/Installation_guide)
    - AUR Helper: [yay](https://github.com/Jguer/yay)
- Terminal Emulator: [kitty](https://sw.kovidgoyal.net/kitty/)
    - Font: [FiraCode Nerd Font](https://archlinux.org/packages/extra/any/ttf-firacode-nerd/)
- Window Manager: [i3](https://i3wm.org/)
    - Brightness: [brightnessctl](https://github.com/Hummer12007/brightnessctl)
    - Status Bar: [i3status](https://man.archlinux.org/man/i3status.1)
    - Night Shift: [redshift](https://wiki.archlinux.org/title/Redshift)
- Audio: [pipewire](https://wiki.archlinux.org/title/PipeWire)
    - GUI: [pavucontrol](https://archlinux.org/packages/extra/x86_64/pavucontrol/)
    - [wireplumber](https://wiki.archlinux.org/title/WirePlumber)
    - [pipewire-pulse](https://archlinux.org/packages/extra/x86_64/pipewire-pulse/)
- Keyboard Customizer: [keyd](https://github.com/rvaiya/keyd)


### `neovim` Setup

TODO: give overview

