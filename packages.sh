#!/bin/bash
#
# Install all application
#
# Author: Wiktor Chocianowicz

APT_PACKAGES="curl screen adb biber brave-browser code dos2unix feh flatpak gimp graphviz htop inkscape libreoffice-base libreoffice-calc logisim neofetch openjdk-17-jdk-headless openjdk-19-jdk ranger speedtest sysbench terminator texlive tree virtualbox wine zerotier-one unrar"

#######################################
# Echo to stderr.
# Arguments:
#   1. Message to be printed.
#######################################
sterr() {
    echo -e "[$(date +'%d-%m-%Y %H:%M:%S%z')] \033[0;31m[error]\033[0m: $*" >&2
    exit 1
}

echo "Warning!"
echo "Script will install following packages:"
echo "$APT_PACKAGES $BREW_PACKAGES"
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

# apt
which apt-get && sudo apt-get install $APT_PACKAGES 


echo $'Finished installing packages.'
