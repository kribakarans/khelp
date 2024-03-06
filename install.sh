#!/bin/bash

BASHRC=$HOME/.bashrc
DIRKHELP=$HOME/.khelp

chmod +x $DIRKHELP/khelp.sh

grep "$DIRKHELP/khelp.sh" $BASHRC > /dev/null 2>&1
if [ $? -ne 0 ]; then
	echo "Installing bash alias ..."
	echo "alias khelp='$DIRKHELP/khelp.sh'" >> $BASHRC
fi

exit $?

#EOF

