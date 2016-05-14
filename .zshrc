# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"  # I use this in the desktop
#ZSH_THEME="awesomepanda"
#ZSH_THEME="blinks"
#ZSH_THEME="cypher"
ZSH_THEME="afowler"  ### This on desktop
#ZSH_THEME="cobalt2"
#ZSH_THEME="random"
#ZSH_THEME="wezm+"
#ZSH_THEME="daveverwer"
# ZSH_THEME="tjkirch"  # I use this in the notbook

# unix handy aliases
alias ls='ls --color=auto --group-directories-first'
alias sl='ls --color=auto --group-directories-first'
alias l='ls --color=auto --group-directories-first'
alias ll='ls -alF --color=auto --group-directories-first'
alias la='ls -A --color=auto --group-directories-first'
alias grep='grep -i --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ..='cs ..'
alias tmux="tmux -2"
alias xclip="xclip -selection primary -f | xclip -selection clipboard"
alias put="xsel -p"
alias arrakis='ssh juan@arrakis.local'
alias haploview='java -jar ~/software/Haploview.jar'
alias picard-tools='java -jar ~/software/picard-tools-2.2.4/picard.jar'
alias fastq='~/software/FastQC/fastqc'
alias fastq-mcf='~/software/ea-utils.1.1.2-537/fastq-mcf'

# replace AWK with Ruby
alias rawk='ruby -lane'
alias rawk,='ruby -F, -lane'
alias rawk:='ruby -F: -lane'
alias rawkt='ruby -F"\t" -lane'
alias rawks='ruby -F"\s+" -lane'

alias mv='mv -i'
alias cp='cp -iv'

alias mostusedcomms="history | awk '{CMD[\$2]++;count++;}END { for (a in CMD)print CMD[a] \" \" CMD[a]/count*100 \"% \" a;}' | grep -v \"./\" | column -c3 -s \" \" -t | sort -nr | nl |  head -n20"

# coding and gitting
alias be='bundle exec'
alias s='clear; git status'

push_branch() {
    branch=`git rev-parse --symbolic-full-name --abbrev-ref HEAD`
    git push $1 $branch
}
pull_branch() {
    branch=`git rev-parse --symbolic-full-name --abbrev-ref HEAD`
    git pull $1 $branch
}
autoload push_branch
autoload pull_branch

alias gpo='git push origin'
alias gpom='git push origin master'
alias gpob='push_branch origin'

alias gfo='git fetch origin'
alias gfu='git fetch upstream'
alias gfot='git fetch origin --tags'
alias gfut='git fetch upstream --tags'
alias gpot='git push origin --tags'
alias gput='git push upstream --tags'

alias gpu='git push upstream'
alias gpum='git push upstream master'
alias gpub='push_branch upstream'

alias glo='git pull origin'
alias glom='git pull origin master'
alias glob='pull_branch origin'
alias glum='git pull upstream master'
alias glub='pull_branch upstream'

alias gadd='git add'

# file [de]compressing

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13
#

if [[ -r ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
    source ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
fi

pswatch () {
  watch -n1 "ps aux | head -n1 && ps aux | grep '$1' | grep -v 'grep'"
}

cs () {
  cd $1;

  if [ $? -eq 0 ]; then  # If dir exists!
    if [ `ls | wc -l` -ge 15 ]; then
      ls --color=auto --group-directories-first;
    else
      ls -lh --color=auto --group-directories-first;
    fi
  fi
}

backup () {
  newname=$1.`date +%Y%m%d.%H%M.bak`;
  mv $1 $newname;
  echo "-> Backed up to '$newname'";
  cp -p $newname $1;
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
export PATH=$HOME/bin:$PATH
export PATH=$HOME/repos/stem-loop/bin:$HOME/repos/stem-loop/StemLoop/bin:$PATH

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export EDITOR=vim
export BROWSER=google-chrome
export PYTHONSTARTUP=$HOME/.pythonrc

export BLASTDB="/home/juan/bio/ncbi-blast-2.2.30+/db"

# This is needed for VCFTtools:
export PERL5LIB=/path/to/your/vcftools-directory/src/perl/

export PATH=/home/juan/miniconda3/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
