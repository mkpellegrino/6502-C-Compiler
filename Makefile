#CC=/usr/bin/gcc
#CC=/usr/local/gcc-10.1.0-true/bin/g++-10.1-true
CC=/usr/local/gfortran/bin/g++
LEX=/usr/bin/lex
#LEX=/usr/local/bin/flex
YACC=/usr/local/bin/yacc
#YACC=/usr/bin/yacc
#YACC=/usr/local/bin/bison
LIBRARIES=-ll -ly

all:	clean lexer parser compiler math motion snake2100 city gravity program

parser: parser.y
	$(YACC) -d -v parser.y

lexer:	lexer.l
	$(LEX) lexer.l

compiler: y.tab.c
	$(CC) $(LIBRARIES) -w  y.tab.c -o compiler

pointers:
	cat ./pointers.c common.c > pointers.tmp
	./compiler --code-segment 2100 --data-segment 820 --kick < ./pointers.tmp > pointers.asm
	java -jar KickAss.jar pointers.asm
	rm -f pointers.tmp

sidint:
	cat ./sidint.c common.c > sidint.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./sidint.tmp > sidint.asm
	java -jar KickAss.jar sidint.asm
	rm -f sidint.tmp

motion:
	cat ./motion.c common.c > motion.tmp
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table --kick < ./motion.tmp > motion.asm
	rm -f motion.tmp
	java -jar KickAss.jar motion.asm

memcpy:
	cat ./memcpy.c common.c > memcpy.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./memcpy.tmp > memcpy.asm
	java -jar KickAss.jar memcpy.asm
	rm -f memcpy.tmp

raster3:
	cat ./raster3.c common.c > raster3.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./raster3.tmp > raster3.asm
	rm -f raster3.tmp
	java -jar KickAss.jar raster3.asm

irqs:
	cat ./irqs.c common.c > irqs.tmp
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table --kick  < ./irqs.tmp > irqs.asm
	rm -f irqs.tmp
	java -jar KickAss.jar irqs.asm

raster2:
	cat ./raster2.c common.c > raster2.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./raster2.tmp > raster2.asm
	rm -f raster2.tmp
	java -jar KickAss.jar raster2.asm

raster:
	cat ./raster.c common.c > raster.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./raster.tmp > raster.asm
	java -jar KickAss.jar raster.asm
	rm -f raster.tmp

charset:
	cat ./charset.c common.c > charset.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./charset.tmp > charset.asm
	java -jar KickAss.jar charset.asm
	rm -f charset.tmp

testdrive:
	cat ./testdrive.c common.c > testdrive.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./testdrive.tmp > testdrive.asm
	java -jar KickAss.jar testdrive.asm

pokes:
	cat ./pokes.c common.c > pokes.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./pokes.tmp > pokes.asm
	java -jar KickAss.jar pokes.asm
	rm -fR pokes.tmp


show:
	cat ./showspr.c common.c > showspr.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./showspr.tmp > showspr.asm
	java -jar KickAss.jar showspr.asm


coll:
	cat ./spritecol.c common.c > spritecol.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --memory-locations < ./spritecol.tmp > spritecol.asm
	java -jar KickAss.jar spritecol.asm

poke2:
	cat ./poke2.c common.c > poke2.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./poke2.tmp > poke2.asm
	java -jar KickAss.jar poke2.asm

banks:
	cat ./banks.c common.c > banks.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./banks.tmp > banks.asm
	java -jar KickAss.jar banks.asm


example:
	cat ./example.c common.c > example.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./example.tmp > example.asm
	java -jar KickAss.jar example.asm

terra:
	cat ./terraform.c common.c > terra.tmp
#	./compiler --code-segment 7632 --data-segment 40960 --memory-locations --symbol-table < ./terraform.c > terra.tmp.asm
#	./compiler --code-segment 7624 --data-segment 40960 --memory-locations --symbol-table < ./terraform.c > terra.tmp.asm
	./compiler --code-segment 7624 --data-segment 49152  --memory-locations --symbol-table --kick < ./terra.tmp > terra.tmp.asm
	cat terra.tmp.asm cj-sid.asm > terra7624.asm
