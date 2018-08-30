#!/bin/bash

if [ "$1" ]; then
    cd "$1"
fi
dir="$(ls $PWD)"

echo "${dir[0]}" >> temp.txt

while IFS='' read -r line || [[ -n "$line" ]]; do
    if ! [[ -d $line  ]]; then
      if [ "${line: -4}" = ".jpg" ] || [ "${line: -4}" = ".png" ] || [ "${line: -4}" = ".gif" ] || [ "${line: -5}" = ".jpeg" ]; then
           [ -d "pic" ] || mkdir "pic"
           mv "$line" "./pic/"
       fi
       if [ "${line: -4}" = ".mkv" ] || [ "${line: -4}" = ".mp4" ] || [ "${line: -4}" = ".avi" ] || [ "${line: -4}" = ".MP4" ]; then
           [ -d "video" ] || mkdir "video"
           mv "$line" "./video/"
       fi
       if [ "${line: -4}" = ".pdf" ]; then
           [ -d "pdfs" ] || mkdir "pdfs"
           mv "$line" "./pdfs/"
       fi
       if [ "${line: -4}" = ".zip" ] || [ "${line: -4}" = ".tar" ] || [ "${line: -4}" = ".rar" ] || [ "${line: -7}" = ".tar.xz" ] || [ "${line: -7}" = ".tar.gz" ]; then
           [ -d "compressed" ] || mkdir "compressed"
           mv "$line" "./compressed/"
       fi
       if [ "${line: -4}" = ".txt" ] || [ "${line: -4}" = ".doc" ] || [ "${line: -5}" = ".docx" ] || [ "${line: -4}" = ".odt" ] || [ "${line: -4}" = ".rtf" ] ; then
           [ -d "documents" ] || mkdir "documents"
           mv "$line" "./documents/"
       fi
       if [ "${line: -4}" = ".mp3" ] || [ "${line: -4}" = ".mpg" ] || [ "${line: -4}" = ".oga" ]; then
           [ -d "audio" ] || mkdir "audio"
           mv "$line" "./audio/"
       fi
       if [ "${line: -4}" = ".xls" ] || [ "${line: -5}" = ".xlsx" ] || [ "${line: -4}" = ".csv" ] || [ "${line: -4}" = ".ods" ]; then
           [ -d "exels" ] || mkdir "exels"
           mv "$line" "./exels/"
       fi
    fi
    sed -i '1d' "temp.txt"
done < "temp.txt"
rm -f "temp.txt"
