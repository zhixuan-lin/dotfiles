# https://github.com/lewagon/dotfiles/blob/master/install.sh

# Make backup folders
BACKUP="$HOME/.dotfiles_backup"
DOTFILES="tmux.conf zshrc vimrc"


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

for name in $DOTFILES; do
  target="$HOME/.$name"
  backup $target
  
  if [ ! -e "$target" ]; then
    echo "-----> Symlinking your new $target"
    ln -s "$PWD/$name" "$target"
  fi
done
