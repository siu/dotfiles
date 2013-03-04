#!/bin/sh

#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
#

# exec gnome-session
# exec startkde
# exec startxfce4
# exec icewm
# exec openbox
# exec blackbox
# exec fluxbox
# exec ratpoison
# exec dwm
# ... or any other WM of your choosing ...
#exec xterm
#exec startfluxbox

#xcompmgr &
#wicd-client &
#xscreensaver -no-splash &
#(sleep 1; awsetbg $WALLPAPER )&
#numlockx

~/.bash_utils/swapkb us
exec awesome


