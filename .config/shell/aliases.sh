# -----------------------------------------------------------------------------
# Aliases for XDG compliance 
#
# wget
[ -f  $HOME/.wget-hsts ] && mv $HOME/.wget-hsts $XDG_CACHE_HOME/wget-hsts
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'

# yarn
[ ! -d $XDG_CONFIG_HOME/yarn/ ] && mkdir $XDG_CONFIG_HOME/yarn/
[ -f  $HOME/.yarnrc ] && mv $HOME/.yarnrc $XDG_CONFIG_HOME/config
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'

# moc
alias mocp='mocp -M "$XDG_CONFIG_HOME"/moc'

# nvidia-settings
alias nvidia-settings='nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings'

# mvn
alias mvn='mvn -gs "$XDG_CONFIG_HOME"/maven/settings.xml'
# -----------------------------------------------------------------------------


# -----------------------------------------------------------------------------
# Convienience aliases
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -AlF'
alias la='ls -A'
alias l='ls -CF'
alias lg='lazygit'
alias sserver='ssh -X wchocian@lab09011.elka.pw.edu.pl'
alias apply='python3 $HOME/GIT/imedit/filters.py'
alias evince='evince >/tmp/null 2>&1'
alias open='open >/tmp/null 2>&1'
alias generate='python3 $HOME/Code/DALL-E/dall-e.py'
alias startserver='cd /home/wchocian/Saves/Beta_1.7.3_server/SERVER_SCRIPTS; ./start-server-scripts.sh'
alias stopserver='cd /home/wchocian/Saves/Beta_1.7.3_server/SERVER_SCRIPTS; ./stop-server.sh'
alias fconf='nvim $HOME/.config/fish/config.fish'
alias bconf='nvim $HOME/.config/bspwm/bspwmrc'
alias sconf='nvim $HOME/.config/sxhkd/sxhkdrc'
alias pconf='nvim $HOME/.config/polybar/config'
alias nconf='nvim $HOME/.config/nvim/init.vim'
alias todo='nvim $HOME/Documents/todolist.md'
alias ls='ls --color=auto'
alias tree='tree -C'
alias upt='sudo apt-get update &&\
    sudo apt-get upgrade -y --fix-missing;\
    sudo apt-get autoremove -y\
    sudo apt-get clean'

alias fzf='fzf --bind "enter:execute(open {} >/tmp/null 2>&1 &; disown)"'
