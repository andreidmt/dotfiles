```toml
id="b715611c-9f2d-41fd-aaca-b9ab0c7bbc1d"
type="snippet"
description="Bash functions to clear and replace the current line"
tags=["linux", "bash"]
createdAt="2023-04-10T18:31:43+02:00"
```

```bash
clearCurrentLine() {
  # -n to prevent newline
  # -e to evaluate escape sequences
  # \r sets cursor to beginning of line
  # \033[K clears line
  echo -n -e "\r\033[K"
}

# Replaces the current line with the given string.
#
# Arguments:
# $1 - string to print
replaceCurrentLine() {
  clearCurrentLine
  # -n to prevent newline
  # -e to evaluate escape sequences
  # \r sets cursor to beginning of line
  echo -n -e "\r$1"
}
```
