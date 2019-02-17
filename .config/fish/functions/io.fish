function io -a cmd -a subcmd -d "~> IO" 
    switch "$cmd"
        case "ssh-add"
            if not pgrep -f ssh-agent > /dev/null
                echo "No running ssh-agent, starting one."
                eval (ssh-agent -c)
            end

            ssh-add ~/.ssh/github_t420
            ssh-add ~/.ssh/asd14__nginx--tiny-1
        case "wifi"
            switch "$subcmd"
                case "speed"
                    speedometer -r wlp3s0
                case "home"
                    sudo netctl start wifi-112357
                case "*"
                    sudo wifi-menu
            end
    end
end
