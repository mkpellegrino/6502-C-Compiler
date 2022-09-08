#CC=/usr/bin/gcc
CC=/usr/local/gfortran/bin/g++
LEX=/usr/local/bin/flex
#LEX=/usr/bin/lex
#YACC=/usr/local/bin/yacc
#YACC=/usr/bin/yacc
YACC=/usr/local/bin/bison
LIBRARIES=-ll -ly

all:	clean lexer parser compiler

parser: parser.y
	$(YACC) -d -v parser.y

lexer:	lexer.l
	$(LEX) lexer.l

compiler: parser.tab.c
	$(CC) $(LIBRARIES) -w parser.tab.c -o compiler

clean:
	rm -fR *.*~
	rm -fR Makefile~
