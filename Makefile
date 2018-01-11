manuscript = report
latexopt = -file-line-error -halt-on-error

$(manuscript).pdf: $(manuscript).tex text/*.tex references.bib images/*.png
	pdflatex $(latexopt) $(manuscript).tex
	bibtex $(manuscript).aux
	bibtex $(manuscript).aux
	pdflatex $(latexopt) $(manuscript).tex
	pdflatex $(latexopt) $(manuscript).tex

clean :
	rm -f *.aux *.log *.bbl *.lof *.lot *.blg *.out *.toc *.run.xml *.bcf
	rm -f text/*.aux
	rm $(manuscript).pdf
	rm code/*.pyc

# Make keyword for commands that don't have dependencies
.PHONY : all clean
