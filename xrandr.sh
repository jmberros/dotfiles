#!/bin/bash

# Problem: the HDMI-1-1 output looks too streched, low res.
#xrandr --fb 3840x1080 \
  #--output eDP-1 --mode 1920x1080 --right-of HDMI-1-1 \
  #--pos 1920x0 --panning 1920x1080+1920+0/1920x1080+1920+0 \
  #--output HDMI-1-1 --mode 1920x1080 --left-of eDP-1 \
  #--pos 0x0 --panning 1920x1080+0000+0/1920x1080+0000+0

#xrandr \
  #--fb 4480x1440 \
  #--output HDMI-1-1 --mode 2560x1440 --pos 0x0 --left-of eDP-1 \
  #--output eDP-1 --mode 1920x1080 --pos 2560x0 --right-of HDMI-1-1
  # --pos 1920x0 --panning 1920x1080+1920+0/1920x1080+1920+0 \
  # --pos 0x0 --panning 1920x1080+0000+0/1920x1080+0000+0

xrandr \
  --fb 4480x1440 \
  --output eDP-1 --primary --mode 1920x1080 --scale 1x1 --pos 2560x0 \
  --output HDMI-1-1 --left-of eDP-1 --mode 2560x1440 --scale 1x1 --pos 0x0
  # --output eDP-1 --primary --mode 1920x1080 \
