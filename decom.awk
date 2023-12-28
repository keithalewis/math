#!/usr/bin/env -S gawk -f

BEGIN {
	file = "_" ARGV[1];
	p = 1;
}
/^<details>/ { p = 0 }
{ if (p == 1) print > file }
/^<\/details>/ { p = 1 }
