#!/bin/bash

apt update
apt install -y -qq tmux vim htop
pip install --root-user-action ignore --upgrade pip
pip install --root-user-action ignore -q ipython

Purple='\033[0;35m'
Color_Off='\033[0m'

echo
echo
echo "    🤖 : Welcome to the pod '`hostname`'!"
echo
echo
