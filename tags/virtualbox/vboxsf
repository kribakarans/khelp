Setting Virtualbox shared folder:

1. Added the host folder to share in Virtualbox settings.

2. Insert Guest Additions CD image to mount the ISO image.

3. Follow the below steps as sudoer
    $ sudo su
    $ apt install gcc make
    $ mkdir --parents /media/cdrom
    $ mount /dev/cdrom /media/cdrom
    $ /media/cdrom/VBoxLinuxAdditions.run
    $ reboot

4. After reboot:
    $ modinfo vboxguest
    $ sudo usermod --append --groups vboxsf -- $USER
    $ sudo adduser $USER vboxsf (optional)
    $ cat /etc/group | grep $USER

5. Now the shared folder is available to the guest.
