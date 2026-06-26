function fish_greeting
    

    echo -ne '\x1b[38;5;16m'  # Set colour to primary
    maybe_show_ascii
    
end

function maybe_show_ascii
    # Only run in Kitty
    if not set -q KITTY_WINDOW_ID
        return
    end
    if playerctl status 2>/dev/null | string match -q "Playing"
        kitten icat --place 40x20@100x0 ~/Pictures/Wallpapers/quby.gif
    else
        kitten icat --place 20x40@110x0 --loop 1 ~/Pictures/Wallpapers/cutequby.gif

    end
    # Get terminal size
    set rows (tput lines)
    set cols (tput cols)

    # Heuristic: if very big, assume fullscreen
    if test $rows -ge 40 -a $cols -ge 120
        cat ~/.config/fish/ascii.txt
        set_color normal
        fastfetch --logo-padding-top 1 --logo-padding-right 5 --logo-padding-left 5 --logo-width 17
    
    else
        fastfetch -c /home/kashi/.config/fastfetch/caelestia-config.jsonc 
    end
    
end

function on_resize --on-signal SIGWINCH
    clear
    fastfetch -c /home/kashi/.config/fastfetch/caelestia-config.jsonc 
end