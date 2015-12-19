from i3pystatus import IntervalModule
from os.path import isfile


class Uptime(IntervalModule):
    settings = (
        ("color", "String color"),
    )

    file = "/var/run/reboot-required"
    color = "#ff6633"

    def run(self):
        self.text = ''

        if isfile(self.file):
            with open(self.file, 'r') as f:
                self.text = f.read().rstrip()

        self.output = {
            "full_text": self.text,
            "color": self.color,
        }
