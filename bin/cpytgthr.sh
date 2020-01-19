#!/bin/bash

# Path konstansok
SRCPATH="/mnt/f/muszi/hugo"
#DSTPATH="/mnt/f/muszi/hugo/cikk_tgthr"
DSTPATH="/mnt/h/gwork/cikk_archivum/latex"
# Konverzió helye
echo $DSTPATH

mkdir -p $DSTPATH

# DOC források
cd $SRCPATH/cikk_doc
find . -name '*tex' -exec cp --parents \{\} $DSTPATH \;

# ODT források
cd $SRCPATH/cikk_odt
find . -name '*tex' -exec cp --parents \{\} $DSTPATH \;

# Tex forrás kommentezve
cd $SRCPATH/cikk
find . -name '*tex' -exec cp --parents \{\} $DSTPATH \;

# MD 5 fordítás
#cd $DSTPATH
#find . -name '*tex' -exec ~/bin/cvt-tex2md.sh \{\}  \;


# Remove Latex source
#find . -name '*tex' -exec rm \{\}  \;
