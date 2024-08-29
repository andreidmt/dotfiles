```toml
id="340e18a4-7924-4fda-9eb7-be189fdb4ce6"
type="snippet"
tags=["linux", "bash"]
description="BASH template with argument parsing and validation input"
createdAt="2023-05-30T09:17:32+02:00"
```

```sh
#!/usr/bin/env sh

parse_arguments() {
  # :; is a no-op,
  while [ "$#" -gt 0 ]; do
    case $1 in
      -f|--folder)
        if [ "$2" ]; then
          FOLDER=$2; shift
        else
          echo 'ERROR: "-f|--folder" requires a non-empty option argument.' >&2
          exit 1
        fi
      ;;

      -s|--script)
        if [ "$2" ]; then
          SCRIPT=$2; shift
        else
          echo 'ERROR: "-s|--script" requires a non-empty option argument.' >&2
          exit 1
        fi
      ;;

      # Standalone "--" terminates argument processing
      --) shift; break ;;

      # Argument not recognized
      -?*)
        echo "Error: Unknown argument $1" >&2
        exit 1
      ;;

      # anything else, considered as non-option argument
      *) break ;;
    esac
    shift
  done
}

validate_input() {
  if [ -z "$FOLDER" ]; then
    echo "ERROR: -f|--folder is required"
    exit 1
  fi

  if [ -z "$SCRIPT" ]; then
    echo "ERROR: -s|--script is required"
    exit 1
  fi
}


##
## Main
##

parse_arguments "$@"
validate_input

while true; do
  find "$FOLDER" -type f -name '*.js' -o -type d \
    | entr -c -d sh -c "$SCRIPT || exit 0"
done
```
