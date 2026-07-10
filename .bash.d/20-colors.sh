# Colors & Prompt Configuration

# Enable color support for utilities
export CLICOLOR=1

# Define ANSI colors (using tput)
if [[ $- == *i* ]]; then
  # Standard colors
  RED=$(tput setaf 1)
  GREEN=$(tput setaf 2)
  YELLOW=$(tput setaf 3)
  BLUE=$(tput setaf 4)
  MAGENTA=$(tput setaf 5)
  CYAN=$(tput setaf 6)
  WHITE=$(tput setaf 7)
  BOLD=$(tput bold)
  RESET=$(tput sgr0)

  export RED GREEN YELLOW BLUE MAGENTA CYAN WHITE BOLD RESET
fi

# Load official Git prompt integration if available
GIT_PROMPT_SCRIPT="/usr/share/git-core/contrib/completion/git-prompt.sh"
if [ -f "$GIT_PROMPT_SCRIPT" ]; then
  . "$GIT_PROMPT_SCRIPT"
  
  # Configure Git prompt features
  export GIT_PS1_SHOWDIRTYSTATE=1
  export GIT_PS1_SHOWUNTRACKEDFILES=1
  export GIT_PS1_SHOWSTASHSTATE=1
  export GIT_PS1_SHOWUPSTREAM="auto"
fi

# Update PS1 dynamically before rendering - high performance & robust
_update_prompt() {
  local EXIT_CODE=$?
  local status_indicator=""
  
  # Red arrow or indicator if previous command failed
  if [ $EXIT_CODE -ne 0 ]; then
    status_indicator="\[${RED}\][${EXIT_CODE}] \[${RESET}\]"
  fi
  
  # Git status check
  local git_info=""
  if [ -f "$GIT_PROMPT_SCRIPT" ]; then
    # Use official __git_ps1 to get branch name and dirty/untracked/stash/upstream flags
    local raw_git
    raw_git=$(__git_ps1 "%s" 2>/dev/null)
    if [[ -n "$raw_git" ]]; then
      # Extract branch name and status symbols
      local branch_name="${raw_git%% *}"
      local git_status="${raw_git#$branch_name}"
      
      git_info=" on \[${BLUE}\]${branch_name}\[${RESET}\]${git_status}"
    fi
  else
    # Fallback to custom optimized check if official script is missing
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
      local branch
      branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
      if [[ -n "$branch" ]]; then
        local dirty=""
        if git status --porcelain --ignore-submodules 2>/dev/null | grep -q '^'; then
          dirty="*"
        fi
        git_info=" on \[${BLUE}\]${branch}${dirty}\[${RESET}\]"
      fi
    fi
  fi
  
  local symbol='$ '
  
  PS1="${status_indicator}\[${MAGENTA}\]\u\[${RESET}\] in \[${GREEN}\]\w\[${RESET}\]${git_info}\n${symbol}"
}

# Run the update prompt command
if [[ $- == *i* ]]; then
  PROMPT_COMMAND="_update_prompt"
  export PS2="\[$RED\]→ \[$RESET\]"
fi
