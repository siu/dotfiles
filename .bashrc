# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ENV Variables
export EDITOR=/usr/bin/vim

# Aliases
alias ls='ls --color=auto'
alias ll='ls -l'
alias lt='ls -ltr'
alias g='gvim'
alias grep='grep --color=auto'
alias gl='git lg'
alias gll='git lgl'
alias gs='git status'
alias gd='git diff'
alias git-export='git checkout-index -a -f --prefix '
alias u='urxvtc'
alias gcm='git commit -m '
alias ga='git add '
alias gau='git add -u :/'
alias gci='git commit -v'

# PS1
MYPS1="\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\] "
PS1=$MYPS1

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

# Local configuration
if [ -e ~/.bashrc.local ]; then
  source ~/.bashrc.local
fi

# StartX if first tty
if [[ -z $DISPLAY && $(tty) = /dev/tty1 ]]; then
  exec startx
fi

