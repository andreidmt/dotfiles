#!/usr/bin/sh -e

guardIsRoot() {
  if [ "$(id -u)" != 0 ]; then
    die "You must be root to run this program"
  fi
}
