Xstatup file for VNC server:

For Gnome desktop:
    #!/bin/sh
    vncconfig -iconic &
    dbus-launch --exit-with-session gnome-session &

For XFCE desktop:
    #!/bin/sh
    vncconfig  -nowin &
    autocutsel -fork
    i3 &
