# This file
# - copies dotfiles, backup old dotfiles
# - installs oh-my-zsh
# - changes default shell to zsh

# Some functions are from https://github.com/lewagon/dotfiles/blob/master/install.sh

# Make backup folders
BACKUP="$HOME/.dotfiles_backup"
DOTFILES="tmux.conf zshrc vimrc"

# Check git, zsh, python are installed
if ! type "git" > /dev/null; then
    echo "Please install git first"
    exit
fi

if ! type "zsh" > /dev/null; then
    echo "Please install zsh first"
    exit
fi

# if ! type "python" > /dev/null; then
#     echo "Please install python first"
#     exit
# fi

# Function for backup files
backup() {
  mkdir -p "$BACKUP"
  target=$1
  if [ -e "$target" ]; then           # Does the config file already exist?
    if [ ! -L "$target" ]; then       # If not symlink
      timestr=$(date +%Y_%m_%d_%H_%M_%S)
      cfgname=$(basename $target)
      backup="$BACKUP/${cfgname}_${timestr}.backup"
      mv "$target" "$backup"   # Then backup it
      echo "-----> Moved your old $target config file to $backup"
    fi
  fi
}


# Install oh-my-zsh if it is not installed
[ ! -e ~/.oh-my-zsh ] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) " "" --unattended --skip-chsh


for name in $DOTFILES; do
  target="$HOME/.$name"
  backup $target
  
  if [ ! -e "$target" ]; then
    echo "-----> Symlinking your new $target"
    ln -s "$PWD/$name" "$target"
  fi
done

# If autojump is not installed, install it. 
# See https://stackoverflow.com/questions/7522712/how-can-i-check-if-a-command-exists-in-a-shell-script
# if ! type "autojump" > /dev/null; then
#     git clone git://github.com/wting/autojump.git
#     cd autojump
#     ./install.py 
#     cd -
#     rm -rf autojump
# fi


# Colors: https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
RED='\033[0;31m'
NC='\033[0m' # No Color

# If current shell is zsh, source zshrc
# Otherwise we run change shell
if [ "$(basename "$SHELL")" = "zsh" ]; then
    # Reload tmux configuration if some tmux is running.
    echo "Done. You may need to run '${RED}source reload.sh${NC}' to reload settings."
else
    echo "changing default shell to zsh"
    if ! chsh -s "$(which zsh)"; then
        echo "chsh command unsuccessful. Change your shell manually"
    else
        echo "Installation done. Please restart your session to use zsh."
        echo "After that, run '${RED}source reload.sh${NC}' to reload tmux settings"
    fi
fi
# Reload tmux settings
# tmux source-file ~/.tmux.conf
