#!/bin/sh

OIFS=$IFS
IFS="
"

for i in $(ls *.doc); do
	libreoffice --invisible --convert-to html --outdir output $i
done

IFS=$OIFS
