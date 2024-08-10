#!/bin/bash

# Define opacity options
options="Opaque windows\nDefault windows opacity"

# Show the Rofi menu
selected=$(echo -e $options | rofi -dmenu -p "Select setting")

# Get the ID of the active window
active_window=$(hyprctl activewindow | grep "ID:" | awk '{print $2}')

# Apply the selected opacity or toggle opaque mode
if [ "$selected" == "Opaque windows" ]; then
    hyprctl keyword decoration:active_opacity 1
    hyprctl keyword decoration:inactive_opacity 1
elif [[ "$selected" == "Default windows opacity" ]]; then
    hyprctl keyword decoration:active_opacity 0.9
    hyprctl keyword decoration:inactive_opacity 0.7
fi
