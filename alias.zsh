# Tput?
#######
bold=$(tput bold)
normal=$(tput sgr0)

# Aliases
#########

alias vimrc='vim ~/.vimrc'
alias lsd="printf '%s\\n' .*"
alias cpd='pwd|tr -d "\n" | pbcopy'
alias vimz='vim ~/.zshrc'
alias zs="source ~/.zshrc"
alias brewery="brew upgrade && brew cleanup && brew update && brew outdated"
alias zalias="vim +3 ~/dotfiles/alias.zsh"
alias sagent='eval "$(ssh-agent -s)"'
alias tk="tmux kill-window -t"
alias tl="tmux ls"
alias ms="mux start"
alias zshrc="vim ~/.zshrc"
alias lt="ls -lht | head -5"

# Functions

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
	find . -exec grep -l -s $1 {} \;
	return 0
}
