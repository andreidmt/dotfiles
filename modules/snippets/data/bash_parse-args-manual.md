```toml
id="52fd62a9-f7f5-4897-97de-acd2eac4208a"
type="snippet"
description="Example of manual parsing of short and long form arguments"
url="http://mywiki.wooledge.org/BashFAQ/035"
tags=["linux", "sh"]
createdAt="2022-07-23T18:32:31+02:00"
```

```sh
while [ "$#" -gt 0 ]; do
  case $1 in
    -l|--lorem)
      ipsum="dolor sit amet"
    ;;
    -f|--foo)
      if [ "$2" ] && [ "${2#-}" = "$2" ]; then
        foo=$2; shift
      else
        print_error "-f|--foo flag requires a value"
        exit 1
      fi
    ;;
    -?*) print_error "unknown flag $1"; exit 1 ;;
    *) print_error "unknown argument $1"; exit 1 ;;
  esac
  shift
done
```
