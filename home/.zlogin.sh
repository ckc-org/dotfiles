#
# Executes commands at login post-zshrc.
#

# Hide "Last login: Wed Dec 18 01:16:13 on ttys009" message
clear

# Execute code that does not affect the current session in the background.
{
  # Compile the completion dump to increase startup speed.
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ "$zcompdump" -nt "${zcompdump}.zwc" || ! -s "${zcompdump}.zwc" ]]; then
    zcompile "$zcompdump"
  fi

  # Set environment variables for launchd processes.
  if [[ "$OSTYPE" == darwin* ]]; then
    for env_var in PATH MANPATH; do
      launchctl setenv "$env_var" "${(P)env_var}"
    done
  fi
} &!

# Print a random, hopefully interesting, adage.
if (( $+commands[fortune] )); then
#  # Get a random cow
#  cowlist=( $(cowsay -l | sed "1 d") );
#  thechosencow=${cowlist[$(($RANDOM % ${#cowlist[*]}))]}
#
#  # Say something with that cow, in fancy colors
#  fortune | cowsay -f "$thechosencow" | lolcat

  # Use custom ckc cow
  thechosencow=$(for n in ~/my/dotfiles/etc/cows/*; do printf '%s\n' "$n"; done | shuf -n 1)
  fortune | cowsay -f $thechosencow | lolcat

  print
fi
