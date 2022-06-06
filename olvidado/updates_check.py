from i3pystatus import IntervalModule


class UpdatesCheck(IntervalModule):
    def run(self):
        with open("/home/juan/.check_updates_status", "r") as f:
            status = f.read()

        if status.startswith("0 packages"):
            status = ""

        self.output = {
            "full_text": status,
            "color": "#53db29"
        }
