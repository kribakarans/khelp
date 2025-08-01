# Bash script to run and handle the command exit status

## Method-1: Execute command and check the exit status directly:
```  if <command-line>; then
    echo "Command succeeded"
  else
    echo "Command failed"
  fi
```

## Method-2: Checking failure case:
```  if ! <command-line>; then
    echo "Command failed"
  fi
```
