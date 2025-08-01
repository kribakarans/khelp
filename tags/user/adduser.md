# Add new user
    useradd <username>    # Create only the user enrty
    useradd <username> -m # Create user and home directory
    adduser <username> --home /home/<username> --shell /bin/bash
    useradd <username> -m -d /home/<username> -s /bin/bash <username>

    Examples:
    adduser username
    adduser username --home /home/username --shell /bin/bash

    useradd options (see: man useradd):
        -r, --system Create a system account
        -m, --create-home Create the user's home directory
        -d, --home-dir HOME_DIR Home directory of the new account
        -s, --shell SHELL Login shell of the new account
        -g, --gid GROUP Name or ID of the primary group
        -G, --groups GROUPS List of supplementary groups
        -p, --password PASSWORD Encrypted password of the new account
        -u, --uid UID Specify user ID

# Add new group and new user
    groupadd -g 1000 <username>
    useradd -d /home/<username> -s /bin/bash -m <username> -u 1000 -g 1000

    Examples:
    groupadd -g 1000 username
    useradd -d /home/username -s /bin/bash -m username -u 1000 -g 1000

# Adding the new user to the sudo group
    groups <username>           # To list the groups of the user belongs to
    usermod -aG sudo <username> # Add the new user to a sudo group

    Examples:
    usermod -aG sudo username
    usermod -aG vboxusers username

# Alternate way to add user in sudo group
    If you are signed as root user type 'visudo' and add the below entry
    <username> ALL=(ALL:ALL) ALL

# Delete a user
    deluser <username>               # Delete only the user
    deluser --remove-home <username> # Delete user entry and home directory
