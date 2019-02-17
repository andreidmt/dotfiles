function notify -a title -a message -a icon -d "Doom guy dunst"

    # set -l options (fish_opt --short=t --long=title) 
    # set options $options (fish_opt --short=m --long=message)
    # argparse $options -- $argv

    if pgrep -f X > /dev/null
        notify-send -i ~/doomguy.png \
            -t 3000 \
            "$title" \
            "$message"
    else
        echo_head "$title"
    end
end
