#!/bin/bash

echo -e "$cMagenta#===========================================#"
echo -e "#               DevTools Theme"
echo -e "#===========================================#$cDefault"

if [ "$OS" == "OSX" ]; then
	chrome_user_stylesheets="$HOME/Library/Application Support/Google/Chrome/Default/User StyleSheets"
elif [ "$OS" == "Ubuntu" ] || [ "$OS" == "Gnome" ]; then
	chrome_user_stylesheets="$HOME/.config/google-chrome/Default/User StyleSheets"
fi
file="Custom.css"

if [ -d "$chrome_user_stylesheets" ]; then

	# If the file exists, rename it.
	if [ -f "$chrome_user_stylesheets/$file" ]; then
		mv "$chrome_user_stylesheets/$file" "$chrome_user_stylesheets/$file.bak"

		rm -f "$chrome_user_stylesheets/$file"
	fi

	if [ ! -f "$chrome_user_stylesheets/$file" ]; then
		if [ ! -L "$chrome_user_stylesheets/$file" ]; then
			log "$file not linked yet, symlinking now..."
			sleep 2

			ln -s "$dir/chrome/$file" "$chrome_user_stylesheets/$file"

			success "Done."
		else
			success "$file already linked."
		fi
	else
		"$file can't be symlinked because it already exists even after forceful deletion. Please make sure Chrome is closed and rerun boost."
		exit
	fi
else
	error "Uh-oh. It looks like the $chrome_user_stylesheets directory doesn't exist."
fi

sleep 2
echo