#!/bin/bash

pathpre="${HOME}/Public/Dropbox/Academia/latex_templ"

mkdir ref backup supports styles

# bash scripts to accelerate operations
cp -r ${pathpre}/supports ./

cp ${pathpre}/userdef-mathsym.tex supports/
cp ${pathpre}/ref/library.bib  ./ref/
cp -r ${pathpre}/beamer-fig        ./figures

cp ${pathpre}/_gitignore  .gitignore
cp ${pathpre}/_projectile .projectile

# use color themes
cp ${pathpre}/beamer-sty/zyuebeamer.sty ./styles/
cp ${pathpre}/beamer-sty/zyuebeamerdark.sty ./styles/
cp ${pathpre}/beamer-sty/zyuebeamerplain.sty ./styles/
cp ${pathpre}/beamer-sty/lcsbbeamer.sty ./styles/

# touch .tex file
touch beamer.tex