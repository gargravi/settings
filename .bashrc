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

function make_scp_str()
{
	ARG_NAME=$1; shift
	HST_IPV4_ADDR=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | grep -v '192.'`
	PWD_P=`pwd`
	echo "scp -p root@$HST_IPV4_ADDR:$PWD_P/$ARG_NAME ."
}

function csv_print()
{
	CSV_FILE_NAME=$1; shift
	column -s, -t < $CSV_FILE_NAME | less -#2 -N -S
}

alias ll='ls -ltr'
alias vi='vim'
alias c.="cd .."
alias csp=make_scp_str;
alias pd="ps -ef | grep deluge"
alias clr="clear && ls -ltr"
alias gitg="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias gitls="git ls-files -m | xargs ls -ltr "
alias gcp="cd /home/dev/git/cpp"

export PS1='$(whoami)@$(hostname):$(pwd)]>'

export ECLIPSE_HOME=/root/eclipse/eclipse

export TERM=xterm-256color
