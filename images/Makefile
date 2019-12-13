SRCS      = $(shell ls *.tex)

EXT       = ps dvi pdf bak log aux nav out snm toc vrb idx
OUT       = $(foreach s,$(SRCS), $(addprefix $(s:.tex=.), $(EXT)))


images: $(SRCS)
	 ls *.tex | xargs -n 1 xelatex

clean:
	/bin/rm -rf *~ $(OUT)

# END OF FILE
