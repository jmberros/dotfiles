#!/usr/bin/python3
# -*- coding: utf-8 -*-

from i3pystatus import Status

status = Status(standalone=True)

status.register("clock",
                color="#cccccc",
                format="%A %-d/%m, %H:%M",)

status.register("battery",
                # format="🔋 {percentage:.0f}% {bar}‖ ⌛ {remaining}",
                format="🔋 {bar}~⌛{remaining}",
                no_text_full=True,
                full_color="#009146",
                color="#E8D100",
                charging_color="#009146",
                critical_color="#FF3D0D")

status.register("mem",
                divisor=10**9,
                color="#4CAF50",
                format="{avail_mem}Gb")

status.register("mem_bar",
                format="RAM:{available_mem_bar}",
                multi_colors=True,
                color="#009146",
                warn_color="#FF9100",
                alert_color="#FF3D0D")

status.register("pulseaudio", format="🔉 {volume}",)

status.register("load",
                color="#bbbbbb",
                critical_limit=8,
                format="💻 {avg1}/{avg5}")

status.register("network",
                interface="wlp3s0",
                format_up="{bytes_sent}↑ {bytes_recv}↓ {essid} {quality}%",
                format_down="{interface} DOWN",
                dynamic_color = True,
                start_color="#cccccc",
                end_color="chartreuse",
                color_down="#ff2222")

status.register("pomodoro",
                pomodoro_duration=25 * 60,
                break_duration=5 * 60,
                long_break_duration=15 * 60,
                sound="/home/juan/Dropbox/pomodoro-sound.wav")

status.register("tea-timer",
                sound="/home/juan/Dropbox/tea-sound.wav")

status.register("disk",
     path="/",
     color="#bbbbbb",
     format="{avail} Gb left")

status.register("capslock")
# ^ text and color are also settings


# Shows disk usage of /
# Format:
# 42/128G [86G]
#  status.register("disk",
     #  path="/",
     #  color="#bbbbbb",
     #  #format="{used} / {total}G [ {avail}G ]",)
     #  format="{avail} Gb left")

#  status.register("disk",
    #  color="#bbbbbb",
    #  path="/media/500gb",
    #  format="{avail}G ({total}G)")

#  status.register("disk",
    #  color="#bbbbbb",
    #  path="/media/600gb",
    #  format="{avail}G ({total}G)")


status.run()
