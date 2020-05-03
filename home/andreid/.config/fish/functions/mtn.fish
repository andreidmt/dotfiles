function mtn -a cmd "~> Mutant" 
    switch "$cmd"
        case "start"
          i3-sensible-terminal fish -c "do connect db1 root 8080:localhost:8080" & 
          i3-sensible-terminal fish -c "do connect db1 root 28015:localhost:28015" &
          i3-sensible-terminal fish -c "wo mutant-api && npm run watch" &
          i3-sensible-terminal fish -c "wo mutant-api && npm run watch:socket" &
          i3-sensible-terminal fish -c "wo mutant-api && npm run watch:changes" &

          disown (jobs -p)

        case "*"
          notify "~> Mutant" "Command \"$cmd\" is invalid"
    end
end
