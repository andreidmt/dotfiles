```toml
id="f113aa73-3acb-4e03-a79c-53b5e37d6153"
type="snippet"
description="Safe way to loop over lines in a string"
tags=["linux", "sh"]
createdAt="2023-12-22T22:41:23+01:00"
```

```sh
#!/usr/bin/env sh

lines="line1\nline2\nline3"

# "IFS=" (Internal Field Separator) prevents leading/trailing whitespace from
# being trimmed.
# "read -r" prevents backslashes from being escaped.

echo $lines | while IFS= read -r line; do
  echo "$line"
done

# ... or without pipe
while IFS= read -r line; do
  echo "$line"
done <<< "$lines"
```
