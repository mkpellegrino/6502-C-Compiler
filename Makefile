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
	$(CC) $(LIBRARIES) -w  y.tab.c -o compiler

args:
	cat ./args.c common.c > args.tmp
	./compiler --basic --code-segment 2100 --data-segment 820 --kick < ./args.tmp > args.asm
	java -jar KickAss.jar args.asm
	rm -f args.tmp

walker8:
	cat ./walker8.c common.c > walker8.tmp
	./compiler --basic --code-segment 2100 --data-segment 820 --kick --no-asm-comments --memory-locations < ./walker8.tmp > walker8.asm
	java -jar KickAss.jar walker8.asm
	rm -f walker8.tmp

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
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./raster3.tmp > raster3.asm
	rm -f raster3.tmp
	java -jar KickAss.jar raster3.asm
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -delete raster3 -write raster3.prg raster3

irqs:
	cat ./irqs.c common.c > irqs.tmp
	./compiler --basic  --code-segment 2100 --data-segment 820 --memory-locations --symbol-table --kick  < ./irqs.tmp > irqs.asm
	rm -f irqs.tmp
	java -jar KickAss.jar irqs.asm
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele irqs -write irqs.prg irqs


raster2:
	cat ./raster2.c common.c > raster2.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 820 --no-asm-comments --symbol-table < ./raster2.tmp > raster2.asm
	rm -f raster2.tmp
	java -jar KickAss.jar raster2.asm
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele raster2 -write raster2.prg raster2

raster:
	cat ./raster.c common.c > raster.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./raster.tmp > raster.asm
	java -jar KickAss.jar raster.asm
	rm -f raster.tmp
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele raster -write raster.prg raster

charset:
	cat ./charset.c common.c > charset.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./charset.tmp > charset.asm
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

testprg:
	cat ./testprg.c common.c > testprg.tmp
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./testprg.tmp > testprg.asm
	java -jar KickAss.jar testprg.asm

fighter:
	cat ./fighter.c common.c > fighter.tmp
	./compiler --basic --kick --debug --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./fighter.tmp > fighter.asm
	java -jar KickAss.jar fighter.asm


spritecol:
	cat ./spritecol.c common.c > spritecol.tmp
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --memory-locations < ./spritecol.tmp > spritecol.asm
	java -jar KickAss.jar spritecol.asm

spritecol2:
	cat ./spritecol2.c common.c > spritecol2.tmp
	./compiler --basic --kick --code-segment 2100 --data-segment 49152 --memory-locations < ./spritecol2.tmp > spritecol2.asm
	java -jar KickAss.jar spritecol2.asm


textmode:
	cat ./textmode.c common.c > textmode.tmp
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --memory-locations < ./textmode.tmp > textmode.asm
	java -jar KickAss.jar textmode.asm


poke2:
	cat ./poke2.c common.c > poke2.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./poke2.tmp > poke2.asm
	java -jar KickAss.jar poke2.asm

pong:
	java -jar KickAss.jar pong.asm
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele pong -write pong.prg pong	

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
	./compiler --basic --debug --code-segment 17626 --data-segment 2062 --kick --symbol-table < ./terra.tmp > terra7624.asm
	java -jar KickAss.jar -asminfo all -asminfofile terra-asminfo.txt -showmem -vicesymbols terra7624.asm
	rm -f ./terra.tmp
	rm -f ./terra.tmp.asm
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele terra -write terra.prg terra

terraland:
	cat ./terraland.c common.c > terraland.tmp
	./compiler --basic --kick --code-segment 7624 --data-segment 49152 --memory-locations --symbol-table < ./terraland.tmp > terraland.tmp.asm
	cat ./terra3.hex cj-sid.asm terraland.tmp.asm > terraland7624.asm
	java -jar KickAss.jar terraland7624.asm
	rm -f ./terraland.tmp
	rm -f ./terraland.tmp.asm
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele terraland7624 -write terraland7624.prg terraland7624

dice:
	cat ./dice.c common.c > dice.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./dice.tmp > dice2100.asm
	java -jar KickAss.jar dice2100.asm
	rm -f dice.tmp

gravity:
	cat ./gravity.c common.c > gravity.tmp
	./compiler --basic --kick --code-segment 4096 --data-segment 820 --memory-locations --symbol-table < ./gravity.tmp > gravity4096.asm
	java -jar KickAss.jar gravity4096.asm
	rm -f gravity.tmp

keys:
	./compiler --kick --code-segment 2100 --data-segment 820 --no-asm-comments < ./keys.c > keys.asm
	java -jar KickAss.jar keys.asm
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele keys -write keys.prg keys

