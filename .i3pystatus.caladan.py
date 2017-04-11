# -*- coding: utf-8 -*-

import subprocess

from i3pystatus import Status

status = Status(standalone=True)

status.register("clock",
                color="#cccccc",
                format="%H:%M, %A %-d %B",)

status.register("pulseaudio",
                format="🔊 {volume}",)

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
                interface="en0",
                format_up="{bytes_sent} kB/s↑ {bytes_recv} kB/s↓",
                format_down="Internet DOWN",
                dynamic_color = True,
                start_color="gray",
                end_color="yellow",
                color_down="#ff2222",
                )

status.register("disk",
                path="/home/juan",
                color="#bbbbbb",
                #format="{used} / {total}G [ {avail}G ]",)
                format="🏠 {avail}G",)

status.register("disk",
                path="/",
                color="#bbbbbb",
                #format="{used} / {total}G [ {avail}G ]",)
                format="/ {avail}G",)

status.run()
