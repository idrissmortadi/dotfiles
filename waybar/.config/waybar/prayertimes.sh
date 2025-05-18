#!/usr/bin/env bash
# Fetch prayer times, find upcoming, output JSON for Waybar.
# Requires: curl, jq, GNU date

LATITUDE="48.72614"
LONGITUDE="2.27192"
TIMEZONE="Europe/Paris"
API="https://islamicfinder.us/index.php/api/prayer_times?latitude=$LATITUDE&longitude=$LONGITUDE&timezone=$TIMEZONE"
ICON=""

# Fetch and clean times
raw=$(curl -s "$API")
declare -A pray
for name in Fajr Dhuhr Asr Maghrib Isha; do
  # remove the %am% / %pm% markers and convert to lowercase am/pm
  t=$(echo "$raw" |
    jq -r ".results[\"$name\"]" |
    sed -E 's/%([ap])m%/\1m/g' |
    xargs -I{} date -d {} +%H:%M)
  pray[$name]="$t"
done

# Compute minutes since midnight for each prayer and now
declare -A mins
for name in "${!pray[@]}"; do
  # date -d understands “4:33 am” etc.
  h=$(date -d "${pray[$name]}" +%H)
  m=$(date -d "${pray[$name]}" +%M)
  mins[$name]=$((10#$h * 60 + 10#$m))
done
now=$((10#$(date +%H) * 60 + 10#$(date +%M)))

# Find next prayer
next=""
for name in Fajr Dhuhr Asr Maghrib Isha; do
  if ((mins[$name] > now)); then
    next=$name
    next_time=${mins[$name]}
    break
  fi
done
[[ -z "$next" ]] && next=Fajr && next_time=${mins[Fajr]}

# Build the alt text with Pango markup
lines=()
for name in Fajr Dhuhr Asr Maghrib Isha; do
  t="${pray[$name]}"
  if [[ $name == $next ]]; then
    # bold yellow highlight
    lines+=("<b><span>$name $t</span></b>")
  else
    lines+=("$name $t")
  fi
done

# Join lines with \n, escape quotes
alt=$(printf "%s\n" "${lines[@]}" |
  sed -e ':a;N;s/\n/\\n/g;ta' -e 's/"/\\"/g')

# Check if 5 minutes remain for the next prayer
notify_file="/tmp/last_prayer_notify"
if ((next_time - now <= 5)); then
  if [[ ! -f "$notify_file" || "$(cat "$notify_file")" != "$next" ]]; then
    notify-send "Prayer Reminder" "5 minutes left for $next prayer."
    echo "$next" >"$notify_file"
  fi
else
  rm -f "$notify_file" # Clear the file if no prayer is within 5 minutes
fi

# Emit JSON
current_time=$(date +%H:%M)
current_date_short=$(date "+%d %B")
current_date=$(date "+%A %d %B %Y")
printf '{"text":"%s %s","tooltip":"%s\\n\\n%s"}\n' "$ICON" "$current_time" "$current_date" "$alt"
