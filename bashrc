# vim: set ft=sh:

# Joseph Harriott - Mon 23 May 2016
# Git for Windows .bashrc
# source ~/.bashrc if you've changed something here...

set -o vi

alias h='history'
alias s="stat -c '%A %a %U %s %y %n'"
alias sm="stat -c '%y %n'"
export HISTCONTROL=ignoreboth
export HISTIGNORE='?:??'
export HISTSIZE=1000
shopt -s histappend

# Git
# ---
alias ga='git add'
alias gis='git status -u'
gic () {
	git commit -m "$1"
}

