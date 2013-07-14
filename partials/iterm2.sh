#!/bin/bash

#===========================================#
#	iTerm2 Check							#
#===========================================#

if [ "$OS" == "OSX" ] && [[ $(ps -ef | grep iTerm | wc -l) -lt 2 ]]; then # Less than 2 because the ps command used to detect this shows up in the output as well (how meta).
	error "You're not using iTerm yet, install this and run this script again using it: http://www.iterm2.com/"
	error "Also, download the Tomorrow Night theme from here: https://raw.github.com/chriskempson/tomorrow-theme/master/iTerm2/Tomorrow%20Night.itermcolors"
	exit
fi