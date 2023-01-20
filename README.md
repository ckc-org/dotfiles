# Dotfiles
Colourful & robust OS X configuration files and utilities.

(edited for Eric Carmichael)

## Features

* **NO DEPENDENCIES!**
* Auto-completion
* Syntax highlighting
* Automatic setting up of terminal tab / window title to current dir
* `rm` moves file to the OS X trash
* A bunch of useful functions:
    * `extract archive.tar.bz` — unpack any archive (supports many extensions)
    * `ram safari` — show app RAM usage
    * `openfiles` — real-time disk usage monitoring with `dtrace`.
    * `loc py coffee js html css` — count lines of code
    in current dir in a colourful way.
    * `ff file-name-or-pattern` - fast recursive search for a file name in directories.
    * `curl http://site/v1/api.json | json` - pretty-print JSON
    * `aes-enc`, `aes-dec` - safely encrypt files.
* Neat git extras:
    * Opinionated `git log`, `git graph`
    * `gcp` for fast `git commit -m ... && git push`
    * `git pr <pull-req> [origin]` for fetching pull request branches
    * `git cleanup` — clean up merged git branches. Very useful if
    you’re doing github pull requests in topic branches.
    * `git summary` — outputs commit email statistics.
    * `git release` — save changes, tag commit. If used on node.js project, also push to npm.
    * `git url` - opens GitHub repo for current git repo.
    * `git-changelog`, `git-setup` etc.
* [homesick](https://github.com/technicalpickles/homesick) /
  [homeshick](https://github.com/andsens/homeshick)-compatible

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

