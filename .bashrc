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
MYPS1="${C2}\u${CW}@${C1}\h${CW} \w${CW} ${C4}\\\$ ${CW}"
PS1=$MYPS1

# Aliases
alias ls='ls --color=auto'
alias ll='ls -l'
alias lt='ls -ltr'
alias g='gvim'
alias grep='grep --color=auto'
alias gs='git status'
alias git-export='git checkout-index -a -f --prefix '
alias u='urxvtc'

alias restore_flash='~/.bash_utils/restore_flash.sh'

if [[ -z $DISPLAY && $(tty) = /dev/tty1 ]]; then
  exec startx
fi

function _git_prompt() {
    local git_status="`git status -unormal 2>&1`"
    if ! [[ "$git_status" =~ Not\ a\ git\ repo ]]; then
        if [[ "$git_status" =~ nothing\ to\ commit ]]; then
            local ansi=42
        elif [[ "$git_status" =~ nothing\ added\ to\ commit\ but\ untracked\ files\ present ]]; then
            local ansi=43
        else
            local ansi=45
        fi
        if [[ "$git_status" =~ On\ branch\ ([^[:space:]]+) ]]; then
            branch=${BASH_REMATCH[1]}
            test "$branch" != master || branch=' '
        else
            # Detached HEAD.  (branch=HEAD is a faster alternative.)
            branch="(`git describe --all --contains --abbrev=4 HEAD 2> /dev/null ||
                echo HEAD`)"
        fi
        echo -n '\[\e[0;37;'"$ansi"';1m\]'"$branch"'\[\e[0m\] '
    fi
}
function _prompt_command() {
    PS1="`_git_prompt`"$MYPS1
}
PROMPT_COMMAND=_prompt_command
