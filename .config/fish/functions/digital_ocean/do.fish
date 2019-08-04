function do -a cmd -a prop -a prop2 -d "~> DigitalOcean wrapper" 
    switch "$cmd"
        # List all available doclets
        case "ls"
          doctl compute droplet list -o json | jq 'map({id,name,ip_public:.networks.v4[0].ip_address,status,price:.size.price_monthly})'
        
        # SSH into instance
        case "connect"
          set JQ_SELECTOR "map(select(.name==\"$prop\"))[0].ip_public"
          set IP (do ls | jq -r "$JQ_SELECTOR")

          if test -n "$prop2"
            set USER $prop2 || "root"
          else
            set USER "root"
          end

          echo-head "Connecting to $USER@$IP"

          ssh $USER@$IP

        # Invalid
        case "*"
            echo "do: Invalid command \"$cmd\""
        end
end
