#!/bin/bash
# volume-control.sh - Script to show/hide volume bar when volume changes

# Path to EWW binary
EWW_BIN="eww"

# Variables for the volume window
VOLUME_WINDOW="volume"

# Function to open the volume window
show_volume_window() {
  # Check if the window is already open
  if ! $EWW_BIN windows | grep -q "$VOLUME_WINDOW"; then
    $EWW_BIN open $VOLUME_WINDOW

    # Auto-close the window after 2 seconds
    (sleep 2 && $EWW_BIN close $VOLUME_WINDOW) &
  else
    # Reset the auto-close timer
    pkill -f "sleep 2 && $EWW_BIN close $VOLUME_WINDOW" 2>/dev/null
    (sleep 2 && $EWW_BIN close $VOLUME_WINDOW) &
  fi
}

# Listen for volume changes
pactl subscribe | grep --line-buffered "sink" | while read -r line; do
  show_volume_window
done
