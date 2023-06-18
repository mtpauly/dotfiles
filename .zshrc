# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=robbyrussell

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

