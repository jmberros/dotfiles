#!/bin/python3

import os
import random
from glob import glob
import subprocess


dir_ = "/home/juan/Dropbox/Fotos/wpp/vaporwave"
pics = glob(os.path.join(dir_, "*"))
pic = random.choice(pics)
command = ["feh", "--bg-fil", pic]
output = subprocess.check_output(command)

with open("/tmp/random_wpp.log", "a+") as f:
    f.write(" ".join(command) + "\n")
    if output:
        f.write(str(output) + "\n")
    f.write("---\n")

