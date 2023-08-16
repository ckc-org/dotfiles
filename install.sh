#!/usr/bin/env zsh

# A simple script for setting up OSX dev environment.

dev="$HOME/src"
pushd .
mkdir -p $dev
cd $dev/dotfiles

echo 'Do you want to change host/user name? yes/no [default]:'
read response

if [[ "$response" == "yes" ]]; then
    echo 'Enter new hostname of the machine (e.g. macbook-paulmillr)'
    read hostname
    echo "Setting new hostname to $hostname..."
    scutil --set HostName "$hostname"
    compname=$(sudo scutil --get HostName | tr '-' '.')
    echo "Setting computer name to $compname"
    scutil --set ComputerName "$compname"
    sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$compname"
else
    echo "Skipping host/user name change."
fi

# Already have a key? skip!
pub=$HOME/.ssh/id_rsa.pub
echo 'Checking for SSH key, generating one if it does not exist...'
if [[ ! -f $pub ]]; then
  ssh-keygen -t rsa

  echo 'Copying public key to clipboard. Paste it into your Github account...'
  cat $pub | pbcopy
  open 'https://github.com/account/ssh'
fi

# If we on OS X, install homebrew and tweak system a bit.
if [[ `uname` == 'Darwin' ]]; then
  which -s brew
  if [[ $? != 0 ]]; then
    echo 'Installing Homebrew...'
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
       
      # make brew accessible immediately as `$ brew`
      eval "$(/opt/homebrew/bin/brew shellenv)"
       
      brew update
      brew install htop ruby fortune cowsay lolcat fzf coreutils python3 virtualenvwrapper

      # install fuzzyfind
      /usr/local/opt/fzf/install --completion --key-bindings --no-update-rc

      # install virtualenvwrapper stuff
      source virtualenvwrapper.sh
  fi

  echo 'Tweaking OS X...'
    source 'etc/osx.sh' || true
fi

echo 'Symlinking config files...'
dotfiles=~/src/dotfiles
bin="/usr/local/bin"

if [[ -d "$dotfiles" ]]; then
  echo "Symlinking dotfiles from $dotfiles"
else
  echo "$dotfiles does not exist"
  exit 1
fi

link() {
  from="$1"
  to="$2"
  echo "Linking '$from' to '$to'"
  rm -f "$to"
  ln -s "$from" "$to"
}

for location in $(find home -name '.*'); do
  file="${location##*/}"
  file="${file%.sh}"
  link "$dotfiles/$location" "$HOME/$file"
done

popd
