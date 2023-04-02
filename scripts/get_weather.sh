#!/bin/bash

WEATHER="$(curl wttr.in/武汉?format="%l:+%c+%t+%h+%m\n")"

echo $WEATHER

case $BLOCK_BUTTON in
1) notify-send "Today weather" "$(curl wttr.in/武汉?format="%l+\n湿度:+%h\n风速:+%w\n气压:+%p\n体感温度：+%f+%M")" ;;
2) setsid -f "$TERMINAL" -e "curl wttr.in/wuhan" ;;
3) notify-send "weather module" ;;
esac
