MKDN = $(wildcard *.md)
HTML = $(MKDN:.md=.html)
PDF  = $(MKDN:.md=.pdf)
DOCX = $(MKDN:.md=.docx)

KATEX=https://cdn.jsdelivr.net/npm/katex@0.12.0/dist/
CSS = math.css

FLAGS  = -f markdown+definition_lists+raw_html+pipe_tables
FLAGS += -t html5
FLAGS += -s # smart quotes
FLAGS += --katex=$(KATEX)
FLAGS += --css $(CSS)
FLAGS +=  -M date="$(shell date "+%B %e, %Y")"
#FLAGS += --toc
#FLAGS += -B katex.tex
#FLAGS += --reference-location=block
#FLAGS += -t html5
#FLAGS += --mathjax
#FLAGS += --css capm.css
#FLAGS += --section-divs
#FLAGS += -H header.html
#FLAGS += -H katex.html
#FLAGS += -A footer.html
#FLAGS += -f markdown+tex_math_single_backslash+auto_identifiers+definition_lists

$(HTML): %.html: %.md $(CSS)
	pandoc $(FLAGS) $< -o $@

$(PDF): %.pdf: %.md
	pandoc  $< -o $@

$(DOCX): %.docx: %.md
	pandoc $< -o $@

index: $(MKDN)
	./index.sh $(MKDN) > docs/index.html

docs: $(HTML) index
	cp *.html docs

rsync:
	rcp $(HTML) $(CSS) kal@web626.webfaction.com:webapps/kalx/math
