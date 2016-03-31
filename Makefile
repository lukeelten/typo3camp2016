MTHEME = mtheme
THEME_INSTALL = ~/texmf/tex/latex/mtheme
PRESENTATION = Presentation
TEXT = Text
MAIN = main.tex
TMP = output

ALL: presentation text clean

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

text:
	mkdir -p $(TMP)
	cd $(TEXT) && pdflatex -output-directory=../$(TMP) -jobname=$(TEXT) $(MAIN)
	cd $(TEXT) && pdflatex -output-directory=../$(TMP) -jobname=$(TEXT) $(MAIN)
	cp -f $(TMP)/$(TEXT).pdf .

clean:
	rm -rf $(TMP)
	rm -f $(PRESENTATION)/*.aux $(PRESENTATION)/*.log $(PRESENTATION)/*.nav $(PRESENTATION)/*.out $(PRESENTATION)/*.snm $(PRESENTATION)/main.pdf $(PRESENTATION)/*.synctex.gz $(PRESENTATION)/*.toc
	rm -f $(TEXT)/*.aux $(TEXT)/*.log $(TEXT)/*.nav $(TEXT)/*.out $(TEXT)/*.snm $(TEXT)/main.pdf $(TEXT)/*.synctex.gz $(TEXT)/*.toc
