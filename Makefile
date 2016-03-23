MTHEME = mtheme
THEME_INSTALL = ~/texmf/tex/latex/mtheme
PRESENTATION = Presentation
MAIN = main.tex
JOBNAME = Presentation
TMP = output

ALL: theme theme_install presentation clean

theme:
	git submodule init
	git submodule update
	make -C $(MTHEME) sty

theme_install:
	mkdir -p $(THEME_INSTALL)
	cp $(MTHEME)/*.sty $(THEME_INSTALL)

presentation:
	mkdir -p $(TMP)
	pdflatex -output-directory=output -jobname=$(JOBNAME) $(PRESENTATION)/$(MAIN)
	pdflatex -output-directory=output -jobname=$(JOBNAME) $(PRESENTATION)/$(MAIN)
	cp -f $(TMP)/$(JOBNAME).pdf .

clean:
	rm -rf $(TMP)
	rm -f $(PRESENTATION)/*.aux $(PRESENTATION)/*.log $(PRESENTATION)/*.nav $(PRESENTATION)/*.out $(PRESENTATION)/*.snm $(PRESENTATION)/main.pdf $(PRESENTATION)/*.synctex.gz $(PRESENTATION)/*.toc
