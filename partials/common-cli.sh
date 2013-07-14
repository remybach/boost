#!/bin/bash

echo -e "$cMagenta#===========================================#"
echo -e "#             Common CLI tools"
echo -e "#===========================================#$cDefault"

#===== rvm and Ruby =====#
if [ -z "$(probe ruby)" ]; then
	# TODO: Test this in OSX
	log "Installing rvm and Ruby..."
	sleep 2

	curl -L get.rvm.io | zsh -s stable --auto
	source /etc/profile.d/rvm.sh

	if [ -z "$(probe gem)" ]; then
		_install rubygems
	fi

	if [ "$(probe ruby)" ]; then
		success "rvm and ruby installed."
	else
		error "There was an error installing rvm and ruby. Please try run boost again, or install them manually. https://rvm.io/"
		exit
	fi
fi

#===== Compass =====#
if [ -z "$(probe compass)" ]; then
	log "Installing compass..."
	sleep 2

	gem update --system
	_gem compass

	if [ "$(probe compass)" ]; then
		success "Compass installed."
	else
		error "There was an error installing Compass. Please try run boost again, or install them manually. http://compass-style.org/install/"
		exit
	fi
fi

#===== Node and npm =====#
if [ "$OS" == "OSX" ] && [ -z "$(probe node)" ]; then
	# TODO: Test this out on OSX.
	log "Installing node and npm..."
	sleep 2

	brew install node

	if [ "$(probe node)" ] && [ "$(probe npm)" ]; then
		success "node and npm installed."
	else
		error "There was an error installing node and npm. Please try run boost again, or install them manually. https://github.com/joyent/node/wiki/Installation"
		exit
	fi
elif [ "$OS" == "Ubuntu" ] || [ "$OS" == "Gnome" ] && [ -z "$(probe nodejs)" ]; then
	log "Installing nodejs and npm"
	sleep 2

	sudo apt-get update -qq
	sudo apt-get install -y python-software-properties python g++ make
	sudo add-apt-repository -y ppa:chris-lea/node.js
	sudo apt-get update -qq
	sudo apt-get install -y nodejs

	# There is a naming conflict with the node package (Amateur Packet Radio Node Program), and the nodejs binary has been renamed from node to nodejs.
	ln -s /usr/bin/nodejs /usr/bin/node

	if [ "$(probe node)" ] && [ "$(probe npm)" ]; then
		success "node and npm installed."
	else
		error "There was an error installing node and npm. Please try run boost again, or install them manually. https://github.com/joyent/node/wiki/Installation"
		exit
	fi
elif [ "$(probe npm)" ]; then
	log "Making sure npm is up to date"
	sleep 2

	sudo npm update -g npm
fi

#===== Grunt =====#
if [ -z "$(probe grunt)" ]; then
	log "Installing GruntJS..."
	sleep 2

	_npmg grunt-cli

	if [ "$(probe grunt)" ]; then
		success "GruntJS installed."
	else
		error "There was an error installing GruntJS. Please try run boost again, or install them manually. http://gruntjs.com/getting-started"
		exit
	fi
fi

#===== Docpad =====#
if [ -z "$(probe docpad)" ]; then
	log "Installing DocPad..."
	sleep 2

	_npmg docpad

	if [ "$(probe docpad)" ]; then
		success "DocPad installed."
	else
		error "There was an error installing DocPad. Please try run boost again, or install them manually. http://docpad.org/docs/install"
		exit
	fi
fi

sleep 2
echo