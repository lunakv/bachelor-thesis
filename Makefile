
all: prace.pdf abstrakt.pdf abstrakt_en.pdf
	mv *.pdf pdf

# LaTeX je potreba spustit nekolikrat, aby spravne spocital odkazy
prace.pdf: prace.tex $(wildcard *.tex) literatura.bib prace.xmpdata
	pdflatex $<
	bibtex prace
	pdflatex $<
	pdflatex $<

abstrakt.pdf: abstrakt.tex abstrakt.xmpdata
	pdflatex $<

abstrakt_en.pdf: abstrakt_en.tex abstrakt_en.xmpdata
	pdflatex $<

clean:
	rm -f *.log *.dvi *.aux *.toc *.lof *.lot *.out *.bbl *.blg *.xmpi *.te\~
	rm -f pdf/*

check:
	verapdf --format text -f 2u pdf/prace.pdf
