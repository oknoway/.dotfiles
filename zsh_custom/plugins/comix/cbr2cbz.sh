#!/bin/bash

if [ -z "$1" ]; then
	echo "Convert cbr file to cbz file.";
	echo "Usage:";
	echo "    cbrtocbz {filenames}";
else
	for file in "$@"
	do
		dir=`mktemp -d`;
		echo "Extracting images to $dir…";
		#7z e -o"$dir" "$file"
		unrar e -inul "$file" "$dir"

		echo "Compressing images…";

		name="${file%.*}";

		echo "Writing new file: $name.cbz";
		zip -0 -j -q "$name".cbz "$dir"/*.[JjPp][PpNn][Gg];

		rm -rf "$dir"
	done
fi
