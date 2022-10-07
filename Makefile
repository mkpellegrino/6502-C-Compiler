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

tests: 
	./compiler --code-segment 49152 --data-segment 828 --no-asm-comments --symbol-table < ./cond-tests.c > cond-tests.asm


typetest:
	./compiler --code-segment 49152 --data-segment 828 --no-asm-comments --parser-comments --memory-locations --symbol-table < ./typetest.c > typetest.asm

forloop:
	./compiler --code-segment 49152 --data-segment 828 < ./forloop.c > forloop.asm

vartests:
	./compiler --code-segment 49152 --data-segment 828 --no-asm-comments --memory-locations < ./vartests.c > vartests.asm

debug:
	./compiler --code-segment 49152 --data-segment 828 --parser-comments --memory-locations < ./cond-tests.c > cond-tests.asm
	./compiler --code-segment 49152 --data-segment 828 --parser-comments --memory-locations < ./typetest.c > typetest.asm
	./compiler --code-segment 49152 --data-segment 828 --parser-comments --memory-locations < ./forloop.c > forloop.asm
	./compiler --code-segment 49152 --data-segment 828 --parser-comments --memory-locations < ./vartests.c > vartests.asm
	./compiler --code-segment 49152 --data-segment 828 --parser-comments --memory-locations < ./looptests.c > looptests.asm
	./compiler --code-segment 49152 --data-segment 828 --parser-comments --memory-locations < ./iftests.c > iftests.asm

clean:
#	mv -f parser.tab.c parser.tab.c.prev
#	mv -f parser.tab.h parser.tab.h.prev
#	rm -f compiler.prev
#	mv -f compiler compiler.prev
	rm -fR *.*~
	rm -fR Makefile~
	rm -fR ~/Downloads/*.prg
