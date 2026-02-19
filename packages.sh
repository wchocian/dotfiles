#!/bin/bash
#
# Install all application
#
# Author: Wiktor Chocianowicz

#APT_PACKAGES="curl code dos2unix feh gimp graphviz inkscape libreoffice-base\
    #libreoffice-calc neofetch openjdk-17-jdk-headless openjdk-19-jdk ranger \
    #speedtest sysbench terminator texlive tree wine zerotier-one unrar zip\
    #yt-dlp vlc sed perl ffmpeg imagemagick openjdk-8-jre fzf \
    #"
APT_PACKAGES="curl fish info manpages glow jq stow qbittorrent\
    git kicad ranger terminator vlc hwinfo texlive-full hplip\
    inkscape filelight fzf lazygit"

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
echo "$APT_PACKAGES"
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
which apt-get && 
    sudo apt update &&
    sudo apt-get install $APT_PACKAGES -y &&
    sudo apt-get autoremove &&
    sudo apt-get clean

# which pacman

[[ ! -d $HOME/.local/bin/ ]] && mkdir -p $HOME/.local/bin/

# nvim
if ! which nvim > /dev/null 2>&1; then
    echo "----------- Installing neovim -----------"
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
    sudo rm -rf $HOME/.local/bin/nvim-linux-x86_64
    sudo tar -C $HOME/.local/bin -xzf nvim-linux-x86_64.tar.gz
    sudo rm -r nvim-linux-x86_64.tar.gz
fi

# brave
if ! which brave-browser > /dev/null 2>&1; then
    echo "----------- Installing brave -----------"
    curl -fsS https://dl.brave.com/install.sh | sh
fi

# kicad
# todo
#if ! which kicad* > /dev/null 2>&1; then
    #echo "----------- Installing kicad -----------"
    #wget https://downloads.kicad.org/kicad/linux/explore/stable/download/kicad-10.0.0-rc1-x86_64.AppImage
    #chmod u+x kicad-10.0.0-rc1-x86_64.AppImage
    #mv kicad-10.0.0-rc1-x86_64.AppImage $HOME/.local/bin/
#fi

# multimc
if [ ! -d /opt/multimc ]; then
    echo "----------- Installing multimc -----------"
    curl -s 'https://multimc.org/#Download' | grep -o 'https.*\.deb' | xargs curl -fsSO
    sudo dpkg -i multimc*.deb
    rm multimc*.deb
fi

# discord
if ! which discord > /dev/null 2>&1; then 
    echo "----------- Installing multimc -----------"
    curl -fsSO 'https://discord.com/api/download?platform=linux&amp;format=deb'
    sudo dpkg -i discord*.deb
    rm discord*.deb
fi

echo $'Finished installing packages.'
