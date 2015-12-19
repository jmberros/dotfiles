# Setting up a decent environment

* Download & Install the latest LTS Ubuntu
 - Set language as English (US) and keyboard layout as English (International AltGr deade keys)

* ~~Restore gnome classic with Compiz: `sudo apt-get install gnome-session-flashback`~~
 - ~~Log out and log in choosing Gnome with Compiz~~

## Git to get these files
* Install git, prolly with `sudo apt-get install git`, do the whole ssh-key thing (google that shit).
* Generate and add SSH key to github (just CTRL-V in the key field):
```
mkdir ~/.ssh
ssh-keygen -t rsa -C "juanmaberros@gmail.com"
ssh-add ~/.ssh/id_rsa
sudo apt-get install xclip
xclip -sel clip < ~/.ssh/id_rsa.pub
google-chrome https://github.com/settings/ssh
```

```
git config --global user.email "juanmaberros@gmail.com"
git config --global user.name "Juan Manuel Berros"
git config --global push.default simple
```
* Clone this repo and the rc files in it to your home dir:
```
mkdir ~/repos && cd ~/repos && git clone git@github.com:jmberros/dotfiles.git && \
cd dotfiles && cp ./.vimrc ~ && cp ./.pryrc ~ && cp ./.zshrc ~ && cp ./.my.cnf ~ && \
cp ./.grcat ~ && sudo cp ./hosts /etc/hosts && cp ./tmux.conf ~ && \
cp ./.i3.config ~/.i3/config && cp ./.i3status.conf ~
```
* Copy all the dotfiles from this repo to $HOME

## Oh my ZSH
* Oh my ZSH! `sudo-apt get install zsh && curl -L http://install.ohmyz.sh | sh && chsh -s /bin/zsh`
* Tap that sweet config: `cp ~/repos/dotfiles/.zshrc ~/`
* Install oh-my-zsh: `curl -L http://install.ohmyz.sh | sh && chsh -s /bin/zsh`

## Google-Chrome
* Install google-chrome and synch your account.

## More stuff
* Install everything that is cool:
```
sudo apt-get install guake terminator vim vim-gtk tree curl compizconfig-settings-manager compizconfig-plugins compizconfig-plugins-extra grc nodejs meld i3 tmux
```
* Set Terminator as your default terminal: `gsettings set org.gnome.desktop.default-applications.terminal exec 'terminator'`

## Vim
* Copy ~/.vimrc to $HOME and run (from the command line): `vim +PluginInstall +qall`

* Set up vim with solarized theme or tomorrow theme
 - `mkdir -p ~/.vim/colors`
 - `cd ~/Downloads && git clone https://github.com/chriskempson/tomorrow-theme && cp tomorrow-theme/vim/colors/*.vim ~/.vim/colors`
 - `wget http://ethanschoonover.com/solarized/files/solarized.zip && unzip solarized.zip && cp solarized/vim-colors-solarized/colors/solarized.vim ~/.vim/colors`
 - tell terminator to use solarized as default colorscheme: ``

## Ruby
* Install rvm with latest ruby http://rvm.io/rvm/install:
 - `\curl -sSL https://get.rvm.io | bash`
 - `rvm install 2.0.0`

## DBs
* Install MariaDB, Redis, ... ?
