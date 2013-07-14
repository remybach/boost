#!/bin/bash

echo -e "$cMagenta#===========================================#"
echo -e "        Checking available installers"
echo -e "#===========================================#$cDefault"

if [ "$OS" == "OSX" ] && [ -z "$(probe brew)" ]; then
	log "Installing brew..."
	sleep 2 # Use sleep for the sole reason of being able to see what's going on.

	# TODO: Test this in OSX
	mkdir /usr/local/homebrew && curl -L https://github.com/mxcl/homebrew/tarball/master | tar xz --strip 1 -C /usr/local/homebrew
	
	if [ "$(probe brew)" ]; then
		success "Brew installed."
	else
		error "There was an error installing brew. Please try run boost again, or install it manually. https://github.com/mxcl/homebrew/wiki/Installation"
		exit
	fi
fi

# Installer Sources Update
log "Updating installer sources..."
sleep 2 # Use sleep for the sole reason of being able to see what's going on.

_update

success "Done."

sleep 2
echo