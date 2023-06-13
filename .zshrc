# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=robbyrussell

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    vi-mode
    zsh-syntax-highlighting
    zsh-autosuggestions
    conda-zsh-completion
)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src  # required for zsh-completions
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/mtp/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/mtp/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/mtp/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/mtp/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
conda deactivate # to prevent conda showing in the terminal prompt

# no beep
unsetopt BEEP LIST_BEEP

# aliases
alias t=tmux
alias n=nvim
alias p=python

# my directories
# TODO: put this in another file
export KDROPOUT=/Users/mtp/Projects/k-dropout
export DECKBUILDER=/Users/mtp/Projects/deckbuilder
export GPTCHESS=/Users/mtp/Projects/gpt-chess
export CHAOSSIM=/Users/mtp/Projects/chaos_simulator_python
export SUPERAUTO=/Users/mtp/Projects/superauto

export OBSIDIAN=/Users/mtp/Documents/personal

export CS128=/Users/mtp/School/cs128
export MATH113=/Users/mtp/School/math113
export CS229=/Users/mtp/School/cs229
export GENED1125=/Users/mtp/School/gened1125

# sparse probing
export HF_DATASETS_CACHE=/Users/mtp/Downloads/sparse-probing/hf_datasets_cache
export FEATURE_DATASET_DIR=/Users/mtp/Downloads/sparse-probing/feature_dataset_dir
export TRANSFORMERS_CACHE=/Users/mtp/Downloads/sparse-probing/transformers_cache
export SPARSE_PROBING_ROOT=/Users/mtp/Projects/sparse-probing
export RESULTS_DIR=/Users/mtp/Downloads/sparse-probing/results

# remote machines
export SUPERCLOUD=mpauly@txe1-login.mit.edu
export TESLA_T4_BOX=ec2-44-214-124-190.compute-1.amazonaws.com
export V100_BOX=ec2-18-235-142-16.compute-1.amazonaws.com

# add scripts
export PATH=$PATH:/Users/mtp/bin

export LESS="-FR"

