#!/bin/bash

PKGNAME=Khelp
PKGVERSION=1.0c

TOPDIR=$HOME
DIRKHTAGS=$TOPDIR/.khelp/tags

FMTNC='\033[0m'
FMTBYLW='\033[1;33m'
FMTBBLUE='\033[1;34m'

#------------------------------------------
# Khelp utility functions
#------------------------------------------

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
		echo -e "$@"
	fi
}

#------------------------------------------
# Khelp core functions
#------------------------------------------

# Renders a text based list of options that can be selected by the
# user using Up, Down and Enter keys and returns the chosen option.
#   Arguments   : list of options, maximum of 256
#                 "opt1" "opt2" ...
#   Return value: selected index (0 for opt1, 1 for opt2 ...)
khelp_display_menu() {
	# little helpers for terminal print control and key input
	ESC=$( printf "\033")
	cursor_blink_on()  { printf "$ESC[?25h"; }
	cursor_blink_off() { printf "$ESC[?25l"; }
	cursor_to()        { printf "$ESC[$1;${2:-1}H"; }
	print_option()     { printf "  $1 "; }
	print_selected()   { printf " $ESC[7m $1 $ESC[27m"; }
	get_cursor_row()   { IFS=';' read -sdR -p $'\E[6n' ROW COL; echo ${ROW#*[}; }
	key_input()        { read -s -n 3 key 2>/dev/null >&2
	                     if [[ $key = $ESC[A ]]; then echo up;    fi
	                     if [[ $key = $ESC[B ]]; then echo down;  fi
	                     if [[ $key = ""     ]]; then echo enter; fi; }

	# initially print empty new lines (scroll down if at bottom of screen)
	for opt; do printf "\n"; done

	# determine current screen position for overwriting the options
	local lastrow=`get_cursor_row`
	local startrow=$(($lastrow - $#))

	# ensure cursor and input echoing back on upon a ctrl+c during read -s
	trap "cursor_blink_on; stty echo; printf '\n'; exit" 2
	cursor_blink_off

	local selected=0
	while true; do
		# print options by overwriting the last lines
		local idx=0
		for opt; do
			cursor_to $(($startrow + $idx))
			if [ $idx -eq $selected ]; then
				print_selected "$opt"
			else
				print_option "$opt"
			fi
			((idx++))
		done

		# user key control
		case `key_input` in
			enter) break;;
			up)    ((selected--));
			       if [ $selected -lt 0 ]; then selected=$(($# - 1)); fi;;
			down)  ((selected++));
			       if [ $selected -ge $# ]; then selected=0; fi;;
		esac
	done

	# cursor position back to normal
	cursor_to $lastrow
	printf "\n"
	cursor_blink_on

	return $selected
}

exit_if_no_database() {
	if [ ! -d "$DIRKHTAGS" ]; then
		echo "$PKGNAME: Tags database is empty !!!"
		exit 1
	fi
}

exit_if_no_tags() {
	NITEMS=$(ls "$DIRKHTAGS" | wc -l)
	if [ $NITEMS -le 0 ]; then
		echo "$PKGNAME: no tags found !!!"
		echo "  You can add topics at '$DIRKHTAGS' and it will be displayed further."
		echo "  The Tag should be a directory where the topics are located."
		exit 1
	fi
}

exit_if_no_tag_entry() {
	if [ ! -d "$DIRTAG" ]; then
		echo "$PKGNAME: '$TAGNAME' tag is not exist !!!"
		echo "  You can add tags at '$DIRKHTAGS' and it will be displayed further."
		echo "  The Tag should be a directory where the topics are located."
		exit 1
	fi
}

exit_if_no_tag_contents() {
	NITEMS=$(ls "$DIRTAG" | wc -l)
	if [ $NITEMS -le 0 ]; then
		echo "$PKGNAME: no contents in '$TAGNAME' tag !!!"
		echo "  You can add contents at '$DIRTAG' and it will be displayed further."
		echo "  The contents should be in plain text format."
		exit 1
	fi
}

list_tag_items() {
	DIRTAG=$1
	TAGNAME=$(basename $DIRTAG)

	exit_if_no_tags
	exit_if_no_tag_entry
	exit_if_no_tag_contents

	echo "$PKGNAME: listing $NITEMS topics in '$TAGNAME' tag ..."

	for TAGNAME in $(ls "$DIRTAG"); do
		echo "  -- $TAGNAME"
	done
}

list_tags() {
	exit_if_no_database
	exit_if_no_tags

	if [ $# -le 0 ]; then
		echo "$PKGNAME: listing $NITEMS tags ..."
		for TAGNAME in $(ls "$DIRKHTAGS"); do
			echo "  -- $TAGNAME"
		done
	else
		for TAGNAME in $@; do
			list_tag_items $DIRKHTAGS/$TAGNAME
		done
	fi
}

display_contents() {
	TAGNAME=$1
	DIRTAG=$DIRKHTAGS/$TAGNAME

	if [ $# -le 1 ]; then
		tui_display_contents $1
	else
		shift
		for TOPIC in $@; do
			exit_if_no_tag_entry

			if [ ! -f $DIRTAG/$TOPIC ]; then
				echo "$PKGNAME: Topic '$TOPIC' doesn't exist in '$TAGNAME' tags !!!"
				echo "  You can add your own at '$DIRTAG' and it will be displayed further."
				continue
			else
				echo -e "\n${FMTBBLUE}${PKGNAME}${FMTNC}: ${FMTBYLW}${1}/${TOPIC}${FMTNC}\n"
				#echo "Topic: '$TOPIC'"
				$KHVIEW $DIRTAG/$TOPIC
			fi
		done
	fi
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
			display_contents $@
			;;
		esac

	return $?
}

parse_cmdline_options() {
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
				MODE=grep
				shift; grep -nri "$1" $DIRKHTAGS
				exit $?
				shift
				;;
			-l | --list)
				MODE=list
				shift; list_tags $1;
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
			*) echo "$PKGNAME: invalid option '$1'"
				exit 1
				;;
		esac
	done

	#echo "Remaining arguments: $@"
	khelp_worker $@

	return $?
}

tui_display_contents() {
	DIRTAG=$DIRKHTAGS/$1

	exit_if_no_tags
	exit_if_no_tag_entry
	exit_if_no_tag_contents

	KHTAGITEMLIST=$(ls "$DIRTAG")
	KHTAGITEMS=($KHTAGITEMLIST)

	echo "$PKGNAME: Select any topic you wish to explore ..."
	khelp_display_menu $KHTAGITEMLIST

	KHTAGITEMNAME=${KHTAGITEMS[$?]}

	KHTITLE="$PKGNAME: $1/$KHTAGITEMNAME"

	#clear -x
	echo -e "\n${FMTBBLUE}${PKGNAME}${FMTNC}: ${FMTBYLW}${1}/${KHTAGITEMNAME}${FMTNC}\n"

	$KHVIEW $DIRTAG/$KHTAGITEMNAME

	return $?
}

khelp_menu_driver() {
	exit_if_no_database
	exit_if_no_tags

	KHTAGLIST=$(ls "$DIRKHTAGS")
	KHTAGITEM=($KHTAGLIST)

	echo "$PKGNAME: Select any tag to continue ..."
	khelp_display_menu $KHTAGLIST

	KHTAGNAME=${KHTAGITEM[$?]}

	tui_display_contents $KHTAGNAME

	return $?
}

#------------------------------------------
# Main procedure
#------------------------------------------

khelp_main() {
	if [[ $(which mdcat 2>/dev/null) ]]; then
		KHVIEW=mdcat
	else
		KHVIEW=cat
	fi

	if [ $# -lt 1 ]; then
		khelp_menu_driver $@
		exit $?
	fi

	parse_cmdline_options $@

	return $?
}

khelp_main $@

# EOF
