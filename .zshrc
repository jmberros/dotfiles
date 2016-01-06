# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"  # I use this in the desktop
#ZSH_THEME="awesomepanda"
#ZSH_THEME="blinks"
#ZSH_THEME="cypher"
#ZSH_THEME="afowler"
#ZSH_THEME="random"
#ZSH_THEME="wezm+"
#ZSH_THEME="daveverwer"
ZSH_THEME="tjkirch"  # I use this in the notbook

# linux handy aliases
alias ls='ls --color=auto --group-directories-first'
alias sl='ls --color=auto --group-directories-first'
alias l='ls --color=auto --group-directories-first'
alias ll='ls -alF --color=auto --group-directories-first'
alias la='ls -A --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ..='cs ..'
alias rsync='rsync -vzh'
alias tmux="tmux -2"

# coding and gitting
alias be='bundle exec'
alias s='clear; git status'

# file [de]compressing

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

pswatch () {
  watch -n1 "ps aux | head -n1 && ps aux | grep '$1' | grep -v 'grep'"
}

cs () {
  cd $1
  ls
}

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

# Some bio utils from different suites
export PATH=$HOME/bio/ViennaRNA-2.1.9/Utils:$PATH
export PATH=$HOME/bio/RNAz-2.1/perl:$PATH
export PATH=$HOME/bio/ncbi-blast-2.2.30+/bin:$PATH
export PATH=$HOME/usr/bin:$PATH
export PATH=$HOME/repos/stem-loop/bin:$HOME/repos/stem-loop/StemLoop/bin:$PATH

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export EDITOR=vim
export PYTHONSTARTUP=$HOME/.pythonrc

export BLASTDB="/home/juan/bio/ncbi-blast-2.2.30+/db"

