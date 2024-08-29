```toml
id="e2e2f80e-1247-4e9f-8f88-54a783195859"
type="snippet"
description=""
tags=["linux", "bash", "echo", "table", "text", "format"]
createdAt="2023-11-30T09:17:38+01:00"
```

```bash
{
  echo "# before after"
  echo "/home $home_before_free_space $home_after_free_space"
  echo "/ $root_before_free_space $root_after_free_space"
} | column -t -s ' '
```
