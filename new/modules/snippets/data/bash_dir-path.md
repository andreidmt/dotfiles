```toml
id="79d9397a-b01e-4d6b-85da-038a22fdfad4"
type="snippet"
description="Absolute dir path of current script file"
tags=["linux", "bash"]
createdAt="2022-07-18T16:41:53+02:00"
```

```bash
dirpath=$(dirname "$(realpath "$0")")
```

