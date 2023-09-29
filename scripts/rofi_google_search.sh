#!/bin/bash
notify-send "1"

INPUT=$(rofi -dmenu -p " oogle search:")
notify-send "2 $INPUT"
if [[ -z $INPUT ]]; then
    exit 1
fi
notify-send "3"
google-chrome "https://www.google.com/search?q=$INPUT"
notify-send "4"

