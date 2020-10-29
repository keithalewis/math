#!/bin/bash
# Generate index from md files

cat << EoH
<!DOCTYPE HTML>
<html>
<head>
<title>Mathematics</title>
<link rel="stylesheet" href="index.css" />
</head>
<body>
<h1>Mathematics</h1>
<p>
Works in progress on mathematics.
Please contact <a href="mailto:kal@kalx.net">me</a> if you have questions, comments, or suggestions.
</p>
<table>
<thead>
<tr>
<td>Name</td>
<td>Description</td>
</tr>
</thead>
<tbody>
EoH

for f in "$@"
do
	d=$(egrep 'abstract:' $f | sed 's/.*abstract:\s*//')
	b=$(basename -s .md $f)
	cat << EoB
<tr>
<td><a href="$b.html">$b</a></td>
<td>$d</td>
</tr>
EoB
done


cat << EoF
</tbody>
</table>
</body>
</html>
EoF
