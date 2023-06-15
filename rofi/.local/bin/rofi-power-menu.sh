#! /bin/sh

chosen=$(printf "  Power Off\n  Restart\n  Lock" | rofi -dmenu -i -selected-row 1 -p "Powermenu: " )

case "$chosen" in
	"  Power Off") poweroff ;;
	"  Restart") reboot ;;
	"  Lock") i3lock-fancy -gp ;;
	*) exit 1 ;;
esac
