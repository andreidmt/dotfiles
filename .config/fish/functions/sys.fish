function sys -a cmd prop -d "~> System operations"
    switch "$cmd"
        ##
        ## Generate new private/public key pair
        ##
        case "newkey"
				  ssh-keygen -m pem -t rsa -b 4096 -C "andrei@mutant.love"	

        ##
        ## Run sxiv on all images in folder
        ##    
        case "wall"
            set wall_folder (test $prop && echo $prop || echo "Future")
            set wall_path "$HOME/work-luke/wallpapers/$wall_folder"

            if test -d "$wall_path" 
                sxiv "$wall_path"
            else
                notify "~> sys" "Wallpaper \"$wall_folder\" folder does not exist"
            end

        ##
        ## Update package database
        ##    
        case "update"
            sudo pacman -Syy --noconfirm && \
                notify "~> sys" "Package database updated"

        ##
        ## Update packages 
        ##    
        case "upgrade"
            notify "~> sys" "Starting system upgrade, fingers crossed" && \
                neofetch && \
                sudo pacman -Syyuv --noconfirm && \
                notify "~> sys" "Packages updated"

        ##
        ## Maintenance check and package cleanup
        ##    
        case "check"
            echo-head "Failed systemd services"
            sudo systemctl --failed

            echo-head "Errors in logfiles"
            sudo journalctl -p 3 -xb --no-pager

            echo-head "Removing orphan packages"
            sudo pacman -Rns (pacman -Qtdq)

            echo-head "Clear pacman cache"
            sudo paccache -r && paccache -ruk0

        ##
        ## Reload fish and X settings
        ##
        case "reload"
            notify "~sys" "Reloading Fish, X and i3"

            source ~/.config/fish/config.fish
            xrdb ~/.Xresources
            i3-msg reload

        ##
        ## Lock screen
        ##
        case "lock"
            i3lock -i "$HOME/wall.png" -n -b

        case "*"
            notify "~> sys" "command \"$cmd\" is invalid"
            return 1
    end

    # update i3blocks 
    if pgrep -f i3blocks > /dev/null
        pkill -SIGRTMIN+11 i3blocks
    end
end
