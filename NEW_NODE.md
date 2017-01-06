# On remote, as root

```bash
adduser juan
usermod -aG sudo juan

sudo vi /etc/hostname
change the hostname

hostname -F /etc/hostname
```

# On local

```bash
ssh-copy-id juan@hostname
enter pass

sudo vi /etc/hosts
# Add this line
# {ip of new node}      hostname

ssh juan@hostname

rsync -avzh ~/.zshrc juan@hostname:~
rsync -avzh ~/.vimrc juan@hostname:~
```

# On remote, as the new user

```bash
sudo apt-get update
sudo apt-get install vim zsh git mosh ufw
# logout and login via mosh

# Oh my ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Logout - login
vi ~/.zshrc  # Change theme to "steeef"
source ~/.zshrc

vim +PluginInstall +qall

# Firewall
https://www.digitalocean.com/community/tutorials/how-to-setup-a-firewall-with-ufw-on-an-ubuntu-and-debian-cloud-server

# Apache
sudo apt-get install apache2 ngnix

# Python
wget https://repo.continuum.io/archive/Anaconda3-4.2.0-Linux-x86_64.sh
bash Anaconda3-4.2.0-Linux-x86_64.sh


# Postgres
sudo apt-get install postgresql postgresql-contrib
sudo -i -u postgres
psql

# On PSQL as psql role
> create user juan with password '...';
> create database <db>;
> grant all privileges on database <db> to juan;

sudo vi /etc/postgresql/9.5/main/pg_hba.conf 
# Add this line with your trusted IP
# host  all   all  <IP>/24  trust
sudo vi /etc/postgresql/9.5/main/postgresql.conf
# listen_addresses = '*'
sudo service postgresql restart


# DokuWiki
https://www.dokuwiki.org/install:ubuntu
```

