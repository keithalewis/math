MKDN = $(wildcard [a-z]*.md)
HTML = $(MKDN:.md=.html)
PDF  = $(MKDN:.md=.pdf)
DOCX = $(MKDN:.md=.docx)

KATEX=https://cdn.jsdelivr.net/npm/katex@0.12.0/dist/

CSS = math.css

FLAGS  = -f markdown+definition_lists+raw_html+pipe_tables
FLAGS += -t html5
FLAGS += -s # smart quotes
FLAGS += --katex=$(KATEX)
FLAGS += --css math.css
FLAGS += -A FOOTER.md
#FLAGS +=  -M date="$(shell date "+%B %e, %Y")"
#FLAGS += --toc
#FLAGS += -B katex.tex
#FLAGS += --reference-location=block
#FLAGS += -t html5
#FLAGS += --mathjax
#FLAGS += --css capm.css
#FLAGS += --section-divs
#FLAGS += -B HEADER.md
#FLAGS += -H katex.html
#FLAGS += -f markdown+tex_math_single_backslash+auto_identifiers+definition_lists
TEXFLAGS =
TEXFLAGS = 
#TEXFLAGS = --pdf-engine=xelatex

$(HTML): %.html: %.md $(CSS)
	pandoc $(FLAGS) $< -o $@

$(PDF): %.pdf: %.md
	pandoc $(TEXFLAGS) $< -o $@

$(DOCX): %.docx: %.md
	pandoc $< -o $@

index: $(MKDN)
	./index.sh $(MKDN) > docs/index.html

docs: $(HTML) index
	cp *.html math.css docs
	git add docs/*

rsync:
	rcp $(HTML) $(CSS) kal@web626.webfaction.com:webapps/kalx/math

clean:
	rm -f *.html docs/*.html
