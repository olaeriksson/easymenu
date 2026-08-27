#!/bin/sh

cat << __END_OF_MESSAGE__


This script enables some bash specific features of easymenu,
this will spare the user from needing to press return after
each choice.

PLEASE NOTE  PLEASE NOTE  PLEASE NOTE  PLEASE NOTE

This demo required the bash binary to be availible in
your PATH. It also uses some functions that are not
availible in all versions of bash. Therefor, if it
fails, please give the easymenu-demo.sh demonstration
a try!

PLEASE NOTE  PLEASE NOTE  PLEASE NOTE  PLEASE NOTE


Also note, using bash will make it run a bit slower than normal!

__END_OF_MESSAGE__
printf "%s" "Enable bash enhancements? [yes] "

read resp

if [ -z "$resp" ]; then
	resp="yes"
fi

case $resp in
	[yY]|[yY][eE]|[yY][eE][sS])		# Enable bash mode
		bash bin/easymenu -c "@.READCMD:read -n 1" etc/easymenu.conf-sample
		;;

	*)	# Execute in normal mode
		bin/easymenu etc/easymenu.conf-sample
		;;

esac
