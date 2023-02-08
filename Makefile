#CC=/usr/bin/gcc
#CC=/usr/local/gcc-10.1.0-true/bin/g++-10.1-true
CC=/usr/local/gfortran/bin/g++
LEX=/usr/bin/lex
#LEX=/usr/local/bin/flex
YACC=/usr/local/bin/yacc
#YACC=/usr/bin/yacc
#YACC=/usr/local/bin/bison
LIBRARIES=-ll -ly

all:	clean lexer parser compiler tests ifs decdig

parser: parser.y
	$(YACC) -d -v parser.y

lexer:	lexer.l
	$(LEX) lexer.l

compiler: y.tab.c
	$(CC) $(LIBRARIES) -w  y.tab.c -o compiler


poke2:
	cat ./poke2.c common.c > poke2.tmp
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./poke2.tmp > poke2.asm

data:
	cat ./data.c common.c > data.tmp
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./data.tmp > data.asm

banks:
	cat ./banks.c common.c > banks.tmp
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./banks.tmp > banks.asm

example:
	cat ./example.c common.c > example.tmp
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./example.tmp > example.asm

terra:
	cat ./terraform.c common.c > terra.tmp
	./compiler --code-segment 8192 --data-segment 820 --memory-locations --symbol-table < ./terra.tmp > terra.tmp.asm
	cat terra.tmp.asm cj-sid.asm > terra.asm
	rm ./terra.tmp
	rm ./terra.tmp.asm

hires:
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./hires.c > hires.asm

quad:
	cat ./quad.c common.c > quad.tmp
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./quad.tmp > quadratic.asm

driver8:
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./driver8.c > driver8.asm

collision:
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./collision.c > collision.asm

math:
	cat ./math.c common.c > math.tmp
	cat ./division.c common.c > division.tmp

	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./math.tmp > math.asm
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./division.tmp > division.asm

input:
	./compiler --code-segment 2100 --data-segment 820 --parser-comments --memory-locations --symbol-table < ./input.c > input.asm

rocket:
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./rocket.c > rocket.asm

general:
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./general.c > general.asm

uintcmp:
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./uintcmp.c > uintcmp.asm

tests:
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./cond-tests.c > cond-tests.asm
	./compiler --code-segment 2100 --data-segment 820 --no-asm-comments < ./floatmath.c > floatmath.asm
	./compiler --code-segment 2100 --data-segment 820 --no-asm-comments < ./decdig.c > decdig.asm
#	./compiler --code-segment 2100 --data-segment 820 --no-asm-comments < ./bytemath.c > bytemath.asm
	./compiler --code-segment 2100 --data-segment 820 --no-asm-comments < ./poketest.c > poketest.asm
	./compiler --code-segment 2100 --data-segment 820 --no-asm-comments < ./poke2.c > poke2.asm
	./compiler --code-segment 2100 --data-segment 820 --no-asm-comments < ./arithtests.c > arithtests.asm

iftest:
	./compiler --code-segment 2100 --data-segment 820 --no-asm-comments < ./iftests.c > iftests.asm

fortest:
	./compiler --code-segment 2100 --data-segment 820 --no-asm-comments < ./fortest.c > fortest.asm

typetest:
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./typetest.c > typetest.asm

forloop:
	./compiler --code-segment 2100 --data-segment 820 --no-asm-comments < ./forloop.c > forloop.asm

sound:
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./sound.c > sound.asm

array:
	./compiler --code-segment 2100 --data-segment 820 --no-asm-comments  --memory-locations --symbol-table < ./array.c > array.asm

getchar:
	./compiler --code-segment 2100 --data-segment 820 --no-asm-comments  --memory-locations --symbol-table < ./getchar.c > getchar.asm

sprite:
	./compiler --code-segment 2100 --data-segment 820 --parser-comments --memory-locations --symbol-table < ./sprite.c > sprite.asm

sprite2:
	./compiler --code-segment 2100 --data-segment 820 --parser-comments --memory-locations --symbol-table < ./sprite2.c > sprite2.asm



plot:
	cat ./plottest.c common.c > plottest.tmp
	./compiler --code-segment 2100 --data-segment 820 --no-asm-comments < ./plottest.tmp > plottest.asm
	rm -f plottest.tmp


decdig:
	./compiler --code-segment 2100 --data-segment 820 --no-asm-comments < ./decdig.c > decdig.asm

bytemath:
	./compiler --code-segment 2100 --data-segment 820 --no-asm-comments --parser-comments --memory-locations --symbol-table < ./bytemath.c > bytemath.asm

printftest:
	./compiler --code-segment 2100 --data-segment 820 --no-asm-comments --parser-comments --memory-locations --symbol-table < ./printftest.c > printftest.asm

float:
	./compiler --code-segment 2100 --data-segment 820 --no-asm-comments --parser-comments --memory-locations --symbol-table < ./floatmath.c > floatmath.asm

program:
	cat ./poketest.c common.c > poketest.tmp
	./compiler --code-segment 2100 --data-segment 820 --symbol-table < ./poketest.tmp > poketest.asm

arith:
	./compiler --code-segment 2100 --data-segment 820  --memory-locations --no-asm-comments --symbol-table  < ./arithtests.c > arithtests.asm

ifs:
	./compiler --code-segment 49152 --data-segment 828 --no-asm-comments < ./iftests.c > iftests.asm

cond:
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./cond-tests.c > cond-tests.asm

mini:
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./minicond.c > minicond.asm

vartests:
	./compiler --code-segment 2100 --data-segment 828 --memory-locations --symbol-table < ./vartests.c > vartests.asm

debug:
	./compiler --code-segment 2100 --data-segment 828 --parser-comments --memory-locations < ./cond-tests.c > cond-tests.asm
	./compiler --code-segment 49152 --data-segment 828 --parser-comments --memory-locations < ./typetest.c > typetest.asm
	./compiler --code-segment 49152 --data-segment 828 --parser-comments --memory-locations < ./forloop.c > forloop.asm
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
	rm -fR *.tmp
	rm -f ~/Downloads/*.prg
	rm -f ~/Downloads/*.bin
