# https://github.com/lewagon/dotfiles/blob/master/install.sh

# Make backup folders
BACKUP="$HOME/.dotfiles_backup"
DOTFILES="tmux.conf zshrc vimrc"

# Function for backup files
backup() {
  mkdir -p "$BACKUP"
  target=$1
  if [ -e "$target" ]; then           # Does the config file already exist?
    if [ ! -L "$target" ]; then       # If not symlink
      timestr=$(date +%Y_%m_%d_%H_%M_%S)
      file=$(basename $target)
      backup="$BACKUP/$file_$timestr.backup"
      mv "$target" "$backup"   # Then backup it
      echo "-----> Moved your old $target config file to $backup"
    fi
  fi
}

# Check git is installed
if ! type "git" > /dev/null; then
    echo "Please install git first"
    exit
fi

# Check zsh is installed
if ! type "zsh" > /dev/null; then
  # Try to install zsh
  echo "Installing zsh..."
  if [ `uname` = "Darwin" ]; then
      brew install zsh || exit 1
  elif [ `uname` = 'Linux' ]; then
      apt-get install zsh || exit 1
  else
      echo "Unknown system `uname`"; exit 1
  fi
fi

# Install oh-my-zsh if it is not installed
[ ! -e ~/.oh-my-zsh ] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) " "" --unattended --skip-chsh

# Install python
if ! type "python" > /dev/null; then
  # Try to install python
  echo "Installing python..."
  if [ `uname` = "Darwin" ]; then
      brew install python || exit 1
  elif [ `uname` = 'Linux' ]; then
      apt-get install python || exit 1
  else
      echo "Unknown system `uname`"; exit 1
  fi
fi


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
if ! type "autojump" > /dev/null; then
    git clone git://github.com/wting/autojump.git
    cd autojump
    ./install.py 
    cd -
    rm -rf autojump
fi

# If current shell is zsh, source zshrc
# Otherwise we run change shell
if [ "$(basename "$SHELL")" = "zsh" ]; then
    echo "Please run source ~/.zshrc to reload settings."
    # source ~/.zshrc
else
    if ! chsh -s "$(which zsh)"; then
        error "chsh command unsuccessful. Change your shell manually"
    else
        exec zsh -l
    fi
fi
