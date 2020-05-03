function wall -a cmd -a path -d "~> Set file as wallpaper"    
    switch $cmd
        case "reload"
            feh --no-fehbg --bg-scale "$HOME/wall.png"

        case "set"
            # set -l resolution (xrandr | fgrep '*' | awk '{print $1}')
            set -l resolution "2560x1440"

            notify "~> wall" "Converting image to $resolution" $path

            # scale & crop
            convert "$path" \
              -resize "$resolution^" \
              -gravity center \
              -crop "$resolution+0+0" \
              ~/wall.png
           
            # set wallpaper
            feh --no-fehbg --bg-scale "$HOME/wall.png"

            notify "~> wall" "Wallpaper changed to $path" "$HOME/wall.png"
    end
end
