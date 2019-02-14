function vol -a cmd -d "~> Volume amixer wrapper" 
    switch "$cmd"
        case "toggle"
            amixer -q set Master toggle
        case "mute"
            amixer -q set Master mute
        case "up"
            amixer -q -D pulse sset Master 10%+
            set change "(+10%)"
        case "down"
            amixer -q -D pulse sset Master 10%-
            set change "(-10%)"
    end

    set volume (amixer get Master | grep -E 'Front Left:' | awk '{print $5}' | grep -Eo '\w{2,3}')
    set isMute (amixer get Master | grep -E 'Front Left:' | awk '{print $NF}' | grep -Eo '\w{2,3}')

    switch "$isMute"
        case "off"
            set info "mute" $volume"%"
        case "on"
            set info $volume"%"
    end

    if [ "$cmd" = "status" ]
        echo $info
    else
        notify "~> volume ($cmd)" "$info $change" &

        # update i3blocks if running 
        if pgrep -f i3blocks > /dev/null
            pkill -SIGRTMIN+10 i3blocks
        end
    end
end
