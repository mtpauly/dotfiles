# Source shared config (aliases, functions, PATH, work and private config)
source "$HOME/.dotfiles/shell_common.sh"

# History
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
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Vim mode (this needs to go before autosuggestions or it will break the keybind)
bindkey -v

# Autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^Y' autosuggest-accept

# History navigation with Ctrl+P and Ctrl+N
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# Enable fzf completion
source <(fzf --zsh)

# Automatically populate the directory stack
setopt AUTOPUSHD AUTOCD

# No beep
unsetopt BEEP LIST_BEEP

# Syntax highlighting (must be sourced at the end of the zshrc)
# https://github.com/zsh-users/zsh-syntax-highlighting/tree/master?tab=readme-ov-file#why-must-zsh-syntax-highlightingzsh-be-sourced-at-the-end-of-the-zshrc-file
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
