#!bash

#if [ -f ~/.bashrc ] && [ ! -L ~/.bashrc ]; then
#   . ~/.bashrc
#fi

export LC_ALL=ru_RU.UTF-8
export LESSCHARSET=utf-8
export EDITOR=vim
export PS1='\[\e[0;32m\]\u@\h\[\e[m\] \[\e[1;34m\]\w\[\e[m\]\[\e[1;32m\]$(__git_ps1 " (%s)") \$\[\e[m\] \[\e[1;37m\]'
export ACK_PAGER='less -FRX'

# Use local bin before
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