city:
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --no-asm-comments < ./city.c > city.asm
	java -jar KickAss.jar city.asm
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -delete city -write city.prg city

hires:
	cat ./hires.c common.c > hires.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./hires.tmp > hires.asm
	java -jar KickAss.jar hires.asm
	rm -f hires.tmp
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele hires -write hires.prg hires

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
	./compiler --kick --basic --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./knight.tmp > knight.asm
	java -jar KickAss.jar knight.asm
	rm -f knight.tmp

testload:
	cat ./testload.c common.c > testload.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./testload.tmp > testload.asm
	java -jar KickAss.jar testload.asm
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -delete testload -write testload.prg testload
	rm -f ./testload.tmp

readdisk:
	./compiler --kick --basic --code-segment 2100 --data-segment 820  < ./readdisk.c > readdisk.asm
	java -jar KickAss.jar readdisk.asm
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -delete readdisk -write readdisk.prg readdisk

testsave:
	./compiler --kick --basic --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./testsave.c > testsave.asm
	./compiler --kick --basic --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./saveworld.c > saveworld.asm
	java -jar KickAss.jar testsave.asm
	java -jar KickAss.jar saveworld.asm
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -delete testsave test3k -write testsave.prg testsave -write saveworld.prg saveworld

diskwrite:
	java -jar KickAss.jar writedata.asm
	java -jar KickAss.jar readdata.asm

bitmap:
	cat ./bitmap.c common.c > bitmap.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 820 < ./bitmap.tmp > bitmap.asm
	java -jar KickAss.jar bitmap.asm
	rm -f bitmap.tmp
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele bitmap -write bitmap.prg bitmap

mul16:
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./mul16.c > mul16.asm
	java -jar KickAss.jar mul16.asm

datatest:
	cat datatest.c common.c > datatest.tmp
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --no-asm-comments --memory-locations < ./datatest.c > datatest.asm
	java -jar KickAss.jar datatest.asm

roll:
	./compiler --basic --kick --code-segment 2100 --data-segment 820 < ./roll.c > roll.asm
	java -jar KickAss.jar roll.asm
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele roll -write roll.prg roll

knightold:
	cat knight3.bak.c common.c > knight.tmp
	./compiler --kick --basic --code-segment 2061 --data-segment 21000 --no-asm-comments --memory-locations < ./knight.tmp > knight.asm
	java -jar KickAss.jar knight.asm
	rm -f knight.tmp
	/Applications/Vice64/tools/c1541 -attach KNIGHTSQUEST.d64 -delete savedata -delete knight3 -delete knight -write knight.prg knight

knight2:
	cat ./knight2.c common.c > knight2.tmp
	./compiler --kick --basic --code-segment 4096 --data-segment 820 < ./knight2.tmp > knight2.asm
	java -jar KickAss.jar knight2.asm
	rm -f knight2.tmp

knight3:
	cat ./knight3.c common.c > knight3.tmp
	./compiler --kick --basic --code-segment 2061 --data-segment 21000  --memory-locations < ./knight3.tmp > knight3.asm
	java -jar KickAss.jar knight3.asm
	rm -f knight3.tmp
	/Applications/Vice64/tools/c1541 -attach KNIGHTSQUEST.d64 -delete knight -delete savedata -delete knight3 -write knight3.prg knight3

joystick:
	cat ./joystick.c ./common.c > joystick.tmp
	./compiler --kick --basic --code-segment 2061 --data-segment 820 --no-asm-comments < ./joystick.tmp > joystick.asm
	java -jar KickAss.jar joystick.asm
	java -jar KickAss.jar joystick-tiny.asm
	rm -f joystick.tmp
	/Applications/Vice64/tools/c1541 -attach JOYSTICK.d64 -delete joystick -write joystick.prg joystick

rndfx:
	cat ./rndfx.c common.c > rndfx.tmp
	./compiler --kick --basic --code-segment 2061 --data-segment 828 < ./rndfx.tmp > rndfx.asm
	java -jar KickAss.jar rndfx.asm
	java -jar KickAss.jar rndfx2.asm
	rm -f rndfx.tmp
	/Applications/Vice64/tools/c1541 -attach RNDSID.d64 -delete rndfx -write rndfx.prg rndfx
	/Applications/Vice64/tools/c1541 -attach RNDSID.d64 -delete rndfx2 -write rndfx2.prg rndfx2
	/Applications/Vice64/tools/c1541 -attach RNDSID.d64 -delete rndsid -write rndsid.sid rndsid,s

