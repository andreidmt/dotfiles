function heads -a setup -d "~> Heads"
    # All connected display names
    set -l displayNames (xrandr -q | grep " connected" | awk '{print $1}')

    set -l choice (test -n "$setup"
        and echo $setup
        or echo $displayNames | tr ' ' '\n' | dmenu -i -p "Select display arangement:"
    )

    switch $choice
      case "LVDS1"
          xrandr \
            --output LVDS1 --primary \
            --scale 1.0x1.0 \
            --mode 1920x1080 --pos 0x0 --rotate normal --rate 60 \
            --output DP-1-1 --off

      case "DP-1-1"
          xrandr \
            --output LVDS1 --primary \
            --scale 1.0x1.0 \
            --mode 1920x1080 --pos 320x1440 --rotate normal \
            --output VGA1 --off \
            --output VIRTUAL1 --off \
            --output LVDS-1-2 --off \
            --output VGA-1-2 --off \
            --output DP-1-1 \
            --scale 1.0x1.0 \
            --mode 2560x1440 --pos 0x0 --rotate normal \
            --output DP-1-2 --off \
            --output DP-1-3 --off

          wall reload

      case "Manual"
          arandr

      case "*"
        notify "~> Multi-head" "Unknown setup \"$choice\""
    end
  
    # update wallpaper
    wall reload
end
