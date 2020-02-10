install:
	cp ./tletter.cls ~/texmf/tex/latex/tletter.cls

installforce:
	cp -f ./tletter.cls ~/texmf/tex/latex/tletter.cls

installdata:
	cp -f ./tletterData.sty ~/texmf/tex/latex/tletterData.sty

installall: installforce installdata

