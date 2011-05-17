#!/bin/bash

# Restore flash videos, forum thread: https://bbs.archlinux.org/viewtopic.php?pid=901487
d=/proc/$(pidof plugin-container npviewer.bin)/fd
find -L $d -xtype l | xargs ls -l | grep Flash | awk '{system("cp " $9" "$11)}'
