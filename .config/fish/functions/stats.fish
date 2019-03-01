function stats -a cmd -d "~> i3blocks stats"
    switch "$cmd"
        ##
        ## Wireless network name and strength
        ##
        case "wifi"
            set name (wpa_cli status | grep "^ssid" | awk '{split($0,a,"="); print a[2]}')
            set strength (cat /proc/net/wireless | awk 'NR==3 {print $3 "00%"}')
            set key_type (wpa_cli status | grep "^key_mgmt" | awk '{split($0,a,"="); print a[2]}')

            echo $name $key_type $strength
        
        ##
        ## Top proceses by cpu usage
        ##	
        case "cpu"
        	ps axch -o cmd:15,pid:10,%cpu --sort=-%cpu | head
		
        ##
        ## Top processes by mem usage
        ##
        case "mem"
			ps axch -o cmd:15,pid:10,%mem --sort=-%mem | head
        
        ##
        ## How many packages waiting for update
	    ##	
        case "pacman"
            set package_count (pacman -Qu | wc | awk '{print $1}')

            echo "$package_count packages"

            # i3blocks red 
            if pgrep -f i3blocks > /dev/null
                if test $package_count -gt 0
                    return 33
                end
            end

        ##
        ## CPU temperature
        ##
        case "cpu-temp"
            set temp (acpi -t | awk '{print $4 }')
            
            echo $temp"°C"
            
            # i3blocks red
            if pgrep -f i3blocks > /dev/null
                if test $temp -gt 65
                    return 33
                end
            end

		##
        ## Memory user / memory available
        ##
        case "memory"
            free -h | awk '/^Mem:/ {print $3 "/" $2}'

		##
        ## Battery percent state and time left till empty or full (if charging)
        ##    
        case "battery"
            set charge (acpi -b | awk '{print $4}' | sed 's/[^0-9.]*//g')
            set bstatus (acpi -b | awk '{print $3}')
            set time (acpi -b | awk '{print $5}')

            echo $charge"%" $time

            # i3blocks red 
            if pgrep -f i3blocks > /dev/null
                if test \( $bstatus = "Discharging," \) -a \( $charge -lt 10 \)
                    return 33
                end
            end

        case "*"
            notify "~> i3blocks stats" "command \"$cmd\" is invalid"
    end
end
