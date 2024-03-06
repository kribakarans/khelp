# Setup Chroot environment in debian systems

# Install dependencies
    sudo apt-get install debootstrap

# Create directory were to install chroot
    mkdir ./chroot

# Create chroot environment
    sudo debootstrap focal ./chroot/

# Mount required filesystems based on the requirements
    sudo mount --bind /sys  ./chroot/sys/
    sudo mount --bind /dev  ./chroot/dev/
    sudo mount --bind /proc ./chroot/proc/

    Unmount this files after usage

# Run Chroot
    sudo chroot ./chroot/
    sudo chroot ./chroot/ <program>

    Example:
    sudo chroot ./chroot/ bash

# Other stuffs:
# Copy host file to access internet
    cat /etc/os-release
    cp /etc/hosts ~/chroot/ubuntu/bionic/etc/

# Add below prompt in .bashrc
    CHROOT_NAME=trusty-chroot
    export PS1="\e[0;32m\u@$CHROOT_NAME:\[\e[1;34m\]\w\[\e[00m\]$ "
    cd $HOME

# Add new user:
    adduser chroot --home /home/chroot/ --shell /bin/bash

# Give root access
    sudo usermod -aG sudo $USER
    [or]
    Added below line in suders file by 'sudo visudo' (to run command as sudo)
    chroot ALL=(ALL) NOPASSWD: ALL
