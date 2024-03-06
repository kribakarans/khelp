VNC_commands:

vncconfig  -nowin &
vncconfig -iconic &
xsetroot -solid grey

autocutsel -fork
x-window-manager &

x-terminal-emulator -geometry 80x24+10+10 -ls -title "$VNCDESKTOP Desktop" &

Run_commands:
    vncserver -kill :1 && vncserver :1
