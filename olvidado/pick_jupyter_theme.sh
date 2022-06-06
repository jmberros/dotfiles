#!/bin/bash 

new_theme=$1

if [ -z $new_theme ]; then  # No arguments, print help
    printf "\nUsage: ./`basename $0` theme_name\n"
    printf "Themes available:\n\n"

    ls ~/.jupyter/custom/*.css | grep -v custom.css | ruby -F'/' -lane 'theme = $F[-1].gsub(".css", "");  puts "  * #{theme}"'

    while true; do
        echo
        read -p "Type the theme you want: " new_theme

        if [ -z $new_theme ]; then
            "Please choose a theme of exit with CTRL^C, kpo."
        else
            break
        fi
    done
fi

echo "cp ~/.jupyter/custom/{${new_theme},custom}.css" | tee /dev/tty | bash
echo "Reload the notebook (no need to restart the kernel)."
