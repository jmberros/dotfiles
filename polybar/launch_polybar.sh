#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 0.1; done

# Launch polybar
polybar -c /home/juan/repos/dotfiles/polybar/polybar-tlon-main.ini tlon-main &

# DEPRECATED, just use main:
# polybar -c /home/juan/repos/dotfiles/polybar/polybar-tlon-aux.ini tlon-aux &
