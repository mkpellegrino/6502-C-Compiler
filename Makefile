#CC=/usr/bin/gcc
#CC=/usr/local/gcc-10.1.0-true/bin/g++-10.1-true
CC=/usr/local/gfortran/bin/g++
LEX=/usr/bin/lex
#LEX=/usr/local/bin/flex
YACC=/usr/local/bin/yacc
#YACC=/usr/bin/yacc
#YACC=/usr/local/bin/bison
LIBRARIES=-ll -ly

all:	clean lexer parser compiler tests ifs decdig show coll poke2 data banks example terra terraland gravity keys city hires digits quad driver8 collision math odds

parser: parser.y
	$(YACC) -d -v parser.y

lexer:	lexer.l
	$(LEX) lexer.l

compiler: y.tab.c
	$(CC) $(LIBRARIES) -w  y.tab.c -o compiler

motion:
	cat ./motion.c common.c > motion.tmp
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./motion.tmp > motion.asm
	rm -f motion.tmp

memcpy:
	cat ./memcpy.c common.c > memcpy.tmp
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./memcpy.tmp > memcpy.asm
	rm -f memcpy.tmp

raster2:
	cat ./raster2.c common.c > raster2.tmp
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./raster2.tmp > raster2.asm
	rm -f raster2.tmp

raster:
	cat ./raster.c common.c > raster.tmp
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./raster.tmp > raster.asm
	rm -f raster.tmp

charset:
	cat ./charset.c common.c > charset.tmp
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./charset.tmp > charset.asm
	rm -f charset.tmp

testdrive:
	cat ./testdrive.c common.c > testdrive.tmp
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./testdrive.tmp > testdrive.asm

pokes:
	cat ./pokes.c common.c > pokes.tmp
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./pokes.tmp > pokes.asm
	rm -fR pokes.tmp


show:
	cat ./showspr.c common.c > showspr.tmp
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./showspr.tmp > showspr.asm

coll:
	cat ./spritecol.c common.c > spritecol.tmp
	./compiler --code-segment 2100 --data-segment 820 --memory-locations < ./spritecol.tmp > spritecol.asm

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
#	./compiler --code-segment 7632 --data-segment 40960 --memory-locations --symbol-table < ./terraform.c > terra.tmp.asm
#	./compiler --code-segment 7624 --data-segment 40960 --memory-locations --symbol-table < ./terraform.c > terra.tmp.asm
	./compiler --code-segment 7624 --data-segment 49152  --memory-locations --symbol-table < ./terra.tmp > terra.tmp.asm
	cat terra.tmp.asm cj-sid.asm > terra7624.asm
	rm -f ./terra.tmp
	rm -f ./terra.tmp.asm


terraland:
	cat ./terraland.c common.c > terraland.tmp
	./compiler --code-segment 7624 --data-segment 49152 --memory-locations --symbol-table < ./terraland.tmp > terraland.tmp.asm
	cat ./terra3.hex cj-sid.asm terraland.tmp.asm > terraland7624.asm
	rm -f ./terraland.tmp
	rm -f ./terraland.tmp.asm

dice:
	cat ./dice.c common.c > dice.tmp
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./dice.tmp > dice2100.asm
	rm -f dice.tmp

gravity:
	cat ./gravity.c common.c > gravity.tmp
	./compiler --code-segment 4096 --data-segment 820 --memory-locations --symbol-table < ./gravity.tmp > gravity4096.asm
	rm -f gravity.tmp

keys:
	./compiler --code-segment 2100 --data-segment 820 --no-asm-comments < ./keys.c > keys.asm

city:
	./compiler --code-segment 2100 --data-segment 820 --no-asm-comments < ./city.c > city.asm

hires:
	cat ./hires.c common.c > hires.tmp
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./hires.tmp > hires.asm
	rm -f hires.tmp

digits:
	cat ./digits.c common.c > digits.tmp
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./digits.tmp > digits.asm
	rm -f digits.tmp

quad:
	cat ./quadratic.c common.c > quad.tmp
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./quad.tmp > quadratic.asm

driver8:
	cat ./driver8.c common.c > driver8.tmp
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./driver8.tmp > driver8.asm
	rm -f driver8.tmp

collision:
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./collision.c > collision.asm

math:
	cat ./math.c common.c > math.tmp
#	cat ./division.c common.c > division.tmp
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./math.tmp > math.asm
#	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./division.tmp > division.asm


odds:
	cat ./sumofodds.c common.c > sumofodds.tmp
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./sumofodds.tmp > sumofodds.asm
	rm -f sumofodds.tmp

input:
	cat ./input.c common.c > input.tmp
	./compiler --code-segment 2100 --data-segment 820 --parser-comments --memory-locations --symbol-table < ./input.tmp > input.asm
	rm -f input.tmp

rocket:
	cat ./rocket.c common.c > rocket.tmp
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./rocket.tmp > rocket.asm
	rm -f rocket.tmp

