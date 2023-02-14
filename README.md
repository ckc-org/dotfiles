
## install

1. install XCode & its Command Line Tools.
2. Change `Terminal.app` theme to `terminal/paulmillr.terminal`
3. Run these commands:
    ```bash
    $ mkdir -p ~/src
    $ git clone git@github.com:ckc-org/dotfiles.git --recursive
    $ cd dotfiles 
    $ sh bootstrap-new-system.sh
    ```

## custom cows

* generate some cool ascii art ([there are plenty of sites available](https://asciiart.club/))
* create a new file in etc/cows following this naming convention `local_<your_cow_name>.cow`
* the contents of your file should follow the basic format of the existing cows

