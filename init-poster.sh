#!/bin/bash

pathpre="${HOME}/Public/Dropbox/Academia/latex_templ"

mkdir ref figures backup supports poster-layout

# bash scripts to accelerate operations
cp -r ${pathpre}/supports ./

cp ${pathpre}/userdef-mathsym.tex supports/
cp ${pathpre}/ref/library.bib  ./ref/

cp ${pathpre}/poster-layout/*.jpg ./poster-layout/
cp ${pathpre}/poster-layout/beamerthemeconfposter.sty ./
touch poster.tex

cp ${pathpre}/_gitignore .gitignore
cp ${pathpre}/_projectile .projectile
