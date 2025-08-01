#!/bin/bash

set -u

kstat_extension() {
	if [ $# -lt 1 ]; then
		echo "Oops! missing file operand"
		echo "Usage: ${FUNCNAME[0]}: <filename>"
		return 1
	fi

	local _FILE=$1
	local _FILE_BASENAME="$(basename $_FILE)"
	local _FILE_EXTENSION="${_FILE_BASENAME##*.}"

	echo $_FILE_EXTENSION
}

kstat_barename() {
	if [ $# -lt 1 ]; then
		echo "Oops! missing file operand"
		echo "Usage: ${FUNCNAME[0]}: <filename>"
		return 1
	fi

	local _FILE=$1
	local _FILE_BASENAME="$(basename $_FILE)"
	local _FILE_BARENAME="${_FILE_BASENAME%.*}"

	echo $_FILE_BARENAME
}

kstat_basename() {
	if [ $# -lt 1 ]; then
		echo "Oops! missing file operand"
		echo "Usage: ${FUNCNAME[0]}: <filename>"
		return 1
	fi

	local _FILE=$1

	basename $_FILE
}

kstat_dirname() {
	if [ $# -lt 1 ]; then
		echo "Oops! missing file operand"
		echo "Usage: ${FUNCNAME[0]}: <filename>"
		return 1
	fi

	local _FILE=$1

	dirname $_FILE
}

export -f kstat_dirname
export -f kstat_basename
export -f kstat_barename
export -f kstat_extension

# EOF
