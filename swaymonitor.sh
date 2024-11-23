swaymsg -m -t subscribe '["window"]' |
	jq --unbuffered --raw-output '"\(.change) \(.container.id) \(.container.app_id)"'
