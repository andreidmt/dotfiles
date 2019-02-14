function io -a cmd -a subcmd -d "~> IO" 
    switch "$cmd"
        case "ssh-start"
            eval (ssh-agent -c)
        case "ssh-add"
            ssh-add ~/.ssh/github_t420
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
