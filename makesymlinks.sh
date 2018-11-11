#! /bin/bash

################
# This script creates symlinks from ~ to the dotfiles in ~/dotfiles.
################

#### Variables

dir=~/dotfiles   # dotfiles directory
olddir=~/dotfiles_old    # backup directory for old dotfiles
files="bash_profile emacs tmux.conf vimrc"    # list of dotfiles

####

# create olddir in ~
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo " ... done"

# change to the dotfiles directory
echo "changing to $dir"
cd $dir
echo " ... done"

# move any existing dotfiles in ~ to olddir, then create symlinks from ~ to the files in dir
for file in $files; do
	echo "Moving $file from ~ to $olddir"
	mv ~/.$file $olddir
	echo "Creating symlink to $file in home directory"
	ln -s $dir/$file ~/.$file
done
echo " ... done"

