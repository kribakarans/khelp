debmake: Debianize package source

Shell_script:
debmake -b ':sh' -t -u 1.0 -r 0 -p <package-name>

Executable:
debmake -t -p <package-name> -u 1.0 -r 0 -x 1 -f 'User Name' -e user@email.com

Shared_library:
debmake -t -p <package-name> -b',lib_name,lib_name-dev' -u 1.0 -r 0 -x 2 -f 'User Name' -e user@email.com
