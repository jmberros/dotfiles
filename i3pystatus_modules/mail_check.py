from i3pystatus import IntervalModule
import subprocess


class MailCheck(IntervalModule):
    def run(self):
        try:
            output = subprocess.check_output(["grep", "Subject", "/var/mail/juan"])
            mails = [mail for mail in output.decode("utf-8").split("\n")
                    if "INTERNAL DATA" not in mail and len(mail) > 0]

            count = len(mails)
            msg = "" if count == 0 else "You have mail! ({})".format(count)
        except subprocess.CalledProcessError:
            msg = ""

        self.output = {
            "full_text": msg,
            "color": "#53db29"
        }
