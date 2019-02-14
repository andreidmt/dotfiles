function service -a cmd -a name -d "systemctl wrapper"
    switch "$cmd"
        case "ls"
            systemctl --type=service --no-pager
        case "enable"
            systemctl enable "$name.service"
    end
end
