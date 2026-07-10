# ~/.bash_aliases
# Easy-to-extend shell aliases and functions.

# --- Navigation ---
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# --- Utilities ---
alias cl='clear'
alias xx='exit'
alias path='echo -e ${PATH//:/\\n}' # Clean path viewer

# --- ls (Directory Listing) ---
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lsd='ls -l --color=auto | grep "^d"' # Fixed double grep typo

# --- dir ---
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

# --- grep ---
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# --- Docker ---
alias dm='docker-machine'
alias dms='docker-machine ssh'
alias dmf='docker-machine scp'

# Safer Docker Functions (preventing errors when no containers/images exist)
unalias dost dorm dormi 2>/dev/null
dost() {
  local containers
  containers=$(docker ps -a -q)
  if [ -n "$containers" ]; then
    docker stop $containers
  else
    echo "No containers running."
  fi
}

dorm() {
  local containers
  containers=$(docker ps -a -q)
  if [ -n "$containers" ]; then
    docker rm $containers
  else
    echo "No containers to remove."
  fi
}

dormi() {
  local images
  images=$(docker images -q)
  if [ -n "$images" ]; then
    docker rmi $images
  else
    echo "No images to remove."
  fi
}
