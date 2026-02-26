function fish_greeting
    # print ASCII text
    maybe_show_ascii

    fastfetch
    echo ""
    echo ""
end

function maybe_show_ascii
    # Only run in Kitty
    if not set -q KITTY_WINDOW_ID
        return
    end

    # Get terminal size
    set rows (tput lines)
    set cols (tput cols)

    # Heuristic: if very big, assume fullscreen
    if test $rows -ge 40 -a $cols -ge 120
        cat ~/.config/fish/ascii.txt
    end
end

function on_resize --on-signal SIGWINCH
    clear
    fastfetch
    echo ""
    echo ""
    echo ""
end
