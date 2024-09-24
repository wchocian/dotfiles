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
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'

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

# yarn
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'

# moc
alias mocp='mocp -M "$XDG_CONFIG_HOME"/moc'
# -----------------------------------------------------------------------------