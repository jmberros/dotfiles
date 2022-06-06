# -*- coding: utf-8 -*-

import subprocess

from i3pystatus import Status
#  from i3pystatus.updates import aptget

status = Status(standalone=True)

#  status.register("weather",
                #  location_code="ARXX2499:1:AR",
                #  interval=300,
                #  format="{current_temp} {humidity}%"
                #  )

status.register("clock",
                color="#cccccc",
                format="%H:%M, %A %-d %B",)

#  status.register("updates",
                #  format = "{count} update(s) available",
                #  format_no_updates = "",
                #  backends = [aptget.AptGet()])

status.register("mail_check")
status.register("restart_required")

status.register("pulseaudio",
                format="🔊 {volume}",)

status.register("pomodoro",
                long_break_duration=(20*60),
                sound="/home/juan/Dropbox/chinise-gong.wav")

status.register("cpu_usage", format='🖥 {usage:02}%')

status.register("load",
                color="#bbbbbb",
                critical_limit=8,
                format="💻 {avg1} / {avg5}")

status.register("mem",
                divisor=10**9,
                color="#4CAF50",
                format="{used_mem} / {avail_mem} Gb")

status.register("now_playing",
    player="clementine",
    color="#ffc080",
    format='{artist}: "{title}" {song_elapsed}/{song_length}')

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
status.register("disk",
    path="/",
    color="#bbbbbb",
    #format="{used} / {total}G [ {avail}G ]",)
    format="🏠 {avail}G",)

status.register("disk",
    color="#bbbbbb",
    path="/media/new_500gb/",
    format="🎜 {avail}G",)

status.register("disk",
    color="#bbbbbb",
    path="/media/old_500gb/",
    format="{avail}G",)

#  status.register("radiotray",
                #  color="#f9ef8d")

status.run()
