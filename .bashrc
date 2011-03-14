# Aliases
alias ls='ls --color=auto'
alias ll='ls -l'
alias lt='ls -ltr'
alias grep='grep --color=auto'
alias git-export='git checkout-index -a -f --prefix '

# ENV Variables
export EDITOR=/usr/bin/vim

# PS1
CW='\[\033[0;0m\]'
C1='\[\033[0;31m\]'
C2='\[\033[0;34m\]'
C3='\[\033[0;33m\]'
C4='\[\033[0;32m\]'
PS1="${C1}(\D{%k:%M})${C2}\u${CW}@${C3}\h${CW} \w${CW} ${C4}\$ ${CW}"
