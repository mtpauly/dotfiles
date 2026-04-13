# Source shared config (aliases, functions, PATH, work and private config)
source "$HOME/.dotfiles/shell_common.sh"

# History
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=5000
HISTFILESIZE=10000

# Prompt
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Shell options
shopt -s checkwinsize
shopt -s expand_aliases

# Completions
if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
fi
