#################
#
# Oh My ZSH Configuration
#
#################

ZSH=$HOME/.oh-my-zsh
# DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
# export UPDATE_ZSH_DAYS=13

# See: https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins
plugins=(git ssh-agent bundler capistrano gem grb git-extras web-search wd python pip npm last-working-dir)


#################
#
# Theme
#
#################


# ZSH_THEME="af-magic" # @numenor
# ZSH_THEME="avit" # @caladan
# ZSH_THEME="daveverwer" # @arrakis
# ZSH_THEME="clean"  # @beleriand
ZSH_THEME="steef"  # @solaris


#################
#
# Aliases and Functions
#
#################

# SSH to servers
alias arrakis='ssh -A juan@arrakis.local'
alias caladan='ssh -A juan@caladan.local'
alias numenor='ssh -A juan@numenor.local'
alias beleriand='ssh -A juan@beleriand.local'
alias solaris='mosh juan@solaris'

# Common operations
alias sc='cs'
alias mv='mv -i'
alias cp='cp -iv'
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
alias haploview='java -jar ~/software/Haploview.jar'
alias fastq-mcf='~/software/ea-utils.1.1.2-537/fastq-mcf'
alias mostusedcomms="history | awk '{CMD[\$2]++;count++;}END { for (a in CMD)print CMD[a] \" \" CMD[a]/count*100 \"% \" a;}' | grep -v \"./\" | column -c3 -s \" \" -t | sort -nr | nl |  head -n20"

# replace AWK with Ruby
alias rawk='ruby -lane'
alias rawk,='ruby -F, -lane'
alias rawk:='ruby -F: -lane'
alias rawkt='ruby -F"\t" -lane'
alias rawks='ruby -F"\s+" -lane'

# Git related aliases
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

alias s='clear; git status'
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

# Bioinformatics
alias gatk='java -jar /home/juan/software/GenomeAnalysisTK-3.7/GenomeAnalysisTK-3.7.jar'
alias picard='java -jar ~/software/picard-tools-2.9.1.jar'
alias snpeff='java -jar ~/software/snpEff-4.3m/snpEff.jar'
alias snpsift='java -jar ~/software/snpEff-4.3m/SnpSift.jar'
alias vep='~/software/ensembl-tools-release-87/scripts/variant_effect_predictor/variant_effect_predictor.pl'
alias igv='~/software/IGV_2.3.93/igv.sh'


#################
#
# Functions
#
#################


view_vcf() {
    grep -v '^##' $1 | sed 's/^#//' | column -t
}

view_vcf_no_INFO() {
    view_vcf $1 | ruby -F"\s+" -lane 'puts ($F.first(7) + $F[8..-1]).join("\t")'
}

grep_variant_from_vcf() {
    view_vcf $2 | grep -E "($1|CHROM)"
}

grep_variant_from_vcf_no_INFO() {
    view_vcf_no_INFO $2 | grep -E "($1|CHROM)"
}

less_vcf() {
    view_vcf $1 | less -S
}

less_vcf_no_INFO() {
    view_vcf_no_INFO $1 | less -S
}

pswatch () {
  watch -n1 "ps aux | head -n1 && ps aux | grep '$1' | grep -v 'grep'"
}

# Doesn't work for some reason:
# https://unix.stackexchange.com/questions/27236/zsh-autocomplete-ls-command-with-directories-only
# compdef _dirs cs

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

findhome () {
    find ~ -iname "*${1}*"
}

backup () {
  newname=$1.`date +%Y%m%d.%H%M.bak`;
  mv $1 $newname;
  echo "-> Backed up to '$newname'";
  cp -p $newname $1;
}


#################
#
# Etc.
#
#################


if [[ -r ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
    source ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
fi

source $ZSH/oh-my-zsh.sh


#################
#
# PATH and variables
#
#################


export EDITOR=vim
export BROWSER=google-chrome

export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export PATH=/home/juan/anaconda3/bin:$PATH  # Anaconda
export PATH="$HOME/.rbenv/bin:$PATH"  # Rb Env

eval "$(rbenv init -)"

# Variant Effect Predictor breaks without this:
# export PERL5LIB=/home/juan/storage/paip_resources/vep_data_87:$PERL5LIB
# export PATH=$PATH:/home/juan/storage/paip_resources/vep_data_87/htslib
