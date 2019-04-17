#!/bin/bash

pathpre="${HOME}/Public/Dropbox/Academia/latex_templ"

mkdir figures ref archived backup supports

# bash scripts to accelerate operations
cp -r ${pathpre}/supports ./

cp ${pathpre}/userdef-mathsym.tex supports/
cp ${pathpre}/ref/library.bib ./ref/
cp ${pathpre}/ref/natbib.bst ./ref/

cp ${pathpre}/_gitignore .gitignore
cp ${pathpre}/_projectile .projectile


# touch .tex file
if [ ! -f *.tex ]; then
    touch master.tex
fi