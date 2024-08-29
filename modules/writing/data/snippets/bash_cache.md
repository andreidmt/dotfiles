```toml
id="57e28e3d-04f3-4afc-8545-f031b4e34bf8"
type="snippet"
syntax="sh"
description=""
tags=["linux", "shell", "cache"]
createdAt=""
```

```sh
  # Invalidate cache if older than 1 day 
  if [ -f "$cache_path" ]; then
    is_old=$(find "$cache_path" -mtime +1 -print)

    if [ -n "$is_old" ]; then
      rm "$cache_path"
    fi
  fi
```
