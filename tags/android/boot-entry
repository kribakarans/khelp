Install Android x86 with Ubuntu:

- Download the Android x86 ISO file
- Create the directories /android and /android/data
- Extract initrd.img, ramdisk.img, kernel and system.* from the ISO file to the /android directory
- The ramdisk.img can be ignored for Android 10+
- Create the grub entry for respective android image shown below in one of the below files
  /etc/grub.d/40_custom (or)
  /etc/grub.d/proxifiedScripts/custom
- Run 'sudo update-grub'
- Alternatively use 'grub-customizer' to add new grub entry and save and exit

Android OS:
  menuentry "Android OS"{
    linux /android/kernel quiet root=/dev/ram0
    initrd /android/initrd.img
    linux /android/kernel quiet root=/dev/ram0 androidboot.hardware=android_x86 SRC=/android
    initrd /android/initrd.img
  }

Bliss OS:
  menuentry "Android Bliss"{
    linux /blissos/kernel FFMPEG_CODEC=1 FFMPEG_PREFER_C2=1 quiet root=/dev/ram0 SRC=/blissos
    initrd /blissos/initrd.img
  }

Prime OS:
  menuentry "Prime OS"{
    #insmod part_gpt
    #search --file --no-floppy --set=root /primeos/system.sfs
    linux /primeos/kernel root=/dev/ram0 androidboot.selinux=permissive buildvariant=userdebug SRC=/primeos
    initrd /primeos/initrd.img
  }

Remix OS:
  menuentry "RemixOS" {
    linux /remix/kernel root=/dev/ram0 androidboot.hardware=remix_x86_64 androidboot.selinux=permissive quiet SERIAL=random logo.showlogo=1 SRC= DATA= CREATE_DATA_IMG=1
    initrd /remix/initrd.img
  }

Weblinks:
https://docs.blissos.org/installation/manual-install-on-linux
https://techposts.org/installing-remix-os-hdd-using-ubuntu-linux-os.html
https://www.fosslicious.com/2022/01/easy-install-prime-os-2-on-linux.html
https://itsfoss.community/t/install-primeos-on-ubuntu-or-any-other-distro/7405
https://unix.stackexchange.com/questions/492587/add-prime-os-android-x86-x64-to-grub-menu
https://techposts.org/installing-remix-os-hdd-using-ubuntu-linux-os/
https://deepakpk.medium.com/how-to-dual-boot-remixos-with-ubuntu-c7ee2d973f72
