function mic -a cmd -d "~> Microfone amixer wrapper" 
    switch "$cmd"
        case "toggle"
            amixer -q -D pulse sset Capture toggle
        case "mute"
            amixer set Capture mute
        case "up"
            amixer -q -D pulse sset Capture 10%+
            set change "(+10%)"
        case "down"
            amixer -q -D pulse sset Capture 10%-
            set change "(-10%)"
    end

    set volume (amixer sget Capture | grep -E 'Front Left: Capture' | awk '{print $(NF-1)}' | grep -Eo '[0-9]{1,}')
    set isMute (amixer sget Capture | grep -E 'Front Left: Capture' | awk '{print $NF}' | grep -Eo '\w{2,3}')

    switch "$isMute"
        case "off"
            set info "Mic muted $volume%"
        case "on" 
            set info "Mic $volume%"
    end

    if [ "$cmd" = "status" ]
        echo $info
    else
        notify "~> microphone ($cmd)" "$info $change"
    end
end
