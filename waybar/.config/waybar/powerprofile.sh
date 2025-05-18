#!/bin/bash

current=$(powerprofilesctl get)

case "$current" in
power-saver) icon="󰌪" ;; # nf-mdi-battery_outline
balanced) icon="" ;;    # nf-fae-balance_scale
performance) icon="󱓞" ;; # nf-md-flash
esac

printf '{"text":"%s","tooltip":"Power profile: %s"}\n' "$icon" "$current"
