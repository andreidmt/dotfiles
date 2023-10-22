```toml
id="c0a4161c-f1b5-467b-bf00-980eea6fc940"
type="snippet"
tags=["linux", "bash"]
description="BASH script to check DNS propagation"
```

```bash
#!/bin/bash
set -euo pipefail

TIMEOUT_SECS=900
HOSTNAME="$1"

function get_now_time() {
    local now=$(date +%s)
    echo "$now"
}

function wait_for_dns_propagation() {
    local start_time=$(get_now_time)

    echo "Checking dns propagation every 5 seconds for $TIMEOUT_SECS seconds" 

    while ! nslookup $HOSTNAME >> /dev/null; do
        echo "Checking..."; 
        sleep 5;
        current_time=$(get_now_time)
        let "dt = ${current_time} - ${start_time}"
        if [[ $dt -ge $TIMEOUT_SECS ]]; then
            echo "Timeout reached."
            exit 1
        fi
    done

    echo "DNS propagated for $HOSTNAME"
}

wait_for_dns_propagation
```
