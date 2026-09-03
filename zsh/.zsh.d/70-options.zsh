# Extra Usability & Performance Options

# --- Shell Behavior Settings ---
# Automatically change directory if typing a directory name directly (no 'cd' needed)
setopt AUTO_CD

# Correct minor spelling typos in commands
setopt CORRECT

# Recursive globbing (e.g. ls **/*.js) is native to zsh, no option needed

# --- Colorized Man Pages ---
# Adds color coding to man pages using less termcap variables
export LESS_TERMCAP_mb=$'\e[1;31m'      # begin bold
export LESS_TERMCAP_md=$'\e[1;36m'      # begin double-bright
export LESS_TERMCAP_me=$'\e[0m'         # reset term
export LESS_TERMCAP_se=$'\e[0m'         # reset standout
export LESS_TERMCAP_so=$'\e[01;33m'     # begin standout (yellow)
export LESS_TERMCAP_ue=$'\e[0m'         # reset underline
export LESS_TERMCAP_us=$'\e[1;4;32m'    # begin underline (green)

# --- Reload Alias ---
# Quick command to source configurations and apply changes
alias reload='source ~/.zshrc && echo "Shell configuration reloaded successfully!"'
