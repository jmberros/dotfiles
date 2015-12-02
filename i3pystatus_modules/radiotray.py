from i3pystatus import IntervalModule
from dbus import SessionBus


class Radiotray(IntervalModule):
    """
    Displays current radio and song from Radiotray

    .. rubric:: Available formatters (uses :ref:`formatp`)

    * `{song}` — (Current artist and song)
    * `{radio}` — (Current radio name)
    """

    settings = (
        ("format", "formatp string"),
        ("color", "Text color"),
    )

    format = "♫ {song}"

    def run(self):
        radiotray = SessionBus().get_object("net.sourceforge.radiotray",
                                            "/net/sourceforge/radiotray")
        cdict = {
            "radio": str(radiotray.getCurrentRadio()),
            "song": str(radiotray.getCurrentMetaData()),
        }

        if "not playing" in cdict["radio"]:
            full_text = ""
        else:
            full_text = self.format.format(**cdict)

        self.output = {
            "full_text": full_text,
            "color": self.color,
        }
