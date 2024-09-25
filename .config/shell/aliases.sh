# -----------------------------------------------------------------------------
# Aliases for XDG compliance 
# wget
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'

# yarn
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'

# moc
alias mocp='mocp -M "$XDG_CONFIG_HOME"/moc'

# nvidia-settings
alias nvidia-settings='nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings'

# mvn
alias mvn='mvn -gs "$XDG_CONFIG_HOME"/maven/settings.xml'
# -----------------------------------------------------------------------------