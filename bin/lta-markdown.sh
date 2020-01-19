#!/bin/bash

# Path konstansok
LTXPATH="/mnt/h/gwork/cikk_archivum/latex"
MDPATH="/mnt/h/gwork/cikk_archivum/markdown"

# Copy Tex
cd $MDPATH
cp -a $LTXPATH/* ./

# MD fordítás
cd $MDPATH
find . -name '*tex' -exec ~/bin/cvt-tex2md.sh \{\}  \;

# Remove Latex source
find . -name '*tex' -exec rm \{\}  \;
