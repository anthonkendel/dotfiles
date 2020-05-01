# Append to the history file, don't overwrite it
shopt -s histappend
# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
# shopt -s checkwinsize

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [[ $- == *i* ]]; then
  # prompt colors
  MAGENTA=$(tput setaf 5)
  BLUE=$(tput setaf 4)
  GREEN=$(tput setaf 2)
  PURPLE=$(tput setaf 1)
  BOLD=$(tput bold)
  RESET=$(tput sgr0)

  export MAGENTA
  export BLUE
  export GREEN
  export PURPLE
  export BOLD
  export RESET
fi

# Git branch details
function parse_git_dirty() {
	[[ $(git status 2> /dev/null | tail -n1) != *"working "*" clean"* ]] && echo "*"
}
function parse_git_branch() {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

# Change this symbol to something sweet.
# (http://en.wikipedia.org/wiki/Unicode_symbols)
symbol='$ '

export PS1="\[${MAGENTA}\]\u \[$RESET\]in \[$GREEN\]\w\[$RESET\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$BLUE\]\$(parse_git_branch)\[$RESET\]"$'\n$symbol\[$RESET\]'
export PS2="\[$RED\]→ \[$RESET\]"
