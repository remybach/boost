#!/usr/local/bin/bash

#===========================================#
#	Config									#
#===========================================#

# This script's directory
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# Receive the OS as the first parameter
OS=$1
# And whether this is a non-desktop (ie: server) environment as the second.
NON_DESKTOP=$2

# Figure out which installer to use
if [ "$OS" == "OSX" ]; then
	installer="brew"
elif [ "$OS" == "Ubuntu" ] || [ "$OS" = "Gnome" ]; then
	installer="apt-get"
fi

. config/colours.sh
. config/utility_functions.sh
. config/external-apps.sh

#===========================================#
#      The Meat & Potatoes (as it were)     #
#===========================================#

. partials/ascii_begin.sh

. partials/iterm2.sh
. partials/installers.sh
. partials/prerequisites.sh
. partials/dotfiles.sh
. partials/zsh.sh
. partials/common-cli.sh
. partials/ssh-keys.sh

# We don't care about the following if running on a server.
if [ -z "$NON_DESKTOP" ]; then
	log "Proceeding with Desktop stuff..."
	. partials/other-apps.sh
	. partials/sublime-text.sh
	. partials/git-repos.sh
	. partials/devtools.sh
fi

. partials/ascii_end.sh
