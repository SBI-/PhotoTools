#!/bin/bash

find $1 -name "*.CR2" -exec exiv2 -g "Exif.Canon.FocalLength" {} 2> /dev/null \; | awk '{print $4}' | sort -n | uniq -c | sort -k2 -nr
