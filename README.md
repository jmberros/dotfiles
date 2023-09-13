# After installing Ubuntu

Should take a couple of hours top.

- Install firefox and google-chrome, sync profiles
- Install Dropbox
- Remove Ubuntu default home directories
- Create ssh key and copy it to your profile in gituhb
- Oh my zsh! + Spaceship prompt + base16 + base16-shell-preview
- evalcache for oh my zsh speedup: https://github.com/mroth/evalcache
- juan in sudoers with no pass: `juan  ALL=(ALL) NOPASSWD: ALL`
- Install some stuff:

```bash
sudo apt install \
  zsh git vlc i3 tig xclip curl \
  transmission-remote-gtk build-essential \
  cmake tree pavucontrol htop polybar flameshot \
  fzf bat w3-img exa duf jq net-tools \
  brightnessctl rofi qalculate-gtk

sudo snap install authy slack
```

- Clone `dotfiles` repo
- Softlink dotfiles to home dir
- Copy git config from dotfiles
- Install Vim, Vim-plug
- Install i3 WM, put the config from the dotfiles
- Install VSCode insiders
- Nautilus list view by deafult
- Anaconda install Python 3 and pip packages:

```bash
pip install lxml html5lib beautifulsoup4 tqdm i3pystatus psutil netifaces colour
ranger-fm tldr ruff shell-gpt
```

- Download + install Rust (via rustup, see their website) and cargo install:

```bash
cargo install dua-cli dust
```

- install ripgrep: `https://github.com/BurntSushi/ripgrep#installation`
- Symlink the Dunst notifications formatting: `ln -s ~/repos/dotfiles/dunstrc ~/.config/dunst/dunstrc`
- Symlink `Dropbox/scripts/i3_config` to `~/.config/i3/config`
- Symlink `Dropbox/scripts/i3_config.status-bar.arrakis` to `~/.config/i3/i3_config.status-bar`
- Symlink dircolors dotfile
- Symlink ranger `rc.conf`
- Nerdfonts from their repo, all fonts
- Copy vim themes: `cp -r ~/repos/dotfiles/vim_colors ~/.vim/colors`
- Install Vim Plugins: `vim +PlugInstall! +qall`
- Increase padding in gnome-terminal (google it, SO)
- Change the default locales to `en_US.UTF-8` in `/etc/default/locale`
- Install docker

```bash
ln -s ~/repos/dotfiles/scripts/notion ~/.local/bin/
```

- Rofi theming: https://github.com/adi1090x/rofi

# Dev stuff

```bash
sudo apt install postgresql postgresql-contrib

# Removes (base) from the prompt:
conda config --set auto_activate_base false
```

# Old stuff

- [DEPRECATED-Using Polybar now] Copy `Dropbox/scripts/i3pystatus_modules/*` to `anaconda/lib/python/site-packages/i3pyustatus`

```bash
# Was used for i3pystatus -- Not needed anymore?
# sudo apt install libdbus-1-dev libdbus-glib-1-dev libiw-dev
```

- [NOT NECESSARY] Install Latex `sudo apt install texlive-full # 3 Gb !`
- Install rbenv ruby etc (digital ocean guides)
- Install MySQL (digital ocean guides)

## Stuff for @beleriand

- Transmission setup: `sudo vi /etc/transmission-daemon/settings.json`
  y copiarle lo que haya en `~/repos/dotfiles/settings.json`
  ( es posible que desde transgui tengas que cambiar a mano los directorios de dl, /media/600gb/transmission-daemon/{in}complete )

  `sudo service transmission-daemon start`

- Look for .smpt_credentials in your mail archive and save it to
  `~/.smtp_credentials`

- Set up the cronjobs!
  `crontab -e` y copiar lo que haya en `~/repos/dotfiles/crontab`

- Get your scripts from github:

```bash
cd ~/repos
git clone git@github.com:jmberros/last-episode.git
```

- [Bajar soulseek](http://www.slsknet.org/news/node/1) y copiar el ejecutable a `/usr/bin/soulseek`

- f.lux para atonar el monitor al momento del día:
  https://justgetflux.com/ y correr

```bash
sudo add-apt-repository ppa:kilian/f.lux
sudo apt update
sudo apt install fluxgui
xflux -l -34.60 -g -58.38
```
