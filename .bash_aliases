### Aliases

# List all files, exclude . and ..
# append / to directories
alias ls="ls -Apl"

# Open specified files in Sublime Text
# "s ." will open the current directory in Sublime
alias s='open -a "Sublime Text"'

# Quick Nav
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Git
# You must install Git first
alias gl='git log --stat'
alias gs='git status'
alias gb='git branch -a'
alias gco='git checkout'
alias ga='git add .'
alias gcm='git commit -m' # requires you to type a commit message
alias gp='git push'
alias grm='git rm $(git ls-files --deleted)'

# Reload port mapping config
alias portf='sudo pfctl -ef /etc/pf.conf'
