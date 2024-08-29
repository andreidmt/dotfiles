```toml
id="54052898-e4e2-480d-b02f-7ab133a24865"
type="snippet"
description="Bash function checking if a device is a USB device"
tags=["linux", "bash", "udev"]
createdAt="2023-04-10T23:34:23+02:00"
```

```bash
# Predicate checking if a device is a USB device
#
# Arguments:
# $1: The device name
# 
# Return: Exit code 0 if true, 1 otherwise
checkIsUSB() {
  udevadm info --query=property --name="$1" | grep -q "ID_BUS=usb"
}
```
