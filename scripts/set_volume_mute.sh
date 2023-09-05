#!/bin/bash
for SINK in $(pacmd list-sinks | grep 'index:' | cut -b12-)
do
  pactl set-sink-mute $SINK toggle
done
