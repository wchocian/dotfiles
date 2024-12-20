# -----------------------------------------------------------------------------
# XDG compliant user directories
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_STATE_HOME=$HOME/.local/state
export XDG_DATA_HOME=$HOME/.local/share

# less
export LESSHISTFILE=-

# zsh
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

# wget
export WGETRC="$XDG_CONFIG_HOME"/wgetrc

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

# gnupg
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

# dotnet
export DOTNET_CLI_HOME="$XDG_DATA_HOME"/dotnet

# bundle
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle

# git
export GIT_EDITOR=nvim

# -----------------------------------------------------------------------------