# After installing Ubuntu

* Get google-chrome
* Get dropbox
* Install some stuff:
  sudo apt-get install zsh git-core python3-pip radiotray clementine vlc vim-gnome i3 tig hplip-gui xclip curl transmission-cli transmission-daemon transmission-common mutt unattended-upgrades libncurses-dev python-dev build-essential cmake

* Set ssh-keys to clone repos:
  https://help.github.com/articles/generating-ssh-keys/

```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
[enter]
[enter]
[passphrase]
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
xclip -sel clip < ~/.ssh/id_rsa.pub
```

* Paste the copied key here:
  https://github.com/settings/ssh

* Oh my zsh!

`sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

* remove Ubuntu default home directories

```
rmdir Desktop Documents Downloads Music Pictures Public Templates Videos
mkdir ~/software
```

* Install Vundle

```
  mkdir ~/repos
  cd ~/repos
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

* Clone the dotfiles:

```
cs ~/repos
git clone git@github.com:jmberros/dotfiles.git
cd ~/repos/dotfiles
cp .vimrc .i3pystatus.py .zshrc ~/
```

* Install i3 WM

```
sudo echo "deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe" >> /etc/apt/sources.list
sudo apt-get update
sudo apt-get --allow-unauthenticated install sur5r-keyring
sudo apt-get update
sudo apt-get install i3
```

* Copy vim themes

`cp -r ~/repos/dotfiles/vim_colors ~/.vim/colors`

* Install Vim Plugins

`vim +PluginInstall +qall`

  YouCompleteMe plugin probably needs to be compiled. Go to its directory
  and run ./install.sh

* Copy fstab to automount HDDs. Use `sudo fdisk -l` or `sudo blkid` in case you need UUIDs:

```
sudo nano /etc/fstab
/dev/sdb1   /media/500gb    auto    auto,users  0 0
/dev/sdc3   /media/600gb    auto    auto,users    0 0
```

* Get rid of Nautilus desktop. (If this doesn't work, install dconf-tools and maybe libdconf1 and change that option manually from the dconf-editor.)

`gsettings set org.gnome.desktop.background show-desktop-icons false`

* ((in case it's not in i3 config: `setxkbmap -option caps:swapescape`))

* Choose (2) here to get dmenu with a reasonable font: `sudo update-alternatives --config dmenu`

* Shit for i3pystatus:
```
sudo apt-get install python3.5-dev
pip3 install i3pystatus netifaces colour
```

* Fonts for airline/powerline:
```
git clone git@github.com:powerline/fonts.git
./install.sh
```

And set your gnome-terminal profile to use Ubuntu mono for Powerline 12 and gray on black with a lighter gray.

* Bajarse Anaconda e instalar Jupyter y R.

* Git aliases and config
```
git config --global user.email "juanmaberros@gmail.com"
git config --global user.name "Juan Manuel Berros"
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.br branch
git config --global alias.hist 'log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
git config --global alias.type 'cat-file -t'
git config --global alias.dump 'cat-file -p'
```

* Copy i3's config file: `cp ~/repos/dotfiles/.i3.config ~/.i3/config`

# Reiniciar y loguearse en i3:

* Transmission setup: `sudo vi /etc/transmission-daemon/settings.json`
  y copiarle lo que haya en `~/repos/dotfiles/settings.json`
  ( es posible que desde transgui tengas que cambiar a mano los directorios de dl, /media/600gb/transmission-daemon/{in}complete )

  `sudo service transmission-daemon start`

* Instalar ruby para los cronjobs:

```
rbenv (ver instrucciones online)
ruby-build (ver online)
sudo apt-get install libssl-dev libreadline-dev zlib1g-dev
rbenv isntall 2.2.3
rbenv local 2.2.3
rbenv rehash
ruby --version
rbenv-gemset (ver online)
gem install nokogiri pony colorize
```

* Look for .smpt_credentials in your mail archive and save it to
  `~/.smtp_credentials`

* Set up the cronjobs!
  `crontab -e` y copiar lo que haya en `~/repos/dotfiles/crontab`

* Get your scripts from github:

```
  cd ~/repos
  git@github.com:jmberros/last-episode.git
```

* Bajar soulseek y copiar el ejecutable a `/usr/bin/soulseek`

* f.lux para atonar el monitor al momento del día:
  https://justgetflux.com/ y correr
  `xflux -l -34.60 -g -58.38`

* Set unattended-upgrades:
```
sudo dpkg-reconfigure unattended-upgrades
sudo vi /etc/apt/apt.conf.d/50unattended-upgrades
# Add "Google\, Inc.:stable"; to Allowed-Origins
# Uncomment updates in Allowed-Origins
# Uncomment the 'Mail root' line
sudo vi /etc/apt/apt.conf.d/20auto-upgrades
# Add these lines:
# Though I'm not quite sure if these go in the file 10periodic instead
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Unattended-Upgrade "1";
APT::Periodic::Download-Upgradeable-Packages "1";
APT::Periodic::AutocleanInterval "7";
APT::Periodic::Verbose "1";
```

* Enable reboot and shutdown from i3:
```
sudo visudo
# Add this line to the file:
juan     ALL = NOPASSWD: /sbin/reboot, /sbin/shutdown, /sbin/poweroff
```

* Some bioinformatics shit:
  - install VCFtools: https://vcftools.github.io/examples.html
  - install SAMtools and tabix

```
pip install git+https://github.com/jamescasbon/PyVCF
pip install sklearn python-ternary ftputil humanize ipdb pep8 pyyaml

```

* Jupyter custom themes:
```
cp ~/repos/dotfiles/_dot_jupyter/custom/* ~/.jupyter/custom
```
