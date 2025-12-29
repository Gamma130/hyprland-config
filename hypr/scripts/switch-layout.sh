#!/bin/bash
# ~/.config/hypr/scripts/switch-layout.sh

# Get all real keyboards (ignore power buttons & mice)
keyboards=$(hyprctl devices -j | jq -r '.keyboards[].name' | grep -v "power-button" | grep -v "mx-master")

for kb in $keyboards; do
  echo "Switching layout for: $kb"
  hyprctl switchxkblayout "$kb" next
done

