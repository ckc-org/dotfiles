# Dotfiles
Colourful & robust OS X configuration files and utilities.

## Features

* **NO DEPENDENCIES!**
* Auto-completion
* Syntax highlighting

## Structure
* `bin` — files that are symlinked to any directory with binaries in `$PATH`
* `etc` — various stuff like osx text substitutions / hosts backup
* `git-extras` — useful git functions, defined in `home/gitconfig`
* `home` — files that are symlinked to `$HOME` directory
* `terminal` — terminal theme & prompt

## Building system from scratch (reminder)

* Install XCode & its Command Line Tools.
* Change Terminal.app theme to `terminal/paulmillr.terminal`. a copy of this file can be found in `dotfiles/terminal/paulmillr.terminal`
* Create `~/src/`
* Clone this project into the src directory (dotfiles **RECURSIVELY** `--recursive`) and run `sh bootstrap-new-system.sh`

## Custom Cows

* generate some cool ascii art ([there are plenty of sites available](https://asciiart.club/))
* create a new file in etc/cows following this naming convention `local_<your_cow_name>.cow`
* the contents of your file should follow the basic format of the existing cows

