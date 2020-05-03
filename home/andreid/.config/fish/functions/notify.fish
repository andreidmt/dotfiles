function notify -a title -a message -a icon -d "Doom guy dunst"
    if pgrep -f X > /dev/null
        echo "$title:" $message
 
        if ! test -n "$icon"
            set icon ~/doomguy.png
        end
        
        notify-send -i $icon -t 5000 "$title" "$message"
    else
        echo_head "$title"
    end
end
