# Manage Interactive Login:

## Return if non interactive:
### Method 1:
**/etc/bash.bashrc:**
  ```[ -z "$PS1" ] && return

    (or)

  if [ -z "$PS1" ]; then
    return
  fi```

### Method 2:
**~/.bashrc:**
  ```case $- in
      *i*) ;;
        *) return;;
  esac```
