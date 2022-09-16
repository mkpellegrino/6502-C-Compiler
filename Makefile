#CC=/usr/bin/gcc
#CC=/usr/local/gcc-10.1.0-true/bin/g++-10.1-true
CC=/usr/local/gfortran/bin/g++
LEX=/usr/bin/lex
#LEX=/usr/local/bin/flex
YACC=/usr/local/bin/yacc
#YACC=/usr/bin/yacc
#YACC=/usr/local/bin/bison
LIBRARIES=-ll -ly

all:	clean lexer parser compiler

parser: parser.y
	$(YACC) -d -v parser.y

lexer:	lexer.l
	$(LEX) lexer.l

compiler: y.tab.c
	$(CC) $(LIBRARIES) -w y.tab.c -o compiler

clean:
#	mv -f parser.tab.c parser.tab.c.prev
#	mv -f parser.tab.h parser.tab.h.prev
#	rm -f compiler.prev
#	mv -f compiler compiler.prev
	rm -fR *.*~
	rm -fR Makefile~
