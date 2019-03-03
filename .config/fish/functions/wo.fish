function wo -a name -d "~> Switch to work-own project folder"
    set project_path "$HOME/work-own/$name"

    if ! test -d "$project_path" 
        notify "~> work-own" "Project folder \"$name\" does not exist"
        return 1
    end

    clear
    cd $project_path
    lsa
end
