#!/bin/bash
# -*- coding: utf-8 -*-
#
# This is update the LaTeX templates in git repo with the onese under
# maintance.

# Copyright (c) 2014-2017, Zuogong YUE
# Licensed under the GNU General Public License
#
# Last modified on 17 Apr 2019

fromDir=$HOME/Public/Dropbox/Academia/latex_templ/
toDir=$HOME/Workspace/gitrepo/latex_templ/

rsync -rlptD -P --delete \
      --exclude=.DS_Store \
      --exclude="updateMe.sh" \
      --exclude=.git \
      --exclude=.gitignore \
      --exclude=snippets \
      $fromDir $toDir

rsync -rlptD -P --delete \
      --exclude=.DS_Store \
      $HOME/.emacs.d/snippets/latex-mode ./snippets
yes | rm ./snippets/latex-mode/list-of-authors