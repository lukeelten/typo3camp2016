MTHEME = mtheme
THEME_INSTALL = ~/texmf/tex/latex/mtheme
PRESENTATION = Presentation
MAIN = main.tex
TMP = output

ALL: presentation clean

theme:
	git submodule init
	git submodule update
	make -C $(MTHEME) sty

theme_install: theme
	mkdir -p $(THEME_INSTALL)
	cp $(MTHEME)/*.sty $(THEME_INSTALL)

presentation:
	mkdir -p $(TMP)
	cd $(PRESENTATION) && pdflatex -output-directory=../$(TMP) -jobname=$(PRESENTATION) $(MAIN)
	cd $(PRESENTATION) && pdflatex -output-directory=../$(TMP) -jobname=$(PRESENTATION) $(MAIN)
	cp -f $(TMP)/$(PRESENTATION).pdf .

clean:
	rm -rf $(TMP)
	rm -f $(PRESENTATION)/*.aux $(PRESENTATION)/*.log $(PRESENTATION)/*.nav $(PRESENTATION)/*.out $(PRESENTATION)/*.snm $(PRESENTATION)/main.pdf $(PRESENTATION)/*.synctex.gz $(PRESENTATION)/*.toc

