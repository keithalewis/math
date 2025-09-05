# doc

Generate html and pdf static website from md files using pandoc.

For each directory creates an index.html with name, abstract, and links to html and pdf versions
of name.md files. Index has subdirectories at top.

For dir in directories, index.html is

```
# dir

## [subdir](subdir/index.html)
## ...

[name.md] [name.html] [name.pdf]
	> abstract
```
