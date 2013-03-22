filename=YOUR_MAIN_LATEX_FILE_NAME_WITHOUT_THE_.tex

pdf: ps
	ps2pdf -dPDFSETTINGS=/printer ${filename}.ps

ps:	dvi
	dvips -t letter ${filename}.dvi

dvi:
	latex ${filename}
	bibtex ${filename}||true
	latex ${filename}
	latex ${filename}

read:
	evince ${filename}.pdf &

aread:
	acroread ${filename}.pdf

clean:
	rm -f ${filename}.ps ${filename}.pdf ${filename}.log ${filename}.aux ${filename}.out ${filename}.dvi ${filename}.bbl ${filename}.blg

