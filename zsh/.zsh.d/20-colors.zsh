# Colors & Prompt Configuration

# Enable color support for utilities
export CLICOLOR=1

# Allow variable/function expansion inside the prompt string
setopt PROMPT_SUBST

# Load official Git prompt integration if available (Homebrew or system git)
GIT_PROMPT_SCRIPT=""
if command -v brew >/dev/null 2>&1; then
  brew_prefix="$(brew --prefix)"
  for candidate in \
    "$brew_prefix/etc/bash_completion.d/git-prompt.sh" \
    "$brew_prefix/share/git-core/contrib/completion/git-prompt.sh"; do
    if [ -f "$candidate" ]; then
      GIT_PROMPT_SCRIPT="$candidate"
      break
    fi
  done
  unset brew_prefix candidate
fi
if [ -z "$GIT_PROMPT_SCRIPT" ] && [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
  GIT_PROMPT_SCRIPT="/usr/share/git-core/contrib/completion/git-prompt.sh"
fi
if [ -n "$GIT_PROMPT_SCRIPT" ]; then
  . "$GIT_PROMPT_SCRIPT"

  # Configure Git prompt features
  export GIT_PS1_SHOWDIRTYSTATE=1
  export GIT_PS1_SHOWUNTRACKEDFILES=1
  export GIT_PS1_SHOWSTASHSTATE=1
  export GIT_PS1_SHOWUPSTREAM="auto"
fi

# Update PROMPT dynamically before rendering, using zsh's native %F{color} syntax
_update_prompt() {
  local exit_code=$?
  local status_indicator=""

  # Red indicator if previous command failed
  if [ $exit_code -ne 0 ]; then
    status_indicator="%F{red}[${exit_code}] %f"
  fi

  # Git status check
  local git_info=""
  if [ -n "$GIT_PROMPT_SCRIPT" ]; then
    # Use official __git_ps1 to get branch name and dirty/untracked/stash/upstream flags
    local raw_git
    raw_git=$(__git_ps1 "%s" 2>/dev/null)
    if [[ -n "$raw_git" ]]; then
      local branch_name="${raw_git%% *}"
      local git_status="${raw_git#$branch_name}"

      git_info=" on %F{blue}${branch_name}%f${git_status}"
    fi
  else
    # Fallback to custom check if official script is missing
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
      local branch
      branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
      if [[ -n "$branch" ]]; then
        local dirty=""
        if git status --porcelain --ignore-submodules 2>/dev/null | grep -q '^'; then
          dirty="*"
        fi
        git_info=" on %F{blue}${branch}${dirty}%f"
      fi
    fi
  fi

  PROMPT="${status_indicator}%F{magenta}%n%f in %F{green}%~%f${git_info}
$ "
}

# Run the update prompt hook before each prompt render
precmd_functions+=(_update_prompt)
export PS2="%F{red}→ %f"
