```toml
id="80c8ae0a-061c-42df-aba9-c38b138e9638"
type="snippet"
syntax="sh"
description="Example of a case statement"
tags=["linux", "shell"]
createdAt="2022-07-18T16:36:52+02:00"
```

```sh
case "$1" in
  value|another-value)
    echo "$1 equals value or another-value"
  ;;
  with-wildcard*)
    echo "$1 starts with with-wildcard"
  ;;
  *)
    echo "nothing matched"
  ;;
esac
```
