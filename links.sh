#!/bin/bash
#
# Set up symlinks for all config files
#
# Author: Wiktor Chocianowicz

#######################################
# Echo to stderr.
# Arguments:
#   1. Message to be printed.
#######################################
sterr() {
    echo -e "[$(date +'%d-%m-%Y %H:%M:%S%z')] \033[0;31m[error]\033[0m: $*" >&2
    exit 1
}

#######################################
# Link config files.
#
# Arguments:
#   1. Dotfile directory file.
#   2. Home directory path.
#######################################
linkcf() {
    echo "Linking $1 to $2"$'\n'
    ln -sf "$1" "$2"
    [[ $? != 0 ]] && sterr "Something went wrong while linking $1 to $2."
}

#######################################
# Check if path exists. If path
# does not exist, create it.
#
# Arguments:
#   1. Path to be checked.
#######################################
chkpath() {
    [[ ! -d $1 ]] &&
        echo "Directory $1 does not exist. Creating one..."$'\n' &&
        mkdir -p $1
}

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
    sterr "Response not defined. Aborting..."
    ;;
esac

# .bashrc
linkcf "$(pwd)/.bashrc" "$HOME/.bashrc"

# Source changed .bashrc before linking other configs
source "$HOME/.bashrc"
chkpath "$XDG_STATE_HOME/bash"

# mocp
chkpath "$XDG_CONFIG_HOME/moc"
linkcf "$(pwd)/.config/moc/config" "$XDG_CONFIG_HOME/moc/config"

# vim
chkpath "$XDG_CONFIG_HOME/vim"
linkcf "$(pwd)/.config/vim/vimrc" "$XDG_CONFIG_HOME/vim/vimrc"

# audacity
chkpath "$XDG_CONFIG_HOME/audacity"
chkpath "$XDG_DATA_HOME/audacity"

# fontconfig
chkpath "$XDG_CONFIG_HOME/fontconfig"

# npmrc
chkpath "$XDG_CONFIG_HOME/npm"
linkcf "$(pwd)/npmrc" "$NPM_CONFIG_USERCONFIG"

# .gitconfig
chkpath "$XDG_CONFIG_HOME/git"
linkcf "$(pwd)/.config/git/config" "$XDG_CONFIG_HOME/git/config"

echo $'Finished linking process.'
