#!/bin/bash
# ~/.config/hypr/switch-keyboard.sh

# Get list of available keyboards
keyboards=$(hyprctl devices -j | jq -r '.keyboards[].name')

if echo "$keyboards" | grep -q "at-translated-set-2-keyboard"; then
    hyprctl switchxkblayout at-translated-set-2-keyboard next
elif echo "$keyboards" | grep -q "razer-razer-blackwidow-chroma"; then
    hyprctl switchxkblayout razer-razer-blackwidow-chroma next
else
    # Fallback: switch first available keyboard
    first_keyboard=$(echo "$keyboards" | head -n1)
    hyprctl switchxkblayout "$first_keyboard" next
fi
