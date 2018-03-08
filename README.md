# After installing Ubuntu

* Get google-chrome
* Get dropbox
* Install some stuff:
```
sudo apt install zsh git-core python3-pip radiotray clementine vlc vim-gnome i3 tig hplip-gui xclip curl transmission-cli transmission-daemon transmission-common mutt unattended-upgrades libncurses-dev python-dev build-essential cmake xbacklight libfreetype6-dev xautolock latexmk gummi texlive-lang-spanish meld xdec dh-autoreconf keychain tree
```

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

* Paste the copied key in github and gitlab:
  https://github.com/settings/ssh
  https://gitlab.com/profile/keys

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
sudo apt update
sudo apt --allow-unauthenticated install sur5r-keyring
sudo apt update
sudo apt install i3
```

* Get rid of Nautilus desktop. (If this doesn't work, install dconf-tools and maybe libdconf1 and change that option manually from the dconf-editor.)

`gsettings set org.gnome.desktop.background show-desktop-icons false`

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

* Git merge config:
```
[merge]
    tool = mymeld
[mergetool "mymeld"]
    cmd = meld --diff $BASE $LOCAL --diff $BASE $REMOTE --diff $LOCAL $MERGED $REMOTE
```

## i3pystatus:
```
sudo apt install libdbus-1-dev libdbus-glib-1-dev libiw-dev 
cp ~/repos/dotfiles/.i3pystatus.laptop.py ~/.i3pystatus.py
```

* Antes de irte de Unity, configurá por default Nautilus para que muestre listas
  en lugar de íconos.

## Reiniciar y loguearse en i3:

* After default creation of `~/.i3/config`, copy i3's config file: `cp ~/repos/dotfiles/.i3.config ~/.i3/config`

* ((in case it's not in i3 config: `setxkbmap -option caps:swapescape`))

* Enable reboot and shutdown from i3:

```
sudo visudo
# Add this line to the file:
juan     ALL = NOPASSWD: /sbin/reboot, /sbin/shutdown, /sbin/poweroff
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

* Copy fstab to automount HDDs. Use `sudo fdisk -l` or `sudo blkid` in case you need UUIDs:
  (this applies to @beleriand)

```
sudo nano /etc/fstab
/dev/sdb1   /media/500gb    auto    auto,users  0 0
/dev/sdc3   /media/600gb    auto    auto,users    0 0
```

* Fonts for airline/powerline:
```
git clone git@github.com:powerline/fonts.git
./install.sh
```

And set your gnome-terminal profile to use Ubuntu mono for Powerline 12 and gray on black with a lighter gray.

## Python

* Bajarse Anaconda e instalar varias librerías. Esto va a hacer andar a i3pstatus:
```bash
conda install jupyter numpy pandas biopython matplotlib scipy lxml html5lib beautifulsoup4
pip install html5lib q i3pystatus psutil i3pystatus netifaces colour # basiciw dbus-python
```

Recargar i3 (usualmente Mod+Shift+R) para ver bien la barra de status.

* IPython startup:
```
ipython profile create
vi ~/.ipython/profile_default/ipython_config.py
# ^ Add / uncomment stuff (pending)
```

## Clone ur repos

```bash
cs ~/repos
for URL in `cat ~/repos/dotfiles/repo_urls_to_clone.list`; do
    git clone ${URL}
done
```

## Ruby

[DigitalOcean guide is perfect](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-16-04)

## MySQL

[DigitalOcean guide is great](https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-16-04)

Then log in with the root account whose password you set up during install,
and create a juan user:

```mysql
> CREATE USER 'juan'@'localhost' IDENTIFIED BY 'password';
> GRANT ALL PRIVILEGES ON * . * TO 'juan'@'localhost';
```

## Unattended-upgrades:

```bash
sudo dpkg-reconfigure unattended-upgrades
sudo vi /etc/apt/apt.conf.d/50unattended-upgrades
```
* Add `"Google\, Inc.:stable";` to Allowed-Origins.
* Uncomment updates in Allowed-Origins
* Uncomment the 'Mail root' line

* Add these lines to `sudo vi /etc/apt/apt.conf.d/20auto-upgrades`:
```
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Unattended-Upgrade "1";
APT::Periodic::Download-Upgradeable-Packages "1";
APT::Periodic::AutocleanInterval "7";
APT::Periodic::Verbose "1";
```

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

## Bioinformatics:

```bash
sudo apt install bioperl libbz2-dev liblzma-dev
```

Install:
- Samtools + Bcftools + HTSLib
- GATK
- PicardTools
- MultiQC
- cutadapt (`pip install cutadapt`)
- SnpEff + SnpSift
- VEP


## Etc.

* Jupyter custom themes:
```
cp ~/repos/dotfiles/_dot_jupyter/custom/* ~/.jupyter/custom
```

## Varmilo Keyboard with Bluetooth stuff

* To pair the Varmilo keyboard (After pluggin the Bluetooth dongle!), follow
  the instructions [here](http://markrages.tumblr.com/post/124253167608/set-up-the-varmilo-vb87m-bluetooth-4-keyboard-in).
```
sudo add-apt-repository ppa:vidplace7/bluez5
sudo apt update
sudo apt install bluez bluetooth
```
  - Make sure the Varmilo Keyboard is turned on: Fn + Insert
  - Then start `bluetoothctl` for an interactive prompt. Try with these commands:
  - `power on`, `agent on` (or `agent KeyboardOnly`?), `pairable on`, `scan on`
  - The `scan on` command should show you the MAC address for the keyboard!
    Use that MAC address (autocomplete with TAB works, don't type the whole thing)
    in this command: `pair MAC`, wait for the pairing to be successful
    (it should print a **Passkey** on screen, type that number with the keyboard and hit ENTER!!)
  - Once the pairing is successfull, try `connect MAC`.
  - I needed to reboot the computer and then the keyboard was paired.
  - Watch out for auto-turn off of the thing, make sure it's on while pairing/connecting.
      
I couldn't get a passkey to be displayed on my second attemp on this, so I first
connected to the thing from the GUI bluetooth-wizard, selecting
"Set up new device", choosing the keyboard, and then "Do not pair" and without passkey.
This would connect it without pairing it. I later did a GUI-based pairing with the
keys icon (though this could be done using `bluetoothctl # pair <MAC>` too.)
The result was a non-functional pairing though ....

I have no idea how I got it to display a passkey on the other run! Blueman does 
display a PASSKEY when I connect the keyboard in beleriand ....

I did got the message via Ubuntu notification ONLY when using the regular Unity
session / WM, not i3.

While you do stuff on the GUI, keep an eye on `bluetoothctl` to check what happens.

## More stuff

* Command to backup `beleriand`'s music dir (run from `arrakis`!):
```
nice -n 19 ionice -c3 rsync juan@beleriand.local:/media/600gb/music/ ~/ -avhz --delete
```

* Remove zsh theme `ls` alias in `~/.oh-my-zsh/lib/theme-and-appearance.zsh`.


* To remap keys in the Lenovo laptop (HOME, END, PAGE DOWN|UP), I used this https://radu.cotescu.com/remapping-keys-in-ubuntu-14.04/. Edit the file and change the keys and their mappings, it's intuitive enough to figure it out along the way:
```
sudo vi /usr/share/X11/xkb/symbols/pc
```

## Biotools

* java
* haploview (agregar alias al zshrc)
* vcftools
* samtools
* bedtools
* Gatk (agregar alias al zshrc)
* Python con jupyter via conda
* fastq-mcf (ea-utils)
* picard tools

