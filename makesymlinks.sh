#!/bin/bash
###########
## Script used to set up a directory with dotfiles
## for easy version control through git

# Variables
###########
## folders and files

dotdir=~/dotfiles
olddot=~/dotfiles_old
myfiles="bash_profile vimrc zshrc alias.zsh gitconfig gitignore_global"
existfiles=""

## look for exisiting dotfiles in ~/
printf "checking if any dotfile already exists...\n"
for file in $myfiles; do
  if [ -f ~/.$file ]; then
    printf "dotfile .$file found...\n";
    existfiles="$existfiles $file"
  else
    printf "no .$file found...\n"
  fi
done

## if existing dotfiles found the variable will not be empty:
[ -n "$existfiles" ] && printf "Old dotfiles found: $existfiles\nWill be stored in $olddot\n"

# oh-my-zsh
###########
## Check status of oh-my-zsh
## Downloads if needed

if [ -d .oh-my-zsh ]; then
  printf ".oh-my-zsh exists, proceeding\n"
  myfiles="$myfiles oh-my-zsh"
elif [ -L .oh-my-zsh ]; then
  printf "oh-my-zsh as symlink exists...\n"
else
  printf "no .oh-my-zsh, cloning...\n\n"
  git clone https://github.com/robbyrussell/oh-my-zsh.git $dotdir/oh-my-zsh
  printf "\n"
  ln -s $dotdir/oh-my-zsh ~/.oh-my-zsh
fi

read -p "Download powerlevel9k theme (y/n)?  " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
## powerlevel9k theme
if [ ! -d $dotdir/oh-my-zsh/custom/themes/powerlevel9k ]; then
  git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
fi
fi

# Folders and symlinks
######################
## all already existing dotfiles are moved to _old directory
## creates symlinks from home directory to dotfiles directory
## ~/.filename will link to ~/dotfiles/filename
if [ -n "$existfiles" ]; then 
  mkdir $olddot
  for file in $existfiles; do
    echo "Moving $file from $HOME to $olddot"
    mv ~/.$file $olddot/$file
  done
fi

for file in $myfiles; do
  echo "Creating symlinks in $HOME/.$file to $dotdir"
  ln -s $dotdir/$file .$file
done

printf "Symlinks complete!\n\n"

# git
#####
## using a local config file with 
## user data to keep name/address
## out of the git repo

read -p "Create a gitconfig_local file (y/n)?  " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then

if [ ! -f dotfiles/gitconfig_local ]; then
printf "\n************************\n"
printf "*create gitconfig_local*\n"
printf "************************\n"
printf "\nThe following information
will be signed to all git commits
made from this computer\n\n"
printf "First name: "
read first
printf "Last name: "
read last
printf "Email address: "
read email

cat > dotfiles/gitconfig_local << EOF
[user]
       name = $first $last
       email = $email
EOF
fi
printf "\ngitconfig_local created in $dotdir\n"
printf "Contents:\n"
cat dotfiles/gitconfig_local

fi
printf "\nDotfiles folder and symlinks created.\n
Use source ~/dotfiles/zshrc to load.\n\n"

if [ -d $olddot ]; then
  printf "Contents of $olddot\n"
  ls -a $olddot
fi
printf "Contents of $dotdir\n"
ls -a $dotdir
