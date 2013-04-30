#!/bin/sh 
BASEDIR="/share/photos" 
LIST=`find . -iname "*.jpg"` 
STRTIME="Image timestamp" 
 
for F in $LIST; do 
YEAR=`exiv2 "$F" | grep "${STRTIME}" | awk '{ print $4 }' | awk -F: '{ print $1 }'` 
MONTH=`exiv2 "$F" | grep "${STRTIME}" | awk '{ print $4 }' | awk -F: '{ print $2 }'` 
DAY=`exiv2 "$F" | grep "${STRTIME}" | awk '{ print $4 }' | awk -F: '{ print $3 }'` 
NAME=`basename "$F"` 
DIR="${BASEDIR}/${YEAR}/${MONTH}/$DAY" 
mkdir -p ${DIR} 
mv -f ${F} "${DIR}/${NAME}" 
done
