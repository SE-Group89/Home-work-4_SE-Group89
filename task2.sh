#!/bin/bash

grep -rl "sample" . | while read file; do
  occurrences=$(grep -o "CSC510" "$file" | wc -l)

  if [ "$occurrences" -ge 3 ]; then
    filesize=$(stat -c%s "$file")
    
    echo "$occurrences $filesize $file"
  fi
done | gawk '{ gsub(/file_/, "filtered_", $3); print $1, $2, $3 }' | sort -k1,1nr -k2,2n
