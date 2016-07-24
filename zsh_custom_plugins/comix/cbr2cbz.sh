cbr=$1
start_directory=`pwd`

cbz=`basename "$cbr" .cbr`.cbz

tempdir=`mktemp -d`
cd "$tempdir"
unrar e -inul "$start_directory/$cbr"
zip -q "$start_directory/$cbz" *
rm -rf "$tempdir"
