function stats -a cmd -d "~> i3blocks stats"
    switch "$cmd"
        case "cpu-temp"
            set temp (acpi -t | awk '{print $4 }')
            set usage (mpstat 1 1 | awk '$3 ~ /CPU/ { for(i=1;i<=NF;i++) { if ($i ~ /%idle/) field=i } } $3 ~ /all/ { printf("%d",100 - $field) }')

            echo $usage $temp"°C"
            
            # custom i3blocks response 
            if pgrep -f i3blocks > /dev/null
                if test $temp -gt 60
                    return 33
                end
            end
        case "memory"
            awk '
            /^MemTotal:/ {
                mem_total=$2
            }
            /^MemFree:/ {
                mem_free=$2
            }
            /^Buffers:/ {
                mem_free+=$2
            }
            /^Cached:/ {
                mem_free+=$2
            }
            END {
                printf("%.2fG/%.2fG\n", (mem_total - mem_free)/1024/1024, mem_total/1024/1024)
            }' /proc/meminfo
        case "battery"
            set charge (acpi -b | awk '{print $4}' | sed 's/[^0-9.]*//g')
            set bstatus (acpi -b | awk '{print $3}')
            set time (acpi -b | awk '{print $5}')

            echo $charge"%" $time

            # custom i3blocks response 
            if pgrep -f i3blocks > /dev/null
                if test \( $bstatus = "Discharging," \) -a \( $charge -lt 20 \)
                    return 33
                end
            end
    end
end
