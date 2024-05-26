#CC=/usr/bin/gcc
#CC=/usr/local/gcc-10.1.0-true/bin/g++-10.1-true
CC=/usr/local/gfortran/bin/g++
LEX=/usr/bin/lex
#LEX=/usr/local/bin/flex
YACC=/usr/local/bin/yacc
INCLUDE=-I/usr/local/include/c++/10.1.0/
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

nocomment: nocomment.cpp
	$(CC) -O3  nocomment.cpp -I/usr/local/include/c++/10.1.0/ -o nocomment

disk:	deltesting dummy motion memcpy raster3 raster2 charset pokes banks gravity keys city hires quad mul16 datatest roll joystick vscroll hscroll math input screen conway vartests

args:
	cat ./args.c common.c > args.tmp
	./compiler --basic --code-segment 2100 --data-segment 820 --kick --no-asm-comments --unsafe-ifs < ./args.tmp > args.asm
	java -jar KickAss.jar args.asm
	rm -f args.tmp
	/Applications/Vice64/tools/c1541 -attach GENERAL.d64 -delete args -write args.prg args

deltesting:
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele dummy motion memcpy raster3 raster2 charset pokes banks gravity keys city hires digits quad mul16 datatest roll joystick vscroll vscroll2 hscroll math input fortest screen conway snake2100 vartests

dummy:
	cat dummy.c common.c > dummy.tmp
	./compiler --basic --code-segment 2100 --data-segment 820 --kick --no-asm-comments < ./dummy.tmp > dummy.asm
	java -jar KickAss.jar dummy.asm
	rm -f dummy.tmp
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -delete dummy -write dummy.prg dummy

demux:
	java -jar KickAss.jar demux.asm

spritexytest:
	cat ./spritexytest.c common.c > spritexytest.tmp
	./compiler --basic --code-segment 2100 --data-segment 820 --kick --no-asm-comments --unsafe-ifs < ./spritexytest.tmp > spritexytest.asm
	java -jar KickAss.jar spritexytest.asm

spritextest:
	./compiler --basic --code-segment 2100 --data-segment 820 --kick --no-asm-comments --unsafe-ifs < ./spritextest.c > spritextest.asm
	java -jar KickAss.jar spritextest.asm

walker8:
	cat ./walker8.c common.c > walker8.tmp
	./compiler --basic --unsafe-ifs --code-segment 2100 --data-segment 820 --kick --no-asm-comments < ./walker8.tmp > walker8.asm
	java -jar KickAss.jar walker8.asm
	rm -f walker8.tmp
	/Applications/Vice64/tools/c1541 -attach SPRITES.d64 -delete walker8 -write walker8.prg walker8

pointers:
	cat ./pointers.c > pointers.tmp
	./compiler --code-segment 2100 --data-segment 820 --kick --no-asm-comments < ./pointers.tmp > pointers.asm
	java -jar KickAss.jar pointers.asm
	rm -f pointers.tmp

helloworld:
	./compiler --kick --code-segment 2054 --datasegment 2106 --no-asm-comments < ./helloworld.c > helloworld.asm
	java -jar KickAss.jar helloworld.asm
	java -jar KickAss.jar hw2.asm
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -delete hw2 -delete helloworld -write helloworld.prg helloworld -write hw2.prg hw2

writeprog:
	./compiler --kick --code-segment 2100 --datasegment 820 --no-asm-comments < ./writeprog.c > writeprog.asm
	java -jar KickAss.jar writeprog.asm
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -delete writeprog -delete prog -write writeprog.prg writeprog

sidint:
	cat ./sidint.c common.c > sidint.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --memory-locations  --no-asm-comments < ./sidint.tmp > sidint.asm
	java -jar KickAss.jar sidint.asm
	rm -f sidint.tmp

motion:
	cat ./motion.c common.c > motion.tmp
	./compiler --basic --code-segment 2100 --data-segment 820 --no-asm-comments --kick < ./motion.tmp > motion.asm
	rm -f motion.tmp
	java -jar KickAss.jar motion.asm
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -delete motion -write motion.prg motion

memcpy:
	cat ./memcpy.c common.c > memcpy.tmp
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --no-asm-comments < ./memcpy.tmp > memcpy.asm
	java -jar KickAss.jar memcpy.asm
	rm -f memcpy.tmp
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -delete memcpy -write memcpy.prg memcpy

