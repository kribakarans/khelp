Array in bash shell

SYNTAX:
    ARR=( "element-1" "element-2" "element-3" )

USAGE:
    for VAR in ${ARR[@]}; do
        echo "Array element: '$VAR'"
    done

EXAMPLES:
    a=(one two three)   # array definition
    echo "${a}"         # print first element of array a
    echo "${a[0]}"      # print first element of array a
    echo "${a[1]}"      # print *second* element of array a
    echo "${#a[@]}"     # print number of elements in array a

    If you put single variable in array then you just have an array with single element.

    There are many situations in bash that in combination with other characters
    they can be used as:
        command substitution: $()
        process substitution: <() and >()
        subshell: (command)
        arithmetic evaluation: (())
        function definition: fun () { echo x; }
        pattern list in glob: ?(), *(), +(), @(), !() (only if extglob is enable)
