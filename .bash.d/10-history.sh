# Shell History Configuration

# Append to history file instead of overwriting
shopt -s histappend

# Ignore duplicate commands and consecutive duplicates
export HISTCONTROL=ignoreboth:erasedups

# Large history limits
export HISTSIZE=10000
export HISTFILESIZE=20000
