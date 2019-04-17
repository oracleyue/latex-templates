#!/bin/bash
# -*- coding: utf-8 -*-
#
# This is to backup the tex in the local "backup" folder.

# Copyright (c) 2014-2017, Zuogong YUE
# Author: Zuogong YUE
#         https://github.com/oracleyue
# Licensed under the GNU General Public License
#
# Last modified on 22 Feb 2019


if [[ $# -eq 0 ]]; then
    texFiles=$(find . -maxdepth 1 -name '*.tex' -print)
else # 1 argument
    texFiles=$1
fi

for fname in $texFiles; do
    fnameExtract=$(basename $fname .tex)
    if [[ "$fnameExtract" == "userdef-mathsym" ]]; then
       continue
    fi

    fnameBackup=${fnameExtract}_$(date +"%Y%m%d_%Hh%M%S").tex

    cp -f $fname ./backup/$fnameBackup
done

echo "backup tex files: done."
