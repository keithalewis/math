cover.docx: cover.md
	pandoc $< -o $@

ep.docx: ../ep.md
	pandoc -f markdown -t latex ../ep.md -o ep.tex
	pandoc -f latex ep.tex -o $@
