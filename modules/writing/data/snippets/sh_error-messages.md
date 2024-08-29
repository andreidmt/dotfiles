```toml
id="c5115af3-a490-4d71-8042-274ee434514c"
type="snippet"
description=""
tags=[]
created_at="2024-06-03T08:10:17+02:00"
```

```sh
# STDIN
#  Standard input can be redirected to field value by setting if to '@'. 
#  Fields supporting this are "--foo", "--bar" and "--little-lorem".
#
#  This is useful when the value is too large to be passed as an argument and
#  when the value is being piped from another command.
#
#  Example:
#   echo "Hello, Im Bob!" | create users --field bio @
#
# ERROR CODES
#  1: Missing environment variable
#  2: Invalid input - parsing error of stdin, argument or flag parsing
#  3: Sqlite3 failed to insert record(s)

##
## Shield wall!
##

if [ -z "$VAR_NAME" ]; then
  log error -v var_name "\$VAR_NAME" "Missing environment variable"
  exit 1
fi

##
## FUNCTIONS
##

guard_missing_option_key() {
  if [ -z "$2" ]; then
    log error -v option "$1" "Missing key"
    exit 2
  fi
}

guard_missing_option_value() {
  if [ -z "$2" ]; then
    log error -v option "$1" "Missing value"
    exit 2
  fi
}

guard_missing_option_stdin() {
  if [ -z "$2" ]; then
    log error -v option "$1" "Option value set to '@' but stdin is empty"
    exit 2
  fi
}

guard_missing_argument() {
  if [ -z "$2" ]; then
    log error -v arg_name "$1" "${3:-Missing argument}"
    exit 2
  fi
}

##
## PARSE ARGUMENTS
##

if [ -z "$2" ]; then
  log error -v option "$1" "Missing key"; exit 2
fi
key=$2; shift

if [ -z "$2" ]; then
  log error -v option "$1" "Missing value"; exit 2
fi
value=$2; shift


-?*) log error -v name "$1" "Unknown parameter"; exit 2 ;;

```
