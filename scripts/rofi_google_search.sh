#!/bin/bash

INPUT=$(rofi -dmenu -p " oogle search:")
if [[ -z $INPUT ]]; then
    exit 1
fi
google-chrome "https://www.google.com/search?q=$INPUT"
