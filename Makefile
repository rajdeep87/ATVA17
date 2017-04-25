SRC=algorithm.tex deductions.tex related_work.tex definitions.tex learning.tex domains.tex conclusion.tex example.tex paper.tex contributions.tex experiments.tex decision.tex introduction.tex symbols.tex appendix.tex result.tex plot-runtimes.tex graph1.tex graph2.tex graphs.tex
TARGET=paper
BIB=biblio.bib

all: ${TARGET}.pdf

${TARGET}.dvi: ${TARGET}.tex ${BIB} ${SRC}
	latex ${TARGET}.tex
	bibtex ${TARGET}
	latex ${TARGET}.tex
	latex ${TARGET}.tex

${TARGET}.ps: ${TARGET}.dvi 
	dvips -t a4 -Ppdf -G0 -o ${TARGET}.ps ${TARGET}.dvi 

${TARGET}.pdf: ${TARGET}.ps 
	ps2pdf -sPAPERSIZE=a4  -dCompatibilityLevel=1.4 -dSubsetFonts=true -dEmbedAllFonts=true  -dPDFSETTINGS=/prepress ${TARGET}.ps ${TARGET}.pdf

clean:
	rm -f ${TARGET}.{log,aux,dvi,bbl,blg,toc,ps,pdf,out} 

purge: clean
	rm -f ${TARGET}.pdf

PHONY : all clean purge
