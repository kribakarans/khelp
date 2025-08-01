#!/bin/bash

set -u

FMTNC='\033[0m'
FMTBRED='\e[1;31m'
FMTBYLW='\033[1;33m'
FMTBBLUE='\033[1;34m'

#------------------------------------------
# Khelp utility functions
#------------------------------------------

echo_info() {
	echo -e "${FMTBYLW}$@${FMTNC}" >&2
}

echo_error() {
	echo -e "${FMTBRED}$@${FMTNC}" >&2
}

echo_tag() {
	echo -e "  -- ${FMTBBLUE}$@${FMTNC}"
}

echo_tag_items() {
	echo "  -- ${FMTBYLW}$@${FMTNC}"
}

execv() {
	set -v
	eval $@
	EVAL=$?
	set +v

	return $EVAL
}

execit() {
	echo_info "$@"
	eval $@
	EVAL=$?

	return $EVAL
}

print_usage() {
	cat <<-USAGE
	Usage: khelp [options] [topic-name] [content-name]
	Khelp display information about predefined topics.

	Options:
	    -g  --grep     -- Grep topic or contents
	    -l  --list     -- List topics under specified tag
	    -t  --tags     -- List tag names that are available
	    -v  --version  -- Print package version
	    -h  --help     -- Show this help menu

	More options:
	    khelp list topic-1 topic-2 ...      -- Similar to --list. In addition, it accepts multiple inputs
	    khelp [grep PATTERN |help|version]  -- Similar to the respective long options mentioned above
	USAGE

	exit 0
}

print_version() {
	echo "$PKGNAME: Version $PKGVERSION - Display information about topics."
	exit 0
}

print_debug() {
	if [ $VERBOSE -eq 1 ]; then
		echo -e "$@" >&2
	fi
}

exit_if_no_database() {
	if [ ! -d "$DIRKHTAGS" ]; then
		echo_error "${FMTBBLUE}${PKGNAME}:${FMTBRED} Tags database is empty !!!"
		exit 1
	fi
}

exit_if_no_tags() {
	local NITEMS=$(ls "$DIRKHTAGS" | wc -l)

	if [ $NITEMS -le 0 ]; then
		echo_error "${FMTBBLUE}${PKGNAME}:${FMTBRED} no tags found !!!"
		echo_info  "  You can add topics at '${FMTBBLUE}${DIRKHTAGS}${FMTBYLW}' and it will be displayed further."
		echo_info  "  The Tag should be a directory where the topics are located."
		exit 1
	fi
}

exit_if_no_tag_entry() {
	local DIRTAG=$1
	local TAGNAME=$(basename $DIRTAG)

	if [ ! -d "$DIRTAG" ]; then
		echo_error "${FMTBBLUE}${PKGNAME}:${FMTBRED} '${FMTBYLW}${TAGNAME}${FMTBRED}' tag is not exist !!!"
		echo_info  "  You can add tags at '${FMTBBLUE}${DIRKHTAGS}${FMTBYLW}' and it will be displayed further."
		echo_info  "  The Tag should be a directory where the topics are located."
		exit 1
	fi
}

exit_if_no_tag_items() {
	local DIRTAG=$1
	local TAGNAME=$(basename $DIRTAG)
	local NITEMS=$(ls "$DIRTAG" | wc -l)

	if [ $NITEMS -le 0 ]; then
		echo_error "${FMTBBLUE}${PKGNAME}:${FMTBRED} no items in '${FMTBBLUE}${TAGNAME}${FMTBYLW}' tag !!!"
		echo_info  "  You can add new tag entries at '${FMTBBLUE}${DIRTAG}${FMTBYLW}' and it will be displayed further."
		echo_info  "  The tag entries should be in plain text or .md file format."
		exit 1
	fi
}

exit_if_no_tag_file() {
	local TAGFILE=$1

	if [ $TAGFILE -le 0 ]; then
		echo_error "${FMTBBLUE}${PKGNAME}:${FMTBRED} no items in '$TAGNAME' tag !!!"
		echo_info  "  You can add new tag entries at '$DIRTAG' and it will be displayed further."
		echo_info  "  The tag entries should be in plain text or .md file format."
		exit 1
	fi
}

list_tag_items() {
	local NITEMS=0
	local DIRTAG=$1
	local TAGNAME=$(basename $DIRTAG)

	exit_if_no_tags
	exit_if_no_tag_entry $DIRTAG
	exit_if_no_tag_items $DIRTAG

	NITEMS=$(ls "$DIRTAG" | wc -l)
	echo_info "${FMTBBLUE}${PKGNAME}: ${FMTBYLW}listing ${NITEMS} topics in ${FMTBBLUE}'${TAGNAME}' ${FMTBYLW}tag ...${FMTNC}"

	for TAGNAME in $(ls "$DIRTAG"); do
		echo "  -- $TAGNAME"
	done
}

