#!/usr/bin/sh

##
## List all Note titles with type meta and path
##

home="$HOME/Notes/src"
notePaths=$(rg --files "$home" | rg .md | sort -r)

for path in $notePaths
do
  title=$(rg "^# " --max-count 1 "$path" | sed -e "s/# //g")
  type=$(cat "$path" \
    | sed -n '/^```toml/,/^```/ p' \
    | grep TYPE \
    | awk -F'[ ="]+' '{ print tolower($2) }'
  )

  if [ -z "$type" ]; then
    printf "%s\n<small>%s</small>|" "${title:-'--'}" "$path"
else
    printf "[%s] %s\n<small>%s</small>|" "$type" "${title:-'--'}" "$path"
  fi
done
