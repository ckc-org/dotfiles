
## install
1. Install XCode and accept license. eg `sudo xcodebuild -license`
1. Run these commands:
    ```bash
    $ mkdir -p ~/src && cd ~/src
    $ git clone https://github.com/ckc-org/dotfiles.git --recursive
    $ cd dotfiles 
    $ ./install.sh
    ```
1. Change `Terminal.app` theme to `terminal/paulmillr.terminal`

## custom cows

* generate some cool ascii art ([there are plenty of sites available](https://asciiart.club/))
* create a new file in etc/cows following this naming convention `local_<your_cow_name>.cow`
* the contents of your file should follow the basic format of the existing cows