list_tags() {
	local NITEMS
	local DIRTAG
	local TAGNAME

	exit_if_no_database
	exit_if_no_tags

	if [ $# -lt 1 ]; then
		DIRTAG=$DIRKHTAGS
	else
		DIRTAG=$DIRKHTAGS/$1
	fi

	NITEMS=$(ls "$DIRTAG" | wc -l)
	if [ $# -le 0 ]; then
		echo_info "${FMTBBLUE}${PKGNAME}: ${FMTBYLW}listing ${NITEMS} tags ...${FMTNC}"
		for TAGNAME in $(ls "$DIRKHTAGS"); do
			echo_tag "$TAGNAME"
		done
	else
		for TAGNAME in $@; do
			list_tag_items $DIRKHTAGS/$TAGNAME
		done
	fi
}

#------------------------------------------
# Khelp core functions
#------------------------------------------

# Renders a text based list of options that can be selected by the
# user using Up, Down and Enter keys and returns the chosen option.
#   Arguments   : list of options, maximum of 256
#                 "opt1" "opt2" ...
#   Return value: Index value of the selected entry 0, 1, 2 ...
khelp_display_menu_worker() {
	local ESC CURSOR_ON CURSOR_OFF FMT_RESET FMT_HL
	local OPTS LASTROW STARTROW SELECTED_ITEM IDX

	# Store all options in an array
	OPTS=("$@")

	# Define ANSI codes and other constants
	ESC=$(printf "\033")
	CURSOR_ON="$ESC[?25h"
	CURSOR_OFF="$ESC[?25l"
	FMT_RESET="$ESC[0m"
	FMT_HL="$ESC[7m"

	# Encapsulated functions
	dm_cleanup() {
		dm_cursor_blink_on
		stty echo
		printf "\n"
	}

	dm_exit() {
		dm_cleanup
		# echo_error 'Exited.'
		exit 1
	}

	dm_key_input() {
		read -rsn1 KEY 2>/dev/null >&2
		case $KEY in
			$ESC)
				read -rsn2 KEY 2>/dev/null >&2
				case $KEY in
					"[A")
						echo up
						;;
					"[B")
						echo down
						;;
					*)
						# Handle other escape sequences if needed
						;;
				esac
				;;
			q)
				echo quit
				;;
			"")
				echo enter
				;;
			*)
				# Handle any other key presses if needed
				;;
		esac
	}

	dm_print_option() {
		local FILE=$1
		local BARENAME="${FILE%.*}"

		if [ -z $FILE ]; then
			echo_error "ERROR: dm_print_option() :: invalid input."
			return 1
		fi

		echo "  $BARENAME "
	}

	dm_print_selected() {
		local FILE=$1
		local BARENAME="${FILE%.*}"

		if [ -z $FILE ]; then
			echo_error "ERROR: dm_print_selected() :: invalid input."
			return 1
		fi

		echo -e " $ESC[7m $BARENAME $ESC[27m"
	}

	dm_cursor_blink_on()  { printf "$CURSOR_ON";        }
	dm_cursor_blink_off() { printf "$CURSOR_OFF";       }
	dm_cursor_to()        { printf "$ESC[$1;${2:-1}H";  }
	dm_get_cursor_row()   { local ROW COL; IFS=';' read -sdR -p $'\E[6n' ROW COL; echo ${ROW#*[}; }

	# Menu driver definition
	# Initially print empty new lines (scroll down if at bottom of screen)
	for OPT in "${OPTS[@]}"; do
		printf "\n";
	done

	# Determine current screen position for overwriting the options
	LASTROW=$(dm_get_cursor_row)
	STARTROW=$(($LASTROW - ${#OPTS[@]}))

	# Signal handling
	trap "dm_exit; return 1;" SIGINT
	dm_cursor_blink_off

	SELECTED_ITEM=0
	while true; do
		# Print options by overwriting the last lines
		IDX=0
		for OPT in "${OPTS[@]}"; do
			dm_cursor_to $(($STARTROW + $IDX))
			if [ $IDX -eq $SELECTED_ITEM ]; then
				dm_print_selected "$OPT"
			else
				dm_print_option "$OPT"
			fi
			((IDX++))
		done

		# User key control
		case $(dm_key_input) in
			enter) break;;
			up)    ((SELECTED_ITEM--)); [ $SELECTED_ITEM -lt 0 ] && SELECTED_ITEM=$((${#OPTS[@]} - 1));;
			down)  ((SELECTED_ITEM++)); [ $SELECTED_ITEM -ge ${#OPTS[@]} ] && SELECTED_ITEM=0;;
			quit)  dm_exit; return 1;;
		esac
	done

	# Cursor position back to normal
	dm_cursor_to $LASTROW
	printf "\n"
	dm_cursor_blink_on

	return $SELECTED_ITEM
}

khelp_worker() {
	exit_if_no_database
	exit_if_no_tags

	case $1 in
		grep)
			shift
			if [ $# -lt 1 ]; then
				echo "$PKGNAME: grep: missing search pattern !!!"
			else
				echo "$PKGNAME: '$1' pattern search ..."
				grep -nri "$1" $DIRKHTAGS
			fi
			exit $?
			;;
		list)
			shift; list_tags $@
			;;
		help)
			print_usage
			;;
		version)
			print_version
			;;
		*)
			khelp_inline_tag_handler $@
			;;
		esac

	return $?
}

khelp_parse_cmdline() {
	if [ $# -lt 1 ]; then
		echo_error "Oops! missing arguments"
		echo_info  "Try 'khelp --help' for more information."
		return 1
	fi

	GETOPTS=$(getopt -o g:l:tvh --long grep:,list:,tags,help,version -- "$@")
	if [ "$?" != "0" ]; then
		echo "Try 'khelp --help' for more information."
		exit 1
	fi

	eval set -- "$GETOPTS"
	while :
	do
		case "$1" in
			-g | --grep)
				shift;
				echo_info "${FMTBBLUE}${PKGNAME}:${FMTNC} ${FMTBYLW}Grep ...${FMTNC}"
				grep -nr $@ $DIRKHTAGS
				exit $?
				shift
				;;
			-l | --list)
				shift;
				list_tags $1;
				exit $?
				shift
				;;
			-t | --tags)
				list_tags;
				exit $?
				shift
				;;
			-v | --version)
				print_version
				shift
				;;
			-h | --help)
				print_usage
				shift
				;;
			--) shift; break ;; # -- means the End of the arguments
			*) echo_error "$PKGNAME: invalid option '$1'"
				exit 1
				;;
		esac
	done

	#echo "Remaining arguments: $@"
	khelp_worker $@

	return $?
}

# EOF
