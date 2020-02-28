install:
	mkdir -p ~/texmf/tex/latex/
	cp ./tletter.cls ~/texmf/tex/latex/tletter.cls

installforce:
	mkdir -p ~/texmf/tex/latex/
	cp -f ./tletter.cls ~/texmf/tex/latex/tletter.cls

installdata:
	mkdir -p ~/texmf/tex/latex/
	cp -f ./tletterData.sty ~/texmf/tex/latex/tletterData.sty

installall: installforce installdata

