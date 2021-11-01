DOCNAME=sheet

all: report

.PHONY: clean

report:
	rm -f *.blg *.bbl *.aux *.log
	rm -f *.dvi *.out *.loabbre *.loapp *.loaf *.lof *.lot *.toc *.los
	pdflatex $(DOCNAME).tex
	bibtex $(DOCNAME).aux
	pdflatex $(DOCNAME).tex
	pdflatex $(DOCNAME).tex
	latex2rtf $(DOCNAME).tex

view: report
	open $(DOCNAME).pdf

clean:
	rm -f *.blg *.bbl *.aux *.log
	rm -f *.dvi *.out *.loabbre *.loapp *.loaf *.lof *.lot *.toc *.los
