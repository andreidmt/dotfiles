```toml
id="3f344f42-2d2e-453f-8a8a-45f6abcd66f5"
type="snippet"
syntax=""
description=""
url=""
tags=[]
```

```json
{
  "executor": "nx:run-commands",
  "options": {
    "command": "tsc --project libs/tsconfig.json --noEmit"
  },
  "dependsOn": [
    {
      "target": "generate-types",
      "projects": "dependencies"
    }
  ]
}
```
