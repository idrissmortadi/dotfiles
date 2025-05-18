#!/bin/bash

# Check if hypridle is running
if pgrep -x "hypridle" >/dev/null; then
  # If running, kill the process
  pkill -x "hypridle"
  echo "hypridle stopped"
  notify-send "hypridle stopped"
  eww update hypridle-running=false
else
  # If not running, start hypridle
  hypridle &
  echo "hypridle started"
  notify-send "hypridle started"
  eww update hypridle-running=true
fi