raster3:
	cat ./raster3.c common.c > raster3.tmp
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --no-asm-comments < ./raster3.tmp > raster3.asm
	rm -f raster3.tmp
	java -jar KickAss.jar raster3.asm
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -delete raster3 -write raster3.prg raster3

irqs:
	cat ./irqs.c common.c > irqs.tmp
	./compiler --basic --code-segment 2100 --data-segment 820 --no-asm-comments --kick --unsafe-ifs < ./irqs.tmp > irqs.asm
	rm -f irqs.tmp
	java -jar KickAss.jar irqs.asm
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele irqs -write irqs.prg irqs

irqs2:
	./compiler --basic --code-segment 2100 --data-segment 820 --kick < ./irqs2.c > irqs2.asm
	java -jar KickAss.jar irqs2.asm
	/Applications/Vice64/tools/c1541 -attach SPRITES.d64 -delete irqs2 -write irqs2.prg irqs2

raster2:
	cat ./raster2.c common.c > raster2.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 820 --no-asm-comments  < ./raster2.tmp > raster2.asm
	rm -f raster2.tmp
	java -jar KickAss.jar raster2.asm
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele raster2 -write raster2.prg raster2

raster:
	./compiler --kick --code-segment 2100 --data-segment 820 --no-asm-comments --unsafe-ifs < ./raster.c > raster.asm
	java -jar KickAss.jar raster.asm
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele raster -write raster.prg raster

charset:
	cat ./charset.c common.c > charset.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 820 --no-asm-comments < ./charset.tmp > charset.asm
	java -jar KickAss.jar charset.asm
	rm -f charset.tmp
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -delete charset -write charset.prg charset


testdrive:
	cat ./testdrive.c common.c > testdrive.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --no-asm-comments < ./testdrive.tmp > testdrive.asm
	java -jar KickAss.jar testdrive.asm

pokes:
	cat ./pokes.c common.c > pokes.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --no-asm-comments < ./pokes.tmp > pokes.asm
	java -jar KickAss.jar pokes.asm
	rm -fR pokes.tmp
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -delete pokes -write pokes.prg pokes

show:
	cat ./showspr.c common.c > showspr.tmp
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --no-asm-comments < ./showspr.tmp > showspr.asm
	java -jar KickAss.jar showspr.asm

testprg:
	cat ./testprg.c common.c > testprg.tmp
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --no-asm-comments --unsafe-ifs < ./testprg.tmp > testprg.asm
	java -jar KickAss.jar testprg.asm

fighter:
	cat ./fighter.c common.c > fighter.tmp
	./compiler --unsafe-ifs --basic --kick --debug --code-segment 2100 --data-segment 820  < ./fighter.tmp > fighter.asm
	java -jar KickAss.jar fighter.asm
	/Applications/Vice64/tools/c1541 -attach SPRITES.d64 -delete fighter -write fighter.prg fighter


spritecol:
	cat ./spritecol.c common.c > spritecol.tmp
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --no-asm-comments < ./spritecol.tmp > spritecol.asm
	java -jar KickAss.jar spritecol.asm
	/Applications/Vice64/tools/c1541 -attach SPRITES.d64 -delete spritecol -write spritecol.prg spritecol

spritecol2:
	cat ./spritecol2.c common.c > spritecol2.tmp
	./compiler --basic --kick --code-segment 2100 --data-segment 49152 --no-asm-comments < ./spritecol2.tmp > spritecol2.asm
	java -jar KickAss.jar spritecol2.asm
	/Applications/Vice64/tools/c1541 -attach SPRITES.d64 -delete spritecol2 -write spritecol2.prg spritecol2

textmode:
	cat ./textmode.c common.c > textmode.tmp
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --memory-locations --no-asm-comments < ./textmode.tmp > textmode.asm
	java -jar KickAss.jar textmode.asm


poke2:
	cat ./poke2.c common.c > poke2.tmp
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --no-asm-comments < ./poke2.tmp > poke2.asm
	java -jar KickAss.jar poke2.asm

pong:
	@echo "sys 8448 to execute"
	java -jar KickAss.jar pong.asm
