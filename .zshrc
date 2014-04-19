# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
#ZSH_THEME="random"
#ZSH_THEME="crunch"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias s='clear; git status'
alias df='df -h'
alias du='du -c -h'
alias ..='cd ..'
alias be='bundle exec'
alias rsync='rsync -vzh'

# ssh to servers
alias tools='ssh -A sumavisos@tools'
alias parsers5='ssh -A sumavisos@parsers5'
alias pepita='ssh -A sumavisos@pepita'
alias ramona='ssh -A sumavisos@ramona'
alias clementina='ssh -A sumavisos@clementina'
alias kf='cd /home/juan/repos/keywords-factory'
alias dsv='ssh -A sumavisos@dsv'
alias dsv-db='ssh -A sumavisos@dsv-db'

# start consoles and servers locally
alias kfconsole='cd /home/juan/repos/keywords-factory && bundle exec padrino console'
alias psconsole='cd /home/juan/repos/panel-sem && bundle exec padrino console'
alias psserver='ps; bundle exec padrino start -p3000'
alias kfserver='kf; bundle exec padrino start -p4567'

alias panel_data="rsync --ignore-existing -vzh sumavisos@clementina:~/exchange_rates/\* ~/exchange_rates && rsync --ignore-existing -vzh sumavisos@clementina:~/arbitrage_stats/\* ~/arbitrage_stats" 

# RVM is a function motherfucker!
source ~/.rvm/scripts/rvm

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 
