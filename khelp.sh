#!/bin/bash


PKGNAME=Khelp
PKGVERSION=1.0

TOPDIR=$HOME
DIRKHTAGS=$TOPDIR/.khelp/tags

#------------------------------------------
# Khelp utility functions
#------------------------------------------

print_usage() {
	cat <<-USAGE
	Usage: khelp [options] [topic-name] [search-pattern]
	Khelp display information about pre-defined topics.

	Options:
	    -g  --grep     -- Grep topic or contents
	    -l  --list     -- List topics under specified tag
	    -t  --tags     -- List tag names that are available
	    -v  --version  -- Print package version
	    -h  --help     -- Show this help menu
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
	for TAGNAME in $(ls "$DIRTAG")
	do
		echo "  -- $TAGNAME"
	done
}

list_tags() {
	exit_if_no_database
	exit_if_no_tags

	if [ $# -le 0 ]; then
		echo "$PKGNAME: listing $NITEMS tags ..."
		for TAGNAME in $(ls "$DIRKHTAGS")
		do
			echo "  -- $TAGNAME"
		done
	else
		for TAGNAME in $@
		do
			list_tag_items $DIRKHTAGS/$TAGNAME
		done
	fi
}

display_contents() {
	TAGNAME=$1
	DIRTAG=$DIRKHTAGS/$TAGNAME

	if [ $# -le 1 ]; then
		list_tag_items $DIRTAG
	else
		shift
		for TOPIC in $@
		do
			exit_if_no_tag_entry

			if [ ! -f $DIRTAG/$TOPIC ]; then
				echo "$PKGNAME: Topic '$TOPIC' doesn't exist in '$TAGNAME' tags !!!"
				echo "  You can add your own at '$DIRTAG' and it will be displayed further."
				continue
			else
				echo "Topic: '$TOPIC'"
				more $DIRTAG/$TOPIC
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
			*) echo "Invalid option: $1"
				exit 1
				;;
		esac
	done

	#echo "Remaining arguments: $@"
	khelp_worker $@

	return $?
}

#------------------------------------------
# Main procedure
#------------------------------------------

khelp_main() {
	if [ $# -lt 1 ]; then
		print_usage
		exit 1
	fi

	parse_cmdline_options $@

	return $?
}

khelp_main $@

# EOF