savedata: 
	cat ./savedata.c common.c > savedata.tmp
	./compiler --kick --basic --code-segment 8192 --data-segment 49152 < ./savedata.tmp > savedata.asm
	java -jar KickAss.jar savedata.asm
	rm -f savedata.tmp
	/Applications/Vice64/tools/c1541 -attach KNIGHTSQUEST.d64 -delete knight3 -delete loadsprites -delete savedata -delete savesprites -delete sprites1 -delete world1 -write savedata.prg savedata -write knight3.prg knight3

loadsprites:
	cat ./loadsprites.c common.c > loadsprites.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 49152 < ./loadsprites.tmp > loadsprites.asm
	java -jar KickAss.jar loadsprites.asm
	rm -f loadsprites.tmp
	/Applications/Vice64/tools/c1541 -attach KNIGHTSQUEST.d64 -delete loadsprites -write loadsprites.prg loadsprites

functions:
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --memory-locations --symbol-table --no-asm-comments < ./functions.c > functions.asm
	java -jar KickAss.jar functions.asm

collision:
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./collision.c > collision.asm
	java -jar KickAss.jar collision.asm

vscroll:
	cat ./vscroll.c common.c > vscroll.tmp
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --no-asm-comments --memory-locations --symbol-table < ./vscroll.tmp > vscroll.asm
	java -jar KickAss.jar vscroll.asm
	java -jar KickAss.jar vertical-scroll.asm
	rm -f vscroll.tmp
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele vscroll -write vscroll.prg vscroll


vscroll2:
	cat ./vscroll2.c common.c > vscroll2.tmp
	./compiler --basic --kick --code-segment 2100 --data-segment 820  --symbol-table < ./vscroll2.tmp > vscroll2.asm
	java -jar KickAss.jar vscroll2.asm
	rm -f vscroll2.tmp
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele vscroll2 -write vscroll2.prg vscroll2

strings:
	cat ./strings.c > strings.tmp
#	cat ./strings.c common.c > strings.tmp
	./compiler --basic --code-segment 2100 --data-segment 820 --memory-locations --symbol-table --kick < ./strings.tmp > strings.asm
	java -jar KickAss.jar strings.asm
	java -jar KickAss.jar strings2.asm
	rm -f ./strings.tmp

hscroll:
	./compiler --basic --code-segment 2100 --data-segment 820 --no-asm-comments --kick < ./hscroll.c > hscroll.asm
	java -jar KickAss.jar hscroll.asm
	java -jar KickAss.jar horizontal-scroll.asm

math:
	./compiler --basic --code-segment 2100 --data-segment 820 --symbol-table --kick < ./cosine.c > cosine.asm
	java -jar KickAss.jar cosine.asm
	cat ./math.c > math.tmp
#	cat ./division.c common.c > division.tmp
	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table --kick < ./math.tmp > math.asm
#	./compiler --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./division.tmp > division.asm
	java -jar KickAss.jar math.asm
	java -jar KickAss.jar math2.asm
	java -jar KickAss.jar hscroll.asm


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
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --no-asm-comments  --symbol-table < ./general.tmp > general.asm
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

looptest:
	./compiler --kick --code-segment 2100 --data-segment 820  < ./looptest.c > looptest.asm
	java -jar KickAss.jar looptest.asm


sound:
	cat ./sound.c common.c > sound.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./sound.tmp > sound.asm
	java -jar KickAss.jar sound.asm


image:
	cat ./image.c common.c > image.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./image.tmp > image.asm
	java -jar KickAss.jar image.asm

array:
	cat ./array.c common.c > array.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./array.tmp > array.asm
	java -jar KickAss.jar array.asm

getchar:
	./compiler --code-segment 2100 --data-segment 820 --no-asm-comments  --memory-locations --symbol-table < ./getchar.c > getchar.asm

spriteptr:
	cat ./spriteptr.c common.c > spriteptr.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 820 --memory-locations --symbol-table < ./spriteptr.tmp > spriteptr.asm
	java -jar KickAss.jar spriteptr.asm

sprite:
	cat ./sprite.c common.c > sprite.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 820 --parser-comments --memory-locations --symbol-table < ./sprite.tmp > sprite.asm
	java -jar KickAss.jar sprite.asm

sprite2:
	./compiler --kick --basic --code-segment 2100 --data-segment 820 --parser-comments --memory-locations --symbol-table < ./sprite2.c > sprite2.asm
	java -jar KickAss.jar sprite2.asm

sprite3:
	cat ./sprite3.c common.c > sprite3.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 820 --parser-comments --memory-locations --symbol-table < ./sprite3.tmp > sprite3.asm
	java -jar KickAss.jar sprite3.asm

