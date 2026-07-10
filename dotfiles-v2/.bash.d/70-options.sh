# Extra Usability & Performance Options

# --- Shell Behavior Settings ---
# Automatically change directory if typing a directory name directly (no 'cd' needed)
shopt -s autocd 2>/dev/null

# Correct minor spelling typos in directory names when running 'cd'
shopt -s cdspell 2>/dev/null

# Enable recursive globbing (e.g. ls **/*.js)
shopt -s globstar 2>/dev/null

# --- Colorized Man Pages ---
# Adds color coding to man pages using less termcap variables
export LESS_TERMCAP_mb=$'\e[1;31m'      # begin bold
export LESS_TERMCAP_md=$'\e[1;36m'      # begin double-bright
export LESS_TERMCAP_me=$'\e[0m'         # reset term
export LESS_TERMCAP_se=$'\e[0m'         # reset standout
export LESS_TERMCAP_so=$'\e[01;33m'     # begin standout (yellow)
export LESS_TERMCAP_ue=$'\e[0m'         # reset underline
export LESS_TERMCAP_us=$'\e[1;4;32m'    # begin underline (green)

# --- FZF Integration Enhancements ---
# Use ripgrep (rg) if installed for extremely fast file fuzzy finding
if command -v rg >/dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

# --- Reload Alias ---
# Quick command to source configurations and apply changes
alias reload='source ~/.bash_profile && echo "Shell configuration reloaded successfully!"'
