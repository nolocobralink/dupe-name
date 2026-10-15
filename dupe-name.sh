#!/usr/bin/env bash

fullpath=$1
identifier=$2

if [[ -z "$fullpath" ]] || [[ -z "$identifier" ]];
then
	echo "Please enter the path of the file (full or relative) and the identifier to add."
	exit 1
fi

dir=$(dirname $fullpath)
filename=$(basename $fullpath)

filebase="${filename%.*}"
fileext="${filename##*.}"

# If file doesn't have an extension, fileext will be the same as filebase
# Therefore this check clears fileext if "$filebase.$fileext" doesn't match $filename
if [[ "$filebase.$fileext" != "$filename" ]];
then
	fileext=""
fi

echo -n "$dir/${filebase}_$identifier"

[[ ! -z "$fileext" ]] && echo ".$fileext" || echo ""

