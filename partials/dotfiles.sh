#!/bin/bash

echo -e "$cMagenta#===========================================#"
echo -e "#               dotfiles"
echo -e "#===========================================#$cDefault"

if [ ! -d "$HOME/dotfiles_old" ]; then
	mkdir $HOME/dotfiles_old
fi

dotfiles=($dir/dotfiles/*)
for file in "${dotfiles[@]}"; do
	if [ -f "$HOME/.$file" ]; then
		mv $HOME/.$file $HOME/dotfiles_old/
	fi

	# Let's grab *just* the filename here.
	file=$(echo "$file" | sed 's:.*/::')
	if [ ! -L "$HOME/$file" ]; then
		log ".$file not linked yet, symlinking now..."

		ln -s "$dir/dotfiles/$file" "$HOME/.$file"

		success "Done."
	else
		success ".$file already linked."
	fi
done

sleep 2
echo