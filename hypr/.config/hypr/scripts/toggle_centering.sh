#!/bin/bash

res=$(hyprctl -j monitors | jq "[.[].reserved]" | jq ".[0].[0]")
monitor=$(hyprctl -j activeworkspace | jq -r ".monitor")

if [[ "$res" -eq 0 ]]; then
  hyprctl keyword monitor "$monitor, addreserved, 0, 0, 300, 300"
else
  hyprctl keyword monitor "$monitor, addreserved, 0, 0, 0, 0"
fi
