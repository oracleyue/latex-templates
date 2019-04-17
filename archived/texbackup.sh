#!/bin/bash

texfiles=$(find . -maxdepth 1 -name '*.tex' -print)

pathpre="${HOME}/Public/Dropbox/Academia/Manuscripts"

count=0
for texfn in $texfiles
do
    bakfn="${pathpre}/../backup/${texfn}"
    bakfnlocal="${HOME}/Documents/backup/${texfn}"
    count=$((count+1))
    if [ -f ${bakfn}.sha1 ];
    then
        cursum=$(cat "${bakfn}.sha1" | awk '{print $1}')
    else
        cursum='N/A'
    fi
    newsum=$(shasum ${texfn} | awk '{print $1}')

    #if [ -f "${bakfn}.sha1" ]
    #then
        #shasum ${texfn} > ${bakfn}.sha1
    #fi

    #echo "------------------FILE NO.${count}------------------"
    #echo "Name: ${texfn}"
    
    if [ $cursum = $newsum ];
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
        echo "SHA1 of LaTeX file in DROPBOX_HOME/backup/: $cursum"
        echo "SHA1 of the current LaTeX file:   $newsum"
        echo "----"
        cp -f $texfn $bakfn
        cp -f $texfn $bakfnlocal
        shasum $texfn > "${bakfn}.sha1"
        shasum $texfn > "${bakfnlocal}.sha1"
        echo "LaTeX source files in DROPBOX_HOME/backup/ updated."
        echo "---------------------------------------------"
        echo ""
    fi
done
