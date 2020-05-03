function view -a file -d "~> Open file base on extension" 
    switch $file
      case "*.mkv" "*.mp4"
        mpv $file --keep-open=yes

      case "*.png" "*.jpg" "*.jpeg" "*.gif" "*.bmp"
        sxiv $argv

      case "*"
        notify "~> view" "Cant open $file"
    end
end
