# Install

Run `install.sh`. After that, if you are not using `zsh`, you may want to restart your session. 
Also, you may need to do `source reload.sh` to reload settings.

Note we create symlinks instead of hard copies. If one configuration file already exists, it will be backed up.
The backup file will be saved in `~/.dotfiles_back`.

All configurations are light so that they work on new machines. 
However, if you don't have some basic programs like `zsh`, `git`, `python` `curl` installed, 
you may need root privilege to install these programs.


# Recommended tools

* `autojump`
* `tldr`
* `htop`
* `fzf`
* `gpustats`