#	cat terra.tmp.asm mysid.hex > terra7624.asm
	java -jar KickAss.jar terra7624.asm

	rm -f ./terra.tmp
	rm -f ./terra.tmp.asm


terraland:
	cat ./terraland.c common.c > terraland.tmp
	./compiler --kick --code-segment 7624 --data-segment 49152 --memory-locations --symbol-table < ./terraland.tmp > terraland.tmp.asm
	cat ./terra3.hex cj-sid.asm terraland.tmp.asm > terraland7624.asm
	java -jar KickAss.jar terraland7624.asm
	rm -f ./terraland.tmp
	rm -f ./terraland.tmp.asm

dice:
	cat ./dice.c common.c > dice.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./dice.tmp > dice2100.asm
	java -jar KickAss.jar dice2100.asm
	rm -f dice.tmp

gravity:
	cat ./gravity.c common.c > gravity.tmp
	./compiler --kick --code-segment 4096 --data-segment 820 --memory-locations --symbol-table < ./gravity.tmp > gravity4096.asm
	java -jar KickAss.jar gravity4096.asm
	rm -f gravity.tmp

keys:
	./compiler --kick --code-segment 2100 --data-segment 820 --no-asm-comments < ./keys.c > keys.asm
	java -jar KickAss.jar keys.asm

city:
	./compiler --kick --code-segment 2100 --data-segment 820 --no-asm-comments < ./city.c > city.asm
	java -jar KickAss.jar city.asm

hires:
	cat ./hires.c common.c > hires.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./hires.tmp > hires.asm
	java -jar KickAss.jar hires.asm
	rm -f hires.tmp

digits:
	cat ./digits.c common.c > digits.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./digits.tmp > digits.asm
	java -jar KickAss.jar digits.asm
	rm -f digits.tmp

quad:
	cat ./quadratic.c common.c > quad.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./quad.tmp > quadratic.asm
	java -jar KickAss.jar quadratic.asm

knight:
	cat ./knight.c common.c > knight.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./knight.tmp > knight.asm
	java -jar KickAss.jar knight.asm
	rm -f knight.tmp

collision:
	./compiler --kick --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./collision.c > collision.asm
	java -jar KickAss.jar collision.asm

math:
	cat ./math.c common.c > math.tmp
#	cat ./division.c common.c > division.tmp
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table --kick < ./math.tmp > math.asm
#	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./division.tmp > division.asm
	java -jar KickAss.jar math.asm


odds:
	cat ./sumofodds.c common.c > sumofodds.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./sumofodds.tmp > sumofodds.asm
	java -jar KickAss.jar sumofodds.asm
	rm -f sumofodds.tmp

input:
	cat ./input.c common.c > input.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --parser-comments --memory-locations --symbol-table < ./input.tmp > input.asm
	java -jar KickAss.jar input.asm
	rm -f input.tmp

rocket:
	cat ./rocket.c common.c > rocket.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./rocket.tmp > rocket.asm
	java -jar KickAss.jar rocket.asm
	rm -f rocket.tmp

general:
	cat ./general.c common.c > general.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./general.tmp > general.asm
	java -jar KickAss.jar general.asm
	rm -f general.tmp

uintcmp:
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./uintcmp.c > uintcmp.asm

tests:
	cat ./tests.c common.c > tests.tmp
	./compiler --kick --code-segment 2100 --data-segment 820  < ./tests.tmp > tests.asm
	java -jar KickAss.jar tests.asm
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
	./compiler --kick --code-segment 2100 --data-segment 820 --parser-comments --memory-locations --symbol-table < ./sprite.c > sprite.asm
	java -jar KickAss.jar sprite.asm

sprite2:
	./compiler --kick --code-segment 2100 --data-segment 820 --parser-comments --memory-locations --symbol-table < ./sprite2.c > sprite2.asm
	java -jar KickAss.jar sprite2.asm

sprite3:
	cat ./sprite3.c common.c > sprite3.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --parser-comments --memory-locations --symbol-table < ./sprite3.tmp > sprite3.asm
	java -jar KickAss.jar sprite3.asm


