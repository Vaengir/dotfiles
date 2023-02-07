#! /bin/sh

chosen=$(printf "  Power Off\n  Restart\n  Lock" | rofi -dmenu -i -theme-str '@import "config.rasi"')

case "$chosen" in
	"  Power Off") poweroff ;;
	"  Restart") reboot ;;
	"  Lock") i3lock -i ~/git/AwesomeWM/awesome/themes/nord/lockscreen.jpg ;;
	*) exit 1 ;;
esac
