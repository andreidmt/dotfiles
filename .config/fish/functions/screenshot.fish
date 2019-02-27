function screenshot -d "Capture current screen content"
  set DIR "$HOME/Pictures/Screenshots"
  set NOW (date +"%Y-%B-%d-%A-%R:%S")
  set FILENAME "Screenshot_$NOW.png"

  # make sure folder exists
  mkdir -pv "$DIR"

  # capture screen and save it to file
  scrot "$FILENAME" -e "mv \$f $DIR"

  notify "~> screenshot" "$DIR/$FILENAME"
end