general:
	cat ./general.c common.c > general.tmp
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./general.tmp > general.asm
	rm -f general.tmp

uintcmp:
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./uintcmp.c > uintcmp.asm

tests:
	cat ./tests.c common.c > tests.tmp
	./compiler --code-segment 2100 --data-segment 820  < ./tests.tmp > tests.asm
	rm -f tests.tmp

iftest:
	./compiler --code-segment 2100 --data-segment 820 --no-asm-comments < ./iftests.c > iftests.asm

fortest:
	./compiler --code-segment 2100 --data-segment 820 --no-asm-comments < ./fortest.c > fortest.asm

typetest:
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./typetest.c > typetest.asm

forloop:
	cat ./forloop.c common.c > forloop.tmp
	./compiler --code-segment 2100 --data-segment 820 --memory-locations < ./forloop.tmp > forloop.asm
	rm -f forloop.tmp



sound:
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./sound.c > sound.asm

array:
	cat ./array.c common.c > array.tmp
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./array.tmp > array.asm

getchar:
	./compiler --code-segment 2100 --data-segment 820 --no-asm-comments  --memory-locations --symbol-table < ./getchar.c > getchar.asm

sprite:
	./compiler --code-segment 2100 --data-segment 820 --parser-comments --memory-locations --symbol-table < ./sprite.c > sprite.asm

sprite2:
	./compiler --code-segment 2100 --data-segment 820 --parser-comments --memory-locations --symbol-table < ./sprite2.c > sprite2.asm

sprite3:
	cat ./sprite3.c common.c > sprite3.tmp
	./compiler --code-segment 2100 --data-segment 820 --parser-comments --memory-locations --symbol-table < ./sprite3.tmp > sprite3.asm


plot:
	cat ./plottest.c common.c > plottest.tmp
	./compiler --code-segment 2100 --data-segment 820 --no-asm-comments < ./plottest.tmp > plottest.asm
	rm -f plottest.tmp


screen:
	cat ./screen.c common.c > screen.tmp
	./compiler --code-segment 2100 --data-segment 820 --no-asm-comments < ./screen.tmp > screen2.tmp
	cat screen2.tmp  terra2img.hex > screen.asm
	rm -f screen.tmp
	rm -f screen2.tmp


decdig:
	./compiler --code-segment 2100 --data-segment 820 --no-asm-comments < ./decdig.c > decdig.asm


return:
	cat ./return.c common.c > return.tmp
	./compiler --code-segment 2100 --data-segment 820 --no-asm-comments --symbol-table < ./return.tmp > return.asm
	rm -f return.tmp

conway:
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./conway.c > conway2100.asm

stack:
	cat ./stack.c common.c > stack.tmp
	./compiler --code-segment 2100 --data-segment 820 < ./stack.tmp > stack.asm
	rm -f stack.tmp

recursive:
	cat ./recursive.c common.c > recursive.tmp
	./compiler --code-segment 2100 --data-segment 820 --no-asm-comments --symbol-table < ./recursive.tmp > recursive.asm
	rm -f recursive.tmp

bytemath:
	cat ./bytemath.c common.c > bytemath.tmp
	./compiler --code-segment 2100 --data-segment 820 < ./bytemath.tmp > bytemath.asm
	rm -f bytemath.tmp

clearscreen:
	./compiler --code-segment 2100 --data-segment 820   < ./clearscreen.c > clearscreen.asm

snake2100:
	./compiler --code-segment 2100 --data-segment 820   < ./snake2100.c > snake2100.asm

printftest:
	cat ./printftest.c common.c > printftest.tmp
	./compiler --code-segment 2100 --data-segment 820 --no-asm-comments --parser-comments --memory-locations --symbol-table < ./printftest.tmp > printftest.asm
	rm -f ./printftest.tmp

float:
	./compiler --code-segment 2100 --data-segment 820 --no-asm-comments --parser-comments --memory-locations --symbol-table < ./floatmath.c > floatmath.asm

program:
	cat ./poketest.c common.c > poketest.tmp
	./compiler --code-segment 8192 --data-segment 820 --symbol-table < ./poketest.tmp > poketest-tmp.asm
	cat poketest-tmp.asm ufo-sid.asm > poketest.asm

	rm -f poketest.tmp poketest-tmp.asm

arith:
	./compiler --code-segment 2100 --data-segment 820  --memory-locations --no-asm-comments --symbol-table  < ./arithtests.c > arithtests.asm

ifs:
	./compiler --code-segment 49152 --data-segment 828 --no-asm-comments < ./iftests.c > iftests.asm

cond:
	cat ./cond-tests.c common.c > cond-tests.tmp
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./cond-tests.tmp > cond-tests.asm
	rm -f cond-tests.tmp

mini:
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./minicond.c > minicond.asm

vartests:
	cat ./vartests.c common.c > vartests.tmp
	./compiler --code-segment 2100 --data-segment 828 --memory-locations --symbol-table < ./vartests.tmp > vartests.asm
	rm -f vartests.tmp

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
