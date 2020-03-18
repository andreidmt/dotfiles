function io -a cmd -a subcmd -d "~> IO" 
    switch "$cmd"
        ##
        ## Start ssh-agent if not running, add keys so ssh knows what to use
        ##    
        case "ssh-add"
            if not pgrep -f ssh-agent > /dev/null
                echo "No running ssh-agent, starting one."
                eval (ssh-agent -c)
            end

            ssh-add ~/.ssh/github_t420
            ssh-add ~/.ssh/asd14__andreid
            ssh-add ~/.ssh/asd14__ci

        ##
        ## Proton VPN 
        ##
        case "vpn"
            echo-head "Connect to fastest VPN server"
            sudo pvpn -d
            sudo pvpn -f

            echo-head "VPN status"
            sudo pvpn --status

        ##
        ## Wifi interaction
        ##
        case "wifi"
            switch "$subcmd"
                # Wireless speed test
                case "speed"
                    speedometer -r wlp3s0

                # Connect to home network
                case "home"
                    sudo netctl start wifi-112357

                # Reset home connection

                case "reset"
                    sudo rfkill unblock all
                    sudo systemctl restart netctl@wifi\\x2d112357.service

                # Choose wifi network
                case "*"
                    sudo wifi-menu
            end
        
        case "*"
            notify "~> IO" "command \"$cmd\" is invalid"
    end

    # Update i3blocks 
    if pgrep -f i3blocks > /dev/null
        pkill -SIGRTMIN+12 i3blocks
    end
end