#	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele pong -write pong.prg pong

banks:
	cat ./banks.c common.c > banks.tmp
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --no-asm-comments < ./banks.tmp > banks.asm
	java -jar KickAss.jar banks.asm
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -delete banks -write banks.prg banks


#	THIS IS THE EXAMPLE OF A SINGLE COLOUR MOB FIGURE MOBVING AROUND A WORLD
example:
	cat ./example.c common.c > example.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --no-asm-comments < ./example.tmp > example.asm
	java -jar KickAss.jar example.asm

terra:
	cat ./terraform.c common.c > terra.tmp
	./compiler --basic --code-segment 17626 --data-segment 2062 --kick --no-asm-comments --unsafe-ifs < ./terra.tmp > terra7624.asm
	java -jar KickAss.jar -asminfo all -asminfofile terra-asminfo.txt -showmem -vicesymbols terra7624.asm
	rm -f ./terra.tmp
	rm -f ./terra.tmp.asm
#	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele terra -write terra.prg terra

terraland:
	cat ./terraland.c common.c > terraland.tmp
	./compiler --basic --kick --code-segment 7624 --data-segment 49152 --no-asm-comments < ./terraland.tmp > terraland.tmp.asm
	cat ./terra3.hex cj-sid.asm terraland.tmp.asm > terraland7624.asm
	java -jar KickAss.jar terraland7624.asm
	rm -f ./terraland.tmp
	rm -f ./terraland.tmp.asm
#	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele terraland7624 -write terraland7624.prg terraland7624

dice:
	cat ./dice.c common.c > dice.tmp
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --no-asm-comments < ./dice.tmp > dice2100.asm
	java -jar KickAss.jar dice2100.asm
	rm -f dice.tmp

gravity:
	cat ./gravity.c common.c > gravity.tmp
	./compiler --basic --kick --code-segment 4096 --data-segment 820 --no-asm-comments < ./gravity.tmp > gravity4096.asm
	java -jar KickAss.jar gravity4096.asm
	rm -f gravity.tmp
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -delete gravity -write gravity4096.prg gravity

keys:
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --no-asm-comments < ./keys.c > keys.asm
	java -jar KickAss.jar keys.asm
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele keys -write keys.prg keys

city:
	./compiler --unsafe-ifs --basic --kick --code-segment 2100 --data-segment 820 --no-asm-comments < ./city.c > city.asm
	java -jar KickAss.jar city.asm
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -delete city -write city.prg city

hires:
	cat ./hires.c common.c > hires.tmp
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --no-asm-comments --unsafe-infs  < ./hires.tmp > hires.asm
	java -jar KickAss.jar hires.asm
	rm -f hires.tmp
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele hires -write hires.prg hires

digits:
	cat ./digits.c common.c > digits.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --no-asm-comments --unsafe-ifs < ./digits.tmp > digits.asm
	java -jar KickAss.jar digits.asm
	rm -f digits.tmp
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele digits -write digits.prg digits

quad:
	cat ./quadratic.c > quad.tmp
	./compiler --unsafe-ifs --basic --kick --code-segment 2100 --data-segment 820 --no-asm-comments < ./quad.tmp > quadratic.asm
	java -jar KickAss.jar quadratic.asm
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele quadratic -write quadratic.prg quadratic


knight:
	cat ./knight.c common.c > knight.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 820 --no-asm-comments < ./knight.tmp > knight.asm
	java -jar KickAss.jar knight.asm
	rm -f knight.tmp

loaddata:
	./compiler --kick --code-segment 2100 --data-segment 3500 --no-asm-comments  < ./loaddata.c > loaddata.asm
	java -jar KickAss.jar loaddata.asm
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -delete loaddata -write loaddata.prg loaddata
	/Applications/Vice64/tools/c1541 -attach KNIGHTSQUEST.d64 -delete loaddata -write loaddata.prg loaddata

testload:
	cat ./testload.c common.c > testload.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 820 --memory-locations  < ./testload.tmp > testload.asm
	java -jar KickAss.jar testload.asm
#	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -delete testload -write testload.prg testload
	rm -f ./testload.tmp

