function vol -a cmd -d "~> Volume amixer wrapper" 
    switch "$cmd"
        case "toggle"
            amixer -q -D pulse sset Master toggle
        case "mute"
            amixer -q -D pulse sset Master mute
        case "up"
            amixer -q -D pulse sset Master 10%+
            set change "(+10%)"
        case "down"
            amixer -q -D pulse sset Master 10%-
            set change "(-10%)"
    end

    set volume (amixer sget Master | grep -E 'Front Left: Playback' | awk '{print $(NF-1)}' | grep -Eo '[0-9]{1,}')
    set isMute (amixer sget Master | grep -E 'Front Left: Playback' | awk '{print $NF}' | grep -Eo '\w{2,3}')

    switch "$isMute"
        case "off"
            set info "Vol muted $volume%"
        case "on" 
            set info "Vol $volume%"
    end

    if [ "$cmd" = "status" ]
        echo $info
    else
        notify "~> volume ($cmd)" "$info $change"
    end
end
