#!/bin/bash

# The end.
if [ -z $error ]; then
	echo
	echo -e "${cCyan}        ___    ___           __ "
	echo -e "${cBlue}       /${cCyan}\_ \  ${cBlue}/${cCyan}\_ \         ${cBlue}/${cCyan}\ \ "
	echo -e "${cCyan}   __  ${cBlue}\//${cCyan}\ \ ${cBlue}\//${cCyan}\ \        ${cBlue}\\\\${cCyan}_\ \    ___     ___      __ "
	echo -e "${cCyan} /'__\`\  ${cBlue}\ ${cCyan}\ \  ${cBlue}\ ${cCyan}\ \       /'_\` \  / __\`\ /' _ \`\  /'__\`\ "
	echo -e "${cBlue}/${cCyan}\ \L\.\_ ${cBlue}\\\\${cCyan}_\ \_ ${cBlue}\\\\${cCyan}_\ \_    ${cBlue}/${cCyan}\ \L\ \\\\${cBlue}/${cCyan}\ \L\ \ \ \\\\${cBlue}/${cCyan}\ \\\\${cBlue}/${cCyan}\  __/ "
	echo -e "${cBlue}\ ${cCyan}\__/${cBlue}.${cCyan}\_\\\\${cBlue}/${cCyan}\____\\\\${cBlue}/${cCyan}\____\   ${cBlue}\ ${cCyan}\___,_\ \____/${cBlue}\ ${cCyan}\_\ \_\ \____\ "
	echo -e " ${cBlue}\/__/\/_/\/____/\/____/    \/__,_ /\/___/  \/_/\/_/\/____/ ${cDefault}"
	echo

	success "Go forth and code!"
else
	error "There were some issues along the way. Please review the above output."
fi

echo
echo