#!/bin/sh

OIFS=$IFS
IFS="
"

for i in $(cat list | awk -F\" '{print $4}'); do
	ftp "https://wqcdcompliance.com/${i}"
	sleep 2;
done

IFS=$OIFS
