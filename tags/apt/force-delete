force-delete: force delete corrupted packages.

sudo dpkg --remove --force-all <pkg-name>
sudo rm -i /var/lib/dpkg/info/<pkg-name>.*
sudo dpkg --remove --force-remove-reinstreq <pkg-name>
sudo apt-get update
