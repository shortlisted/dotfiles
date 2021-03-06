# emacs tramp
#############

# Path to your oh-my-zsh installation.uexport ZSH=$HOME/.oh-my-zsh
export ZSH=$HOME/dotfiles/oh-my-zsh
# Set name of the theme to load.

# Theme
#Look in ~/.oh-my-zsh/themes/
# Honukai gnzh cordial bureau alanpeabody kphoen mara pygmalion 
# ext: Bullet train Haribo theme Spaceship
POWERLEVEL9K_MODE='awesome-patched'
# POWERLEVEL9K_MODE='nerdfont-complete'
ZSH_THEME="powerlevel9k/powerlevel9k"

# Possible settings
# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(vi-mode git brew osx z pip python history web-search virtualenv)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

#Go development
export GOPATH="${HOME}/Programmering/go"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

#Personal aliases
#################
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Custom Aliases in /oh-my-zsh/custom/aliases.zsh
# For a full list of active aliases, run `alias`.
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source ~/dotfiles/alias.zsh

# History settings 
HIST_STAMPS="yyyy-mm-dd"
export HISTSIZE=32768;
export HISTFILESIZE=$HISTSIZE;
export HISTCONTROL=ignoredups;
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"
export HIST_IGNORE_ALL_DUPS;

# From brew info zsh
#unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help

fpath=(/usr/local/share/zsh-completions $fpath)

# Custom exports
# ## Set EDITOR to /usr/bin/vim if Vim is installed
if [ -f /usr/local/bin/vim ]; then
  export EDITOR=/usr/local/bin/vim
elif [ -f /usr/bin/vim ]; then
  export EDITOR=/usr/bin/vim
fi

# For system agnostic dotfiles below

# case $(uname) in
#   'Darwin') source ~/dotfiles/tmuxinator/tmuxinator.zsh;test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh";export EDITOR=/usr/local/bin/vim
# esac

# POWERLEVEL9K
# Right prompt
# Show insert or command mode in right prompt
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='46' #green
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='196' #red
POWERLEVEL9K_VI_INSERT_MODE_STRING='✍'
POWERLEVEL9K_VI_COMMAND_MODE_STRING=' '

# Left prompt
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status virtualenv vcs dir dir_writable )
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode background_jobs )

#Colors
#######
POWERLEVEL9K_STATUS_OK_BACKGROUND='235'
POWERLEVEL9K_USER_DEFAULT_BACKGROUND='235'
POWERLEVEL9K_USER_DEFAULT_FOREGROUND='220'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='white'
POWERLEVEL9K_DIR_HOME_FOREGROUND='white'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='white'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='026'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='026'
POWERLEVEL9K_DIR_HOME_BACKGROUND='026'
#PROMPT='%n@%m:%15<..<%~%<<%# '
#source /usr/share/zsh-theme-powerlevel9k/powerleel9k.zsh-theme

# for vi-mode
export KEYTIMEOUT=1

# retain up/down arrow history searches
# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search
  bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi
