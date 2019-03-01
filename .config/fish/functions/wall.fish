function wall -a path -d "Set file as wallpaper"    
    set resolution (xrandr | fgrep '*' | awk '{print $1}')

    # scale & crop
    convert "$path" -resize "$resolution^" -gravity center -crop "$resolution+0+0" ~/wall.png
    
    # set as wallpaper
    feh --bg-center "$HOME/wall.png"

    notify "Wallpaper changed" "$path" "$HOME/wall.png"
end
