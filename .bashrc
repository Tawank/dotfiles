#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Using color promt
if [[ ${EUID} == 0 ]] ; then
    PS1='\[\033[48;2;221;75;57;38;2;255;255;255m\] \$ \[\033[48;2;0;135;175;38;2;221;75;57m\]\[\033[48;2;0;135;175;38;2;191;255;255m\] \h \[\033[48;2;83;85;85;38;2;0;135;175m\]\[\033[48;2;83;85;85;38;2;255;255;255m\] \w \[\033[49;38;2;83;85;85m\]\[\033[00m\] '
else
    PS1='\[\033[48;2;105;121;16;38;2;255;255;255m\] \$ \[\033[48;2;0;135;175;38;2;105;121;16m\]\[\033[48;2;0;135;175;38;2;255;255;255m\] \u@\h \[\033[48;2;83;85;85;38;2;0;135;175m\]\[\033[48;2;83;85;85;38;2;255;255;255m\] \w \[\033[49;38;2;83;85;85m\]\[\033[00m\] '
fi

# bash no duplicates history
export HISTCONTROL=ignoreboth:erasedups
