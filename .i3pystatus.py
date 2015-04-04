# -*- coding: utf-8 -*-

import subprocess

from i3pystatus import Status

status = Status(standalone=True)

# Displays clock like this:
# Tue 30 Jul 11:59:46 PM KW31
#                          ^-- calendar week
status.register("clock",
    #format="%A %-d %B, %X KW%V",)
    color="#cccccc",
    format="%A %-d %B, %X",)

# Shows pulseaudio default sink volume
#
# Note: requires libpulseaudio from PyPI
status.register("pulseaudio",
    format="♪ {volume}",)

# Shows the average load of the last minute and the last 5 minutes
# (the default value for format is used)
status.register("load",
    color="#bbbbbb",
    format="{avg1} - {avg5}"
    )

status.register("cpu_usage_graph",
    #format="{usage} {cpu_graph}",
    #graph_width='10',
    #graph_style="blocks",
    start_color="#66d13c", # limegreen
    end_color="#ff6347")

#status.register("uptime",
    #format="Uptime {uptime}")

# Shows your CPU temperature, if you have a Intel CPU
status.register("temp",
    color="#cccccc",
    format="CPU {temp:.0f}°C",)

# The battery monitor has many formatting options, see README for details

# This would look like this, when discharging (or charging)
# ↓14.22W 56.15% [77.81%] 2h:41m
# And like this if full:
# =14.22W 100.0% [91.21%]
#
# This would also display a desktop notification (via dbus) if the percentage
# goes below 5 percent while discharging. The block will also color RED.
status.register("battery",
    battery_ident="BAT1",
    #format="{status} {consumption:.2f}W {percentage:.2f}% [{percentage_design:.2f}%] {remaining:%E%hh:%Mm}",
    format="{status} {percentage:.2f}% ({percentage_design:.2f}%) \[ {remaining:%E%hh:%Mm} \]",
    alert=True,
    alert_percentage=5,
    status={
        "DIS": "Discharging",
        "CHR": "Charging",
        "FULL": "Bat Full!",
    },
    critical_color="#ff6347", # tomato
    color="#fff321", # lemon
    #status={
        #"DIS": "↓",
        #"CHR": "↑",
        #"FULL": "=",
    #},
    )

# Shows disk usage of /
# Format:
# 42/128G [86G]
status.register("disk",
    path="/",
    color="#bbbbbb",
    #format="{used} / {total}G [ {avail}G ]",)
    format="{avail}G",)

# This would look like this:
# Discharging 6h:51m
#status.register("battery",
    #format="{status} {remaining:%E%hh:%Mm}",
    #alert=True,
    #alert_percentage=5,
    #status={
        #"DIS":  "Discharging",
        #"CHR":  "Charging",
        #"FULL": "Bat full",
    #},)

# Displays whether a DHCP client is running
#status.register("runwatch",
    #name="DHCP",
    #path="/var/run/dhclient*.pid",)

# Shows the address and up/down state of eth0. If it is up the address is shown in
# green (the default value of color_up) and the CIDR-address is shown
# (i.e. 10.10.10.42/24).
# If it's down just the interface name (eth0) will be displayed in red
# (defaults of format_down and color_down)
#
# Note: the network module requires PyPI package netifaces
status.register("network",
    interface="eth0",
    #format_up="{v4cidr}",
    format_up="{interface} {network_graph}{kbs}KB/s",
    format_down="", # Hide when there's no ethernet connection
    color_up="#66d13c", # limegreen
    color_down="#ff6347", # tomato
    )

# Has all the options of the normal network and adds some wireless specific things
# like quality and network names.
#
# Note: requires both netifaces and basiciw
status.register("wireless",
    interface="wlan0",
    color_up="#66d13c", # limegreen
    color_down="#ff6347", # tomato
    format_up="{essid} {quality:03.0f}%",
    format_down="{interface} down",
    )

# Shows mpd status
# Format:
# Cloud connected▶Reroute to Remain
#status.register("mpd",
    #format="{title}{status}{album}",
    #status={
        #"pause": "▷",
        #"play": "▶",
        #"stop": "◾",
    #},)

status.register("uname",
    format="{nodename}")

status.run()
