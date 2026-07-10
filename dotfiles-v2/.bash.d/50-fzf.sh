# FZF (Command Line Fuzzy Finder) Configuration

# Default options for direct 'fzf' executions
export FZF_DEFAULT_OPTS='--height 30% --border --layout=reverse --inline-info'

# Explicitly apply options to key bindings to prevent internal script overrides
export FZF_CTRL_T_OPTS='--height 30% --border --layout=reverse --inline-info'
export FZF_CTRL_R_OPTS='--height 30% --border --layout=reverse --inline-info'
export FZF_ALT_C_OPTS='--height 30% --border --layout=reverse --inline-info'

# Enable FZF key bindings if available
for fzf_bindings in "/usr/share/fzf/shell/key-bindings.bash" "/usr/share/doc/fzf/examples/key-bindings.bash" "$HOME/.fzf/shell/key-bindings.bash"; do
  if [ -f "$fzf_bindings" ]; then
    . "$fzf_bindings"
    break
  fi
done
unset fzf_bindings
