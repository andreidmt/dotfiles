function wall -a path -d "~> Set file as wallpaper"    
    set resolution (xrandr | fgrep '*' | awk '{print $1}')

    notify "~> wall" "Converting image to $resolution" $path

    # scale & crop
    convert "$path" -resize "$resolution^" -gravity center -crop "$resolution+0+0" ~/wall.png
   
    # set as wallpaper
    feh --bg-center "$HOME/wall.png"

    notify "~> wall" "Wallpaper changed to $path" "$HOME/wall.png"
end