readdisk:
	./compiler --kick --basic --code-segment 2100 --data-segment 820  < ./readdisk.c > readdisk.asm
	java -jar KickAss.jar readdisk.asm
#	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -delete readdisk -write readdisk.prg readdisk

testsave:
	./compiler --kick --basic --code-segment 2100 --data-segment 820 --memory-locations  < ./testsave.c > testsave.asm
	./compiler --kick --basic --code-segment 2100 --data-segment 820 --memory-locations  < ./saveworld.c > saveworld.asm
	java -jar KickAss.jar testsave.asm
	java -jar KickAss.jar saveworld.asm
#	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -delete testsave test3k -write testsave.prg testsave -write saveworld.prg saveworld

diskwrite:
	java -jar KickAss.jar writedata.asm
	java -jar KickAss.jar readdata.asm

bitmap:
	cat ./bitmap.c common.c > bitmap.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 820 --no-asm-comments --unsafe-ifs < ./bitmap.tmp > bitmap.asm
	java -jar KickAss.jar bitmap.asm
	rm -f bitmap.tmp
#	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele bitmap -write bitmap.prg bitmap

mul16:
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --no-asm-comments < ./mul16.c > mul16.asm
	java -jar KickAss.jar mul16.asm
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele mul16 -write mul16.prg mul16

datatest:
	cat datatest.c common.c > datatest.tmp
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --no-asm-comments < ./datatest.c > datatest.asm
	java -jar KickAss.jar datatest.asm
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele datatest -write datatest.prg datatest

roll:
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --no-asm-comments < ./roll.c > roll.asm
	java -jar KickAss.jar roll.asm
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele roll -write roll.prg roll

knightold:
	cat knight3.bak.c common.c > knight.tmp
	./compiler --kick --basic --no-optimize --code-segment 2061 --data-segment 21000 < ./knight.tmp > knight.asm
	java -jar KickAss.jar knight.asm
	rm -f knight.tmp
#	/Applications/Vice64/tools/c1541 -attach KNIGHTSQUEST.d64 -delete savedata -delete knight3 -delete knight -write knight.prg knight

specialbit:
	./compiler --kick --basic --code-segment 4096 --data-segment 820 --memory-locations < ./specialbit.c > specialbit.asm
	java -jar KickAss.jar specialbit.asm

knight2:
	cat ./knight2.c common.c > knight2.tmp
	./compiler --kick --basic --code-segment 4096 --data-segment 820 < ./knight2.tmp > knight2.asm
	java -jar KickAss.jar knight2.asm
	rm -f knight2.tmp

knight3:
	cat ./knight3.c common.c > knight3.tmp
	./compiler --unsafe-ifs  --kick --basic --code-segment 2061 --data-segment 21000 --no-asm-comments < ./knight3.tmp > knight3.asm
	java -jar KickAss.jar knight3.asm
#	rm -f knight3.tmp
	/Applications/Vice64/tools/c1541 -attach KNIGHTSQUEST.d64 -delete knight -delete savedata -delete knight3 -write knight3.prg knight3


knight3lean1:
	cat ./knight3.c common.c > knight3lean1.tmp
	./compiler --kick --code-segment 2100 --data-segment 21000 --no-asm-comments --unsafe-ifs < ./knight3lean1.tmp > knight3lean1.asm
	java -jar KickAss.jar knight3lean1.asm
	/Applications/Vice64/tools/c1541 -attach KNIGHTSQUEST.d64 -delete knight3 -write knight3lean1.prg knight3

	rm -f knight3lean1.tmp

knight3lean:
	java -jar KickAss.jar knight3lean1.asm
	/Applications/Vice64/tools/c1541 -attach KNIGHTSQUEST.d64 -delete knight -delete savedata -delete knight3 -write knight3.prg knight3



joystick:
	cat ./joystick.c ./common.c > joystick.tmp
	./compiler --kick --basic --code-segment 2061 --data-segment 820 --no-asm-comments < ./joystick.tmp > joystick.asm
	java -jar KickAss.jar joystick.asm
	java -jar KickAss.jar joystick-tiny.asm
	rm -f joystick.tmp
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -delete joystick -write joystick.prg joystick

