#!/bin/bash
# -*- coding: utf-8 -*-
#
# Copy the .tex file from Overleaf from "~/Downloads/", then call latexdiff
# and compile the PDF to show differences between two files.

# Copyright (c) 2014-2017, Zuogong YUE
# Licensed under the GNU General Public License
#
# Last modified on 22 Feb 2019


source $HOME/.bashrc
# requirements of commandline tools in PATH:
#   - latexdiff
#   - rubber

Flag=FALSE       # marking if path and file names have been set
FlagClean=TRUE   # default: clean all intermediate files
FlagSwap=FALSE   # default: use overleaf file as the new source

while [[ $# -gt 0 ]]; do
    key=$1

    case $key in
        -f|--file)
            ftarget=$2
            shift
            shift
            ;;
        -d|--directory)
            dtarget=$2
            shift
            shift
            ;;
        -k|--keep)
            FlagClean=FALSE
            shift
            ;;
        -s|--swap)
            FlagSwap=TRUE
            shift
            ;;
        -h|--help|*)
            echo "Usage: overleaf-diff.sh -f FILE -d DIRECTORY"
            echo "       which copies the source downloaded from Overleaf with name FILE.tex from ${HOME}/Downloads/DIRECTORY."
            echo "Usage: overleaf-diff.sh -k[--keep] ..."
            echo "       which keeps the Overleaf source and diff.tex after compilation."
            echo "Usage: overleaf-diff.sh -s[--swap] ..."
            echo "       which will use the overleaf file as the old source in latexdiff."
            exit 1
            ;;
    esac
done

# go to project root; since normally this script is under "ROOT/supports/"

# guess target file if not specified
if [[ -z $ftarget ]]; then
    numfiles=$(ls *.tex | wc -l)
    if [[ $numfiles -eq 1 ]]; then
        file_source=$(ls *.tex)
        temp=$(basename $file_source .tex)
        file_overleaf=$temp"_overleaf.tex"

        Flag=TRUE
    fi
else
    file_source=$ftarget".tex"
    file_overleaf=$ftarget"_overleaf.tex"
fi

# guess Overleaf directory if not specified
if [[ -z $dtarget ]]; then
    numfiles=$(ls *.tex | wc -l)
    if [[ $numfiles -eq 1 ]]; then
        file=$(ls *.tex)
        temp=$(basename $file .tex)
        fpath=${HOME}/Downloads/$temp

        Flag=TRUE
    fi
else
    fpath=${HOME}/Downloads/$dtarget
fi

# both specified; ready for compilation
if [[ ! -z $ftarget ]] && [[ ! -z $dtarget ]]; then
    Flag=TRUE
fi

# check if the Overleaf file exists in the directory
if [[ -d $fpath ]] && [[ -f $fpath/$file_source ]] \
       && [[ $Flag = TRUE ]]; then

    # copy the overleaf file to your work folder
    cp $fpath/$file_source $file_overleaf

    # latex diff and compile
    if [[ $FlagSwap = TRUE ]]; then
        latexdiff $file_overleaf $file_source > diff.tex
    else
        latexdiff $file_source $file_overleaf > diff.tex
    fi
    rubber --synctex -d diff.tex
    rubber --clean diff.tex

    # clean the Overleaf source and diff.tex?
    if [[ $FlagClean = TRUE ]]; then
        yes | rm diff.tex $file_overleaf
    fi
else
    # usage errors
    echo "Errors: possibly, due to"
    echo "   - failing to guess the target file (more than 1 .tex in your working folder);"
    echo "     specify the target file"
    echo "   - folder not exist; specify the folder saving files downloaded from Overleaf"
    echo "   - file not exist; specify the target file name"
    echo " "
    echo "Usage: overleaf-diff.sh -f[--file] FILE -d[--directory] DIRECTORY"
    echo "       which copies the source downloaded from Overleaf with name FILE.tex from ${HOME}/Downloads/DIRECTORY."
    echo "Usage: overleaf-diff.sh -k[--keep] ..."
    echo "       which keeps the Overleaf source and diff.tex after compilation."
    echo "Usage: overleaf-diff.sh -s[--swap] ..."
    echo "       which will use the overleaf file as the old source in latexdiff."
    exit 1
fi
