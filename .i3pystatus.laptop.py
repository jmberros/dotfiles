#!/usr/bin/python3
# -*- coding: utf-8 -*-

import subprocess

from i3pystatus import Status
from i3pystatus.updates import aptget

status = Status(standalone=True)

# status.register("weather",
                # location_code="ARXX2499:1:AR",
                # interval=300,
                # format="{current_temp} {humidity}%"
                # )

status.register("clock",
                color="#cccccc",
                format="%A %-d/%m, %H:%M",)

status.register("battery",
                format="🗲 {percentage:.0f}% {bar}‖ ⌛ {remaining}",
                no_text_full=True,
                full_color="#cccccc",
                color="#ffff66",
                charging_color="#99ff99",
                critical_color="#ff0000")

# status.register("updates",
                # format = "{count} update(s) available",
                # format_no_updates = "",
                # backends = [aptget.AptGet()])

status.register("mail_check")

status.register("pulseaudio",
                format="🔉 {volume}",)

status.register("pomodoro",
                sound="/home/juan/Dropbox/glass_ping.wav")

#  status.register("radiotray",
                #  color="#ff33cc")

status.register("now_playing",
                player="clementine",
                color="#ffc080",
                format='{artist}: "{title}"')

#  status.register("mem_bar",
                #  format="{used_mem_bar}‖",
                #  multi_colors=True,
                #  color="#FFFFFF",
                #  warn_color="#FFFFFF",
                #  alert_color="#FFFF11")

status.register("mem",
                divisor=10**9,
                format="{used_mem} | {avail_mem} Gb")

status.register("load",
                color="#bbbbbb",
                critical_limit=8,
                format="💻 {avg1} / {avg5}")

status.register("network",
                interface="eth0",
                format_up="{bytes_sent}↑ {bytes_recv}↓",
                format_down="",
                dynamic_color = True,
                start_color="gray",
                end_color="yellow",
                color_down="#ff2222")

status.register("network",
                interface="wlp3s0",
                format_up="{bytes_sent}↑ {bytes_recv}↓ {essid} [{quality:03.0f}%]",
                format_down="{} {interface} DOWN",
                dynamic_color = True,
                start_color="#cccccc",
                end_color="yellow",
                color_down="#ff6347", # tomato
                )

# Shows disk usage of /
# Format:
# 42/128G [86G]
status.register("disk",
     path="/",
     color="#bbbbbb",
     #format="{used} / {total}G [ {avail}G ]",)
     format="{avail}G")

#  status.register("disk",
    #  color="#bbbbbb",
    #  path="/media/500gb",
    #  format="{avail}G ({total}G)")

#  status.register("disk",
    #  color="#bbbbbb",
    #  path="/media/600gb",
    #  format="{avail}G ({total}G)")

status.register("capslock")
# ^ text and color are also settings

status.run()
