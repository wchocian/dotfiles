if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

	#function fish_prompt -d "Write out the prompt"
	#	printf '%s%s%s (%s)%s> ' (set_color "#2fbbf2") (prompt_pwd) \
	#		(set_color "#148ebe") (git branch --show-current) \
	#		(set_color normal)
	#end

	# set -a PATH '/usr/bin'
	# set -a PATH '/usr/sbin'
	# set -a PATH '/snap/bin'
	# set -a PATH '/home/wchocian/bin'
	# set -a PATH '/usr/local/bin'
    # set -a PATH '/home/wchocian/bin/ghdl-gha-ubuntu-22.04-gcc/bin'
	# set -a PATH '/home/wchocian/.local/sbin'
	# set -a PATH '/home/wchocian/.local/bin'
    # set -a PATH '/home/wchocian/.local/bin/arm-gnu-toolchain-14.3.rel1-x86_64-arm-none-eabi/bin'
    # set -a PATH '/home/wchocian/.local/bin/ghdl-gha-ubuntu-22.04-gcc/bin/'
    # set -a PATH '/usr/local/texlive/2025/bin/x86_64-linux/'

    set -a MANPATH '/usr/local/texlive/2025/texmf-dist/doc/man/'
   
    set -a INFOPATH '/usr/local/texlive/2025/texmf-dist/doc/info/'
	
    export EDITOR='nvim'
	export RANGER_LOAD_DEFAULT_RC=FALSE
	
	source /home/wchocian/.config/fish/fish_aliases.fish
    source "$HOME/.config/shell/env_vars.sh"
    source "$HOME/.config/shell/aliases.sh"

    which fzf > /dev/null 2>&1 &&
        fzf --fish | source

    # Homebrew
    if test -e /home/linuxbrew/.linuxbrew/bin/brew
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    end

    # Source - https://superuser.com/a
    # Posted by glenn jackman, modified by community. See post 'Timeline' for change history
    # Retrieved 2026-01-20, License - CC BY-SA 4.0

    function bind_bang
        switch (commandline -t)[-1]
            case "!"
                commandline -t -- $history[1]
                commandline -f repaint
            case "*"
                commandline -i !
        end
    end

    function bind_dollar
        switch (commandline -t)[-1]
            case "!"
                commandline -f backward-delete-char history-token-search-backward
            case "*"
                commandline -i '$'
        end
    end

    function fish_user_key_bindings
        bind ! bind_bang
        bind '$' bind_dollar
    end

end
