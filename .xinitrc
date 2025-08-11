#!/bin/bash

# filter recent files
exec monitor-recently-used &

# themes
xrdb -merge ~/.Xresources

# display configuration
xrandr --output HDMI-A-0 --off --output DisplayPort-0 --mode 2560x1440 --primary --pos 0x0 --rotate normal --rate 170 --set TearFree on --output DisplayPort-1 --mode 2560x1080 --pos 2560x360 --rotate normal --set TearFree on --output HDMI-A-1 --off --output HDMI-A-1-2 --off --output DisplayPort-1-2 --off --output DisplayPort-1-3 --off --output DisplayPort-1-4 --off

# compositor
exec picom --backend xrender --daemon &

# disable screen blanking and powersave (it happens while watching videos)
exec xset s off &
exec xset -dpms &

# mullvad vpn
exec mullvad-vpn &

# polkit authentication agent
exec /usr/libexec/polkit-gnome-authentication-agent-1 &

# wallpaper
# exec feh --bg-tile 'Pictures/Wallpapers/Stitched/carbg1.png' &
exec /home/hasan/Development/multimon-bg-shuffle/bg-shuffle.py &

# pipewire sound server
exec gentoo-pipewire-launcher &

# colemak & qwerty keyboard layout, super+space toggle
exec setxkbmap us,us -variant colemak, -option grp:win_space_toggle &

# notification daemon
exec dunst --startup_notification &

# status program
exec scrolling_metadata 2> /dev/null &   # scrolling song metadata
exec faststatus &

# dwm (the best wm)
exec dbus-launch --sh-syntax --exit-with-session dwm
