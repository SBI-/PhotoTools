#!/bin/bash

#find . -name "*.JPG" -exec identify -verbose {} \; | grep -E 'exif:FNum|exif:FocalLength:' | sed -e 's/^\s*//' 
# exiv2 seems to be the better tool for extracting exiv information from all sorts of files in multiple formats
#find . -name "*.JPG" -exec identify -verbose {} \; | grep -E 'exif:FocalLength:' | sed -e 's/^\s*//' | sort -k2 -n | uniq -c | sort -k1 -k3 -nr
##find . -name "*.CR2" -exec exiv2 {} 2> /dev/null \; | grep -E 'Focal' | sed -e 's/^\s*//' | sort -k2 -n | uniq -c | sort -k1 -k3 -nr
#find . -name "*.CR2" -exec exiv2 -g "Focal lenght" {} \;
find $1 -name "*.CR2" -exec exiv2 -g "Exif.Canon.FocalLength" {} 2> /dev/null \; | awk '{print $4}' | sort -n | uniq -c | sort -k2 -nr
