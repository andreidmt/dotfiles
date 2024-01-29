```toml
id="5d73f4e6-38e4-4746-8fd6-59263471e9a3"
type="snippet"
tags=["linux", "shell", "arguments", "template"]
description="Shell script template with common practices"
created_at="2023-12-22T23:01:58+01:00"
```

```sh
#!/usr/bin/env sh

# -e: exit on error, -u: error on undefined variable
set -eu

. "$CORE_LIBS/die"

print_help() {
  command=$(basename "$0")

  cat <<EOF
NAME
  ${command} - Command short description

SYNOPSIS
  $(basename "$0") [-h|--help]

DESCRIPTION
  Command long description

OPTIONS
  -h, --help            Print this help message and exit
  -p, --prompt <prompt> Prompt to display before the options,
                        default: "Select an option:"

EXAMPLES
  ${command} -h

SEE ALSO
  command1(1), command2(1)
EOF
}

# Process command-line arguments
while [ "$#" -gt 0 ]; do
  case $1 in
    -h|--help)
      print_help
      exit 0
    ;;
    -t|--title)
      if [ "$2" ] && [ "${2#-}" = "$2" ]; then
        title=$2; shift
      else
        die 'ERROR: "--title" requires a non-empty option argument.'
      fi
    ;;
    --) shift; break ;;
    -?*) print_help >&2; die "ERROR: Unknown option: $1" ;;
    *) break ;;
  esac
  shift
done

command() {
  echo "$icon" "$title"
}

case "${1:-command}" in
  command) 
    command "${@:2}" 
  ;;
  *) 
    die "Command \"$1\" not recognized"
  ;;
esac
```
