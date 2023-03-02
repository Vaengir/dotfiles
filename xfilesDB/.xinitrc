#!/bin/sh
# Sets background of root window to black
xsetroot -solid black &
# Sets Cursor
xsetroot -cursor_name top_left_arrow &
# Bell Volume 0
xset b 0 &
# Screensaver and Screen blanking off
xset s off &
xset -dpms &
xset s noblank &
# Keyboard Layout
setxkbmap -layout eu -option caps:none &
xrdb -load $HOME/.Xdefaults &
# Handler for removeable Volumes
ivman &
# Run Compositor
picom &
# Allow Mousepad tapping to click
xinput set-prop "$(xinput list --name-only | grep -i touch)" "libinput Tapping Enabled" 1 &
# Update all repos
g pull ~/git/ &
# Monitor setup
xrandr --output Displayport-1 --primary --auto
xrandr --output Displayport-2 --right-of Displayport-1 --rotate right --auto
# Run Awesome
exec /usr/bin/awesome
