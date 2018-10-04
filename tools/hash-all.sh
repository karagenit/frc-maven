#!/usr/bin/env bash

files=$(find maven -type f \( -not -name '*.md5' -a -not -name '*.sha1' \) -print)

for file in $files; do
    md5=$(md5sum ${file} | awk '{ print $1 }')
    sha1=$(sha1sum ${file} | awk '{ print $1 }')
    echo -n "${md5}" > "${file}.md5"
    echo -n "${sha1}" > "${file}.sha1"
done
