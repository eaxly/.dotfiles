#!/usr/bin/env bash
for font in $(\ls --hide=fonts/ /usr/share/figlet); do
    echo $font:
    toilet -f $font "$font" 2> /dev/null
done
