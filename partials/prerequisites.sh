#!/bin/bash

echo -e "$cMagenta#===========================================#"
echo -e "                Prerequisites"
echo -e "#===========================================#$cDefault"

# Curl
if [ -z "$(probe curl)" ]; then
	_install curl
fi
if [ -z "$(probe curl)" ]; then
	log "No curl installation detected."

	log "Proceeding to install curl..."
	sleep 2
	
	_install curl
	
	if [ $(probe curl) ]; then
		success "curl installed."
	else
		error "There was an error installing curl. Please try run boost again, or install it manually. http://curl.haxx.se/download.html"
		exit
	fi
else
	success "curl is already installed."
fi

sleep 2
echo

# Git
if [ -z "$(probe git)" ]; then
	log "No git installation detected."

	log "Proceeding to install git..."
	sleep 2
	
	_install git
	
	if [ "$(probe git)" ]; then
		success "Git installed."
	else
		error "There was an error installing git. Please try run boost again, or install it manually. http://git-scm.com/download/"
		exit
	fi
else
	success "Git is already installed."
fi

sleep 2
echo