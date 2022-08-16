#!/bin/bash

apt install -y -qq tmux vim
pip install --root-user-action=ignore --upgrade pip
pip install --root-user-action=ignore -q ipython

echo
echo
echo "🤖 : Welcome to the pod '`hostname`'!"
echo
echo
