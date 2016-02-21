#! /bin/bash

nice -n 19 ionice -c3 rsync juan@beleriand.local:/media/600gb/music/blues ~/music/ -avhz --delete
nice -n 19 ionice -c3 rsync juan@beleriand.local:/media/600gb/music/jazz ~/music/ -avhz --delete
nice -n 19 ionice -c3 rsync juan@beleriand.local:/media/600gb/music/classical ~/music/ -avhz --delete
nice -n 19 ionice -c3 rsync juan@beleriand.local:/media/600gb/music/tango_folklore ~/music/ -avhz --delete
nice -n 19 ionice -c3 rsync juan@beleriand.local:/media/600gb/music/world_OST ~/music/ -avhz --delete

