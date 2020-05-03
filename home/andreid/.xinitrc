#!/usr/bin/fish

# The typematic delay indicates the amount of time (typically in miliseconds) 
# a key needs to be pressed and held in order for the repeating process to 
# begin. After the repeating process has been triggered, the character will be 
# repeated with a certain frequency (usually given in Hz) specified by the 
# typematic rate. Note that these settings are configured seperately for Xorg 
# and for the virtual console. 
xset r rate 220 20

# dunst - https://github.com/dunst-project/dunst/issues/347
systemctl --user import-environment DISPLAY

xrdb -merge -I $HOME ~/.Xresources

# i3 window manager
exec i3
