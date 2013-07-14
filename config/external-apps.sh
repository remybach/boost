#!/bin/bash

if [ -z "$(bash --version | grep 'version 4')" ]; then
	error "Please make sure you have at least bash v4 installed and try again. Current bash version is:"
	bash --version
	exit
fi

# External App Links
declare -A appsAny
appsAny["Chrome"]="https://www.google.com/intl/en/chrome/browser/"
appsAny["Google Music Manager"]="https://play.google.com/music/listen?u=0#/manager"
appsAny["SublimeText"]="http://www.sublimetext.com/"
appsAny["Ubuntu Font"]="http://font.ubuntu.com/"

declare -A appsOSX
appsOSX["Alfred"]="http://www.alfredapp.com/#download"
appsOSX["Fantastical"]="https://itunes.apple.com/gb/app/fantastical/id435003921?mt=12"
appsOSX["Gas Mask"]="https://code.google.com/p/gmask/downloads/list"
appsOSX["Growl"]="https://itunes.apple.com/gb/app/growl/id467939042?mt=12"
appsOSX["Little Snapper"]="http://www.realmacsoftware.com/littlesnapper/"
appsOSX["Mou"]="http://mouapp.com/#more"
appsOSX["Reeder"]="https://itunes.apple.com/gb/app/reeder/id439845554?mt=12"
appsAny["SourceTree"]="http://sourcetreeapp.com/download/"
appsOSX["Spectacle"]="http://spectacleapp.com/"
appsOSX["YoruFukurou"]="https://itunes.apple.com/gb/app/yorufukurou/id428834068?mt=12#"