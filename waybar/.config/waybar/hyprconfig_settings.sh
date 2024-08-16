#!/bin/bash

# Define opacity options
# options="Opaque windows\nDefault windows opacity"
#
# # Show the Rofi menu
# selected=$(echo -e $options | rofi -dmenu -p "Select setting")
#
# # Apply the selected opacity or toggle opaque mode
# if [ "$selected" == "Opaque windows" ]; then
#     hyprctl keyword decoration:active_opacity 1
#     hyprctl keyword decoration:inactive_opacity 1
# elif [[ "$selected" == "Default windows opacity" ]]; then
#     hyprctl keyword decoration:active_opacity 0.9
#     hyprctl keyword decoration:inactive_opacity 0.7
# fi
# Define opacity options
options="Change opacity"

# Show the Rofi menu
selected=$(echo -e $options | rofi -dmenu -p "Select setting")

# Apply the selected opacity or toggle opaque mode
if [ "$selected" == "Change opacity" ]; then
  opacity=$(echo -e "100\n90\n80\n70\n60\n50" | rofi -dmenu -p "Select opacity level")
  opacity=$(echo "$opacity/100" | bc -l)
  hyprctl keyword decoration:active_opacity $opacity
  hyprctl keyword decoration:inactive_opacity $opacity
fi
