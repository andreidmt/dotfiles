function screenshot -a cmd -d "Capture current screen content"
  set DIR "$HOME/Pictures/Screenshots"
  set NOW (date +"%Y-%B-%d-%A-%R:%S")
  set FILENAME "Screenshot_$NOW.png"

  # make sure folder exists
  mkdir -pv "$DIR"

  # capture screen and save it to file

  if test "$cmd" = "focused"
    scrot --focused "$FILENAME" -e "mv \$f $DIR"
  else 
    scrot "$FILENAME" -e "mv \$f $DIR"
  end

  notify "~> screenshot" "$DIR/$FILENAME"
end
