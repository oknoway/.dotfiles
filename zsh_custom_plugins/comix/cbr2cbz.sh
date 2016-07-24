#!/bin/bash

if [ -z "$1" ]; then
	echo "Convert cbr file to cbz file.";
	echo "Usage:";
	echo "    cbrtocbz {filenames}";
else
	for file in "$@"
	do
		dir=`mktemp -d`;
		echo "Extracting images to $dir...";
		7z e -o"$dir" "$file"

		echo "Compressing images...";

		name=$(echo $file | cut -f 1 -d '.');
		zip -0 -j "$name".cbz "$dir"/*.[Jj][Pp][Gg] "$dir"/*.[Pp][Nn][Gg];

		rm -rf "$dir"
	done
fi
