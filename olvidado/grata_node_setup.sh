#!/bin/bash

apt update
apt install -y -qq tmux vim htop zsh
pip install -U -q pip ipython jupyter tqdm openpyxl 

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sed -i "s/robbyrussell/bureau/" ~/.zshrc

echo "alias start_jupyter='jupyter lab --no-browser --port 9999 --ip 0.0.0.0 --allow-root'"

Purple='\033[0;35m'
Color_Off='\033[0m'

echo
echo
echo "    🤖 : You are now at '`hostname`'!"
echo
echo
