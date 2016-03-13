#! /bin/bash

nice -n 19 ionice -c3 rsync juan@beleriand.local:/home/juan/new_500gb/music/classical ~/music/ -avhz --delete
nice -n 19 ionice -c3 rsync juan@beleriand.local:/home/juan/new_500gb/music/jazz ~/music/ -avhz --delete
nice -n 19 ionice -c3 rsync juan@beleriand.local:/home/juan/new_500gb/music/world_OST ~/music/ -avhz --delete
nice -n 19 ionice -c3 rsync juan@beleriand.local:/home/juan/new_500gb/music/blues ~/music/ -avhz --delete

