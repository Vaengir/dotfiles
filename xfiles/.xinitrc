#!/bin/sh
# Sets background of root window to black
xsetroot -solid black
# Sets Cursor
xsetroot -cursor_name top_left_arrow
# Bell Volume 0
xset b 0
# Screensaver and Screen blanking off
xset s off
xset s noblank
# Keyboard Layout
setxkbmap -layout eu -option caps:none
xrdb -load $HOME/.Xdefaults
# Handler for removeable Volumes
ivman &
# Run Compositor
compton &
# Allow Mousepad tapping to click
xinput set-prop "$(xinput list --name-only | grep -i touch)" "libinput Tapping Enabled" 1 &
# Update all repos
g pull ~/git/ &
# Run Awesome
exec /usr/bin/awesome
