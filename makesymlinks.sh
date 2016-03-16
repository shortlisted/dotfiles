#!/bin/bash
###########
#Borrowed from https://github.com/michaeljsmalley
###########

# Variables
###

DIR=~/dotfiles
OLDDIR=~/dotfiles_old
FILES="bash_profile gvimrc oh-my-zsh vim vimrc zshrc" #list of files/folders

###

# create backup directory
echo -n "Creating $OLDDIR for backup... "
mkdir -p ~/$OLDDIR
echo "done"

# change to dotfiles directory
echo -n "Changing to the $DIR directory... "
cd $DIR
echo "done"

# move files to backup location, create symlinks from homedir to dotfiles in $files
for FILE in $FILES; do
	echo "Moving existing dotfiles from $HOME to $OLDDIR"
	mv ~/.$FILE ~/$OLDDIR/
	echo "Creating symlinks in home directory."
	ln -s $DIR/$FILE ~/.$FILE
done
