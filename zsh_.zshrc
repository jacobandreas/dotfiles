# PATH

PATH=$PATH:/home/jacob/.gem/ruby/1.9.1/bin # local ruby
PATH=$PATH:/home/jacob/.local/bin # my scripts
PATH=$PATH:/home/jacob/.cabal/bin # cabal installations

PYTHONPATH=/usr/lib/python3.3/site-packages

# prompt and colors

PROMPT="
%F{green}%m: %F{blue}%~ %F{reset}at %F{yellow}%*
%F{reset}%# "

eval `dircolors ~/.dir_colors`

# vi keybindings

set -o vi
bindkey "^r" history-incremental-search-backward

# autocomplete & history

zstyle :compinstall filename '/home/jacob/.zshrc'
autoload -Uz compinit
zmodload -a colors
zmodload -a autocomplete
zmodload -a complist
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=34}:${(s.:.)LS_COLORS}")'
compinit
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob notify

setopt inc_append_history
setopt share_history

# default programs

EDITOR=vim
VISUAL=vim

# aliases

alias ls='ls --color=auto -v'
alias egrep='egrep --color=auto'
alias less='less -R'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
#alias c='cd'
alias s='sudo'
alias q='exit'
alias qq='tmux kill-session'
alias a='apropos'
alias pm='sudo pacman -S'
alias pms='pacman -Ss'
alias pmu='yaourt --aur -Syu'
alias g='egrep'
alias lg='ls | g'
alias ng='find . | g'
alias p='ps -u ${USER} -H'
alias o='xdg-open'
alias vim='vim -X'
alias m="$EDITOR"
alias py="ipython console"
alias py2="ipython2 console"

# make tmux play nice

if [[ -n "$TMUX_PANE" ]]; then 
  unset DBUS_SESSION_BUS_ADDRESS
fi
stty ixoff -ixon
