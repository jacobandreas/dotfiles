# if not running interactively, do nothing
[ -z "$PS1" ] && return

# don't put duplicate lines or empty lines in history
HISTCONTROL=ignoredups:ignorespace

# append to history rather than overwriting
shopt -s histappend

# set size of history file
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command
shopt -s checkwinsize

# make less more friendly for non-text input
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# color prompt
case "$TERM" in
"dumb")
	PS1='[`date +%I:%M:%S`] ${debian_chroot:+($debian_chroot)}\u@\h:\w\$ ' ;;
*)
	PS1='[`date +%I:%M:%S`] ${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
esac

# if this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac


# enable color support of ls and also add handy aliases
#if [ -x /usr/bin/dircolors ]; then
#    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#    alias ls='ls --color=auto'
#    #alias dir='dir --color=auto'
#    #alias vdir='vdir --color=auto'
#
#    alias grep='grep --color=auto'
#    alias fgrep='fgrep --color=auto'
#    alias egrep='egrep --color=auto'
#fi
alias ls='ls --color=auto -v'
alias egrep='egrep --color=auto'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# aliases
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
alias vim='echo "that is not what you meant"'

source $HOME/.bash_apparix

# add local binaries directory to PATH
PATH=$PATH:/home/jacob/.local/bin

# various envvars
VISUAL=/usr/bin/vim
EDITOR=/usr/bin/vim
#TERM=xterm-color

set -o vi
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
