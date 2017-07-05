

alias c.="cd .."
alias clr="clear && ls -ltr"
alias gitg="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

export PS1='$(whoami)@$(hostname):$(pwd)]\n> '
#PS1=${PS1%?}\n'$ '

export TERM=xterm-256color

export ECLIPSE_HOME=/root/eclipse/eclipse


