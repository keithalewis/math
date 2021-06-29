MKDN = $(wildcard [a-z]*.md) # do not publish _* files
HTML = $(MKDN:.md=.html)
PDF  = $(MKDN:.md=.pdf)
DOCX = $(MKDN:.md=.docx)

KATEX = https://cdn.jsdelivr.net/npm/katex@0.12.0/dist/
REVEAL = https://cdn.jsdelivr.net/reveal.js/3.0.0

CSS = math.css

FLAGS  = -f markdown+definition_lists+raw_html+pipe_tables
FLAGS += -f markdown+tex_math_single_backslash+auto_identifiers+definition_lists
TEXFLAGS = --pdf-engine=xelatex
FLAGS += -t html5
FLAGS += -s # smart quotes
FLAGS += --katex=$(KATEX)
#FLAGS += --katex=katex/
FLAGS += --css math.css
FLAGS += -A FOOTER.md
#FLAGS +=  -M date="$(shell date "+%B %e, %Y")"
#FLAGS += --toc
#FLAGS += -B katex.tex
FLAGS += --reference-location=block
#FLAGS += -t html5
#FLAGS += --mathjax
#FLAGS += --css capm.css
FLAGS += --section-divs
FLAGS += -H HEADER.md
#FLAGS += -H katex.html

%.html: %.md $(CSS)
	pandoc $(FLAGS) $< -o $@

index: $(MKDN)
	./index.sh [a-z]*.md > index.html

docs: $(HTML) index
	cp *.html math.css docs
	git add docs/*

clean:
	rm -f *.docx *.pdf *.html docs/*.html

RJS = -V theme="serif" -V revealjs-url=https://cdn.jsdelivr.net/reveal.js/3.0.0

slides: um_slides.md
	pandoc --include-in-header=revealjs.html -V theme=serif -H utf8.html -t revealjs -o um_slides.html um_slides.md
	pandoc -o um_slides.pptx um_slides.md
