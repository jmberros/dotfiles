#!/bin/bash

# NOTE:
# The script to launch the main monitor will take care
# of killing other polybar instances (and waiting for them to die)
~/repos/dotfiles/polybar/launch_polybar_main.sh
~/repos/dotfiles/polybar/launch_polybar_aux.sh

# NOTE:
# The backlight module needs permissions to write this system file:
sudo chgrp juan /sys/class/backlight/intel_backlight/brightness
sudo chmod g+w /sys/class/backlight/intel_backlight/brightness
