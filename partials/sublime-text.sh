#!/bin/bash

echo -e "$cMagenta#===========================================#"
echo -e "#                Sublime Text"
echo -e "#===========================================#$cDefault"

if [ "$OS" == "OSX" ]; then
	sublime_packages="$HOME/Library/Application Support/Sublime Text 3/Packages"
elif [ "$OS" == "Ubuntu" ] || [ "$OS" == "Gnome" ]; then
	sublime_packages="$HOME/.config/sublime-text-2/Packages"
fi

# User preferences
sublimefiles=($dir/sublime-text/User/*)
for file in "${sublimefiles[@]}"; do
	# Let's grab *just* the filename here.
	file=$(echo "$file" | sed 's:.*/::')

	# If the file exists, just delete it.
	if [ -f "$sublime_packages/User/$file" ]; then
		rm -f $sublime_packages/User/$file
	fi

	if [ ! -L "$sublime_packages/User/$file" ]; then
		log "$file not linked yet, symlinking now..."

		ln -s "$dir/sublime-text/User/$file" "$sublime_packages/User/$file"

		success "Done."
	else
		success "$file already linked."
	fi
done

log "You also need to make sure to install package control: http://wbond.net/sublime_packages/package_control/installation"

read -p "Press [Enter] to continue."

sleep 2
echo