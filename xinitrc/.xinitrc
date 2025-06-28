#!/bin/sh

# Hide X session files
USERXSESSION="$XDG_CACHE_HOME/x11/xsession"
USERXSESSIONRC="$XDG_CACHE_HOME/x11/xsessionrc"
ALTUSERXSESSION="$XDG_CACHE_HOME/x11/Xsession"
ERRFILE="$XDG_CACHE_HOME/x11/xsession-errors"

# Startup Applications
## Ensure Xresources is read before window manager starts
xrdb -merge ~/.Xresources

## If the device is a laptop and `Xmodmap` if Xmodmap exists load it
[ "$(hostnamectl chassis)" = "laptop" ] && [ -e ~/.Xmodmap ] && xmodmap ~/.Xmodmap

## Set up monitor resolutions and positions
command -v monitorSwapper && monitorSwapper; monitorSwapper

## Set a random wallpaper
command -v setWallpaper && setWallpaper

## Set up blur/transparency
command -v picom && picom -c -l0 -t0 -r0 -o.00 &

## Hide mouse cursor when it is not being used
command -v unclutter && unclutter &

## Enable davmail
# command -v davmail && davmail   &

## Enable desktop notifications
command -v dunst && dunst     &

## Auto-start applications
# command -v dex && dex -a

## Start nextcloud daemon
# command -v nextcloud && nextcloud --background

## Enable dwm status bar code
dwmblocks 2>&1 >/dev/null &

## When using a your dumb keyboard can't change key maps
## Note that this also runs 'xmodmap ~/.Xmodmap'
##swapkeys

## Used to solve seahorse issues with custom xinitrc
## https://wiki.archlinux.org/title/GNOME/Keyring
# source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

# Relaunch DWM if the binary changes, otherwise bail
 csum=""
 new_csum=$(sha1sum $(which dwm))
while true
do
    if [ "$csum" != "$new_csum" ]
    then
        csum=$new_csum
        dwm
    else
        exit 0
    fi
    new_csum=$(sha1sum $(which dwm))
    sleep 0.5
done
