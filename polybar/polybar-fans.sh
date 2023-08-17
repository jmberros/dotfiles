#! /bin/sh

sensors | grep 'fan' | awk '{ print $2 }' | paste -s -d' ' | while read LINE; do echo $LINE; done
