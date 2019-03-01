function notify -a title -a message -a icon -d "Doom guy dunst"
    if pgrep -f X > /dev/null
        notify-send -i ~/doomguy.png \
            -t 4000 \
            "$title" \
            "$message"
    else
        echo_head "$title"
    end
end
