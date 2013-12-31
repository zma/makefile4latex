filename=YOUR_MAIN_LATEX_FILE_NAME_WITHOUT_THE_.tex

pdf: ps
	# ps2pdf -dPDFSETTINGS=/printer ${filename}.ps
	ps2pdf ${filename}.ps

pdf: ps
	ps2pdf ${filename}.ps

ps:	dvi
	dvips -t letter ${filename}.dvi

dvi:
	latex ${filename}
	bibtex ${filename}||true
	latex ${filename}
	latex ${filename}

html:
	latex2html -split +0 -info "" -no_navigation ${filename}

text: html
	html2text -width 100 -style pretty ${filename}/${filename}.html | sed -n '/./,$$p' | head -n-2 >${filename}.txt

read:
	evince ${filename}.pdf &

aread:
	acroread ${filename}.pdf

clean:
	rm -f ${filename}.ps ${filename}.pdf ${filename}.log ${filename}.aux ${filename}.out ${filename}.dvi ${filename}.bbl ${filename}.blg
