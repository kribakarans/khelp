# Install a package for the local user
    dpkg --root=$HOME/.local -i package.deb
    [or]
    dpkg --instdir=$HOME/.local --admindir=$HOME/.local/var/lib/dpkg -i example.deb

# With checkinstall command
    sudo checkinstall --install=no --fstrans=no --pkgname=example --pkgversion=1.0 \
                      --pkgarch=x86_64 --maintainer=you@example.com --pkggroup=example \
                      --pkgsource=https://example.com/example-1.0.tar.gz --pkglicense=GPL \
                      make install DESTDIR=~/.local

# Required filesystem
    mkdir -p $HOME/.local/var/lib/dpkg
    mkdir -p $HOME/.local/var/lib/dpkg/info
    touch $HOME/.local/var/lib/dpkg/status
    touch $HOME/.local/var/lib/dpkg/available
    touch $HOME/.local/var/lib/dpkg/updates
    touch $HOME/.local/var/lib/dpkg/diversions

# Other ways:
    dpkg-buildpackage --instdir=~/.local/

    Alternatively, you can also set the DESTDIR environment variable in the 'rules' file
      override_dh_auto_build:
          DESTDIR=~/.local/ dh_auto_build
