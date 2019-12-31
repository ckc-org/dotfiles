#!/usr/bin/env zsh

# Load main files.
# echo "Load start\t" $(gdate "+%s-%N")
source "$dotfiles/terminal/startup.sh"
# echo "$dotfiles/terminal/startup.sh"
source "$dotfiles/terminal/completion.sh"
source "$dotfiles/terminal/highlight.sh"
# echo "Load end\t" $(gdate "+%s-%N")

autoload -U colors && colors

# Load and execute the prompt theming system.
fpath=("$dotfiles/terminal" $fpath)
autoload -Uz promptinit && promptinit
prompt 'paulmillr'



# Python
python_bin='/Users/eric/Library/Python/3.7/bin'
path+=$python_bin

# Heroku
path+=('/usr/local/heroku/bin')

# Virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=$python_bin'/virtualenv'
source $python_bin'/virtualenvwrapper.sh'

# Node Version Manager (nvm)
mkdir -p ~/.nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
# We have the nvm bash completion already from ../terminal/completion/_nvm
#[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# To get the latest node LTS and use it by default:
#   nvm install --lts && nvm use --lts && nvm alias default node

# Postgres 11 install helper, not necessary on latest `brew install postres`
path+=('/usr/local/opt/postgresql@11/bin')

# Set global git ignore up
git config --global core.excludesfile '~/.gitignore'

# After modifications, export path for other people to use
export PATH

# ==================================================================
# = Aliases =
# ==================================================================
alias killpycs='find . -name "*.pyc" -delete'
alias ls='ls -AGhl'


# ==================================================================
# = Functions =
# ==================================================================

# Better find(1)
function ff() {
  find . -iname "*${1:-}*"
}
