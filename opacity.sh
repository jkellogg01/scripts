#! /usr/bin/env bash

blur_opacity=${1:-0.85}
focus_opacity=${2:-1.0}

old=0
swaymsg -m -t subscribe '["window"]' | jq --unbuffered -r '"\(.change) \(.container.id)"' |
while read -r change new; do
	[[ $change = 'focus' ]] || continue
	if [[ $old -ne 0 ]]; then
		swaymsg [con_id = $old] opacity set $blur_opacity
	fi
	swaymsg [con_id = $new] opacity set $focus_opacity
	old=$new
done
