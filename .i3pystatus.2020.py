#!/usr/bin/python3
# -*- coding: utf-8 -*-

from i3pystatus import Status

status = Status(standalone=True)

#  status.register("weather",
#                  location_code="ARXX2499:1:AR",
#                  interval=300,
#                  format="☁️ {current_temp} {humidity}%")

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

status.register("mem_bar",
                format="RAM:{used_mem_bar}",
                multi_colors=True,
                color="#009146",
                warn_color="#FF9100",
                alert_color="#FF3D0D")

status.register("mem",
                divisor=10**9,
                color="#4CAF50",
                format="{avail_mem}Gb")

# status.register("updates",
                # format = "{count} update(s) available",
                # format_no_updates = "",
                # backends = [aptget.AptGet()])

status.register("backlight",
                backlight="intel_backlight",
                format="🔆 {brightness}/{max_brightness}")

status.register("pulseaudio",
                format="🔉 {volume}",)

status.register("now_playing",
                color="#ff75af",
                format='🎶 {artist}, {title}')

status.register("load",
                color="#bbbbbb",
                critical_limit=8,
                format="💻 {avg1}/{avg5}")

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
                # format_up="{bytes_sent}↑ {bytes_recv}↓ {essid}",
                format_up="{bytes_sent}⬆️ {bytes_recv}⬇️",
                format_down="{} {interface} DOWN",
                dynamic_color = True,
                start_color="#cccccc",
                end_color="yellow",
                color_down="#ff6347", # tomato
                )

# Shows disk usage of /
# Format:
# 42/128G [86G]
#  status.register("disk",
#       path="/",
#       color="#bbbbbb",
#       #format="{used} / {total}G [ {avail}G ]",)
#       format="{avail} Gb")

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

status.register("pomodoro",
                sound="/home/juan/Dropbox/glass_ping.wav")

status.run()
