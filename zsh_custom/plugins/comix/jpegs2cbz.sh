#!/bin/bash

if [ -z "$1" ]; then
	echo "Zip a folder full of jpegs into a .cbz";
	echo "Usage:";
	echo "    jpegs2cbz {folders}";
else
	for folder in "$@"
	do

		echo "Making a new comic: "$folder".cbz";
		zip -qdgds 1m -0 -j "$folder".cbz -r "$folder" -i "*.jpg" -i "*.JPG" -i "*.jpeg" -i "*.JPEG"
	done
fi
