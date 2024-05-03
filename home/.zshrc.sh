#!/usr/bin/env zsh

dotfiles="$HOME/src/dotfiles"

# Load main files.
# echo "Load start\t" $(gdate "+%s-%N")
source "$dotfiles/terminal/startup.sh"
source "$dotfiles/terminal/completion.sh"
source "$dotfiles/terminal/highlight.sh"
# echo "Load end\t" $(gdate "+%s-%N")

# Load local completion files
for file in $dotfiles/etc/completion/* ; do
  #echo "looking at $file"
  if [ -f "$file" ] ; then
    . "$file"
    #echo "loading $file"
  fi
done

autoload -U colors && colors

# Load and execute the prompt theming system.
fpath=("$dotfiles/terminal" $fpath)
autoload -Uz promptinit && promptinit
prompt 'paulmillr'

# Java you suck
# 1.8
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
# 20
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-20.jdk/Contents/Home
# 17
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH

# Python
python_bin=$(dirname "$(which python3)")
path+=$python_bin

# Python OpenSSL cert
#CERT_PATH=$(python3 -m certifi)
#SSL_CERT_FILE=${CERT_PATH}
#REQUESTS_CA_BUNDLE=${CERT_PATH}

# Heroku
path+=('/usr/local/heroku/bin')

# Ruby (installed from `brew install ruby`)
export PATH=/usr/local/opt/ruby/bin:$PATH;

# Homebrew
export PATH="/opt/homebrew/bin:$PATH"
export HOMEBREW_PREFIX=$(brew --prefix)

# Poetry
export PATH="$HOME/.poetry/bin:$PATH"

# Virtualenvwrapper
#export WORKON_HOME=$HOME/.virtualenvs
#export VIRTUALENVWRAPPER_PYTHON=$python_bin'python'
#export VIRTUALENVWRAPPER_VIRTUALENV=$python_bin'virtualenv'
#source $python_bin'/virtualenvwrapper.sh'
source virtualenvwrapper.sh

# Android/react native dev
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Jetbrains toolbox
export PATH="$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts"

# Node Version Manager (nvm)
mkdir -p ~/.nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
  [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"

# To get the latest node LTS and use it by default:
#   nvm install --lts && nvm use --lts && nvm alias default node

# Postgres 11 install helper, not necessary on latest `brew install postres`
path+=('/usr/local/opt/postgresql@11/bin')

# Set global git ignore up
git config --global core.excludesfile '~/.gitignore'

# After modifications, export path for other people to use
export PATH

# direnv stuff
if command -v direnv > /dev/null 2>&1; then
    eval "$(direnv hook zsh)"
    eval "
    _direnv_hook() {
      trap -- '' SIGINT;
      eval "$("/usr/local/bin/direnv" export zsh)";
      trap - SIGINT;
    }
    typeset -ag precmd_functions;
    if [[ -z "${precmd_functions[(r)_direnv_hook]+1}" ]]; then
      precmd_functions=( _direnv_hook ${precmd_functions[@]} )
    fi
    typeset -ag chpwd_functions;
    if [[ -z "${chpwd_functions[(r)_direnv_hook]+1}" ]]; then
      chpwd_functions=( _direnv_hook ${chpwd_functions[@]} )
    fi"
fi

# ==================================================================
# = Aliases =
# ==================================================================
alias killpycs='find . -name "*.pyc" -delete'
alias ls='ls -AGhl'
alias pycharm='open -na "PyCharm.app" --args "$@"'
alias dstop='docker stop $(docker ps -qa)'
alias dstart='docker-compose up -d'

# ==================================================================
# = Functions =
# ==================================================================

# Better find(1)
function ff() {
  find . -iname "*${1:-}*"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
