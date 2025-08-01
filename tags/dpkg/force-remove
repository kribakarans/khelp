Removing broken packages in Ubuntu:

Find your package in /var/lib/dpkg/info, for example using: ls -l /var/lib/dpkg/info | grep <package>

1. Move your broken packages to /tmp directory
    sudo mv /var/lib/dpkg/info/<package>.* /tmp/

2. Run the following command:
    sudo dpkg --remove --force-remove-reinstreq <package>

Weblinks:
https://stackoverflow.com/questions/48431372/removing-broken-packages-in-ubuntu
