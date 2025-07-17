#!/bin/bash
# Get the focused window's working directory and open kitty there
kitty --working-directory="$(hyprctl activewindow -j | jq -r '.pid' | xargs pwdx | cut -d' ' -f2-)" &
