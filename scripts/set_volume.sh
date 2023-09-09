#!/bin/bash
VOLUME=$1
SINK=`pactl list sinks | grep RUNNING -B1 | head -n1 | cut -d'#' -f2`

pactl set-sink-volume $SINK $VOLUME

#
# Sets volume in ALL sinks:
#
#for SINK in $(pacmd list-sinks | grep 'index:' | cut -b12-)
#do
  #pactl set-sink-volume $SINK $VOLUME
#done
