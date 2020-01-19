#!/bin/bash

# Path konstansok
LTXPATH="/mnt/h/gwork/cikk_archivum/latex"

if [ -e $1 ]
then
    echo $1 "ok, copy Yaml files to there"
else
    echo "nok"
    exit 0
fi
