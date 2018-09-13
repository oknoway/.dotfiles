#!/bin/bash

if [ -z "$1" ]; then
	echo "Unzip a file, rezip contents with the same name.";
	echo "Usage:";
	echo "    rezip {filenames}";
else
	for folder in "$@"
	do

		# filename=$(basename "$folder")
		# extension="${filename##*.}"
		# dir="${filename%.*}"

		zip -0 -j -q "$folder".cbz $(find -type f -exec file --mime-type {}  \; | awk '{if ($NF == "image/jpeg") print $0 }')


		# echo "$filename";
		# echo "$extension";

		#mkdir -p "$dir";
		#unrar e -inul "$file" "$dir";
		#zip -0 -j -q "$dir"_fixed."$extension" "$dir"/*.[JjPp][PpNn][Gg];

		#rm -rf "$dir";

	done
fi
