#!/bin/bash

apt install -y tmux vim
pip install ipython

tmux new-session

alias pm="python manage.py"
alias shell="python manage.py shell"

echo
echo
echo "🤖 --( Welcome to the pod '`hostname`'! )"
echo "- You are in a tmux session now. Ctrl-b is the prefix key."
echo "  See https://tmuxcheatsheet.com/ for help or leave with Ctrl-b + D."
echo "- run 'shell' to start a Django shell"
echo "- 'pm' is 'python manage.py'"
echo
echo
