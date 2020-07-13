# Install

Run `install.sh`. After that, if you are not using `zsh`, you may want to restart your session. 
Also, you may need to do `source reload.sh` to reload settings.

Note we create symlinks instead of hard copies. If one configuration file already exists, it will be backed up.
The backup file will be saved in `~/.dotfiles_backup`.

All configurations are light so that they work on new machines. 
However, if you don't have some basic programs like `zsh`, `git`, `python` `curl` installed, 
you may need root privilege to install these programs.


# Recommended tools

* `tldr`: quickly figure out the usage of most commands
* `autojump`: jump to recently visited locations
* `nnn`: interactive terminal navigator. Supports cd on quit with `<ctrl+g>`
* `htop`: interactive top
* `fzf`: fuzzy file finder
* `gpustat`: monitor gpu usage. Way better than `nvidia-smi`
* `rclone`: command line tool for managing cloud files
