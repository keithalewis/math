MKDN = $(sort $(wildcard [0-9a-z]*.md)) # do not publish _* files
HTML = $(MKDN:.md=.html)
PDF  = $(MKDN:.md=.pdf)
DOCX = $(MKDN:.md=.docx)

KATEX = https://cdn.jsdelivr.net/npm/katex@0.12.0/dist/
REVEAL = https://cdn.jsdelivr.net/reveal.js/3.0.0

CSS = math.css

FLAGS  = -f markdown+definition_lists+raw_html+pipe_tables+citations
FLAGS += -f markdown+tex_math_single_backslash+auto_identifiers+definition_lists
#FLAGS += --citeproc capm.bib
TEXFLAGS = --pdf-engine=xelatex 
FLAGS += -t html5
FLAGS += -s # smart quotes
#FLAGS += --katex
FLAGS += --katex=$(KATEX)
#FLAGS += --katex=katex/
FLAGS += --css math.css
#FLAGS += -A FOOTER.md
FLAGS += --metadata date="$(shell date "+%B %e, %Y")"
#TEXFLAGS += --metadata date="$(shell date "+%B %e, %Y")"
TEXFLAGS += -V fontsize=12pt
TEXFLAGS +=  -M date="$(shell date "+%B %e, %Y")"
#TEXFLAGS += --bibliography=capm.bib
FLAGS += --toc --toc-depth=6
#FLAGS += -B katex.tex
FLAGS += --reference-location=document
#FLAGS += -t html5
#FLAGS += --mathjax
#FLAGS += --css capm.css
FLAGS += --section-divs
#FLAGS += -H HEADER.html
#FLAGS += -H katex.html

%.html: %.md $(CSS)
	pandoc $(FLAGS) $< -o $@

%.pdf: %.md $(CSS)
	pandoc $(TEXFLAGS) $< -o $@

%.docx: %.md
	pandoc $< -o $@

index: $(MKDN)
	./index.sh $(MKDN) > index.html

docs: $(HTML) index
	cp *.html math.css docs
	git add -f docs/*

clean:
	rm -f *.docx *.pdf *.html docs/*.html

RJS = -V theme="serif" -V revealjs-url=https://cdn.jsdelivr.net/reveal.js/3.0.0

slides: um_slides.md
	pandoc -V theme=serif -t revealjs -o um_slides.html um_slides.md
	pandoc -o um_slides.pptx um_slides.md

ep.pdf: ep.md
	pandoc $< --metadata date="$(shell date "+%B %e, %Y")" --pdf-engine=xelatex --bibliography=capm.bib -o $@

#ep.pdf: ep.latex
#	xetex ep.latex
#	bibtex ep.aux
#	xetex ep.latex
#	xetex ep.latex
