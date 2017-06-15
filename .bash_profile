if [ -f ~/.bashrc ]; then
   . ~/.bashrc
fi

export CLICOLOR=true
export CLICOLOR_FORCE=true

# Ignore .DS_Store files in 'ls' command
function ll { ls $@ | grep -v .DS_Store; }

# Java
export JAVA_HOME=$(/usr/libexec/java_home)
export JAVA_OPTS="-Xms512M -Xmx2048M -Xss1M -XX:+CMSClassUnloadingEnabled"

# Add git autocomplete support
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

export WORKON_HOME=~/Envs

export PATH=$PATH:~/Library/Python/2.7/bin:/usr/local/share/python
