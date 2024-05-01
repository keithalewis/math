#!/bin/bash
# Make .md into html

#FLAGS += --metadata date="$(shell date "+%B %e, %Y")"

echo $@

for md in "$@"; do
	echo $md
	date=$(stat -c "%y" ${md} | cut -d' ' -f 1)
	dn=$(dirname ${md})
	echo $date
	echo "pandoc ${md} --metadata date=\"${date}\" -o ${dn}.html"
done
