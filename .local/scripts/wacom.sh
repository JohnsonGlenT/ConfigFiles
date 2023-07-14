#!/usr/bin/env sh

# Use this to target your specific monitor device
screen_dev="HDMI-A-0"

xfconf-query -c displays -p /ActiveProfile -m | while IFS= read -r; do
    echo "Reconfiguring..."

    # Tested with Wacom Cintiq 16 Pen (stylus/eraser)
    for id in $(xsetwacom list devices | grep -i wacom | awk '/Pen/{print $7}'); do
        xsetwacom set "${id}" MapToOutput "${screen_dev}"
    done
done
