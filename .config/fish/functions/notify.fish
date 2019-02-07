function notify -a title -a message -d "Doom guy dunst"
    notify-send -i ~/doomguy.png \
        -t 2000 \
        "$title" \
        "$message"
end
