zstyle :compinstall filename '/home/jacob/.zshrc'
autoload -Uz compinit
compinit
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob notify

bindkey "^r" history-incremental-search-backward
set -o vi
#bindkey -v

EDITOR=vim

PROMPT="%m%# "
RPROMPT="%~ @%*"

alias ls='ls --color=auto -v'
alias egrep='egrep --color=auto'
alias l='ls'
alias ll='l -l'
alias la='l -a'
alias lla='l -la'
alias c='cd'
alias u='c ..'
alias h='c ~'
alias s='sudo'
alias q='exit'
alias bye='exit'
alias :q='exit'
alias so='sudo shutdown -hP now'
alias sr='sudo reboot'
alias ss='sudo hibernate'
alias a='apropos'
alias pm='sudo pacman -S'
alias pms='pacman -Ss'
alias g='egrep'
alias lg='l | g'
alias ng='find . | g'
alias p='ps -u ${USER} -H'
alias psg='ps -ef | grep'
alias o='xdg-open'
alias m='$EDITOR'

eval `dircolors ~/.dir_colors`
