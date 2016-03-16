# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="maran"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew osx z pip python history web-search)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Custom Aliases in /oh-my-zsh/custom/aliases.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Own settings 
export HISTSIZE=32768;
export HISTFILESIZE=$HISTSIZE;
export HISTCONTROL=ignoredups;
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

export HIST_IGNORE_ALL_DUPS;

# Custom exports
# ## Set EDITOR to /usr/bin/vim if Vim is installed
if [ -f /usr/bin/vim ]; then
	export EDITOR=/usr/bin/vim
fi

# Aliases
#########

alias vimrc='vim ~/.vimrc'
alias lsd='printf '%s\n' .*'
alias cpd='pwd|tr -d "\n" | pbcopy'
alias vimz='vim ~/.zshrc'
alias zs="source ~/.zshrc"
alias brewery="brew upgrade && brew cleanup && brew update && brew outdated"

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