writebmp:
	cat ./writebmp.c ./common.c > writebmp.tmp
	./compiler --kick --basic --code-segment 2061 --data-segment 8192 --no-asm-comments < ./writebmp.tmp > writebmp.asm
	java -jar KickAss.jar writebmp.asm
	rm -f writebmp.tmp
	/Applications/Vice64/tools/c1541 -attach KNIGHTSQUEST.d64 -delete writebmp -write writebmp.prg writebmp 



rndfx:
	cat ./rndfx.c common.c > rndfx.tmp
	./compiler --kick --basic --code-segment 2061 --data-segment 828 --no-asm-comments < ./rndfx.tmp > rndfx.asm
	java -jar KickAss.jar rndfx.asm
	java -jar KickAss.jar rndfx2.asm
	rm -f rndfx.tmp
	/Applications/Vice64/tools/c1541 -attach RNDSID.d64 -delete rndfx -write rndfx.prg rndfx
	/Applications/Vice64/tools/c1541 -attach RNDSID.d64 -delete rndfx2 -write rndfx2.prg rndfx2
	/Applications/Vice64/tools/c1541 -attach RNDSID.d64 -delete rndsid -write rndsid.sid rndsid,s

savedata: 
	cat ./savedata.c common.c > savedata.tmp
	./compiler --kick --basic --code-segment 8192 --data-segment 49152 --memory-locations < ./savedata.tmp > savedata.asm
	java -jar KickAss.jar savedata.asm
	rm -f savedata.tmp
	/Applications/Vice64/tools/c1541 -attach KNIGHTSQUEST.d64 -delete knight3 -delete loadsprites -delete savedata -delete savesprites -delete sprites1 -delete world1 -write savedata.prg savedata -write knight3.prg knight3

loadsprites:
	cat ./loadsprites.c common.c > loadsprites.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 49152 < ./loadsprites.tmp > loadsprites.asm
	java -jar KickAss.jar loadsprites.asm
	rm -f loadsprites.tmp
	/Applications/Vice64/tools/c1541 -attach KNIGHTSQUEST.d64 -delete loadsprites -write loadsprites.prg loadsprites
	/Applications/Vice64/tools/c1541 -attach SPRITES.d64 -delete loadsprites -write loadsprites.prg loadsprites

functions:
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --memory-locations < ./functions.c > functions.asm
	java -jar KickAss.jar functions.asm

variables:
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --unsafe-ifs < ./variables.c > variables.asm
	java -jar KickAss.jar variables.asm

comparisons:
	cat ./comparisons.c common.c > comparisons.tmp
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --memory-locations < ./comparisons.tmp > comparisons.asm
	java -jar KickAss.jar -vicesymbols comparisons.asm
	/Applications/Vice64/tools/c1541 -attach COMPARISONS.d64 -delete comparisons -delete symbols -write comparisons.prg comparisons

shifts:
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --no-asm-comments < ./shifts.c > shifts.asm
	java -jar KickAss.jar shifts.asm

ldatests:
	cat ./ldatests.c common.c > ldatests.tmp	
	./compiler --basic --kick --code-segment 2100 --data-segment 820  < ./ldatests.tmp > ldatests.asm
	java -jar KickAss.jar ldatests.asm

smallmath:
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --memory-locations < ./smallmath.c > smallmath.asm
	java -jar KickAss.jar smallmath.asm

mathtest:
	./compiler --basic --kick --code-segment 2100 --data-segment 8192 --memory-locations < ./mathtest.c > mathtest.asm
	java -jar KickAss.jar mathtest.asm

pokepeektest:
	./compiler --basic --kick --code-segment 2100 --data-segment 820  < ./pokepeektest.c > pokepeektest.asm
	java -jar KickAss.jar pokepeektest.asm

logictests:
	./compiler --basic --kick --code-segment 2100 --data-segment 820  < ./logictests.c > logictests.asm
	java -jar KickAss.jar logictests.asm

collision:
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --memory-locations  --no-asm-comments < ./collision.c > collision.asm
	java -jar KickAss.jar collision.asm
	/Applications/Vice64/tools/c1541 -attach SPRITES.d64 -delete collision -write collision.prg collision


