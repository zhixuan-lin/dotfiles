
# Check zsh is installed
if ! type "zsh" > /dev/null; then
  # Try to install zsh
  echo "Trying to install zsh..."
  if [ `uname` = "Darwin" ]; then
      brew install zsh || exit 1
  elif [ `uname` = 'Linux' ]; then
      sudo apt-get install zsh || exit 1
  else
      echo "Unknown system `uname`. Please install zsh manually"; exit 1
  fi
fi

# Install python
if ! type "python" > /dev/null; then
  # Try to install python
  echo "Trying to install python..."
  if [ `uname` = "Darwin" ]; then
      brew install python || exit 1
  elif [ `uname` = 'Linux' ]; then
      sudo apt-get install python || exit 1
  else
      echo "Unknown system `uname`. Please install python manually"; exit 1
  fi
fi
