#!/bin/bash

# Utility functions
function error {
	echo
	echo -e "$cRed$1$cDefault"
	echo
	error=true
}
function log {
	echo
	echo -e "$cYellow$1$cDefault"
	echo
}
function success {
	echo
	echo -e "$cGreen$1$cDefault"
}

# Probe for whether a program is installed
function probe {
	if hash $1 2>/dev/null; then
		echo "it doesn't exist"
	fi
	# Otherwise, do nothing.
}

# Installer abstractions
function _install {
	if [ "$OS" == "OSX" ]; then
		sudo brew install
	elif [ "$OS" == "Ubuntu" ] || [ "$OS" == "Gnome" ]; then
		# Don't show any Y/n prompts.
		sudo apt-get install -y $1
	fi
}
function _update {
	if [ "$OS" == "OSX" ]; then
		sudo brew update
	elif [ "$OS" == "Ubuntu" ] || [ "$OS" == "Gnome" ]; then
		# Silent update
		sudo apt-get update -qq
	fi
}
function _gem {
	sudo gem install $1
}
function _npm {
	sudo npm install $1
}
function _npmg {
	sudo npm install -g $1
}