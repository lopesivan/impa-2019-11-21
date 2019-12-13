.PHONY: clean all

SRCS     = $(shell find -name \*.tex)
NAME     = main
BIB      = referencias.bib
OBJDIR   = build
LATEX    = lualatex
LATEXOPT = --output-directory=$(OBJDIR)
PDF      = $(OBJDIR)/$(NAME).pdf
MAIN     = $(NAME).tex
BBL      = $(OBJDIR)/$(NAME).bbl
AUX      = $(OBJDIR)/$(NAME).aux

all: $(PDF)

$(PDF): $(BBL) $(MAIN)
	TEXINPUTS=".:sty/:" $(LATEX) $(LATEXOPT) $(MAIN)
	TEXINPUTS=".:sty/:" $(LATEX) $(LATEXOPT) $(MAIN)

$(BBL): $(AUX)
	bibtex $(AUX)

$(AUX): $(BIB) | $(OBJDIR)
	TEXINPUTS=".:sty/:" $(LATEX) $(LATEXOPT) $(MAIN)
	TEXINPUTS=".:sty/:" $(LATEX) $(LATEXOPT) $(MAIN)

$(OBJDIR):
	mkdir -p $@

$(NAME).zip:
	git ls-files | xargs zip -9 $@ .git

clean:
	rm -rf ./build

show:
	zathura $(OBJDIR)/main.pdf