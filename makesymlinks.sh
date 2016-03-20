#!/bin/bash
###########
#Borrowed from https://github.com/michaeljsmalley
###########

# Variables
###########

DIR=~/dotfiles
OLDDIR=~/dotfiles_old
FILES="bash_profile gvimrc vim vimrc zshrc tmux tmux.conf" #list of files/folders

#oh-my-zsh
##########
## Check the status of oh-my-zsh
## If installed oh-my-zsh is added to list of files to be changed
## Will git clone oh-my-zsh if it's missing

if [ -d ~/.oh-my-zsh ]; then
	echo ".oh-my-zsh exists, proceeding" ;
	FILES="$FILES oh-my-zsh";
else
	echo "no .oh-my-zsh, installing" ;
	cd $DIR
	git clone http://github.com/robbyrussell/oh-my-zsh.git
	ln -s $DIR/oh-my-zsh ~/.oh-my-zsh;
fi

#Creating folders and symlinks
##############################

# create backup directory
echo -n "Creating $OLDDIR for backup... "
mkdir -p $OLDDIR
echo "done"

# change to dotfiles directory
echo -n "Changing to the $DIR directory... "
cd $DIR
echo "done"

# backup old files, create symlinks to dotfiles in $FILES
for FILE in $FILES; do
	echo "Moving existing dotfiles from $HOME to $OLDDIR"
	mv ~/.$FILE $OLDDIR/
	echo "Creating symlinks in home directory."
	ln -s $DIR/$FILE ~/.$FILE
done

echo '\nSymlinks complete'
