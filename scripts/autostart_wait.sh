#!/bin/bash

sleep 10
fcitx5 -d &
xfce4-power-manager &
>/dev/null

sleep 20
./get_wallpaper.py
