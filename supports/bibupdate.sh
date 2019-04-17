#!/bin/bash

bibfname="./ref/library.bib"
libfname="${HOME}/Public/Dropbox/Academia/latex_templ/ref/library.bib"

if [ -f ${bibfname}.sha1 ];
then
    cursum=$(cat ${bibfname}.sha1 | awk '{print $1}')
else
    cursum='0'
fi

newsum=$(shasum ${libfname} | awk '{print $1}')

echo "SHA1 of the current library.bib: $cursum"
echo "SHA1 of library.bib in Mendeley: $newsum"

if [[ $cursum = $newsum ]]
then
    echo "----"
    echo "Nothing needs to be update."
else
    cp $libfname $bibfname
    shasum $bibfname > ${bibfname}.sha1
    echo "----"
    echo "BibTeX file has been updated."
fi
