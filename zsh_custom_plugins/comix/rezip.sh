#!/bin/bash

if [ -z "$1" ]; then
	echo "Unzip a file, rezip contents with the same name.";
	echo "Usage:";
	echo "    rezip {filenames}";
else
	for file in "$@"
	do

		filename=$(basename "$file")
		extension="${filename##*.}"
		dir="${filename%.*}"

		# echo "$filename";
		# echo "$extension";

		mkdir -p "$dir";
		unrar e -inul "$file" "$dir";
		zip -0 -j -q "$dir"_fixed."$extension" "$dir"/*.[JjPp][PpNn][Gg];
<<<<<<< HEAD
=======

		rm -rf "$dir";
>>>>>>> origin/master

		rm -rf "$dir";
		
	done
fi
