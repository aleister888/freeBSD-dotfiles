#!/usr/local/bin/dash
dunstctl close-all
vol="$(pamixer --get-volume)"
if	[ "$(pamixer --get-volume-human 2>&1)" = "muted" ]; then
		notify-send "AUDIO MUTED"
else
		notify-send "Volume: $vol%"
fi
