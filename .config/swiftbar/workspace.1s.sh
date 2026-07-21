#!/usr/bin/env bash

SPACE=$(yabai -m query --spaces 2>/dev/null | jq -r '[.[] | select(.["is-visible"] == true)] | .[0].index // "?"')
echo "$SPACE"
echo "---"
for i in $(seq 1 6); do
  if [ "$i" = "$SPACE" ]; then
    echo "• $i | bash='yabai -m space --focus $i' terminal=false refresh=true"
  else
    echo "$i | bash='yabai -m space --focus $i' terminal=false refresh=true"
  fi
done
