# Import nvim directory to PATH
export PATH=$HOME/nvim:$PATH

# Import webpc to PATH
export PATH=$PATH:$HOME/webp/bin

# ZZSH Autocomplete
autoload -Uz compinit
compinit
_comp_options+=(globdots)

# Fast Node Manager
export PATH="$HOME/.local/share/fnm:$PATH"
eval "`fnm env`"
eval "$(fnm env --use-on-cd)"

# Hotkay for tmux-sessionizer
alias tmux-sessionizer="$HOME/.config/scripts/tmux-sessionizer"
bindkey -s "^f" "tmux-sessionizer\n"

# Delete key.. delete this line if its not needed
bindkey  "^[[3~"  delete-char

# Allows for prompt expansion based on directory structure
setopt PROMPT_SUBST

# Function to get the current Git branch
function git_branch {
  local branch=$(git branch 2>/dev/null | sed -n "s/^\* \(.*\)/[\1]/p")
  echo -n $branch
}

# Function to display Git status indicator
function git_status {
  if [[ -d .git ]]; then
    local modified_count=$(git status -s | grep "^ M" | wc -l)
    local added_count=$(git status -s | grep "^A " | wc -l)
    local staged_count=$(git status -s | grep "^M " | wc -l)
    local untracked_count=$(git status -s | grep "^??" | wc -l)
    local branch_status="%F{green}$(git_branch)%f%F{yellow}"

    if (( modified_count > 0 )); then
      echo -n "%F{red}[?${modified_count}]$branch_status%f"
    elif (( added_count > 0 )); then
      echo -n "%F{yellow}[?${added_count}]$branch_status%f"
    elif (( staged_count > 0 )); then
      echo -n "%F{green}[\u2714${staged_count}]$branch_status%f"
    elif (( untracked_count > 0 )); then
      echo -n "%F{magenta}[\u2753${untracked_count}]$branch_status%f"
    else
      echo -n "%F{green}[\u2714${branch_status}]"
    fi
  fi
}


# Call the function for coloring 
alias ls='ls --color=always'

# Must clone the repo first!!
source $HOME/.config/zsh/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Set the prompt
PROMPT='$(git_status)%F{yellow}%1~%f> '

