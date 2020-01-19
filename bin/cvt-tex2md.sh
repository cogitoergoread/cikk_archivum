#!/bin/bash

TMPFILE="/mnt/f/tmp/toconv.tex"

if [ -e $1 ]
then
    echo $1 "ok, converting to" "${1%.*}.md"
else
    echo "nok"
    exit 0
fi


# To make it UTF from latin-2
# To convert hungarian textqq to noramla ""
# TO convert ldots to ...
# to filter out margin settings

cat $1 \
    | iconv -f latin2 -t utf-8 \
    | perl -pe 's/\\textqq\{(.*?)\}/„\1”/g' \
    | perl -pe 's/\\ldots/.../g' \
    | perl -pe 's/\$\\pi\$/π/g' \
    | sed -e '/\\.*margin/d' \
    | sed -e '/^.text/d' \
	   > $TMPFILE

# $\pi$ -> Unicode 03C0 , π
# Front matter
cat $TMPFILE\
    | awk -f ~/bin/latex-to-front.awk \
	  > "${1%.*}.md"

# Text
cat $TMPFILE\
    | pandoc --wrap=none -f latex -t markdown \
       	  >> "${1%.*}.md"
