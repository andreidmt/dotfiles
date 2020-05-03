function mic -a cmd -d "~> Microfone amixer wrapper" 
    switch "$cmd"
        case "toggle"
            amixer -q set Capture toggle
        case "mute"
            amixer -q set Capture mute
        case "up"
            amixer -q set Capture 10%+
            set -l change "(+10%)"
        case "down"
            amixer -q set Capture 10%-
            set -l change "(-10%)"
    end

    set volume (amixer get Capture | grep -E 'Front Left:' | awk '{print $(NF-1)}' | grep -Eo '[0-9]{1,}')
    set _status  (amixer get Capture | grep -E 'Front Left:' | awk '{print $NF}' | grep -Eo '\w{2,3}')

    switch "$_status"
        case "on"
            set info $volume"%"
        case "off" 
            set info "mute" $volume"%"
    end

    if [ "$cmd" = "status" ]
        echo $info
    else
        notify "~> microphone" "$info $change"
    end

    # i3blocks red 
    if pgrep -f i3blocks > /dev/null
        pkill -SIGRTMIN+10 i3blocks
        if test $_status = "on"
            return 33
        end
    end
end
