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

# Functions

## Make persistent alias from cli
malias() {
	if [ $# -le 1 ]; then
		echo Not valid alias
		echo "syntax: <malias>  <string of commands>"
	else
		echo alias $1="\"${@:2}"\" >> ~/.zshrc
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
		echo usage: tt word
	else
	trans -b en:sv "$*"
	fi
}

## Find file containing string in directory
sfind()	{
	find . -exec grep -l -s $1 {} \;
	return 0
}