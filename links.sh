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
chkpath "$HOME/.config/shell"
linkcf "$(pwd)/.bashrc" "$HOME/.bashrc"
linkcf "$(pwd)/.config/shell/env_vars.sh" "$HOME/.config/shell/env_vars.sh"
linkcf "$(pwd)/.config/shell/aliases.sh" "$HOME/.config/shell/aliases.sh"
# Source env variables before linking other configs
source "$HOME/.config/shell/env_vars.sh"
source "$HOME/.config/shell/aliases.sh"
chkpath "$XDG_STATE_HOME/bash"

# mocp
chkpath "$XDG_CONFIG_HOME/moc"
linkcf "$(pwd)/.config/moc/config" "$XDG_CONFIG_HOME/moc/config"

# vim
chkpath "$XDG_CONFIG_HOME/vim"
chkpath "$XDG_CONFIG_HOME/vim/autoload"
chkpath "$XDG_DATA_HOME/vim"
linkcf "$(pwd)/.config/vim/vimrc" "$XDG_CONFIG_HOME/vim/vimrc"
linkcf "$(pwd)/.config/vim/autoload/plug.vim" "$XDG_CONFIG_HOME/vim/autoload/plug.vim"

# nvim
chkpath "$XDG_CONFIG_HOME/nvim"
chkpath "$XDG_CONFIG_HOME/nvim/autoload"
chkpath "$XDG_DATA_HOME/nvim"
linkcf "$(pwd)/.config/nvim/init.vim" "$XDG_CONFIG_HOME/nvim/init.vim"
linkcf "$(pwd)/.config/nvim/autoload/plug.vim" "$XDG_CONFIG_HOME/nvim/autoload/plug.vim"

# audacity
chkpath "$XDG_CONFIG_HOME/audacity"
chkpath "$XDG_DATA_HOME/audacity"

# fontconfig
chkpath "$XDG_CONFIG_HOME/fontconfig"

# npmrc
chkpath "$XDG_CONFIG_HOME/npm"
linkcf "$(pwd)/.config/npm/npmrc" "$NPM_CONFIG_USERCONFIG"

# .gitconfig
chkpath "$XDG_CONFIG_HOME/git"
linkcf "$(pwd)/.config/git/config" "$XDG_CONFIG_HOME/git/config"

# nvidia-setting
chkpath "$XDG_CONFIG_HOME/nvidia"

# pki
chkpath "$XDG_DATA_HOME/pki"

echo $'Finished linking process.'
