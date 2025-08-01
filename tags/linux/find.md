# Find command usage:

## Find files and sort it:
  `find . -name *.h -exec dirname {} \; | sort > sorted.txt`

## Find files and run 'bashcov' command for each file
  `find /path/to/your/project -type f -name "*.sh" -exec bashcov {} \;`

## Find and remove remove file (ignoring specified folder)
```
   find . -type f -name tr181-firewall.odl ! -path "*/odl/*" -exec rm -v {}           # Method 1
   find . -type f -name tr181-firewall.odl | grep -v '/odl/' | xargs -I {} rm -v {}   # Method 2
   find . -type f -name tr181-firewall.odl ! -path "*/odl/*" -print0 | xargs -0 rm -v # Method 3
```

- `! -path "*/dir/*"` is a more direct way to exclude paths than using `grep -v`.

- `-print0 and xargs -0` handle filenames with spaces, newlines, or special characters safely.
