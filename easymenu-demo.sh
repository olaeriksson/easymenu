#!/bin/sh


sysname="`uname -s`"
case $sysname in
	*solaris* | *SunOS*)
			# Solaris /bin/sh lacks some needed features
			printf "%s\n" "WARNING - I'v detected that you are running the"
			printf "%s\n" "Sun Solaris operating environment. In normal operations,"
			printf "%s\n" "Easymenu uses the /bin/sh command interpreter, but"
			printf "%s\n" "the standard version provided with Solaris lacks some"
			printf "%s\n" "of the functions needed, which will break the execution"
			printf "%s\n" "of Easymenu. Although, the korn shell (ksh) interpreter"
			printf "%s\n" "which comes with Solaris is able to run Easymenu."
			printf "%s\n" ""
			printf "%s\n" "Note: If you choose to not use ksh, some alternative"
			printf "%s\n" "methods will be used to work around the problem,"
			printf "%s\n" "although, these will slow down the process quite alot."
			printf "%s\n" ""
			printf "%s" "Do you want to use ksh to execute easymenu? [yes] "
			
			read resp
			resp=${resp:-"yes"}
			case $resp in
				[yY]|[yY][eE]|[yY][eE][sS])			# Use ksh to execute easymenu
					ksh bin/easymenu etc/easymenu.conf-sample
					;;

				*)	# Use alternative methods
					bin/easymenu -o etc/easymenu.conf-sample
					;;
			esac
			
			;;

	*)
			# Default action
			# Execute Easymenu with a demo configuration file
			bin/easymenu etc/easymenu.conf-sample
			;;

esac
