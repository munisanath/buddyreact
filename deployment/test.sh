#!/bin/bash

function die() {
	echo "$@" 1>&2
	exit 1
}
pwd=`pwd`
folder="${pwd}/muni"

if [[ ! -d "$folder" ]] && [[ ! -f "$folder" ]]; then
	mkdir -p "$folder"
else
	die "$folder already exists but is not a directory" 1>&2
fi

# set -x
# directory="$DIR"
# if [[ ! -d $DIR ]]; then
#     mkdir "$DIR"
# else
# 	echo "directory already exists"
# fi

# if [ ! -d "${DIR}" ]; then
#   mkdir -p "${DIR}"
# fi