sprite4:
	cat ./sprite4.c common.c > sprite4.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 820 --parser-comments --memory-locations --symbol-table < ./sprite4.tmp > sprite4.asm
	java -jar KickAss.jar sprite4.asm

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
	./compiler --kick --basic --code-segment 2100 --data-segment 820 --symbol-table --no-asm-comments < ./conway.c > conway2100.asm
	./compiler --kick --basic --code-segment 2100 --data-segment 820 --symbol-table --no-asm-comments < ./conway.c > conway-new.asm
	java -jar KickAss.jar conway2100.asm
	java -jar KickAss.jar conway-new.asm
	java -jar KickAss.jar conway-tiny.asm
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele conway -write conway2100.prg conway
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele conwayt -write conway-tiny.prg conwayt

stack:
	cat ./stack.c common.c > stack.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 < ./stack.tmp > stack.asm
	rm -f stack.tmp

recursive:
	cat ./recursive.c common.c > recursive.tmp
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --no-asm-comments --symbol-table < ./recursive.tmp > recursive.asm
	java -jar KickAss.jar recursive.asm
	rm -f recursive.tmp
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele recursive -write recursive.prg recursive

bytemath:
	cat ./bytemath.c common.c > bytemath.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 < ./bytemath.tmp > bytemath.asm
	rm -f bytemath.tmp

clearscreen:
	./compiler --kick --code-segment 2100 --data-segment 820   < ./clearscreen.c > clearscreen.asm

snake2100:
	./compiler --basic --code-segment 2100 --data-segment 820 --kick  < ./snake2100.c > snake2100.asm
	java -jar KickAss.jar snake2100.asm
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele snake2100 -write snake2100


printftest:
	cat ./printftest.c common.c > printftest.tmp
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --no-asm-comments --parser-comments --memory-locations --symbol-table < ./printftest.tmp > printftest.asm
	java -jar KickAss.jar printftest.asm
	rm -f ./printftest.tmp


printstest:
	./compiler --basic --kick --code-segment 4096 --data-segment 820 --no-asm-comments < ./printstest.c > printstest.asm
	java -jar KickAss.jar printstest.asm

float:
	cat ./floatmath.c common.c > floatmath.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --no-asm-comments --parser-comments --memory-locations --symbol-table < ./floatmath.tmp > floatmath.asm
	java -jar KickAss.jar floatmath.asm
	rm -f ./floatmath.tmp

program:
	cat ./poketest.c common.c > poketest.tmp
	./compiler --basic --kick --code-segment 7045 --memory-locations --data-segment 820 --symbol-table < ./poketest.tmp > poketest-tmp.asm
#	./compiler --code-segment 8192 --data-segment 820 --memory-locations --symbol-table < ./poketest.tmp > poketest-tmp.asm
	cat poketest-tmp.asm ufo-sid.asm > poketest.asm
	java -jar KickAss.jar -showmem  poketest.asm
	rm -f poketest.tmp poketest-tmp.asm
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele poketest -write poketest.prg poketest

arith:
	./compiler --kick --code-segment 2100 --data-segment 820  --memory-locations --no-asm-comments --symbol-table  < ./arithtests.c > arithtests.asm

sidirq:
	cat ./sidirq.c common.c > sidirq.tmp
	./compiler --basic --kick --code-segment 2100 --data-segment 49152 --memory-locations --symbol-table < ./sidirq.tmp > sidirq.asm
	java -jar KickAss.jar -showmem sidirq.asm
	/Applications/Vice64/tools/c1541 -attach SID.d64 -dele sidirq -write sidirq.prg sidirq 

twosids:
	cat ./twosids.c common.c > twosids.tmp
	./compiler --basic --kick --code-segment 2100 --data-segment 49152 --memory-locations --symbol-table < ./twosids.tmp > twosids.asm
	java -jar KickAss.jar -showmem twosids.asm
	/Applications/Vice64/tools/c1541 -attach SID.d64 -dele twosids -write twosids.prg twosids 


sidtest:
	cat ./sidtest.c common.c > sidtest.tmp
	./compiler --debug --basic --kick --code-segment 2100 --data-segment 828 --memory-locations < ./sidtest.tmp > sidtest.asm
	java -jar KickAss.jar sidtest.asm
	./compiler --basic --kick --code-segment 2100 --data-segment 828 < ./sidinfo.c > sidinfo.asm
	java -jar KickAss.jar sidinfo.asm


iftests: iftests.c
	cat ./iftests.c common.c > iftests.tmp
	./compiler --basic --kick --code-segment 2100 --data-segment 828 --memory-locations --symbol-table < ./iftests.tmp > iftests.asm
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
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -delete vartests -write vartests.prg vartests

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