vscroll:
	cat ./vscroll.c common.c > vscroll.tmp
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --no-asm-comments --memory-locations  < ./vscroll.tmp > vscroll.asm
	java -jar KickAss.jar vscroll.asm
	java -jar KickAss.jar vertical-scroll.asm
	rm -f vscroll.tmp
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele vscroll1 -write vscroll.prg vscroll1


vscroll2:
	cat ./vscroll2.c common.c > vscroll2.tmp
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --no-asm-comments  < ./vscroll2.tmp > vscroll2.asm
	java -jar KickAss.jar vscroll2.asm
	rm -f vscroll2.tmp
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele vscroll2 -write vscroll2.prg vscroll2

strings:
	cat ./strings.c > strings.tmp
	./compiler --basic --code-segment 2100 --data-segment 820 --kick < ./strings.tmp > strings.asm
	java -jar KickAss.jar strings.asm
#	java -jar KickAss.jar strings2.asm
	rm -f ./strings.tmp

hscroll:
	./compiler --basic --code-segment 2100 --data-segment 820 --no-asm-comments --kick < ./hscroll.c > hscroll.asm
	java -jar KickAss.jar hscroll.asm
	java -jar KickAss.jar horizontal-scroll.asm
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele hscroll -write hscroll.prg hscroll

math:
	./compiler --basic --code-segment 2100 --data-segment 820 --no-asm-comments --kick < ./cosine.c > cosine.asm
	java -jar KickAss.jar cosine.asm
	cat ./math.c > math.tmp
	./compiler --basic --code-segment 2100 --data-segment 820 --no-asm-comments --kick < ./math.tmp > math.asm
	java -jar KickAss.jar math.asm
#	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele math  -write math.prg math
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -delete cosine  -write cosine.prg cosine

odds:
	cat ./sumofodds.c common.c > sumofodds.tmp
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --no-asm-comments < ./sumofodds.tmp > sumofodds.asm
	java -jar KickAss.jar sumofodds.asm
	rm -f sumofodds.tmp

createfiles:
	./compiler --basic --kick --code-segment 2100 --data-segment 820  < ./createfiles.c > createfiles.asm
	java -jar KickAss.jar createfiles.asm
	/Applications/Vice64/tools/c1541 -attach FILES.d64 -dele create -dele file0 -dele file1 -dele file2 -write createfiles.prg create

input:
	./compiler --basic --kick --code-segment 2100 --data-segment 820  --scanf-buffer-size 32 < ./input.c > input.asm
	java -jar KickAss.jar input.asm
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -delete input  -write input.prg input


rocket:
	cat ./rocket.c common.c > rocket.tmp
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --memory-locations < ./rocket.tmp > rocket.asm
	java -jar KickAss.jar rocket.asm
	rm -f rocket.tmp

general:
	cat ./general.c common.c > general.tmp
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --no-asm-comments < ./general.tmp > general.asm
	java -jar KickAss.jar general.asm
	rm -f general.tmp

uintcmp:
	./compiler --basic --kick  --code-segment 2100 --data-segment 820 --no-asm-comment  < ./uintcmp.c > uintcmp.asm
	java -jar KickAss.jar uintcmp.asm

tests:
	@echo tests the screen blanking
	cat ./tests.c common.c > tests.tmp
	./compiler --kick --code-segment 2100 --data-segment 820  < ./tests.tmp > tests.asm
	java -jar KickAss.jar tests.asm
	rm -f tests.tmp


fortest:
	./compiler --kick --basic --code-segment 2100 --data-segment 820 --no-asm-comments < ./fortest.c > fortest.asm
	java -jar KickAss.jar fortest.asm
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele fortest -write fortest.prg fortest


typetest:
	./compiler --kick --basic --code-segment 2100 --data-segment 820 --no-asm-comments < ./typetest.c > typetest.asm
	java -jar KickAss.jar typetest.asm

forloop:
	cat ./forloop.c common.c > forloop.tmp
	./compiler --code-segment 2100 --data-segment 820 --no-asm-comments < ./forloop.tmp > forloop.asm
	rm -f forloop.tmp

looptest:
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --no-asm-comments --unsafe-ifs < ./looptest.c > looptest.asm
	java -jar KickAss.jar looptest.asm


sound:
	cat ./sound.c common.c > sound.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 820 --no-asm-comments < ./sound.tmp > sound.asm
	java -jar KickAss.jar sound.asm


