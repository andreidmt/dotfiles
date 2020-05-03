function unarchive -a file -d "~> Extract archive based on extension" 
    switch $file
      case "*.tar.gz"
        set -l folder (basename $file .tar.gz)

        mkdir $folder
        tar -xzf $file -C $folder

      case "*.tgz"
        set -l folder (basename $file .tgz)

        mkdir $folder
        tar -xzf $file -C $folder

      case "*"
        notify "~> unarchive" "Unknown format $file"
    end
end
