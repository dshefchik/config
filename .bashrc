#! /bin/bash
#
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# check the kickass window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if tput setaf 1 &> /dev/null; then
    tput sgr0
    if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
        CYAN=$(tput setaf 45)
        MAGENTA=$(tput setaf 9)
        ORANGE=$(tput setaf 172)
        GREEN=$(tput setaf 190)
        PURPLE=$(tput setaf 141)
    else
        CYAN=$(tput setaf 14)
        MAGENTA=$(tput setaf 5)
        ORANGE=$(tput setaf 4)
        GREEN=$(tput setaf 2)
        PURPLE=$(tput setaf 1)
    fi
    BOLD=$(tput bold)
    RESET=$(tput sgr0)
else
    CYAN="\033[0;36m"
    MAGENTA="\033[1;31m"
    ORANGE="\033[1;33m"
    GREEN="\033[1;32m"
    PURPLE="\033[1;35m"
    BOLD=""
    RESET="\033[m"
fi

export CYAN
export MAGENTA
export ORANGE
export GREEN
export PURPLE
export BOLD
export RESET

export GIT_MERGE_AUTOEDIT=no
export EDITOR=vim

# Git branch details
function parse_git_dirty() {
    [[ $(git status 2> /dev/null | tail -n1) != *"working tree clean"* ]] && echo "*"
}

function parse_git_branch() {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

# Change this symbol to something sweet.
# (http://en.wikipedia.org/wiki/Unicode_symbols)
symbol="🔥 "

export PS1="\[${MAGENTA}\]\u\[$RESET\]:\[$GREEN\]\w\[$RESET\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$PURPLE\]\$(parse_git_branch)\[$RESET\]\n$symbol\[$RESET\]"
export PS2="\[$ORANGE\]→ \[$RESET\]"

### Misc

# Only show the current directory's name in the tab
# export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'

#
# Configure Virtualenv
#
show_virtual_env() {
  if [ -n "$VIRTUAL_ENV" ]; then
    echo "${CYAN}($(basename $VIRTUAL_ENV))$RESET "
  fi
}

export PS1="$(show_virtual_env)$PS1"

# Prefer python3
VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
[ -f /usr/local/bin/python3 ] && VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export VIRTUALENVWRAPPER_PYTHON

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# AWS
complete -C aws_completer aws

# Add git autocomplete support
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

export PATH
