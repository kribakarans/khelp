# Download the .deb file of the package to the current directory
    sudo apt-get download package-name

# Download the .deb file to a specific directory
    sudo apt-get -o dir::cache=$HOME/.local/ download package-name

