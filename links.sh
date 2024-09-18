#!/bin/bash

# Set up symlinks for all config files
echo "Warning!"
echo "Script will replace your current config files."
echo "Do you wish to continue? (Y/N)"

read RESPONSE

case $RESPONSE in
"Y" | "YES" | "yes" | "y")
    echo 'Continuing...'
    ;;
"N" | "NO" | "no" | "n")
    echo 'Aborting...' && exit
    ;;
*)
    echo "Response not defined. Aborting..." && exit
    ;;
esac

[[ -f $HOME/.bashrc || -L $HOME/.bashrc ]] && rm $HOME/.bashrc
echo "Linking $(pwd)/.bashrc to $HOME/.bashrc"$'\n'
ln -s "$(pwd)/.bashrc" "$HOME/.bashrc"
[[ $? != 0 ]] && echo "Something went wrong."

echo $'Finished linking process.'