plot:
	cat ./plottest.c common.c > plottest.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --no-asm-comments < ./plottest.tmp > plottest.asm
	rm -f plottest.tmp
	java -jar KickAss.jar plottest.asm


screen:
	cat ./screen.c common.c > screen.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --no-asm-comments < ./screen.tmp > screen2.tmp
	cat screen2.tmp  terra2img.hex > screen.asm
	java -jar KickAss.jar screen.asm
	rm -f screen.tmp
	rm -f screen2.tmp


decdig:
	./compiler --code-segment 2100 --data-segment 820 --no-asm-comments < ./decdig.c > decdig.asm


return:
	cat ./return.c common.c > return.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --no-asm-comments --symbol-table < ./return.tmp > return.asm
	rm -f return.tmp

conway:
	./compiler --kick --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./conway.c > conway2100.asm
	java -jar KickAss.jar conway2100.asm


stack:
	cat ./stack.c common.c > stack.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 < ./stack.tmp > stack.asm
	rm -f stack.tmp

recursive:
	cat ./recursive.c common.c > recursive.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --no-asm-comments --symbol-table < ./recursive.tmp > recursive.asm
	java -jar KickAss.jar recursive.asm
	rm -f recursive.tmp

bytemath:
	cat ./bytemath.c common.c > bytemath.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 < ./bytemath.tmp > bytemath.asm
	rm -f bytemath.tmp

clearscreen:
	./compiler --kick --code-segment 2100 --data-segment 820   < ./clearscreen.c > clearscreen.asm

snake2100:
	./compiler --code-segment 2100 --data-segment 820 --kick  < ./snake2100.c > snake2100.asm
	java -jar KickAss.jar snake2100.asm


printftest:
	cat ./printftest.c common.c > printftest.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --no-asm-comments --parser-comments --memory-locations --symbol-table < ./printftest.tmp > printftest.asm
	java -jar KickAss.jar printftest.asm
	rm -f ./printftest.tmp

float:
	cat ./floatmath.c common.c > floatmath.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --no-asm-comments --parser-comments --memory-locations --symbol-table < ./floatmath.tmp > floatmath.asm
	java -jar KickAss.jar floatmath.asm
	rm -f ./floatmath.tmp

program:
	cat ./poketest.c common.c > poketest.tmp
	./compiler --kick --code-segment 8192 --data-segment 820 --symbol-table < ./poketest.tmp > poketest-tmp.asm
	cat poketest-tmp.asm ufo-sid.asm > poketest.asm
	java -jar KickAss.jar poketest.asm
	rm -f poketest.tmp poketest-tmp.asm

arith:
	./compiler --kick --code-segment 2100 --data-segment 820  --memory-locations --no-asm-comments --symbol-table  < ./arithtests.c > arithtests.asm

ifs:
	./compiler --kick --code-segment 49152 --data-segment 828 --no-asm-comments < ./iftests.c > iftests.asm
	java -jar KickAss.jar iftests.asm

cond:
	cat ./cond-tests.c common.c > cond-tests.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./cond-tests.tmp > cond-tests.asm
	java -jar KickAss.jar cond-tests.asm
	rm -f cond-tests.tmp

mini:
	./compiler --kick --code-segment 2100 --data-segment 820 --symbol-table < ./minicond.c > minicond.asm
	java -jar KickAss.jar minicond.asm

vartests:
	cat ./vartests.c common.c > vartests.tmp
	./compiler --kick --code-segment 2100 --data-segment 828 --memory-locations --symbol-table < ./vartests.tmp > vartests.asm
	java -jar KickAss.jar vartests.asm
	rm -f vartests.tmp

clean:
#	mv -f parser.tab.c parser.tab.c.prev
#	mv -f parser.tab.h parser.tab.h.prev
#	rm -f compiler.prev
#	mv -f compiler compiler.prev
	rm -fR *.*~
	rm -fR Makefile~
	rm -f *.tmp
	rm -f ~/Downloads/*.prg
	rm -f ~/Downloads/*.bin
