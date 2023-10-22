```toml
id="1e31b9ad-db0d-4621-9c5c-cb71253ba1dd"
type="snippet"
description="Print help section for a bash script"
tags=["linux", "bash"]
createdAt="2023-04-28T12:33:56+02:00"
```

```bash
#!/usr/bin/env sh

set -e

# Author: Andrei Dumitrescu - https://github.com/andreidmt
# Version: 1.0.0
# License: MIT

display_help() {
  cat << EOF
Usage: $(basename "$0") [-h] [-d] source [destination]

Converts the .tgz archive, output of "npm pack", into a zip archive matching the format expected by AWS Lambda (removes the extra "/package" folder from the input archive).

Options:
  [-h, --help]              Print this help guide
  [-d, --delete-source]     Delete the source .tgz file after the conversion is complete

Arguments:
  source                    Source .tgz file (required)
  [destination]             Destination directory for the resulting .zip file (optional, defaults to the current directory)
EOF
}
```
