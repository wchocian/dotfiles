# -----------------------------------------------------------------------------
# XDG compliant user directories
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_STATE_HOME=$HOME/.local/state
export XDG_DATA_HOME=$HOME/.local/share

[ ! -d $XDG_CONFIG_HOME ] && mkdir $XDG_CONFIG_HOME
[ ! -d $XDG_CACHE_HOME ] && mkdir $XDG_CACHE_HOME
[ ! -d $XDG_STATE_HOME ] && mkdir $XDG_STATE_HOME
[ ! -d $XDG_DATA_HOME ] && mkdir $XDG_DATA_HOME 

# less
export LESSHISTFILE=-

# zsh
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

# wget
export WGETRC="$XDG_CONFIG_HOME"/wgetrc

# ranger
export RANGER_LOAD_DEFAULT_RC=FALSE

# python
export PYTHON_HISTORY=$XDG_STATE_HOME/python/history

# wine
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default

# mplayer
export MPLAYER_HOME="$XDG_CONFIG_HOME"/mplayer

# texlive
export TEXMFHOME=$XDG_DATA_HOME/texmf
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var
export TEXMFCONFIG=$XDG_CONFIG_HOME/texlive/texmf-config

# platformio
export PLATFORMIO_CORE_DIR="$XDG_DATA_HOME"/platformio

# nv
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv

# npm
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc

# bash history
export HISTFILE="$XDG_STATE_HOME"/bash/history
[ ! -d $XDG_STATE_HOME/bash/ ] && mkdir $XDG_STATE_HOME/bash/ 
[ -f $HOME/.bash_history ] && mv $HOME/.bash_history $HISTFILE

# gnupg
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

# dotnet
export DOTNET_CLI_HOME="$XDG_DATA_HOME"/dotnet
[ ! -d $DOTNET_CLI_HOME ] && mkdir -p $DOTNET_CLI_HOME
[ -d $HOME/.dotnet ] && mv -T $HOME/.dotnet $DOTNET_CLI_HOME

# cursor
export CURSOR_CONFIG_DIR="$XDG_CONFIG_HOME"/cursor
[ ! -d $CURSOR_CONFIG_DIR ] && mkdir -p $CURSOR_CONFIG_DIR
[ -d $HOME/.cursor ] && mv -T $HOME/.cursor $CURSOR_CONFIG_DIR

# bundle
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle

#[ -d $HOME/.pki/ ] && mv -T $HOME/.pki/ "$XDG_DATA_HOME"/pki
[ -d $HOME/.icons/ ] && mv -T $HOME/.icons/ "$XDG_DATA_HOME"/icons

# gtk-2
[ ! -d "$XDG_CONFIG_HOME/gtk-2.0" ] && mkdir "$XDG_CONFIG_HOME/gtk-2.0"
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
[ -f "$HOME/.gtkrc-2.0" ] && mv "$HOME/.gtkrc-2.0" $GTK2_RC_FILES
# -----------------------------------------------------------------------------
# PATH

export PATH="$PATH:$HOME/.local/bin/"
export PATH="$PATH:$HOME/.local/bin/nvim-linux-x86_64/bin/"
export PATH="$PATH:$HOME/.local/bin/xdg-ninja/"

export MANPATH="$MANPATH:/usr/local/texlive/2025/texmf-dist/doc/man/"
export INFOPATH="$MANPATH:/usr/local/texlive/2025/texmf-dist/doc/info/"

# -----------------------------------------------------------------------------
# EDITORS

export EDITOR=nvim
export GIT_EDITOR=nvim
export VISUAL=cursor

# -----------------------------------------------------------------------------
# OTHER
export STM32_PRG_PATH=$HOME/STMicroelectronics/STM32Cube/STM32CubeProgrammer/bin
