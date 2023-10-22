```toml
id="52fd62a9-f7f5-4897-97de-acd2eac4208a"
type="snippet"
description="Example of manual parsing of short and long form arguments"
url="http://mywiki.wooledge.org/BashFAQ/035"
tags=["linux", "bash"]
createdAt="2022-07-23T18:32:31+02:00"
```

```bash
# :; is a no-op, 
while :; do
  case $1 in
    # Argument with no value, flag
    -l|--lorem)
      ipsum="dolor sit amet"
    ;;

    # Argument with required value
    -f|--foo)
      if [ "$2" ]; then
        foo=$2; shift
      else
        echo 'ERROR: "--foo" requires a non-empty option argument.' >&2
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
```
