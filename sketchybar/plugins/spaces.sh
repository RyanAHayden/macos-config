#!/bin/bash

THEME_FILE="${CONFIG_DIR:-$HOME/.config/sketchybar}/theme.sh"
if [ -f "$THEME_FILE" ]; then
  # shellcheck source=/dev/null
  source "$THEME_FILE"
fi

SPACE_INDEX="${NAME##*.}"
WINDOWS=$(yabai -m query --windows --space "$SPACE_INDEX" 2>/dev/null | jq 'length')

if [ "$SELECTED" = "true" ]; then
  sketchybar --set "$NAME" \
    drawing=on \
    icon="󰝤" \
    icon.color="${ACCENT_COLOR:-0xfff5c2e7}" \
    label.color="${ACCENT_COLOR:-0xfff5c2e7}"
elif [ "${WINDOWS:-0}" -gt 0 ]; then
  sketchybar --set "$NAME" \
    drawing=on \
    icon="$SPACE_INDEX" \
    icon.color="${TEXT_COLOR:-0xffcdd6f4}" \
    label.color="${TEXT_COLOR:-0xffcdd6f4}"
else
  sketchybar --set "$NAME" drawing=off
fi
