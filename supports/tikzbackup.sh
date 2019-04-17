#!/bin/bash

cd figures
texfiles=$(find . -maxdepth 1 -name '*.tex' -print)

pathpre="${HOME}/Public/Dropbox/Academia/latex_templ"

count=0
for texfn in $texfiles
do
    bakfn="${pathpre}/../backup/tikz_figs/${texfn}"
    tikzfn="${pathpre}/../TikZ/${texfn}"
    bakfnlocal="${HOME}/Documents/backup/tikz_figs/${texfn}"
    count=$((count+1))
    if [ -f ${bakfn}.sha1 ];
    then
        cursum=$(cat "${bakfn}.sha1" | awk '{print $1}')
    else
        cursum='N/A'
    fi
    if [ -f ${tikzfn}.sha1 ];
    then
        cursumtk=$(cat "${tikzfn}.sha1" | awk '{print $1}')
    else
        cursumtk='N/A'
    fi
    newsum=$(shasum ${texfn} | awk '{print $1}')

    #if [ -f "${bakfn}.sha1" ]
    #then
        #shasum ${texfn} > ${bakfn}.sha1
    #fi

    #echo "------------------FILE NO.${count}------------------"
    #echo "Name: ${texfn}"

    if [ $cursum = $newsum ] && [ $cursumtk = $newsum ];
    then
        :
        #echo "------------------FILE NO.${count}------------------"
        #echo "Name: ${texfn}"
        #echo "----"
        #echo "Nothing needs to be backup."
        #echo "---------------------------------------------"
        #echo ""
    else
        echo "------------------FILE NO.${count}------------------"
        echo "Name: ${texfn}"
        echo "SHA1 of TikZ file in DROPBOX_HOME/backup/tikz_figs/: $cursum"
        echo "SHA1 of TikZ file in DROPBOX_HOME/TikZ/: $cursumtk"
        echo "SHA1 of the current TikZ file:   $newsum"
        echo "----"
        cp -f $texfn $bakfn
        cp -f $texfn $tikzfn
        cp -f $texfn $bakfnlocal
        shasum $texfn > "${bakfn}.sha1"
        shasum $texfn > "${tikzfn}.sha1"
        shasum $texfn > "${bakfnlocal}.sha1"
        echo "LaTeX source files in DROPBOX_HOME/backup/tikz_figs/ updated."
        echo "LaTeX source files in DROPBOX_HOME/TikZ/ updated."
        echo "---------------------------------------------"
        echo ""
    fi
done
