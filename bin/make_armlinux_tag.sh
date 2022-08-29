#!/bin/bash

rm .files2gtag

for f in block crypto Documentation drivers firmware fs include init ipc kernel lib \
         mm net samples scripts security sound tools usr virt
do
   find $f -iregex '.*\(c\|h\)'  >>.files2gtag
done

for f in boot common configs include kernel lib mach-dove mm nwfpe oprofile \
         plat-orion tools
do
   find arch/arm/$f -iregex '.*\(c\|h\)'  >>.files2gtag
done

gtags -v -f .files2gtag
