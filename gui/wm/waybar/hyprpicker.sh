#!/run/current-system/sw/bin/bash
color_code=$(hyprpicker -a | awk '{print $NF}')
magick -size 100x100 xc:"$color_code" /tmp/color_notification.png
dunstify -r "$(date +%s)" -i /tmp/color_notification.png "The color code has been copied" ""

