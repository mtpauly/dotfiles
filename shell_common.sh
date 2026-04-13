# Shared aliases, functions, and environment — sourced by both .bashrc and .zshrc

# Path
export PATH="$HOME/bin:$HOME/go/bin:/usr/local/go/bin:$PATH"

# Workspace directories for ws* scripts
export SPACE_WORKSPACES="$HOME/workspaces"
export SPACE_TEMPLATES="$HOME/workspace_templates"

# Aliases
alias t=tmux
alias n=nvim
alias g=git
alias p=python3
alias copr="gh pr checkout"
alias tms=tmux-sessionizer
alias ls="ls --color"
alias lsa="ls -alh"
alias mkdir="mkdir -p"

# Checkout a PR and open it in nvim
# Takes a PR number as an argument or opens an interactive picker if none provided
review() {
  if [ -n "$1" ]; then
    pr_number="$1"
  else
    pr_number=$(gh pr list --search "review-requested:@me" \
      --json number,title,author,headRefName \
      --jq '.[] | "\(.number)\t\(.author.login)\t\(.title)"' \
      | fzf --with-nth=1,2,3 --delimiter='\t' \
            --preview 'gh pr view {1}' \
            --preview-window=right:60% \
      | cut -f1)
  fi

  gh pr checkout "$pr_number"
  remote_base=$(gh pr view "$pr_number" --json baseRefName,headRefName | jq -r '.baseRefName')
  git fetch origin "$remote_base"

  merge_base=$(git merge-base "origin/$remote_base" HEAD)
  echo "Diffing HEAD against origin/$remote_base (common ancestor: $merge_base)"

  # From: https://github.com/sindrets/diffview.nvim/blob/main/USAGE.md#review-a-pr
  nvim -c ":DiffviewOpen origin/${remote_base}...HEAD --imply-local"
}

# Decodes a JWT token, outputting the header and payload as a JSON array
# Usage: jwt-decode <token> OR echo <token> | jwt-decode
jwt-decode() {
  jq -R 'split(".") | .[0:2] | map(@base64d) | map(fromjson)' <<< "${1:-$(cat)}"
}

# Source work config if available
if [ -f "$HOME/.dotfiles-work/shell_common.sh" ]; then
    source "$HOME/.dotfiles-work/shell_common.sh"
fi

# Source private config if available
if [ -f "$HOME/.dotfiles/shell_private" ]; then
    source "$HOME/.dotfiles/shell_private"
fi
