# FZF (Command Line Fuzzy Finder) Configuration

if command -v fzf >/dev/null 2>&1; then
  # Default options for direct 'fzf' executions
  # --min-height overrides fzf's own key-bindings.zsh default of "20+", which
  # otherwise forces Ctrl-T/Ctrl-R/Alt-C taller than --height 30% on a normal terminal.
  export FZF_DEFAULT_OPTS='--height 25% --min-height 3 --border --layout=reverse --inline-info'

  # Explicitly apply options to key bindings to prevent internal script overrides
  export FZF_CTRL_T_OPTS="$FZF_DEFAULT_OPTS"
  export FZF_CTRL_R_OPTS="$FZF_DEFAULT_OPTS"
  export FZF_ALT_C_OPTS="$FZF_DEFAULT_OPTS"

  fzf_prefix=""
  if command -v brew >/dev/null 2>&1; then
    fzf_prefix="$(brew --prefix)/opt/fzf"
  fi

  # Enable FZF key bindings if available
  for fzf_bindings in \
    "$fzf_prefix/shell/key-bindings.zsh" \
    "/usr/share/fzf/shell/key-bindings.zsh" \
    "/usr/share/doc/fzf/examples/key-bindings.zsh" \
    "$HOME/.fzf/shell/key-bindings.zsh"; do
    if [ -f "$fzf_bindings" ]; then
      . "$fzf_bindings"
      break
    fi
  done
  unset fzf_bindings

  # Enable FZF's ** trigger completion if available
  for fzf_completion in \
    "$fzf_prefix/shell/completion.zsh" \
    "/usr/share/fzf/shell/completion.zsh" \
    "/usr/share/doc/fzf/examples/completion.zsh" \
    "$HOME/.fzf/shell/completion.zsh"; do
    if [ -f "$fzf_completion" ]; then
      . "$fzf_completion"
      break
    fi
  done
  unset fzf_completion fzf_prefix

  # Use ripgrep (rg) if installed for extremely fast file fuzzy finding
  if command -v rg >/dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  fi
fi
