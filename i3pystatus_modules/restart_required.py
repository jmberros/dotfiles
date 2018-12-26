from i3pystatus import IntervalModule
from os.path import isfile


class RestartRequired(IntervalModule):
    settings = (
        ("color", "String color"),
        ("message", "Message in case restart is required"),
    )

    reboot_req_file = "/var/run/reboot-required"
    color = "#ff6633"
    message = "Restart Required!"

    def run(self):
        self.text = ''

        if isfile(self.reboot_req_file):
            with open(self.reboot_req_file, 'r') as f:
                self.text = f.read().rstrip()

        if not self.text == "*** System restart required ***":
            self.message = ""

        self.output = {
            "full_text": self.message,
            "color": self.color,
        }
