import subprocess
import re


from i3pystatus import IntervalModule


class Capslock(IntervalModule):
    """
    Displays text if capslock key is on; blank otherwise.
    """

    settings = (
        ("color", "the color of the text displayed"),
        ("text", "the text to display"),
    )
    color = "#FF3333"
    text = "CAPSLOCK!"
    interval = 1


    def capslock_on(self):
        keyboard_state = subprocess.check_output(["xset", "-q"]).decode("utf-8")
        match = re.search("Caps Lock:   (on|off)", keyboard_state)
        capslock_state = match.group(1)
        return capslock_state == "on"


    def run(self):
        self.full_text = self.text if self.capslock_on() else ""

        self.output = {
            "full_text": self.full_text,
            "color": self.color,
        }
