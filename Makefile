MTHEME = mtheme
THEME_INSTALL = ~/texmf/tex/latex/mtheme
PRESENTATION = Presentation
MAIN = main.tex
JOBNAME = Presentation
TMP = output

ALL: theme theme_install presentation

theme:
	git submodule init
	git submodule update
	cd $(MTHEME)
	make sty
	cd ..

theme_install:
	mkdir -p $(THEME_INSTALL)
	cp $(MTHEME)/*.sty $(THEME_INSTALL)

presentation:
	mkdir -p $(TMP)
	pdflatex -output-directory=output -jobname=$(JOBNAME) $(PRESENTATION)/$(MAIN)
	cp -f $(TMP)/$(JOBNAME).pdf .
	rm -rf $(TMP)
