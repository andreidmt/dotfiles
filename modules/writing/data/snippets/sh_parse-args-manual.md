```toml
id="52fd62a9-f7f5-4897-97de-acd2eac4208a"
type="snippet"
description="Example of manual parsing of short and long form arguments"
url=""
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
      if [ -z "$2" ]; then
        log error -v option "$1" "Missing value"; exit 2
      fi
      foo=$2; shift
    ;;
    --) shift; break ;;
    -?*) log error -v name "$1" "Unknown parameter"; exit 2 ;;
    *) break ;;
  esac
  shift
done
```
