#!/bin/bash

day=$(date "+%Y-%m-%d")
time=$(date "+%H:%M")
week=$(date "+%A")
print_volume() {
	volume="$(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')"
	if test "$volume" -gt 0; then
		echo -e ":${volume} "
	else
		echo -e ":Mute"
	fi
}
percent=$(acpi -b | awk -F", " '{print $2}')
battery_time=$(acpi -b | awk -F", " '{print $3}')
get_battery_charging_status() {
	if $(acpi -b | grep --quiet Discharging); then
		echo ":"
	else # acpi can give Unknown or Charging if charging, https://unix.stackexchange.com/questions/203741/lenovo-t440s-battery-status-unknown-but-charging
		echo ":"
	fi
}
print_bat() {
	echo "[$(get_battery_charging_status)$percent $battery_time]"
}

xsetroot -name "$(print_volume)$(print_bat) [$USER] ${week} ${day} ${time}"
