export EDITOR=subl

bind "set show-all-if-ambiguous On"

. ~/my/dotfiles/etc/django_bash_completion.sh
. ~/my/dotfiles/etc/docker
. ~/my/dotfiles/etc/docker-compose
. ~/my/dotfiles/etc/docker-machine
. ~/my/dotfiles/etc/docker-machine-prompt
. ~/my/dotfiles/etc/docker-machine-wrapper
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/src
source /usr/local/bin/virtualenvwrapper.sh

# Terminal colours (after installing GNU coreutils)
NM="\[\033[0;38m\]" #means no background and white lines
HI="\[\033[0;37m\]" #change this for letter colors
HII="\[\033[0;31m\]" #change this for letter colors
SI="\[\033[0;33m\]" #this is for the current directory
IN="\[\033[0m\]"

export PS1="$NM[ $HI\u $HII\h $SI\w$NM ] $IN"
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

# Setup max files
#launchctl limit maxfiles 1000000 16000

# Android SDK
export PATH=$PATH:/Android/tools:/Android/platform-tools;

# Ruby
export PATH=$PATH:/usr/local/opt/ruby/bin;

# Java
export PATH=$PATH:$JAVA_HOME/bin;

# Postgres
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin

# Heroku toolbelt
export PATH="/usr/local/heroku/bin:$PATH"


#SYSTEM ALIASES
alias dir='ls'
alias cls='clear'
alias cd..='cd ..'
alias kill='sudo kill -9'
alias deltree='sudo rm -R'
alias make='make -j 2'
alias pico='pico -w'
alias ls='ls -AGhl'
alias l='ls'


#PROGRAM ALIASES

alias tm='mate $1'
alias md='mkdir'
alias fnd='sudo find . -name $1'
alias grepall='grep -r -l $1   .'
alias up='uptime'
alias top='top -o cpu'
alias svnClean="find d . -name .svn -exec rm -rf '{}' \; -print"
alias gs='git status'
alias matebash='mate ~/.bash_profile'
alias ducks='du -cks * | sort -rn|head -11'
alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"
# alias start_pg="postgres -D /Volumes/Aerie/Users/skoczen/.db"
alias start_pg="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias start_memcached="/usr/local/bin/memcached"
alias start_rabbitmq="sudo rabbitmq-server -detached"
alias stop_rabbitmq="sudo rabbitmqctl stop"
alias start_celery="python manage.py celeryd -v 2 -B -s /tmp/celery -E --concurrency=3 --logfile=/tmp/celery.log"
alias kill_pyc='find . -iname "*.pyc" -delete'
alias kill_dstore='find . -iname ".DS_Store" -delete'
alias gitbox='open -a /Applications/Gitbox.app .'
alias update_boxen='cd /opt/boxen/repo;bundle exec librarian-puppet outdated;boxen'
alias pycharm='open -a /Applications/PyCharm.app/'

#GIT ALIASES
alias gitclean='git branch -d $(git branch --merged)'
# NOTE in .gitconfig we have `git track` which sets upstream branch!

#DIRECTORY ALIASES
alias cdwork='cd ~/workingCopy/'
alias cdframeworks='cd /Library/Frameworks/Python.framework/Versions/Current/lib/python2.5/site-packages/'

#DJANGO ALIASES
alias syncdb='python manage.py syncdb'¡¡¡
alias rsaquameta='python manage.py --settings=env.dev.settings runserver'
alias rs='python manage.py runserver 0.0.0.0:8000'
alias rs+='python manage.py runserver_plus'

alias lr='python manage.py livereload'

alias killpycs='find . -name "*.pyc" -delete'

alias start_redis='/usr/local/Cellar/redis/2.2.12/bin/redis-server /usr/local/etc/redis.conf'
alias start_redis2.4='/usr/local/Cellar/redis/2.4.0-rc6/bin/redis-server /usr/local/etc/redis.conf'
alias copy_ssh='scp ~/.ssh/id_rsa.pub'
alias checkout_live='git checkout live'
alias checkout_master='git checkout master'
alias merge_master='git merge master'

alias sub='open $* -a /Applications/Sublime\ Text\ 2.app/'

# UTILITY ALIASES
#programming stuff
alias clearsvn='rm -r `find * -name "*.svn*"`'

# FORTUNE COOKIES!
fortune | cowsay

# misc tab-completes
# pip bash completion start
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip
# pip bash completion end
source ~/my/dotfiles/etc/git-completion.bash
source ~/my/dotfiles/etc/git-flow-completion.bash
source ~/my/dotfiles/etc/fab_complete.sh
source ~/my/dotfiles/etc/ve.sh


#_fab_completion() {
#    COMPREPLY=( $( \
#    COMP_LINE=$COMP_LINE  COMP_POINT=$COMP_POINT \
#    COMP_WORDS="${COMP_WORDS[*]}"  COMP_CWORD=$COMP_CWORD \
#    OPTPARSE_AUTO_COMPLETE=1 $1 ) )
#}

#complete -o default -F _fab_completion bolt

function parse_git_branch {

        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \[\1\]/'

}

function proml {

  local        BLUE="\[\033[0;34m\]"

# OPTIONAL - if you want to use any of these other colors:

  local         RED="\[\033[0;31m\]"

  local   LIGHT_RED="\[\033[1;31m\]"

  local       GREEN="\[\033[0;32m\]"

  local LIGHT_GREEN="\[\033[1;32m\]"

  local       WHITE="\[\033[1;37m\]"

  local  LIGHT_GRAY="\[\033[0;37m\]"

# END OPTIONAL

  local     DEFAULT="\[\033[0m\]"

PS1="$NM[ $HI\u $HII\h $SI\w$NM ] $IN$RED\$(parse_git_branch)$DEFAULT\n\$ "

}

proml

function title {
  printf "\033]0;%s\007" "$1"
}
export PATH="/usr/local/sbin:$PATH"
