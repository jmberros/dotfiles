from i3pystatus import Module
from subprocess import call


class UpdatesCheck(Module):
    def init(self):
        with open("/home/juan/.check_updates_status", "r") as f:
            status = f.read()

        if status.startswith("0 packages"):
            status = ""

        self.output = {
            "full_text": status,
            "color": "#53db29"
        }
