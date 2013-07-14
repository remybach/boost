#!/bin/bash

echo -e "$cMagenta#===========================================#"
echo -e "#                Other Apps"
echo -e "#===========================================#$cDefault"

log "Nearly done. Here are all the apps you should install: "

echo -e "${cYellow}OS Independent:$cDefault"
for i in "${!appsAny[@]}"
do
  echo "$i: ${appsAny[$i]}"
done
echo

read -p "Press [Enter] when you're done."

if [ "$OS" == "OSX" ]; then
	echo -e "${cYellow}OSX:$cDefault"
	for i in "${!appsOSX[@]}"
	do
	  echo "$i: ${appsOSX[$i]}"
	done
	echo

	read -p "Press [Enter] when you're done."
fi

sleep 2
echo