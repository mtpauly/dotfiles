# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=robbyrussell

plugins=(
    git
    vi-mode
    zsh-syntax-highlighting
    zsh-autosuggestions
    command-time
    conda-zsh-completion
)

# TODO: figure out whats the deal with these completions and update readme
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src  # required for zsh-completions
source $ZSH/oh-my-zsh.sh
autoload -U compinit && compinit

# User configuration
# add scripts
export PATH=$PATH:$HOME/bin

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
alias p=python
alias tms=tmux-sessionizer
alias lg=lazygit

# no beep
unsetopt BEEP LIST_BEEP

# only use less when the output is taller than the height of the terminal
export LESS="-FR"

# configure command time
ZSH_COMMAND_TIME_MIN_SECONDS=3
ZSH_COMMAND_TIME_MSG="Execution time: %s sec"
ZSH_COMMAND_TIME_COLOR="cyan"
ZSH_COMMAND_TIME_EXCLUDE=(nvim n tmux t)

