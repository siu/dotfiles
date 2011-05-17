# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ENV Variables
export EDITOR=/usr/bin/vim

# PS1
CW='\[\033[0;0m\]'
C1='\[\033[0;31m\]'
C2='\[\033[0;34m\]'
C3='\[\033[0;33m\]'
C4='\[\033[0;32m\]'
PS1="${C2}\u${CW}@${C1}\h${CW} \w${CW} ${C4}\$ ${CW}"

# Aliases
alias ls='ls --color=auto'
alias ll='ls -l'
alias lt='ls -ltr'
alias g='gvim'
alias grep='grep --color=auto'
alias git-export='git checkout-index -a -f --prefix '
alias u='urxvtc'

alias restore_flash='~/.bash_utils/restore_flash.sh'
