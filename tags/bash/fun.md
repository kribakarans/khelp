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
