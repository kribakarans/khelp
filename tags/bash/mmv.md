# MMV command usage

## mmv to rename files with extensions .ab and .abc to .zip like this:
```
mmv "*.ab" "#1.zip"
mmv "*.abc" "#1.zip"
```

## Ensure no file overwrites happen, use the -n flag first to preview the changes:
```
mmv -n "*.ab" "#1.zip"
mmv -n "*.abc" "#1.zip"
```

## Rename all files with any extension to have a .zip extension:
```
mmv '*.*' '#1.zip'
```
