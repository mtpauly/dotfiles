# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=robbyrussell

plugins=(
    git
    vi-mode
    zsh-syntax-highlighting
    zsh-autosuggestions
)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src  # required for zsh-completions
source $ZSH/oh-my-zsh.sh
autoload -U compinit && compinit  # required for conda-zsh-completion

# User configuration
# TODO: is this the appropriate place for this configuration
export PATH=$PATH:$HOME/bin
export PATH=$PATH:/Applications/kitty.app/Contents/MacOS
export PATH=/opt/homebrew/opt/llvm/bin:$PATH  # want to use this version of clang first

# source private config
for file in $HOME/.zshrc_private/*; do
    if [[ -f $file && -r $file ]]; then
        source $file
    fi
done

# enable fzf completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# aliases
alias t=tmux
alias n=nvim
alias v=nvim
alias p=python3
alias tms=tmux-sessionizer
alias tmd="tmux-sessionizer default"
alias lg=lazygit
alias cs="gh copilot suggest" # https://docs.github.com/en/copilot/github-copilot-in-the-cli/using-github-copilot-in-the-cli
alias ce="gh copilot explain"

# no beep
unsetopt BEEP LIST_BEEP

# only use less when the output is taller than the height of the terminal
export LESS="-FR"

# configure command time
ZSH_COMMAND_TIME_MIN_SECONDS=3
ZSH_COMMAND_TIME_MSG="Execution time: %s sec"
ZSH_COMMAND_TIME_COLOR="cyan"
ZSH_COMMAND_TIME_EXCLUDE=(nvim n v tmux t lf lg)

# configure autosuggestions with C-y to complete
# Define a custom widget to accept autosuggestion
function accept-autosuggestion-widget() {
    zle autosuggest-accept
}
zle -N accept-autosuggestion-widget  # Register the widget with ZLE

bindkey '^Y' accept-autosuggestion-widget  # Bind Ctrl+Y to the custom widget

# Add the custom widget to ZSH_AUTOSUGGEST_ACCEPT_WIDGETS for autosuggestions
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS+=(accept-autosuggestion-widget)

# setup shell traps for tmux
# only traps when shell is interactive
# [[ -n $PS1 ]] && trap "test -n $TMUX && test $(tmux list-panes | wc -l) -eq 1 && test $(tmux list-windows | wc -l) -eq 1 && tmux-sessionizer default" 0

# if you wish to use IMDS set AWS_EC2_METADATA_DISABLED=false

export AWS_EC2_METADATA_DISABLED=true

