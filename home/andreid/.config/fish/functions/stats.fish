function stats -a cmd -d "~> i3blocks stats"
  switch "$cmd"
    ##
    ## Public IP
    ##
    case "ip"
      curl http://ipv4.icanhazip.com

    ##
    ## Wireless network name and strength
    ##
    case "wifi"
      set -l name (wpa_cli status | grep "^ssid" | awk '{split($0,a,"="); print a[2]}')
      set -l strength (cat /proc/net/wireless | awk 'NR==3 {print $3 "00%"}')
      set -l key_type (wpa_cli status | grep "^key_mgmt" | awk '{split($0,a,"="); print a[2]}')

      echo $name $key_type $strength
    
    ##
    ## Top proceses by cpu usage
    ##	
    case "cpu"
      ps axch -o cmd:15,pid:10,%cpu --sort=-%cpu | head

    ##
    ## CPU temperature
    ##
    case "cpu-temp"
      set -l temp (acpi -t | awk '{print $4 }')
      set -l fanLevel (grep 'level:' /proc/acpi/ibm/fan | awk '{print $2}')
      
      echo " $temp°C |  $fanLevel "
      
      # i3blocks red
      if test $temp -gt 72
        return 33
      end

    ##
    ## GHz speed for each core
    ##
    case "cpu-speeds"
      set -l coreSpeeds (grep -e "cpu MHz" /proc/cpuinfo | awk '{print $4}' | numfmt --padding=4 --from-unit=M --to=si | sed "s/G//" | tr '\n' ' ')

      echo "$coreSpeeds(GHz)"

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
      if test $package_count -gt 0
        return 33
      end

    ##
    ## Memory user / memory available
    ##
    case "memory"
      set -l memory (free -h | awk '/^Mem:/ {print $3 "/" $2}')

      echo " $memory"

    ##
    ## Battery percent state and time left till empty or full (if charging)
    ##
    case "battery"
      for battery in /sys/class/power_supply/BAT?
        set -l bstatus (cat $battery/status)
        set -l bcharge (cat $battery/capacity)
        set -l bwattage (cat /sys/class/power_supply/BAT0/power_now | \
          numfmt --from-unit=1 --to=si | \
          sed "s/M/W/")

        echo "$bstatus $bcharge% |  $bwattage " | sed "s/Charging//; s/Discharging//; s/Full//"

        # i3blocks red
        if test $bcharge -lt 10
          return 33
        end
      end

    case "*"
      notify "~> i3blocks stats" "command \"$cmd\" is invalid"
  end
end
