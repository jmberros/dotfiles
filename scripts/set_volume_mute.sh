#!/bin/bash
SINK=pactl list sinks | grep RUNNING -B1 | head -n1 | cut -d'#' -f2
pactl set-sink-mute $SINK toggle

#
# Mutes or Unmutes all sinks:
#
#for SINK in $(pacmd list-sinks | grep 'index:' | cut -b12-)
#do
  #pactl set-sink-mute $SINK toggle
#done
