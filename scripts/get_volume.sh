#!/bin/sh

# Prints the current volume or 🔇 if muted.

case $BLOCK_BUTTON in
# 1) setsid -f "$TERMINAL" -e pulsemixer ;;
1) setsid -f "$TERMINAL" -e alsamixer ;;
2) wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle ;;
4) wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+ ;;
5) wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%- ;;
3) notify-send "📢 Volume module" "\- Shows volume 🔊, 🔇 if muted.
- Middle click to mute.
- Scroll to change." ;;
6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac

vol="$(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')"
#vol="$(wpctl get-volume @DEFAULT_AUDIO_SINK@)"

# If muted, print 🔇 and exit.
#[ "$vol" != "${vol%\[MUTED\]}" ] && echo 🔇 && exit
is_mute="$(amixer get Master | tail -n1 | grep off | sed -r 's/.*\[(.*)%\].*/\1/')"
if [ $is_mute ]; then
	echo 🔇 && exit
fi

vol="${vol#Volume: }"
split() {
	# For ommiting the . without calling and external program.
	IFS=$2
	set -- $1
	printf '%s' "$@"
}
vol="$(split "$vol" ".")"
vol="${vol##0}"

case 1 in
$((vol >= 70))) icon="🔊" ;;
$((vol >= 30))) icon="🔉" ;;
$((vol >= 1))) icon="🔈" ;;
*) echo 🔇 && exit ;;
esac

echo "$icon$vol%"
