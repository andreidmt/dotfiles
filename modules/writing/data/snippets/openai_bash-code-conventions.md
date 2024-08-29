```toml
id="c9b9c1c0-cdee-4231-b05e-58d6b39242b4"
type="snippet"
description="BASH code conventions when prompting OpenAI"
tags=["openai", "code-conventions", "bash", "sh"]
createdAt="2023-05-02T21:22:34+02:00"
```

When writing BASH, SH or ZSH script, use the following rules:

- When passing a variable a command, use double quotes where needed to prevent
  word splitting and globing
- When echoing an error message, redirect to stderr
- Only use inline/short-hand if statements when they are short and replace
  if-then, not if-then-else. If both cases need handling, use an explicit
  if-then-else
- Prefer piping instead of multiple commands, if pipe is too long, write the
  command on multiple lines and set the pipeline operator at the beginning of
  the line
