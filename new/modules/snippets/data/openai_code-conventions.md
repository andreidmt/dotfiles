```toml
id="67287b36-ffa6-4308-9c44-a4ddfbda10aa"
type="snippet"
description="General code conventions when prompting OpenAI"
tags=["openai", "code-conventions"]
createdAt="2023-05-02T21:24:57+02:00"
```

When writing code, please follow these guidelines:

- Use 2 spaces for indentation
- Use double quotes for strings
- Keep lines under 80 characters
- Use CamelCase for variables and functions
- Use UPPER_CASE for constants
- Prefix boolean variables with is, has, can, should, did or will
- Define functions before they are used and named with a verb followed by an
  optional adjective and noun. For example `getUser` or `getActiveUser`
- Prefer if guards over if-then-else or nested ifs
