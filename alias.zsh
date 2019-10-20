# Tput?
#######
bold=$(tput bold)
normal=$(tput sgr0)

# Aliases
#########

alias vimrc='vim ~/.vimrc'
alias lsd="ls -ld .?*"
alias cpd='pwd|tr -d "\n" | pbcopy'
alias zs="source ~/.zshrc"
alias brewery="brew upgrade && brew cleanup && brew update && brew outdated"
alias zalias="vim +8 ~/dotfiles/alias.zsh"
alias sagent='eval "$(ssh-agent -s)"'
alias tk="tmux kill-window -t"
alias tl="tmux ls"
alias ms="mux start"
alias zshrc="vim ~/.zshrc"
alias i3rc="vim ~/.config/i3/config"
alias i3s="vim ~/.config/i3status/config"
alias lt="ls -lht --color | head -5"
alias lat="ls -lAht | head -10"
alias help="run-help"
alias pp="python3"
alias pbl='pbc "$(ls -rt | tail -n1)"'
alias my="mysql -u root -p"
alias tmacs="/usr/local/Cellar/emacs/25.1/bin/emacs-25.1 -nw"
alias bison="/usr/local/Cellar/bison/3.0.4/bin/bison"
alias se="sudoedit"
alias ml="mdless"
alias aux="ps aux | grep"
alias hg="history | grep"
alias gitconfig="vim ~/.gitconfig"
alias svgpng="qlmanage -t -s 1000 -o . "
alias lsym='ls -la $1 | grep "\->"'
alias er='echo $?'
alias venv='source virtualenv/bin/activate'
alias pq='pacman -Q | grep $1'
alias die='kill -9'

# Functions

# JavaAlias
###########
jm() {
  if [ $# -ne 1 ]; then
    echo Error. Supply file name without .java
    echo "jm <filename>"
  else
    javac $1.java;java $1
  fi
}

# ExpandURL
###########
expandurl() {
  curl -sIL $1 | grep ^Location;
}

# Emacs
#######


# Man as pdf
############
pdfman () {
  man -t "$@" | open -f -a Preview
}

## Redo with flags
alias redo="~/.bin/redo.sh"

## mkdir && cd
mc ()
{
  mkdir -p -- "$1" &&
    cd -P -- "$1"
  }

## Basic math
calc() {
    bc -l <<< "$@"
}

## Make persistent alias from cli
malias() {
	if [ $# -le 1 ]; then
		echo Not valid alias
		echo "syntax: <malias>  <string of commands>"
	else
		echo alias $1="\"${@:2}"\" >> ~/.alias.zsh
	fi
}

## Backup copy
bcp() { 
    if [[ $# -eq 0 ]] ; then
        echo "Usage: ${bold}bcp file${normal} creates a copy named ${bold}file.bak${normal}"
        kill -INT $$
    fi
    cp "$*" "$*".bak
    if [ -f "$*".bak ]; then
        echo "File backed up to ${bold}"$*".bak${normal}";
    else
        echo "Something went wrong. No backup found.";
    fi
}

## File content to clipboard
pbc() { cat $1 | pbcopy }

## SSH key function
## Syntax: sshk keyname user@host
sshk() { ssh -i ~/.ssh/$1 $2 }

## Translate CLI
## Require trans - command line translator
tt() {
	if (( $# == 0 )); then
		echo usage: ${bold}tt word${normal}
	else
	trans -b en:sv "$*"
	fi
}

## Find file containing string in directory
sfind()	{
        #-l print name of file -s supress error msgs
	find . -exec grep -l -s $1 {} \;
	return 0
}

## open most recently changed file in vim:
##########################################
vl() {
  recentfile="$(ls -rt | tail -n1)"
  $EDITOR $recentfile
}

## tarsee
#########
tarsee() {
  tar -tvf $1
}

## Autoconvert last .tiff to .jpg
########################
cvrt() {
  lastfile="$(ls -rt | tail -n1)"
  convert -quality 100 $lastfile ${lastfile: : -5}.jpg
}

# Manual convert
################
mcvrt() {
  convert -quality 100 $1.svg $1.jpg
}

# Convert (LaTeX) pdf -> white background png
#############################################
pdfpng() {
  convert -density 300 $1.pdf -quality 90 -flatten $1.png
}
