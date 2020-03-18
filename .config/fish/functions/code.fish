function code -a cmd -a subcmd -d "~> CODE" 
    switch "$cmd"
        ##
        ## Show number of files and lines for list of extensions
        ##    
        case "stats"
          set current_dir (pwd) 
          set extensions (string split , $subcmd)
          set filesTotal 0
          set linesTotal 0
          set output ""

          echo-head "Looking inside \"$current_dir\", respecting .gitignore"

          for ext in $extensions
            set files (git ls-files | grep "\.$ext\$")
            set filesCount (echo $files | tr " " \\n | wc -l)
            set linesCount (echo $files | tr " " \\n | xargs wc -l | tail -1 | awk '{print $1}')
   
            set filesTotal (math "$filesTotal+$filesCount")
            set linesTotal (math "$linesTotal+$linesCount")

            set output "$output \n $ext $filesCount $linesCount"
          end

          set header "Extension Files  Lines\n--- --- ---"
          echo -e "$header \n $output \n --- --- --- \n Total $filesTotal $linesTotal" | column -t

        case "*"
            notify "~> CODE" "Command \"$cmd\" is invalid, expected one of [\"stats\"]"
    end
end
