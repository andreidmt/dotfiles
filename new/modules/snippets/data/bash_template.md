```toml
id="5d73f4e6-38e4-4746-8fd6-59263471e9a3"
type="snippet"
tags=["linux", "bash"]
description="BASH script template with common practices"
```

```bash
#!/usr/bin/env sh

set -eu
set -o pipefail

. "$LIBRARY_HOME/die.sh"

while :; do
  case ${1+x} in
    -e|--is-error)
      icon="$HOME/doomguy-blood.png"
    ;;
    -t|--title)
      if [ "$2" ]; then
        title=$2; shift
      else
        die 'ERROR: "--title" requires a non-empty option argument.'
      fi
    ;;
    --) shift; break ;;
    -?*) echo "WARN: Unknown flag (ignored): $1" >&2 ;;
    *) break ;;
  esac
  shift
done

command() {
  echo "$icon" "$title"
}

case "${1:-command}" in
  command) command "${@:2}" ;;
  *) die "Command \"$1\" not recognized" ;;
esac
```
