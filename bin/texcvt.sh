#!/bin/bash

# Path konstansok
TMPATH="/mnt/f/tmp/convert"
TEXSRC="/mnt/c/Users/gombk/OneDrive/Mellékletek/wegy/cikk"
MDPATH="/mnt/f/muszi/hugo/cikk_tex2"

# Konverzió helye
echo $TMPATH

mkdir -p $TMPATH


# Tex források másolása
cd $TEXSRC
find . -name '*tex' -exec cp --parents \{\} $TMPATH \;

# Még konverzió
cd $TMPATH
rm -rf tex-pelda fr TGM/es_cikkek.tex

# Convert all files
find . -type f -name "*tex" -execdir ~/bin/cvt-tex2md.sh '{}' \;


# Copy to HuGo, Cikk_tex
mkdir -p  $MDPATH
cd $TMPATH
find . -name '*.md' -exec cp --parents \{\} $MDPATH \;

