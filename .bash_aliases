# Quicker navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias cl='clear'
alias xx='exit'

# ls aliases
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lsd='ls --color=auto | grep grep "^d"'

# dir alias
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

# grep alias
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# docker alias
alias dm='docker-machine'
alias dms='docker-machine ssh'
alias dmf='docker-machine scp'

alias dost='docker stop $(docker ps -a -q)'
alias dorm='docker rm $(docker ps -a -q)'
alias dormi='docker rmi $(docker ps -a -q)'
