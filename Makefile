MKDN = $(wildcard [a-z]*.md)
HTML = $(MKDN:.md=.html)
PDF  = $(MKDN:.md=.pdf)
DOCX = $(MKDN:.md=.docx)

KATEX = https://cdn.jsdelivr.net/npm/katex@0.12.0/dist/
REVEAL = https://pagecdn.io/lib/reveal/4.0.2/js/reveal.min.js

CSS = math.css

FLAGS  = -f markdown+definition_lists+raw_html+pipe_tables
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
FLAGS += -f markdown+tex_math_single_backslash+auto_identifiers+definition_lists
TEXFLAGS =
#TEXFLAGS = 
TEXFLAGS = --pdf-engine=xelatex

%.html: %.md $(CSS)
	pandoc $(FLAGS) $< -o $@

$(PDF): %.pdf: %.md
	pandoc $(TEXFLAGS) $< -o $@

$(DOCX): %.docx: %.md
	pandoc $< -o $@

index: $(MKDN)
	./index.sh [a-z]*.md > index.html

docs: $(HTML) index
	cp *.html math.css docs
	git add docs/*

clean:
	rm -f *.docx *.pdf *.html docs/*.html

<<<<<<< HEAD
RJS = -V theme="serif" -V revealjs-url=https://cdn.jsdelivr.net/reveal.js/3.0.0
RJS += --katex=$(KATEX)
=======
RJS = -V $(REVEAL)
>>>>>>> ab2c58c4b5decbe0e3688e3e1c9f864e4147c979

slides: um_slides.md
	pandoc -s -H utf8.html -t revealjs $(RJS) -o um_slides.html um_slides.md
	pandoc -o um_slides.pptx um_slides.md
