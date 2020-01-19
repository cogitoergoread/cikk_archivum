#!/bin/bash

TMPFILE="/mnt/f/tmp/toconv.latex"

if [ -e $1 ]
then
    echo $1 "ok, converting to" "${1%.*}.latex"
else
    echo "nok"
    exit 0
fi

# Standard Latex Header
cat > "${1%.*}.latex" <<EOF
% -*- mode: LaTeX; coding: iso-8859-2 -*-
\documentclass[a4paper,twocolumn]{article}
\usepackage[T1]{fontenc}
\usepackage[latin2]{inputenc}
\usepackage[magyar]{babel}
\begin{document}
\author{}
\title{   }
\date{ \thanks{} }
\maketitle

\begin{abstract}
  
\end{abstract}

EOF

# Odt 2 latex
pandoc --wrap=none -t latex -f docx $1 > $TMPFILE

cat $TMPFILE\
    | sed -e 's/•/./g' \
    | perl -pe "s/£/\\pounds/g" \
    | perl -pe "s/è/é/g" \
    | perl -pe "s/à/á/g" \
    | perl -pe "s/ї/i/g" \
    | perl -pe "s/»//g" \
    | perl -pe "s/→/-/g" \
    | perl -pe "s/‑/-/g" \
    | perl -pe "s/−/-/g" \
    | perl -pe "s///g" \
    | perl -pe "s/¬//g" \
    | perl -pe "s/®/-/g" \
    | perl -pe "s/«//g" \
    | perl -pe "s/''/\}/g" \
    | perl -pe 's/„/\\textqq\{/g' \
    | iconv -c -t latin2 -f utf-8 \
       	     >> "${1%.*}.latex"

#    | perl -pe "s/œ/oe/g" \	   
# £ ‑ ¬ 
# Œ − → ® ї à è
# Standard footer
cat >> "${1%.*}.latex" <<EOF2

\end{document}

EOF2

