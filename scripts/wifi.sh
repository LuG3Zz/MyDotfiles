#!/bin/bash
ip link set wlan0 up
wpa_supplicant -c /etc/wpa_supplicant.conf -i wlan0 &
sleep 3
dhcpcd &
