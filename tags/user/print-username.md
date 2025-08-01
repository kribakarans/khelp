Bash command to print user name:

getent passwd $USER | cut -d: -f5 | cut -d, -f1
