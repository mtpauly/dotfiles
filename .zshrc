# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=10000

# Prompt
autoload -Uz promptinit
promptinit
prompt adam1
# TODO: configure this more

# Completions
fpath+=~/zsh/completions
autoload -Uz compinit
compinit

# Vim mode (this needs to go before autosuggestions or it will break the keybind)
bindkey -v

# Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^Y' autosuggest-accept

# History navigation with Ctrl+P and Ctrl+N
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward
# Path setup
export PATH=$PATH:$HOME/bin:$HOME/bin-personal:$HOME/bin-work
# TODO: source platorform-dependent config files
# export PATH=$PATH:/Applications/kitty.app/Contents/MacOS
# export PATH=/opt/homebrew/opt/llvm/bin:$PATH  # want to use this version of clang first

# Source private config
ZSHRC_PRIVATE=~/.dotfiles/zshrc_private
if [[ -f $ZSHRC_PRIVATE ]]; then
    source $ZSHRC_PRIVATE
fi

# Source work zshrc
ZSHRC_WORK=~/.dotfiles-work/.zshrc
if [[ -f $ZSHRC_WORK ]]; then
    source $ZSHRC_WORK
fi

# Enable fzf completion
source <(fzf --zsh)

# Case insensitive tab completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Aliases
alias t=tmux
alias n=nvim
alias g=git
alias p=python3
alias k=kubectl

alias sw=swatch
alias tms=tmux-sessionizer
alias kssh="kitty +kitten ssh"

alias ls="ls --color"
alias lsa="ls -alh"

# No beep
unsetopt BEEP LIST_BEEP

# Only use less when the output is taller than the height of the terminal
export LESS="-FR"

# Syntax highlighting must be sourced at the end of the zshrc
# https://github.com/zsh-users/zsh-syntax-highlighting/tree/master?tab=readme-ov-file#why-must-zsh-syntax-highlightingzsh-be-sourced-at-the-end-of-the-zshrc-file
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
