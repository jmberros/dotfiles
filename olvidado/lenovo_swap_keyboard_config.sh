#!/bin/bash 

config="/usr/share/X11/xkb/symbols/pc"
sudo cp ${config}{,.backup}

if grep -q "HOME.*Prior" ${config}; then

    echo "Restore the normal behavior of HOME and END keys"
    echo "sudo cp ~/repos/dotfiles/usr__share__X11__xkb__symbols__pc /usr/share/X11/xkb/symbols/pc" | tee /dev/tty | bash

else

    echo "Swap keys HOME <-> PAGE DOWN and END <-> PAGE UP"
    echo "sudo cp ~/repos/dotfiles/usr__share__X11__xkb__symbols__pc_home_end_pg_down_up_swap /usr/share/X11/xkb/symbols/pc" | tee /dev/tty | bash
fi

