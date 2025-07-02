# Khelp: Display information about predefined topics

### Usage: `khelp [options] [topic-name] [content-name]`

### Options:
```
Options:
    -g  --grep     -- Grep topic or contents
    -l  --list     -- List topics under specified tag
    -t  --tags     -- List tag names that are available
    -v  --version  -- Print package version
    -h  --help     -- Show this help menu

More options:
    khelp list topic-1 topic-2 ...      -- Similar to --list. In addition, it accepts multiple inputs
    khelp [grep PATTERN |help|version]  -- Similar to the respective long options mentioned above
```

## How to use Khelp?
### Display info about `array` in `bash` tag
#### `$ khelp bash array`
```
bash-array: Array in bash script

SYNTAX:
    ARR=( "element-1" "element-2" "element-3" )

USAGE:
    for VAR in ${ARR[@]}; do
        echo "Array element: '$VAR'"
    done
```

### Display multiple help contents of `bash` tag
#### `$ khelp bash array fun`
```
bash-array: Array in bash script

SYNTAX:
    ARR=( "element-1" "element-2" "element-3" )

USAGE:
    for VAR in ${ARR[@]}; do
        echo "Array element: '$VAR'"
    done

fun: function in bash script

USAGE:
    function()
    {
        # Parameter validation
        if [ $# -lt 1 ]; then
            echo "${FUNCNAME[0]}: invalid arguments !!!"
            echo "Usage: ${FUNCNAME[0]} [FILE]..."
            echo "       Write description here."
            return 1
        fi


        #
        # Functionality
        #
    }
```

### Grep patterns in all tags
#### `$ khelp --grep hello`
```
/khelp/tags/docker/nosudo:17:      docker run hello-world
```

#### `$ khelp grep hello`
```
Khelp: 'hello' pattern search ...
/khelp/tags/docker/nosudo:17:      docker run hello-world
```

### List all Khelp tags:
#### `$ khelp --tags`
```
Khelp: listing 3 tags ...
  -- apt
  -- bash
  -- docker
```

### List all topics in the specified tag:
#### `$ khelp --list apt`
```
Khelp: listing 3 topics in 'apt' tag ...
  -- add-ppa
  -- force-delete
  -- release-info
```

### List all topics in multiple tags
#### `$ khelp list apt bash`
```
Khelp: listing 3 topics in 'apt' tag ...
  -- add-ppa
  -- force-delete
  -- release-info
Khelp: listing 2 topics in 'bash' tag ...
  -- array
  -- fun
```
