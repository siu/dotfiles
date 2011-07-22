#!/bin/bash

# Restore flash videos, forum thread: https://bbs.archlinux.org/viewtopic.php?pid=901487
procs=$(pidof plugin-container npviewer.bin)
for pid in $procs
do
  find -L /proc/$pid/fd -xtype l | xargs ls -l --time-style=long-iso | grep Flash | awk '{system("cp " $8" "$10)}'
done
