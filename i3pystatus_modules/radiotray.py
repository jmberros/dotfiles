from i3pystatus import IntervalModule
from dbus import SessionBus
from re import search


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

    format = "♫ {song} @ '{radio}'"

    def run(self):
        radiotray = SessionBus().get_object("net.sourceforge.radiotray",
                                            "/net/sourceforge/radiotray")

        radio_full_name = str(radiotray.getCurrentRadio())
        matches = search("~ ([^\(]*)", radio_full_name)
        radio_short_name = matches.group(1).rstrip() if matches else radio_full_name

        cdict = {
            "radio": radio_short_name,
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
