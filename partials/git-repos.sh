#!/bin/bash

echo -e "$cMagenta#===========================================#"
echo -e "#                Git Repos"
echo -e "#===========================================#$cDefault"

if [ ! -d "$HOME/projects" ]; then
	log "Cloning git repos..."
	sleep 2

	repos=$(cat config/repos.cfg)

	mkdir $HOME/projects

	cd $HOME/projects

	for repo in $repos; do
		log "Cloning $repo..."

		git clone --quiet $repo

		success "Done."
	done

	cd $dir
else
	success "Git repos already cloned."
fi