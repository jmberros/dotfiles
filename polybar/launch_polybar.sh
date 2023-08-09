#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 0.1; done

~/repos/dotfiles/polybar/launch_polybar_main.sh
~/repos/dotfiles/polybar/launch_polybar_aux.sh

# NOTE:
# The backlight module needs permissions to write this system file:
sudo chgrp juan /sys/class/backlight/intel_backlight/brightness
sudo chmod g+w /sys/class/backlight/intel_backlight/brightness
