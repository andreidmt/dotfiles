```toml
id="9a420a14-9052-449f-a62c-c63e995f80b5"
type="snippet"
description="Example of getopts argument parsing (only short form)"
tags=["linux", "bash"]
createdAt="2023-04-09T08:34:06+02:00"
```

```bash
while getopts ":hl:" opt; do 
  case $opt in
    h)
      echo "Usage: $(basename "$0")"
      exit 0
    ;;
    l)
      ipsum="dolor sit amet"
      ;;
    \?)
      echo "Error: Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Error: -$OPTARG requires a value" >&2
      exit 1
      ;;
  esac
done
```
