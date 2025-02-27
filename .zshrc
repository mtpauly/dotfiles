# Don't need to provide omz path on nixos
if [ -z $NIX_PATH ]; then
    export ZSH="$HOME/.oh-my-zsh"
fi

ZSH_THEME=robbyrussell
plugins=(
    git
    vi-mode
    zsh-syntax-highlighting
    zsh-autosuggestions
)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src  # required for zsh-completions
source $ZSH/oh-my-zsh.sh

# User configuration
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

# Aliases
alias t=tmux
alias n=nvim
alias p=python3
alias sw=swatch
alias tms=tmux-sessionizer
alias kssh="kitty +kitten ssh"

# No beep
unsetopt BEEP LIST_BEEP

# Only use less when the output is taller than the height of the terminal
export LESS="-FR"

# Configure autosuggestions with C-y to complete
function accept-autosuggestion-widget() {
    zle autosuggest-accept
}
zle -N accept-autosuggestion-widget  # Register the widget with ZLE
bindkey '^Y' accept-autosuggestion-widget  # Bind Ctrl+Y to the custom widget
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS+=(accept-autosuggestion-widget)
