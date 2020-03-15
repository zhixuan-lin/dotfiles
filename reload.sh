source ~/.zshrc
if pgrep tmux > /dev/null; then
    tmux source-file ~/.tmux.conf
fi
