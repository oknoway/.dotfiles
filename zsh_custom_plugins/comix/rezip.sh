#!/bin/bash

if [ -z "$1" ]; then
	echo "Unzip a file, rezip contents with the same name.";
	echo "Usage:";
	echo "    rezip {filenames}";
else
	for file in "$@"
	do

		filename=$(basename "$fullfile")
		extension="${filename##*.}"
		# filename="${filename%.*}"


		unzip -p "$file" | zip -0 -j -q "$filename"_fixed."$extension" -;

	done
fi
