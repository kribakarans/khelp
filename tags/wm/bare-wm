Setting bare window manager in Ubuntu:20

Platform: Docker VNC server

Steps:
1. Install ubuntu server
   docker pull ubuntu:focal

2. Install Xorg
   apt install xorg

3. Install X11 window managers
   apt install metacity/blackbox/openbox/twm/i3

4. Install VNC server and add the below line to start WM on VNC startup
   /etc/X11/Xsession blackbox

Notes:
We can able to run the GUI apps without window managers directly with Xorg.

Install any GUI program and start it with Xsession
  1. Install Xterm
     apt install xterm

  2. Update the VNC startup with
     /etc/X11/Xsession xterm

  3. Now xterm will run on VNC startup
