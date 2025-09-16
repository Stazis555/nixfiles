#!/run/current-system/sw/bin/bash

# CARD_INDEX=3   # change this if your mic is on a different card
CARD_INDEX=$(arecord -l | rg Blue | rg -o 'card [0-9]+' | tr -d 'card ')
CONTROL_NAME="Mic"

case "$1" in
    up)
        amixer -c "$CARD_INDEX" set "$CONTROL_NAME" playback 5%+ > /dev/null
        ;;
    down)
        amixer -c "$CARD_INDEX" set "$CONTROL_NAME" playback 5%- > /dev/null
        ;;
esac

# Output the current volume as a number for Waybar
VOL=$(amixer -c "$CARD_INDEX" get "$CONTROL_NAME" | grep -o '[0-9]\+%' | head -n1 | tr -d '%')
echo "$VOL"