image:
	cat ./image.c common.c > image.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 820 --no-asm-comments  < ./image.tmp > image.asm
	java -jar KickAss.jar image.asm

mandel:
	./compiler --kick --basic --code-segment 2100 --data-segment 820  < ./mandelbrot.c > mandelbrot.asm
	java -jar KickAss.jar mandelbrot.asm

array:
	cat ./array.c common.c > array.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 820  < ./array.tmp > array.asm
	java -jar KickAss.jar array.asm

getchar:
	./compiler --code-segment 2100 --data-segment 820 --no-asm-comments  --memory-locations  < ./getchar.c > getchar.asm

spriteptr:
	cat ./spriteptr.c common.c > spriteptr.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 820 --memory-locations  < ./spriteptr.tmp > spriteptr.asm
	java -jar KickAss.jar spriteptr.asm
	/Applications/Vice64/tools/c1541 -attach SPRITES.d64 -delete spriteptr -write spriteptr.prg spriteptr


sprite:
	cat ./sprite.c common.c > sprite.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 820 --parser-comments --memory-locations  < ./sprite.tmp > sprite.asm
	java -jar KickAss.jar sprite.asm
	/Applications/Vice64/tools/c1541 -attach SPRITES.d64 -delete sprite -write sprite.prg sprite

sprite2:
	./compiler --kick --basic --code-segment 2100 --data-segment 820 --no-asm-comments < ./sprite2.c > sprite2.asm
	java -jar KickAss.jar sprite2.asm
	/Applications/Vice64/tools/c1541 -attach SPRITES.d64 -delete sprite2 -write sprite2.prg sprite2

sprite3:
	cat ./sprite3.c common.c > sprite3.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 820 --parser-comments --memory-locations  < ./sprite3.tmp > sprite3.asm
	java -jar KickAss.jar sprite3.asm
	/Applications/Vice64/tools/c1541 -attach SPRITES.d64 -delete sprite3 -write sprite3.prg sprite3

sprite4:
	cat ./sprite4.c common.c > sprite4.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 820 --parser-comments --memory-locations  < ./sprite4.tmp > sprite4.asm
	java -jar KickAss.jar sprite4.asm
	/Applications/Vice64/tools/c1541 -attach SPRITES.d64 -delete sprite4 -write sprite4.prg sprite4

sprite5:
	cat ./sprite5.c common.c > sprite5.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 820 --parser-comments --memory-locations  < ./sprite5.tmp > sprite5.asm
	java -jar KickAss.jar sprite5.asm
	/Applications/Vice64/tools/c1541 -attach SPRITES.d64 -delete sprite5 -write sprite5.prg sprite5

plot:
	cat ./plottest.c common.c > plottest.tmp
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --no-asm-comments < ./plottest.tmp > plottest.asm
	rm -f plottest.tmp
	java -jar KickAss.jar plottest.asm

plottest2:
	cat ./plottest2.c common.c > plottest2.tmp
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --no-asm-comments < ./plottest2.tmp > plottest2.asm
	rm -f plottest2.tmp
	java -jar KickAss.jar plottest2.asm

screen:
	cat ./screen.c common.c > screen.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --no-asm-comments < ./screen.tmp > screen2.tmp
	cat screen2.tmp terra2img.hex > screen.asm
	java -jar KickAss.jar screen.asm
	rm -f screen.tmp
	rm -f screen2.tmp
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -delete screen -write screen.prg screen

decdig:
	./compiler --code-segment 2100 --data-segment 820 --no-asm-comments < ./decdig.c > decdig.asm


return:
	cat ./return.c common.c > return.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --no-asm-comments  < ./return.tmp > return.asm
	rm -f return.tmp

conway:
	./compiler --kick --basic --code-segment 2100 --data-segment 820 --no-asm-comments < ./conway.c > conway2100.asm
	./compiler --kick --unsafe-ifs --basic --code-segment 2100 --data-segment 820 --no-asm-comments < ./conway.c > conway-tiny.asm
	java -jar KickAss.jar conway2100.asm
	java -jar KickAss.jar conway-tiny.asm
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele conway -write conway2100.prg conway

stack:
	cat ./stack.c common.c > stack.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 < ./stack.tmp > stack.asm
	rm -f stack.tmp

