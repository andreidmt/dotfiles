function do -a cmd -a name -a user -a tunnel -d "~> DigitalOcean wrapper" 
    switch "$cmd"
        # List all available doclets
        case "ls"
          doctl compute droplet list -o json | jq 'map({id,name,ip_public:.networks.v4[0].ip_address,status,price:.size.price_monthly})'
        
        # SSH into user
        case "connect"
          set JQ_SELECTOR "map(select(.name==\"$name\"))[0].ip_public"
          set IP (do ls | jq -r "$JQ_SELECTOR")

          if test -n "$user"
            set USER $user || "root"
          else
            set USER "root"
          end

          echo-head "Connecting to $USER@$IP"

          if test -n "$tunnel"
            echo-head "ssh -L $tunnel $USER@$IP"
            ssh -L $tunnel $USER@$IP
          else
            echo-head "ssh $USER@$IP"
            ssh $USER@$IP
          end

        # Invalid
        case "*"
            echo "do: Invalid command \"$cmd\""
        end
end
