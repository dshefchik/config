#! /bin/
if [ -f ~/.bashrc ]; then
  # shellcheck source=.bashrc
   . ~/.bashrc
fi

export CLICOLOR=true
export CLICOLOR_FORCE=true

# Ignore .DS_Store files in 'ls' command
function ll {
  shopt -s extglob
  ls -dla !('DS_Store')
}

# Auto-add ssh keys to keychain
alias ssh-add='ssh-add -K'

# Java
JAVA_HOME=$(/usr/libexec/java_home)
export JAVA_HOME

JAVA_OPTS="-Xms512M -Xmx2048M -Xss1M -XX:+CMSClassUnloadingEnabled"
export JAVA_OPTS

# Add git autocomplete support
brew_prefix="$(brew --prefix)"

if [ -f $brew_prefix/etc/bash_completion ]; then
    # shellcheck source=/usr/local/etc/bash_completion
    . $brew_prefix/etc/bash_completion
fi

export WORKON_HOME=~/Envs

export PATH=$PATH:~/Library/Python/2.7/bin:/usr/local/share/python
