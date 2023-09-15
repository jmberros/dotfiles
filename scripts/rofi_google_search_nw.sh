#!/bin/bash

INPUT=$(rofi -dmenu -p "")
if [[ -z $INPUT ]]; then
    exit 1
fi
google-chrome --new-window "https://www.google.com/search?q=$INPUT"
