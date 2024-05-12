%.docx: %.md
	pandoc -s $< -o $@

ep.docx: ../ep.md
	pandoc -f markdown -t latex ../ep.md -o ep.tex
	pandoc -f latex ep.tex -o $@

.PHONY: clean

clean:
	rm *.docx
