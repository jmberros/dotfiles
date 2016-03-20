#! /bin/bash

nice -n 19 ionice -c3 rsync juan@beleriand.local:/home/juan/new_500gb/music/classical ~/music/ -avhz --delete
nice -n 19 ionice -c3 rsync juan@beleriand.local:/home/juan/new_500gb/music/jazz ~/music/ -avhz --delete
nice -n 19 ionice -c3 rsync juan@beleriand.local:/home/juan/new_500gb/music/world_OST ~/music/ -avhz --delete
nice -n 19 ionice -c3 rsync juan@beleriand.local:/home/juan/new_500gb/music/blues ~/music/ -avhz --delete
nice -n 19 ionice -c 3 rsync juan@beleriand.local:/media/new_500gb/music/rock_and_pop/\\\[90-00\\\'s\\\]\\\ Electronica ~/music/rock_and_pop -avzh --delete

date > ~/Dropbox/.last_arrakis_music_backup.date
