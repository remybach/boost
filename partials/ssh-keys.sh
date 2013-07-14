#!/bin/bash

echo -e "$cMagenta#===========================================#"
echo -e "#                SSH Keys"
echo -e "#===========================================#$cDefault"

# Create the ssh directory if it doesn't exist yet.
if [ ! -d "$HOME/.ssh" ]; then
	mkdir $HOME/.ssh
fi

sshfiles=$(ls $dir/ssh)
for file in $sshfiles; do
	if [ ! -L "$HOME/.ssh/$file" ]; then
		log "$file not linked yet, symlinking now..."

		ln -s $dir/ssh/$file $HOME/.ssh/$file

		success "Done."
	else
		success "$file already linked."
	fi
done

sleep 2
echo