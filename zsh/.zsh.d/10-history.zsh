# Shell History Configuration

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=20000

# Append to history file instead of overwriting
setopt APPEND_HISTORY

# Ignore duplicate commands and consecutive duplicates (bash's ignoreboth:erasedups)
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS
