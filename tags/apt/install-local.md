# Install the package binaries in a custom path
    sudo apt-get source package-name
    cd package-name-version
    sudo checkinstall -D --install=no --fstrans=yes --pakdir=$HOME/.local/ make install

# Install the package files in a custom path, but not the package binaries
    apt-get -o dir::cache=$HOME/.local/var/cache/apt -o dir::state=$HOME/.local/var/lib/apt update
    apt-get -o dir::cache=$HOME/.local/var/cache/apt -o dir::state=$HOME/.local/var/lib/apt install package-name
