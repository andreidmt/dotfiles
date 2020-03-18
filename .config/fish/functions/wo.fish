function wo -a name -d "~> Switch to Work project folder"
    set project_path "$HOME/Work/$name"

    if ! test -d "$project_path" 
        notify "~> Work" "Project folder \"$name\" does not exist"
        return 1
    end

    clear
    cd $project_path
    lsa
end
