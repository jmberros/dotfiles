#!/bin/bash

apt update
apt install -y -qq tmux vim htop parallel tree zsh
# pip install --upgrade pip
pip install -q ipython jupyter

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

Purple='\033[0;35m'
Color_Off='\033[0m'

echo
echo
echo "    🤖 : Welcome to the pod '`hostname`'!"
echo
echo
