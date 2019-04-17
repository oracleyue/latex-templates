#!/bin/bash

pathpre="${HOME}/Public/Dropbox/Academia/latex_templ"

texfn="userdef-mathsym.tex"
bakfn="${pathpre}/userdef-mathsym.tex"

if [ -f ${bakfn}.sha1 ]
then
    cursum=$(cat "${bakfn}.sha1" | awk '{print $1}')
else
    cursum='0'
fi
newsum=$(shasum ${texfn} | awk '{print $1}')

echo "SHA1 of userdef-mathsym in use : $cursum"
echo "SHA1 of userdef-mathsym in repo: $newsum"

if [[ $cursum = $newsum ]]
then
    echo "----"
    echo "No need to update."
else
    echo "------------------FILE: userdef-mathsymb.tex------------------"
    echo "SHA1 of the file in DROPBOX_HOME/latex_templ/: $cursum"
    echo "SHA1 of the current file: $newsum"
    echo "----"
    cp -f $texfn $bakfn
    shasum $texfn > "${bakfn}.sha1"
    echo "LaTeX source files in DROPBOX_HOME/latex_templ/ updated."
    echo "---------------------------------------------"
    echo ""
fi