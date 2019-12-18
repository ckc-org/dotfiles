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
