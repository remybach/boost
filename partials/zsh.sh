#!/bin/bash

echo -e "$cMagenta#===========================================#"
echo -e "#             zsh & oh-my-zsh"
echo -e "#===========================================#$cDefault"

if [ -z  "$(probe zsh)" ]; then
	if [ "$OS" == "Ubuntu" ] || [ "$OS" == "Gnome" ] || [ "$OS" == "OSX" ]; then
		log "Proceeding to install zsh..."
		sleep 2

		_install zsh

		if [ -z "$(probe zsh)" ]; then
			error "There was an error installing zsh. Please try run boost again, or install it manually. http://zsh.sourceforge.net/"
			exit
		fi
	else
		error "Oh dear, it seems your system is not compatible with zsh. See the following links for more information on zsh: http://zsh.sourceforge.net/"
	fi
else
	success  "zsh is already installed."
fi

if [ "$(probe zsh)" ] && [ -z "$(ls -A $HOME/.oh-my-zsh/)" ]; then
	log "Proceeding to install oh-my-zsh..."
	sleep 1

	curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
	echo

	success "oh-my-zsh successfully installed..."

	log "Attempting to change shell manually..."
	chsh -s $(which zsh)

	if [ -z "$(ls -A $HOME/.oh-my-zsh/)" ]; then
		error "There was an error installing oh-my-zsh. Please try run boost again, or install it manually. https://github.com/robbyrussell/oh-my-zsh/"
		exit
	fi
else
	success "oh-my-zsh is already installed."
fi

if [ ! -z "$(ls -A $HOME/.oh-my-zsh/)" ] && [ ! -L "$HOME/.oh-my-zsh/prompt.zsh" ]; then
	log "Installing @sindresorhus' Pure prompt..."
	sleep 2

	mv $HOME/.oh-my-zsh/prompt.zsh $HOME/.oh-my-zsh/prompt.zsh.bak
	ln -s $dir/zsh/prompt.zsh $HOME/.oh-my-zsh/prompt.zsh

	if [ -L "$HOME/.oh-my-zsh/prompt.zsh" ]; then
		success "Pure prompt installed."
	else
		error "There was an error installing Pure prompt. Please try run boost again, or install it manually. https://github.com/sindresorhus/pure"
		exit
	fi
fi

if [ ! -L "$HOME/.zshrc" ]; then
	log "Symlinking zsh config file..."
	sleep 2

	mv $HOME/.zshrc $HOME/.zshrc.bak
	ln -s $dir/zsh/.zshrc $HOME/.zshrc

	if [ ! -L "$HOME/.zshrc" ]; then
		error "There was an error symlinking. Please try run boost again, or do it manually."
		exit
	fi
fi

sleep 2
echo