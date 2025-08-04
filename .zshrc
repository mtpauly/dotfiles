# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=10000

# Prompt
autoload -Uz vcs_info
precmd() { 
    vcs_info
    if [[ -n $PROMPT_INCLUDE_NEWLINE ]]; then
        print
    fi
    PROMPT_INCLUDE_NEWLINE=1
}
zstyle ':vcs_info:git:*' formats '%F{198}(%b)%f'
setopt PROMPT_SUBST
PROMPT='%K{4}%n@%m%k %B%F{97}%215<...<%~ %f%b${vcs_info_msg_0_}
%(?.%F{7} %#.%F{1} ✗) %b%f%k'

# Run this to see available colors
# for i in {0..255}; do
#     print -P "%F{$i}Color $i%f"
# done

# Completions
fpath+=~/zsh/completions  # Add custom completions directory
autoload -Uz compinit && compinit

# Vim mode (this needs to go before autosuggestions or it will break the keybind)
bindkey -v

# Autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^Y' autosuggest-accept

# History navigation with Ctrl+P and Ctrl+N
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# Path setup
export PATH=$PATH:$HOME/bin:$HOME/bin-personal
export PATH=$PATH:$HOME/go/bin
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

# Automatically populate the directory stack
setopt AUTOPUSHD
setopt AUTOCD

# Aliases
alias t=tmux
alias n=nvim
alias g=git
alias copr="gh pr checkout"
alias p=python3

alias tms=tmux-sessionizer

alias ls="ls --color"
alias lsa="ls -alh"

# TODO: make more general functions like this for delete, etc
co() {
    git checkout $(git branch -vv --color=always | fzf --ansi | awk '{print $1}')
}

# No beep
unsetopt BEEP LIST_BEEP

# Only use less when the output is taller than the height of the terminal
export LESS="-FR"

# Syntax highlighting (must be sourced at the end of the zshrc)
# https://github.com/zsh-users/zsh-syntax-highlighting/tree/master?tab=readme-ov-file#why-must-zsh-syntax-highlightingzsh-be-sourced-at-the-end-of-the-zshrc-file
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
