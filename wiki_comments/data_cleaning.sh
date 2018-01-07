#!/usr/bin/env bash

normalize_text() {
    sed -e 's!http[s]\?://\S*!!g' -e 's/\"\"\"/\"/g' -e "s/’/'/g" -e "s/′/'/g" -e "s/''/ /g" -e "s/'/ ' /g" -e "s/“/\"/g" -e "s/”/\"/g" \
        -e 's/"/ " /g' -e 's/\./ \. /g' -e 's/<br \/>/ /g' -e 's/, / , /g' -e 's/(/ ( /g' -e 's/)/ ) /g' -e 's/\!/ \! /g' \
        -e 's/\?/ \? /g' -e 's/\;/ /g' -e 's/\:/ /g' -e 's/-/ - /g' -e 's/=/ /g' -e 's/=/ /g' -e 's/*/ /g' -e 's/|/ /g' \
        -e 's/«/ /g' -e 's/NEWLINE/NEWLINE /g' | tr 0-9 " " | tr '[:upper:]' '[:lower:]'
}

while IFS='' read -r line || [[ -n "$line" ]]; do
    echo $line | normalize_text | tr -s " "
done < "$1"

