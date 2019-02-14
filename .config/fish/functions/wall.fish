function wall -a file_path -d "Set file as wallpaper"    
    set resolution (xrandr | fgrep '*' | awk '{print $1}')

    # scale & crop
    convert "$file_path" -resize $resolution -gravity center -crop $resolution+0+0 +repage ~/wall.png
    
    # set as wallpaper
    feh --bg-center "$HOME/wall.png"

    notify "Wallpaper changed" "$file_path" "$HOME/wall.png"
end