recursive:
#	cat ./recursive.c common.c > recursive.tmp
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --no-asm-comments --unsafe-ifs < ./recursive.c > recursive.asm
	java -jar KickAss.jar recursive.asm
	rm -f recursive.tmp
#	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele recursive -write recursive.prg recursive

bytemath:
	cat ./bytemath.c common.c > bytemath.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 < ./bytemath.tmp > bytemath.asm
	rm -f bytemath.tmp

clearscreen:
	./compiler --kick --code-segment 2100 --data-segment 820   < ./clearscreen.c > clearscreen.asm

snake2100:
	./compiler --basic --code-segment 2100 --data-segment 820 --kick --no-asm-comments < ./snake2100.c > snake2100.asm
	java -jar KickAss.jar snake2100.asm
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele snake2100 -write snake2100.prg snake2100


printftest:
	cat ./printftest.c common.c > printftest.tmp
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --no-asm-comments < ./printftest.tmp > printftest.asm
	java -jar KickAss.jar printftest.asm
	rm -f ./printftest.tmp

bitswap:
	java -jar KickAss.jar bitswap.asm

printstest:
	./compiler --basic --kick --code-segment 4096 --data-segment 820  < ./printstest.c > printstest.asm
	java -jar KickAss.jar printstest.asm

float:
	cat ./floatmath.c common.c > floatmath.tmp
	./compiler --kick --code-segment 2100 --data-segment 820 --no-asm-comments < ./floatmath.tmp > floatmath.asm
	java -jar KickAss.jar floatmath.asm
	rm -f ./floatmath.tmp

program:
	cat ./poketest.c common.c > poketest.tmp
	./compiler --basic --kick --code-segment 7045 --data-segment 820 --no-asm-comments --unsafe-ifs < ./poketest.tmp > poketest.asm
#	cat poketest-tmp.asm ufo-sid.asm > poketest.asm
	java -jar KickAss.jar poketest.asm
	java -jar KickAss.jar poketest-small.asm
	rm -f poketest.tmp
#	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -dele poketest -write poketest.prg poketest

arith:
	./compiler --basic --kick --code-segment 2100 --data-segment 820  --memory-locations --no-asm-comments  < ./arithtests.c > arithtests.asm
	java -jar KickAss.jar arithtests.asm

sidirq:
	cat ./sidirq.c common.c > sidirq.tmp
	./compiler --basic --kick --code-segment 2100 --data-segment 49152 --memory-locations  < ./sidirq.tmp > sidirq.asm
	java -jar KickAss.jar -showmem sidirq.asm
	/Applications/Vice64/tools/c1541 -attach SID.d64 -dele sidirq -write sidirq.prg sidirq 

twosids:
	cat ./twosids.c common.c > twosids.tmp
	./compiler --basic --kick --code-segment 2100 --data-segment 49152 --memory-locations  < ./twosids.tmp > twosids.asm
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
	./compiler --unsafe-ifs --basic --kick --code-segment 2100 --data-segment 820 --no-asm-comments < ./iftests.tmp > iftests.asm
	java -jar KickAss.jar iftests.asm

cond:
	cat ./cond-tests.c common.c > cond-tests.tmp
	./compiler --basic --kick --code-segment 2100 --data-segment 820 --no-asm-comments --unsafe-ifs < ./cond-tests.tmp > cond-tests.asm
	java -jar KickAss.jar cond-tests.asm
	rm -f cond-tests.tmp

mini:
	./compiler --basic --kick --code-segment 2100 --data-segment 820  < ./minicond.c > minicond.asm
	java -jar KickAss.jar minicond.asm

vartests:
	cat ./vartests.c common.c > vartests.tmp
	./compiler --basic --kick --code-segment 2100 --data-segment 828 --no-asm-comments < ./vartests.tmp > vartests.asm
	java -jar KickAss.jar vartests.asm
	rm -f vartests.tmp
	/Applications/Vice64/tools/c1541 -attach TESTING.d64 -delete vartests -write vartests.prg vartests

clean:
	rm -fR *.*~
	rm -fR Makefile~
	rm -f *.tmp
	rm -f ~/Downloads/*.prg
	rm -f ~/Downloads/*.bin
