# -*- coding: utf-8 -*-

import subprocess

from i3pystatus import Status
from i3pystatus.updates import aptget

status = Status(standalone=True)

status.register("weather",
                location_code="ARXX2499:1:AR",
                interval=300,
                format="{current_temp} {humidity}%"
                )

status.register("clock",
                color="#cccccc",
                format="%H:%M, %A %-d %B",)

status.register("updates",
                format = "{count} update(s) available",
                format_no_updates = "",
                backends = [aptget.AptGet()])

status.register("mail_check")

status.register("pulseaudio",
                format="🔊 {volume}",)

status.register("pomodoro",
                long_break_duration=30,
                sound="/home/juan/Dropbox/glass_ping.wav")

status.register("radiotray",
                color="#f9ef8d")

status.register("now_playing",
    player="clementine",
    color="#ffc080",
    format='{artist}: "{title}" {song_elapsed}/{song_length}')

status.register("load",
                color="#bbbbbb",
                critical_limit=8,
                format="💻 {avg1} / {avg5}")

#  status.register("mem_bar",
                #  multi_colors=True,
                #  color="#333333",
                #  warn_color="#cccccc",
                #  alert_color="#ffffff")

status.register("network",
    interface="enp0s25",
    format_up="{bytes_sent} kB/s↑ {bytes_recv} kB/s↓",
    format_down="Internet DOWN",
    dynamic_color = True,
    start_color="gray",
    end_color="yellow",
    color_down="#ff2222",
    )

# status.register("network",
#     interface="wlan0",
#     color_up="#66d13c", # limegreen
#     color_down="#ff6347", # tomato
#     format_up="{essid} {quality:03.0f}%",
#     #format_down="{interface} down",
#     format_down="",
#     )

# Shows disk usage of /
# Format:
# 42/128G [86G]
#  status.register("disk",
    #  path="/",
    #  color="#bbbbbb",
    #  #format="{used} / {total}G [ {avail}G ]",)
    #  format="{avail}G ({total}G)",)

#  status.register("disk",
    #  color="#bbbbbb",
    #  path="/media/500gb",
    #  format="{avail}G ({total}G)")

#  status.register("disk",
    #  color="#bbbbbb",
    #  path="/media/600gb",
    #  format="{avail}G ({total}G)")

status.run()
