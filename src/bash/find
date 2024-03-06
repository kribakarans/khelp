# Find command usage:

## List files
  `find` (or) `find .`

## List files with realpath:
  `find $PWD` (or) `find $(realpath .)`

## Find files with type:
  `find -type f`      # Find regular files
  `find -type d`      # Find directories
  `find -executable`  # Find executables and directories

## Find files and sort it:
  `find . -name *.h -exec dirname {} \; | sort > sorted.txt`

## Find files and run 'bashcov' command for each file
  `find /path/to/your/project -type f -name "*.sh" -exec bashcov {} \;`
