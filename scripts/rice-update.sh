#!/bin/sh

#
# This script pushes changes in certain config files to the GitHub repo for my rice
# It should be placed in ~/.bin so it can be run from anywhere
#

# Easily accessible file paths
REPO="$HOME/Documents/repos/bspwm-rice"
REPO_CONFIG="$REPO/.config"
HOME_CONFIG="$HOME/.config"

# Try to get commit message from commandline args
while getopts "m:" opt; do
	case $opt in
		m)
			COMMIT_MESSAGE=$OPTARG
			;;
	esac
done

# Copy config files for...

# bspwm
cp -r $HOME_CONFIG/bspwm $REPO_CONFIG/
# sxhkd
cp -r $HOME_CONFIG/sxhkd $REPO_CONFIG/
# polybar
cp -r $HOME_CONFIG/polybar $REPO_CONFIG/
# kitty
cp -r $HOME_CONFIG/kitty $REPO_CONFIG/
# dunst
cp -r $HOME_CONFIG/dunst $REPO_CONFIG/
# compton
cp $HOME_CONFIG/compton.conf $REPO_CONFIG/

# Copy additional configuration files not found in .config...

# vim
cp $HOME/.vimrc $REPO/
# zsh
cp $HOME/.zshrc $REPO/

# Copy wallpapers
cp -r $HOME/Pictures/wallpapers $REPO/ 

# Push the changes to GitHub
cd $REPO
git add .
# Commit using the commit message from commandline args if it exists
[ ! -z "$COMMIT_MESSAGE" ] && git commit -m "$COMMIT_MESSAGE" || git commit
git push
