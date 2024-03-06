#!/bin/bash

DIRKHELP=.khelp
BASHRC=$HOME/.bashrc

grep "$DIRKHELP/khelp.sh" $BASHRC > /dev/null 2>&1
if [ $? -eq 0 ]; then
	echo "Removing bash alias ..."
	sed -i "/$DIRKHELP/d" $BASHRC
fi

#EOF
