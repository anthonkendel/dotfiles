# FZF (Command Line Fuzzy Finder) Configuration

if command -v fzf >/dev/null 2>&1; then
  # Default options for direct 'fzf' executions
  # --min-height overrides fzf's own key-bindings.bash default of "20+", which
  # otherwise forces Ctrl-T/Ctrl-R/Alt-C taller than --height 30% on a normal terminal.
  export FZF_DEFAULT_OPTS='--height 25% --min-height 3 --border --layout=reverse --inline-info'

  # Explicitly apply options to key bindings to prevent internal script overrides
  export FZF_CTRL_T_OPTS='--height 25% --min-height 3 --border --layout=reverse --inline-info'
  export FZF_CTRL_R_OPTS='--height 25% --min-height 3 --border --layout=reverse --inline-info'
  export FZF_ALT_C_OPTS='--height 25% --min-height 3 --border --layout=reverse --inline-info'

  # Enable FZF key bindings if available
  for fzf_bindings in "/usr/share/fzf/shell/key-bindings.bash" "/usr/share/doc/fzf/examples/key-bindings.bash" "$HOME/.fzf/shell/key-bindings.bash"; do
    if [ -f "$fzf_bindings" ]; then
      . "$fzf_bindings"
      break
    fi
  done
  unset fzf_bindings

  # Use ripgrep (rg) if installed for extremely fast file fuzzy finding
  if command -v rg >/dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  fi
fi
