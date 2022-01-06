#!/bin/sh

# The typematic delay indicates the amount of time (typically in miliseconds) 
# a key needs to be pressed and held in order for the repeating process to 
# begin. After the repeating process has been triggered, the character will be 
# repeated with a certain frequency (usually given in Hz) specified by the 
# typematic rate. Note that these settings are configured seperately for Xorg 
# and for the virtual console. 
xset r rate 220 20

# Extended mouse gestures
libinput-gestures-setup start

# Audio daemon
pulseaudio &

# Music player daemon
mpd &

# Network Manager applet
nm-applet --indicator &

# Bluetooth applet
#blueman-applet &

# USB watcher
#udiskie &

# Notification daemon
dunst &

# Composite manager
picom -b &

# Redshift
screen auto-temp &

# Window manager
exec i3
