from i3pystatus import IntervalModule
import subprocess


class MailCheck(IntervalModule):
    def run(self):
        output = subprocess.check_output(["grep", "Subject", "/var/mail/juan"])
        mails = [mail for mail in output.decode("utf-8").split("\n")
                 if "INTERNAL DATA" not in mail and len(mail) > 0]

        count = len(mails)
        msg = "" if count == 0 else "You have mail! ({})".format(count)

        with open("/home/juan/testing_mail_script", "w") as f:
            f.write(str(mails))

        self.output = {
            "full_text": msg,
            "color": "#53db29"
        }
