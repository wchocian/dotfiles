if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting
    fish_config theme choose Dracula\ Official
	#function fish_prompt -d "Write out the prompt"
	#	printf '%s%s%s (%s)%s> ' (set_color "#2fbbf2") (prompt_pwd) \
	#		(set_color "#148ebe") (git branch --show-current) \
	#		(set_color normal)
	#end

	source /home/wchocian/.config/fish/fish_aliases.fish
    source "$HOME/.config/shell/env_vars.sh"
    source "$HOME/.config/shell/aliases.sh"

    which fzf > /dev/null 2>&1 &&
        fzf --fish | source


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
    date "+%d-%m-%y %H:%M"
end
