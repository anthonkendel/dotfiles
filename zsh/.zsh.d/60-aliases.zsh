# Load User Aliases
# Shared with the bash setup - .bash_aliases has no bashisms, so both
# shells source the exact same file to keep personalization in sync.

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi
