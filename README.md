# After installing Ubuntu

* Install firefox and google-chrome
* Install dropbox
* Remove Ubuntu default home directories
* Set ssh keys
* Oh my zsh! + Spacechip + base16 + base16-shell-preview
* juan in sudoers with no pass: `juan  ALL=(ALL) NOPASSWD: ALL`

* Install some stuff:

```
sudo apt install zsh git vlc i3 tig xclip curl transmission-remote-gtk build-essential cmake tree
```

* Clone `dotfiles` repo
* Copy git config from dotfiles
* Install Vim, Vundle
* Install i3 WM, put the config from the dotfiles
* Install Latex `sudo apt install texlive-full # 3 Gb !`
* Nautilus list view by deafult
* Anaconda install Python 3 and pip packages:


```
pip install lxml html5lib beautifulsoup4 tqdm i3pystatus psutil netifaces colour 
```

## i3pystatus:

* Copy i3pystatus modules to anaconda dir
* Copy or link i3 configs

```
sudo apt install libdbus-1-dev libdbus-glib-1-dev libiw-dev 
```

* Add and Renew Fonts
```
cp -R ~/repos/dotfiles/.fonts ~/
fc-cache -f -v
```

* Copy vim themes

`cp -r ~/repos/dotfiles/vim_colors ~/.vim/colors`

* Install Vim Plugins

`vim +PluginInstall +qall`

  YouCompleteMe plugin probably needs to be compiled. Go to its directory
  and run ./install.sh

* Install rbenv ruby etc (digital ocean guides)
* Install MySQL (digital ocean guides)

# Old stuff

## Stuff for @beleriand

* Transmission setup: `sudo vi /etc/transmission-daemon/settings.json`
  y copiarle lo que haya en `~/repos/dotfiles/settings.json`
  ( es posible que desde transgui tengas que cambiar a mano los directorios de dl, /media/600gb/transmission-daemon/{in}complete )

  `sudo service transmission-daemon start`

* Look for .smpt_credentials in your mail archive and save it to
  `~/.smtp_credentials`

* Set up the cronjobs!
  `crontab -e` y copiar lo que haya en `~/repos/dotfiles/crontab`

* Get your scripts from github:

```
cd ~/repos
git clone git@github.com:jmberros/last-episode.git
```

* [Bajar soulseek](http://www.slsknet.org/news/node/1) y copiar el ejecutable a `/usr/bin/soulseek`

* f.lux para atonar el monitor al momento del día:
  https://justgetflux.com/ y correr

```
sudo add-apt-repository ppa:kilian/f.lux
sudo apt update
sudo apt install fluxgui
xflux -l -34.60 -g -58.38
```
