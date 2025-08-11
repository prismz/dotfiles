#!/usr/bin/env bash

# dependencies: maim, dmenu, xdotool, xclip

set -e

monitors=$(xrandr | grep ' connected' | sed 's/primary//g' |  awk '{print $1 "|" $3}')

choice=$(echo -e "Selection\nActive Window\nWhole Display\n$monitors" | dmenu)
now=$(date +%F-%H%M%S)
screenshot_dir="$(xdg-user-dir PICTURES)/Screenshots"

mkdir -p "$screenshot_dir"

case $choice in
        "Selection")
                maim -s "${screenshot_dir}/${now}.png"
                ;;
        "Active Window")
                maim -i $(xdotool getactivewindow) "${screenshot_dir}/${now}.png"
                ;;
        "Whole Display")
                maim "${screenshot_dir}/${now}.png"
                ;;
        *)
                choice_res=$(echo "$choice" | sed 's/|/\n/g' | tail -n 1)
                for monitor in $monitors; do
                        # echo "see if '$monitor' is match"
                        if [ "$monitor" == "$choice" ]; then
                                # echo "match"
                                maim -g "$choice_res" "${screenshot_dir}/${now}.png"
                                complete=true
                                break
                        fi
                done

                if [ "$complete" != "true" ]; then
                        # echo "no match - $choice"
                        maim "${screenshot_dir}/${now}.png"
                fi
                ;;
esac

# copy to clipboard
xclip -sel clip -t image/png "${screenshot_dir}/${now}.png"
