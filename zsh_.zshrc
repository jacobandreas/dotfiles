# PATH

PATH=$PATH:$HOME/.gem/ruby/1.9.1/bin # local ruby
PATH=$PATH:$HOME/.local/bin # my scripts
PATH=$PATH:$HOME/.cabal/bin # cabal installations

eval `gdircolors ~/.dir_colors`

# vi keybindings

set -o vi
bindkey "^r" history-incremental-search-backward

# autocomplete & history

zstyle :compinstall filename '$HOME/.zshrc'
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

# other envvars

export NLTK_DATA=/Users/jda/Library/nltk
export SCIKIT_LEARN_DATA=/Users/jda/Library/scikit_learn

# aliases

alias ls='gls --color=auto -v --group-directories-first'
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
#alias o='xdg-open'
alias o='reattach-to-user-namespace open'
#alias vim='vim -X'
alias m="$EDITOR"
alias py="ipython console"
alias py2="ipython2 console"

# make tmux play nice

if [[ -n "$TMUX_PANE" ]]; then 
  unset DBUS_SESSION_BUS_ADDRESS
fi
stty ixoff -ixon

# after http://sebastiancelis.com/2009/11/16/zsh-prompt-git-users/

# Allow for functions in the prompt.
setopt PROMPT_SUBST
 
# Autoload zsh functions.
fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)
 
# Enable auto-execution of functions.
typeset -ga preexec_functions
typeset -ga precmd_functions
typeset -ga chpwd_functions
 
# Append git functions needed for prompt.
preexec_functions+='preexec_update_git_vars'
precmd_functions+='precmd_update_git_vars'
chpwd_functions+='chpwd_update_git_vars'

# prompt and colors

Z_HOST_COLOR=green
Z_HOSTNAME=`hostname`
if [ "$Z_HOSTNAME" = "jacob.xen.prgmr.com" ]; then
  Z_HOSTNAME=vps
  Z_HOST_COLOR=magenta
fi

PROMPT='
%F{$Z_HOST_COLOR}$Z_HOSTNAME: %F{blue}%~%F{cyan}$(prompt_git_info) %F{reset}at %F{yellow}%*
%F{reset}%# '

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

