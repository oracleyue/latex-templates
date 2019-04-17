#/bin/bash

curdirname=$(basename "$(pwd)");
pathpre="${HOME}/Public/Dropbox/Academia/Manuscripts"

if [ $curdirname == "figures" ]; then
    cd ..
fi

#../archive/texbackup.sh
#../archive/pptbackup.sh

${pathpre}/archive/texbackup.sh
${pathpre}/archive/pptbackup.sh

if [ -d figures ]; then
    ${pathpre}/archive/tikzbackup.sh
fi
