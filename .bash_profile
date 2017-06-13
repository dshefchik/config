if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# Ignore .DS_Store files in 'ls' command
export CLICOLOR=true
export CLICOLOR_FORCE=true

function ll { ls $@ | grep -v .DS_Store; }

# Add git autocomplete support
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# Java
export JAVA_HOME=$(/usr/libexec/java_home)
export JAVA_OPTS="-Xms512M -Xmx2048M -Xss1M -XX:+CMSClassUnloadingEnabled"

#export GITAWAREPROMPT=~/.bash/git-aware-prompt
#source "${GITAWAREPROMPT}/main.sh"

export WORKON_HOME=~/Envs

export PATH=~/Library/Python/2.7/bin:/usr/local/share/python:$PATH
