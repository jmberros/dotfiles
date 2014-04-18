Set up new machine
========

* Download & Install via LiveUSB the latest LTS Uubutu
 - Set language as English (US) and keyboard layout as English (International AltGr deade keys)
* Restore gnome classic with Compiz: `sudo apt-get install gnome-session-flashback`
 - Log out and log in choosing Gnome with Compiz
* Install google-chrome and synch
* Install everything that is cool:
 - `sudo apt-get install guake terminator git vim vim-gtk tree curl zsh compizconfig-settings-manager grc`
* Oh my ZSH! `sudo-apt get install zsh && curl -L http://install.ohmyz.sh | sh && chsh -s /bin/zsh`
* Set up vim with solarized theme or tomorrow theme
 - https://github.com/chriskempson/tomorrow-theme
 - git clone tomorrow-theme && cp ... ~/.vim/colors & ..
 - http://ethanschoonover.com/solarized
 - `wget http://ethanschoonover.com/solarized/files/solarized.zip && unzip solarized.zip && mkdir ~/.vim && mkdir ~/.vim/colors && cp solarized/vim-colors-solarized/colors/solarized.vim ~/.vim/colors`
 - tell terminator to use solarized as default colorscheme: ``
* Install rvm with latest ruby http://rvm.io/rvm/install:
 - `\curl -sSL https://get.rvm.io | bash`
 - `rvm install 2.0.1`
* Generate and add SSH key to github (just CTRL-V in the key field):
```
mkdir ~/.ssh
ssh-keygen -t rsa -C "juanmaberros@gmail.com"
ssh-add ~/.ssh/id_rsa
sudo apt-get install xclip
xclip -sel clip < ~/.ssh/id_rsa.pub
google-chrome https://github.com/settings/ssh
```
* Git config:
```
git config --global user.email "juanmaberros@gmail.com"
git config --global user.name "Juan Manuel Berros"
```
* Clone this repo and the rc files in it to your home dir: `mkdir ~/repos && cd ~/repos && git clone git@github.com:jmberros/dotfiles.git && cd dotfiles && cp ./.vimrc ~ && cp ./.pryrc ~ && cp ./.zshrc ~ && cp ./.my.cnf ~ && cp ./.grcat ~`
* Clone all the repos in `~/repos`! https://github.com/jmberros?tab=repositories
* `sudo vi /etc/hosts` and add all the servers you're using ATM
* Install oh-my-zsh: `curl -L http://install.ohmyz.sh | sh && chsh -s /bin/zsh`
* `gem install bundler` and inside every repo create a new gemset and run bundle install: `rvm gemset create <repo_name> && bundle install`
