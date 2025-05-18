#!/bin/bash

current=$(powerprofilesctl get)
profiles=("power-saver" "balanced" "performance")

for i in "${!profiles[@]}"; do
  if [[ "${profiles[$i]}" == "$current" ]]; then
    next_index=$(((i + 1) % ${#profiles[@]}))
    next="${profiles[$next_index]}"
    break
  fi
done

powerprofilesctl set "$next"

case "$next" in
power-saver) icon="󰌪" ;; # nf-mdi-battery_outline
balanced) icon="" ;;    # nf-fae-balance_scale
performance) icon="󱓞" ;; # nf-md-flash
esac

printf '{"text":"%s","tooltip":"Power profile: %s"}\n' "$icon" "$next"
