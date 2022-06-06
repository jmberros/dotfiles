#! /bin/bash

nice -n 19 ionice -c3 rsync /home/juan/new_500gb/music/folk /home/juan/old_500gb/music/ -aq --delete
nice -n 19 ionice -c3 rsync /home/juan/new_500gb/music/rock_and_pop /home/juan/old_500gb/music/ -aq --delete
nice -n 19 ionice -c3 rsync /home/juan/new_500gb/music/tango_folklore /home/juan/old_500gb/music/ -aq --delete
nice -n 19 ionice -c3 rsync /home/juan/new_500gb/music/world_OST /home/juan/old_500gb/music/ -aq --delete

date > ~/.last_beleriand_music_backup.date

