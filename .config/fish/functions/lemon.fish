function lemon -a cmd
    set -l screenWidth (xrandr --query | awk '/\<current\>/{print $8}')
    set -l barWidth (math $screenWidth-120)

    switch "$cmd"
        case "toggle"
            if lemonbar > /dev/null
                pkill -9 lemonbar
            else
                ~/scripts/lemon-content | lemonbar -p -f mono -B "#1d2021" -g (echo $barWidth)x40+60+10 -d &
            end
        case "*"
            pkill -9 lemonbar
            ~/scripts/lemon-content | lemonbar -p -f mono -B "#1d2021" -g (echo $barWidth)x40+60+10 -d &
    end
end

