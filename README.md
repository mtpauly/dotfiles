# mt's dotfiles

## Setup

- `git clone git@github.com:mtpauly/dotfiles.git $HOME/.dotfiles`
- `cd $HOME/.dotfiles && ./setup.sh`
- Use `bin/` for any scripts you want added to `$PATH`
- Use `shell_private` for secrets, API keys, and machine-specific environment variables (gitignored)

## Tools

- Shell: [zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
    - Shell Config Manger: [oh my zsh](https://github.com/ohmyzsh/ohmyzsh)
        - Suggestions: [autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
        - Highlighting: [syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- Terminal Manager: [tmux](https://github.com/tmux/tmux)
- Editor: [nvim](https://github.com/neovim/neovim)
- Terminal Emulator: [kitty](https://sw.kovidgoyal.net/kitty/)
- Hotkey Daemon: [skhd](https://github.com/koekeishiya/skhd)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fzf](https://github.com/junegunn/fzf)
- [gh](https://github.com/cli/cli)
- [entr](https://github.com/eradman/entr)

## Mac Setup

- Package Manager: [brew](https://brew.sh/)
- Window Manager: [AeroSpace](https://github.com/nikitabobko/AeroSpace)
- Keyboard Customizer: [Karabiner-Elements](https://karabiner-elements.pqrs.org)
- Night Shift: [flux](https://justgetflux.com/)
- Font: [FiraCode Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode)

## `neovim` Setup

- Plugin Manager: [lazy.nvim](https://github.com/folke/lazy.nvim)
- Completion: [blink.cmp](https://github.com/Saghen/blink.cmp)
- LSP: [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- File Navigation: [telescope](https://github.com/nvim-telescope/telescope.nvim), [oil.nvim](https://github.com/stevearc/oil.nvim), [harpoon](https://github.com/ThePrimeagen/harpoon)
- Git: [diffview.nvim](https://github.com/sindrets/diffview.nvim), [fugitive](https://github.com/tpope/vim-fugitive)
