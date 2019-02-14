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

    set volume (amixer get Capture | grep -E 'Front Left: Capture' | awk '{print $(NF-1)}' | grep -Eo '[0-9]{1,}')
    set is_mute (amixer get Capture | grep -E 'Front Left: Capture' | awk '{print $NF}' | grep -Eo '\w{2,3}')

    switch "$is_mute"
        case "off"
            set info $volume"%"
        case "on" 
            set info "mute" $volume"%"
    end

    if [ "$cmd" = "status" ]
        echo $info
    else
        notify "~> microphone ($cmd)" "$info $change"
    end

    # custom i3blocks response 
    if pgrep -f i3blocks > /dev/null
        pkill -SIGRTMIN+10 i3blocks
        if test $is_mute = "off"
            return 33
        end
    end
end
