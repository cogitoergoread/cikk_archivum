#!/bin/bash

# Path konstansok
TMPATH="/mnt/f/tmp/convert"
ODTSRC="/mnt/c/Users/gombk/OneDrive/Mellékletek/wegy/cikk"
TXPATH="/mnt/f/muszi/hugo/cikk_doc"

# Konverzió helye
echo $TMPATH

mkdir -p $TMPATH


# Tex források másolása
cd $ODTSRC
find . -name '*doc*' -exec cp --parents \{\} $TMPATH \;

# Még konverzió
cd $TMPATH

# Convert all files
find . -type f -name "*doc*" -execdir ~/bin/cvt-doc.sh '{}' \;


# Copy to HuGo, Cikk_tex
mkdir -p  $TXPATH
cd $TMPATH
find . -name '*.latex' -exec cp --parents \{\} $TXPATH \;

