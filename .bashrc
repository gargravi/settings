# .bashrc

# User specific aliases and functions

#alias rm='rm -i'
#alias cp='cp -i'
#alias mv='mv -i'
#
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

alias ll='ls -ltr'
alias vi='vim'
alias c.="cd .."
alias pd="ps -ef | grep deluge"
alias clr="clear && ls -ltr"
alias gitg="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias gitls="git ls-files -m | xargs ls -ltr "

export PS1='$(whoami)@$(hostname):$(pwd)]\n> '

export ECLIPSE_HOME=/root/eclipse/eclipse

export TERM=xterm-256color
