#!/bin/sh
filelist=`svn st -q | awk '{ print $2}'`

for file in $filelist;
do
    echo "run tkdiff $file"
    tkdiff $file
done

