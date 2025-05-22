#CC=/usr/bin/gcc
#CC=/usr/local/gcc-10.1.0-true/bin/g++-10.1-true
#CC=/usr/local/gfortran/bin/g++
CC=g++
LEX=/usr/bin/lex
#LEX=/usr/local/bin/flex
YACC=/usr/local/bin/yacc
INCLUDE=-I/usr/local/include/c++/10.1.0/
#YACC=/usr/bin/yacc
#YACC=/usr/local/bin/bison
LIBRARIES=-ll -ly
X64=/Applications/Vice64/x64.app/Contents/MacOS/x64

all:	clean lexer parser compiler

parser: parser.y
	$(YACC) -d -v parser.y

lexer:	lexer.l
	$(LEX) lexer.l

compiler: y.tab.c
	$(CC) $(LIBRARIES) -w  y.tab.c -o compiler

bin:
	java -jar KickAss.jar binaryfractions.asm

binaryfractions:
	./compiler --kick --basic --code-segment 2100 --data-segment 8192 --no-asm-comments < binaryfractions.c > binaryfractions.asm
	java -jar KickAss.jar binaryfractions.asm

pause:	pause.c
	./compiler --kick --basic --code-segment 2100 --data-segment 24000 --no-asm-comments < pause.c > pause.asm
	java -jar KickAss.jar pause.asm

wedge.op: wedge.op.asm
	java -jar KickAss.jar wedge.op.asm

wedge: wedge.c
	./compiler --kick --code-segment 2100 --data-segment 828 --no-asm-comments < wedge.c > wedge.asm
	java -jar KickAss.jar wedge.asm

sidirq:
	cat sidirq.c > sidirq.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 24000 --asm-comments < sidirq.tmp > sidirq.asm
	java -jar KickAss.jar sidirq.asm
	rm -f sidirq.sym
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -delete sidirq -write sidirq.prg sidirq

gravity: gravity.c
	./compiler --kick --basic --code-segment 2100 --data-segment 49152 < gravity.c > gravity.asm
	cat pause.inc.asm >> gravity.asm
	java -jar KickAss.jar gravity.asm

times40: times40.c
	./compiler --kick --basic --code-segment 2100 --data-segment 820 < times40.c > times40.asm
	cat pause.inc.asm >> times40.asm
	java -jar KickAss.jar times40.asm

floattest:
	cat float-test.c > float-test.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 7000 --asm-comments < float-test.tmp > float-test.asm
	java -jar KickAss.jar float-test.asm
	rm -f float-test.sym

cosine:
	cat cosine.c > cosine.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 7000 --asm-comments < cosine.tmp > cosine.asm
	java -jar KickAss.jar cosine.asm
	rm -f cosine.sym

graph:
	cat graph.c common.c > graph.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 8192 < graph.tmp > graph.asm
	java -jar KickAss.jar graph.asm
	rm -f graph.sym

shell: mcbitmap-shell.c pause.inc.asm setscreenmode.inc.asm registers.inc.asm memory.inc.asm
	./compiler --kick --basic --code-segment 2100 --data-segment 8192 < mcbitmap-shell.c > mcbitmap.asm
	cat pause.inc.asm >> mcbitmap.asm
	cat setscreenmode.inc.asm >> mcbitmap.asm
	cat registers.inc.asm >> mcbitmap.asm
	cat memory.inc.asm >> mcbitmap.asm
	cat random.inc.asm >> mcbitmap.asm
	cat segment.inc.asm >> mcbitmap.asm
	java -jar KickAss.jar mcbitmap.asm
	rm -f mcbitmap.sym

spriteanim:
	cat spriteanim.c common.c > spriteanim.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 8192 < spriteanim.tmp > spriteanim.asm
	java -jar KickAss.jar spriteanim.asm
	rm -f spriteanim.sym

charset:
	cat charset.c > charset.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 7000 < charset.tmp > charset.asm
	java -jar KickAss.jar charset.asm
	rm -f charset.sym

mccharset:
	cat mccharset.c common.c > mccharset.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 7000 < mccharset.tmp > mccharset.asm
	java -jar KickAss.jar mccharset.asm
	rm -f mccharset.sym

mcbitmap:
	cat mcbitmap.c common.c > mcbitmap.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 7000 < mcbitmap.tmp > mcbitmap.asm
	java -jar KickAss.jar mcbitmap.asm
	rm -f mcbitmap.sym

writesynopsis: sya syb syc syd sye syf syg syh syi syj

# Synopses
sya:
	rm -f writesynopsisa.prg writesynopsisa.asm
	cat writesynopsisa.c common.c > writesynopsisa.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 7000 < ./writesynopsisa.tmp > writesynopsisa.asm
	java -jar KickAss.jar writesynopsisa.asm
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -delete synopsisa -delete writesynopsisa -write writesynopsisa.prg writesynopsisa
	rm -f writesynopsisa.tmp writesynopsisa.sym

syb:
	rm -f writesynopsisb.prg writesynopsisb.asm
	cat writesynopsisb.c common.c > writesynopsisb.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 7000 < ./writesynopsisb.tmp > writesynopsisb.asm
	java -jar KickAss.jar writesynopsisb.asm
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -delete synopsisb -delete writesynopsisb -write writesynopsisb.prg writesynopsisb
	rm -f writesynopsisb.tmp writesynopsisb.sym

syc:
	rm -f writesynopsisc.prg writesynopsisc.asm
	cat writesynopsisc.c common.c > writesynopsisc.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 7000 < ./writesynopsisc.tmp > writesynopsisc.asm
	java -jar KickAss.jar writesynopsisc.asm
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -delete synopsisc -delete writesynopsisc -write writesynopsisc.prg writesynopsisc
	rm -f writesynopsisc.tmp writesynopsisc.sym

syd:
	rm -f writesynopsisd.prg writesynopsisd.asm
	cat writesynopsisd.c common.c > writesynopsisd.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 7000 < ./writesynopsisd.tmp > writesynopsisd.asm
	java -jar KickAss.jar writesynopsisd.asm
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -delete synopsisd -delete writesynopsisd -write writesynopsisd.prg writesynopsisd
	rm -f writesynopsisd.tmp writesynopsisd.sym

sye:
	rm -f writesynopsise.prg writesynopsise.asm
	cat writesynopsise.c common.c > writesynopsise.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 7000 < ./writesynopsise.tmp > writesynopsise.asm
	java -jar KickAss.jar writesynopsise.asm
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -delete synopsise -delete writesynopsise -write writesynopsise.prg writesynopsise
	rm -f writesynopsise.tmp writesynopsise.sym

syf:
	rm -f writesynopsisf.prg writesynopsisf.asm
	cat writesynopsisf.c common.c > writesynopsisf.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 7000 < ./writesynopsisf.tmp > writesynopsisf.asm
	java -jar KickAss.jar writesynopsisf.asm
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -delete synopsisf -delete writesynopsisf -write writesynopsisf.prg writesynopsisf
	rm -f writesynopsisf.tmp writesynopsisf.sym

syg:
	rm -f writesynopsisg.prg writesynopsisg.asm
	cat writesynopsisg.c common.c > writesynopsisg.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 7000 < ./writesynopsisg.tmp > writesynopsisg.asm
	java -jar KickAss.jar writesynopsisg.asm
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -delete synopsisg -delete writesynopsisg -write writesynopsisg.prg writesynopsisg
	rm -f writesynopsisg.tmp writesynopsisg.sym

syh:
	rm -f writesynopsish.prg writesynopsish.asm
	cat writesynopsish.c common.c > writesynopsish.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 7000 < ./writesynopsish.tmp > writesynopsish.asm
	java -jar KickAss.jar writesynopsish.asm
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -delete synopsish -delete writesynopsish -write writesynopsish.prg writesynopsish
	rm -f writesynopsish.tmp writesynopsish.sym

syi:
	rm -f writesynopsisi.prg writesynopsisi.asm
	cat writesynopsisi.c common.c > writesynopsisi.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 7000 < ./writesynopsisi.tmp > writesynopsisi.asm
	java -jar KickAss.jar writesynopsisi.asm
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -delete synopsisi -delete writesynopsisi -write writesynopsisi.prg writesynopsisi
	rm -f writesynopsisi.tmp writesynopsisi.sym

syj:
	rm -f writesynopsisj.prg writesynopsisj.asm
	cat writesynopsisj.c common.c > writesynopsisj.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 7000 < ./writesynopsisj.tmp > writesynopsisj.asm
	java -jar KickAss.jar writesynopsisj.asm
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -delete synopsisj -delete writesynopsisj -write writesynopsisj.prg writesynopsisj
	rm -f writesynopsisj.tmp writesynopsisj.sym

createspritefiles:
	./compiler --kick --basic --no-optimize --code-segment 2100 --data-segment 8192 < ./createspritefiles.c > createspritefiles.asm
	java -jar KickAss.jar createspritefiles.asm
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -delete rorbit -delete henchman -delete dragon -delete ghost -write createspritefiles.prg createsprites,p

savelevela:
	./compiler --kick --basic --no-optimize --code-segment 2100 --data-segment 21000 < ./savedata-levela.c > savedata-levela.asm
	java -jar KickAss.jar savedata-levela.asm
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -dele worlda -dele spritesa -dele savedata-levela -write savedata-levela.prg savedata-levela -dele mapa
	rm -f savedata-levela.tmp savedata-levela.sym

savelevelb:
	./compiler --kick --basic --no-optimize --code-segment 2100 --data-segment 21000 < ./savedata-levelb.c > savedata-levelb.asm
	java -jar KickAss.jar savedata-levelb.asm
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -dele worldb -dele spritesb -dele savedata-levelb -write savedata-levelb.prg savedata-levelb -dele mapb
	rm -f savedata-levelb.tmp savedata-levelb.sym

savelevelc:
	./compiler --kick --basic --no-optimize --code-segment 2100 --data-segment 21000 < ./savedata-levelc.c > savedata-levelc.asm
	java -jar KickAss.jar savedata-levelc.asm
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -dele worldc -dele spritesc -dele savedata-levelc -write savedata-levelc.prg savedata-levelc -dele mapc
	rm -f savedata-levelc.tmp savedata-levelc.sym

saveleveld:
	./compiler --kick --basic --no-optimize --code-segment 2100 --data-segment 21000 < ./savedata-leveld.c > savedata-leveld.asm
	java -jar KickAss.jar savedata-leveld.asm
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -dele worldd -dele spritesd -dele savedata-leveld -write savedata-leveld.prg savedata-leveld -dele mapd
	rm -f savedata-leveld.tmp savedata-leveld.sym

savelevele:
	./compiler --kick --basic --no-optimize --code-segment 2100 --data-segment 21000 --memory-locations < ./savedata-levele.c > savedata-levele.asm
	java -jar KickAss.jar savedata-levele.asm
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -dele worlde -dele spritese -dele savedata-levele -write savedata-levele.prg savedata-levele -dele mape
	rm -f savedata-levele.tmp savedata-levele.sym

savelevelf:
	./compiler --kick --basic --no-optimize --code-segment 2100 --data-segment 21000 < ./savedata-levelf.c > savedata-levelf.asm
	java -jar KickAss.jar savedata-levelf.asm
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -dele worldf -dele spritesf -dele savedata-levelf -write savedata-levelf.prg savedata-levelf -dele mapf
	rm -f savedata-levelf.tmp savedata-levelf.sym

savelevelg:
	./compiler --kick --basic --no-optimize --code-segment 2100 --data-segment 21000 < ./savedata-levelg.c > savedata-levelg.asm
	java -jar KickAss.jar savedata-levelg.asm
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -dele worldg -dele spritesg -dele savedata-levelg -write savedata-levelg.prg savedata-levelg -dele mapg
	rm -f savedata-levelg.tmp savedata-levelg.sym

savelevelh:
	./compiler --kick --basic --no-optimize --code-segment 2100 --data-segment 21000 < ./savedata-levelh.c > savedata-levelh.asm
	java -jar KickAss.jar savedata-levelh.asm
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -dele worldh -dele spritesh -dele savedata-levelh -write savedata-levelh.prg savedata-levelh -dele maph
	rm -f savedata-levelh.tmp savedata-levelh.sym savedata-levelh.asm savedata-levelh.vs

saveleveli:
	./compiler --kick --basic --no-optimize --code-segment 2100 --data-segment 21000 < ./savedata-leveli.c > savedata-leveli.asm
	java -jar KickAss.jar savedata-leveli.asm
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -dele worldi -dele spritesi -dele savedata-leveli -write savedata-leveli.prg savedata-leveli -dele mapi
	rm -f savedata-leveli.tmp savedata-leveli.sym savedata-leveli.asm savedata-leveli.vs

savelevelj:
	./compiler --kick --basic --no-optimize --code-segment 2100 --data-segment 21000 < ./savedata-levelj.c > savedata-levelj.asm
	java -jar KickAss.jar savedata-levelj.asm
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -dele worldj -dele spritesj -dele savedata-levelj -write savedata-levelj.prg savedata-levelj -dele mapj
	rm -f savedata-levelj.tmp savedata-levelj.sym

test:	test.c
	./compiler --kick --code-segment 2100 --data-segment 828 < ./test.c > test.asm
	java -jar KickAss.jar test.asm

bmprint.op: bmprint.op.asm
	java -jar KickAss.jar bmprint.op.asm

bmprint-test: bmprint-test.c
	./compiler --kick --basic --no-optimize --code-segment 2100 --data-segment 21000 --no-asm-comments < ./bmprint-test.c > bmprint-test.asm
	cat registers.inc.asm >> bmprint-test.asm
	cat memory.inc.asm >> bmprint-test.asm
	cat pause.inc.asm >> bmprint-test.asm
	cat bmprint.inc.asm >> bmprint-test.asm
	cat setscreenmode.inc.asm >> bmprint-test.asm
	java -jar KickAss.jar bmprint-test.asm

bmprint: bmprint.c registers.inc.asm memory.inc.asm pause.inc.asm
	./compiler --kick --basic --no-optimize --code-segment 2100 --data-segment 21000 --no-asm-comments < ./bmprint.c > bmprint.asm
	cat registers.inc.asm >> bmprint.asm
	cat memory.inc.asm >> bmprint.asm
	cat pause.inc.asm >> bmprint.asm
	cat bmprint.inc.asm >> bmprint.asm
#	cat mcplot.inc.asm >> bmprint.asm
	cat setscreenmode.inc.asm >> bmprint.asm
	java -jar KickAss.jar bmprint.asm

logicalOR:
	./compiler --unsafe-ifs --kick --basic --code-segment 2061 --data-segment 8192 < ./logicalOR.c > logicalor.asm
	java -jar KickAss.jar logicalor.asm

infinite:
	cat ./infinitescroll.c common.c > infinitescroll.tmp
	./compiler --basic --code-segment 2062 --data-segment 8192 --kick --no-asm-comments < ./infinitescroll.tmp > infinitescroll.asm
	java -jar KickAss.jar infinitescroll.asm


scroller2:
	cat ./scroller2.c common.c > scroller2.tmp
	./compiler --basic --code-segment 2062 --data-segment 8192 --kick --no-asm-comments < ./scroller2.tmp > scroller2.asm
	java -jar KickAss.jar scroller2.asm

scroller4:
	cat ./scroller4.c common.c > scroller4.tmp
	./compiler --basic --code-segment 2062 --data-segment 8192 --kick --no-asm-comments < ./scroller4.tmp > scroller4.asm
	cat scroller4.asm charset_1.asm > myscroller.asm
	java -jar KickAss.jar myscroller.asm
	java -jar KickAss.jar ./smooth-scroller/main.asm

vscroll2:
	./compiler --basic --code-segment 2062 --data-segment 8192 --kick --no-asm-comments < ./vscroll2.c > vscroll2.asm
	java -jar KickAss.jar vscroll2.asm

newscroll:
	./compiler --basic --code-segment 2062 --data-segment 8192 --kick --no-asm-comments < ./newscroll.c > newscroll.asm
	java -jar KickAss.jar newscroll.asm
	java -jar KickAss.jar newscroll-faster.asm

snake:
	./compiler --unsafe-ifs --basic --code-segment 2100 --data-segment 820 --kick --no-asm-comments < ./snake2100.c > snake2100.asm
	java -jar KickAss.jar snake2100.asm
	java -jar KickAss.jar snake2100.op.asm
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach TESTING.d64 -dele snake2100 -write snake2100.prg snake2100

laxtest:
	java -jar KickAss.jar laxtest.asm

commonmctext:
	./compiler 00unsafe-ifs --kick --data-segment 820 < ./common-mctext.c > ./common-mctext.asm

screentest:
	cat screentest.c common.c > screentest.tmp
	./compiler --kick --basic --code-segment 2100 --data-segment 4096 < ./screentest.tmp > screentest.asm
	java -jar KickAss.jar screentest.asm

threeonone:
	cat ./three-on-one.c > three-on-one.tmp
	./compiler --unsafe-ifs --kick --basic --code-segment 17626 --data-segment 2062 < ./three-on-one.tmp > three-on-one.asm
	java -jar KickAss.jar three-on-one.asm
	java -jar KickAss.jar three-on-one.op.asm
	rm -f three-on-one.tmp

terraform:
	cat ./terraform.c common.c > terraform.tmp
	./compiler --kick --basic --code-segment 17626 --data-segment 2062 --no-asm-comments < ./terraform.tmp > terraform.asm
	java -jar KickAss.jar terraform.asm
	rm -f terraform.tmp

common:
	./compiler --unsafe-ifs --kick < ./common.c > common.asm

conway:
	./compiler --unsafe-ifs --kick --basic --code-segment 2100 --data-segment 820 < ./conway.c > conway.asm
	./nocomment < conway.asm > conway.nc.asm
	java -jar KickAss.jar conway.asm

conwayop:
	java -jar KickAss.jar conway.op3.asm

newlabels:
	./compiler --kick --basic --code-segment 2061 --data-segment 820  < ./newlabels.c > newlabels.asm
	java -jar KickAss.jar newlabels.asm

byte2hex: byte2hex.c
	./compiler --kick --basic --code-segment 2061 --data-segment 8192 --no-asm-comments< ./byte2hex.c > byte2hex.asm
	cat byte2petscii.inc.asm >> byte2hex.asm
	cat pause.inc.asm >> byte2hex.asm
	java -jar KickAss.jar byte2hex.asm
	java -jar KickAss.jar byte2hex.op.asm


syn1:
	./compiler --kick --basic --code-segment 2100 --data-segment 8192 < ./syn1.c > syn1.asm
	java -jar KickAss.jar syn1.asm
	c1541 -attach KNIGHTSQUEST.d64 -dele completed -dele shoppe -dele syn1 -write syn1.prg syn1,p

shoptext:
	./compiler --kick --basic --code-segment 2100 --data-segment 8192 < ./shop-text.c > shop-text.asm
	java -jar KickAss.jar shop-text.asm
	c1541 -attach KNIGHTSQUEST.d64 -dele shoppe -dele shop-text -write shop-text.prg shop-text,p

endtext:
	./compiler --kick --basic --code-segment 2100 --data-segment 8192 < ./end-text.c > end-text.asm
	java -jar KickAss.jar end-text.asm
	c1541 -attach KNIGHTSQUEST.d64 -dele endofgame -dele -write end-text.prg end-text,p

lastword:
	./compiler --kick --basic --code-segment 2100 --data-segment 8192 < ./last-word.c > last-word.asm
	java -jar KickAss.jar last-word.asm
	c1541 -attach KNIGHTSQUEST.d64 -dele end-text -dele last-word -write last-word.prg last-word,p

putsyns:
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -dele synopsisa -write synopsisa synopsisa,s
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -dele synopsisb -write synopsisb synopsisb,s
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -dele synopsisc -write synopsisc synopsisc,s
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -dele synopsisd -write synopsisd synopsisd,s
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -dele synopsise -write synopsise synopsise,s
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -dele synopsisf -write synopsisf synopsisf,s
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -dele synopsisg -write synopsisg synopsisg,s
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -dele synopsish -write synopsish synopsish,s
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -dele synopsisi -write synopsisi synopsisi,s
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -dele synopsisj -write synopsisj synopsisj,s

testinline:
	./compiler --unsafe-ifs --kick --basic --code-segment 2061 --data-segment 8192 < ./testinline.c > testinline.asm
	java -jar KickAss.jar testinline.asm

registers: registers.c
	./compiler --unsafe-ifs --kick --basic --code-segment 2061 --data-segment 8192 < ./registers.c > registers.asm
	java -jar KickAss.jar registers.asm

clear:	clear.c
	./compiler --kick --basic --code-segment 2061 --data-segment 21000 --no-asm-comments < ./clear.c > clear.asm
	cat memory.inc.asm >> clear.asm
	cat pause.inc.asm >> clear.asm
	java -jar KickAss.jar clear.asm
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach line.d64 -dele clear.prg -dele clear -write clear.prg clear,p
	rm -f clear.vs

randomtest: randomtest.c random.inc.asm
	./compiler --kick --basic --code-segment 2061 --data-segment 8192 --no-asm-comments < ./randomtest.c > randomtest.asm
	cat random.inc.asm >> randomtest.asm
	cat pause.inc.asm >> randomtest.asm
	cat byte2petscii.inc.asm >> randomtest.asm
	java -jar KickAss.jar randomtest.asm
	java -jar KickAss.jar randomtest.op.asm

underlying.op: underlying.op.asm
	java -jar KickAss.jar -vicesymbols underlying.op.asm

underlying: underlying.c
	./compiler --kick --basic --code-segment 2061 --data-segment 21000 --memory-locations --no-asm-comments < ./underlying.c > underlying.asm
	cat mcplot.inc.asm >> underlying.asm
	cat segment.inc.asm >> underlying.asm
	cat registers.inc.asm >> underlying.asm
	cat memory.inc.asm >> underlying.asm
	cat pause.inc.asm >> underlying.asm
	cat bmprint.inc.asm >> underlying.asm
	cat setscreenmode.inc.asm >> underlying.asm
	cat getoffset.inc.asm >> underlying.asm
	java -jar KickAss.jar -vicesymbols -bytedump underlying.asm

disk-procedures.op:
	java -jar KickAss.jar disk-procedures.op.asm

disk-procedures:
	./compiler --kick --basic --code-segment 2061 --data-segment 8192 < ./disk-procedures.c > disk-procedures.asm
	java -jar KickAss.jar disk-procedures.asm

dironly:
	./compiler --kick --code-segment 2061 --data-segment 8192 < ./dironly.c > dironly.asm
	java -jar KickAss.jar dironly.asm
	java -jar KickAss.jar dironly.op.asm -o dironly52915

line.op: line.op.asm
	java -jar KickAss.jar line.op.asm

joystick:
	./compiler --kick --basic --code-segment 2061 --data-segment 8192 --no-asm-comments < ./joystick.c > joystick.asm
	java -jar KickAss.jar ./joystick.asm

getchar: getchar.c getin.c
	./compiler --kick --basic --code-segment 2061 --data-segment 8192 --no-asm-comments < ./getchar.c > getchar.asm
	./compiler --kick --basic --code-segment 2061 --data-segment 8192 --no-asm-comments < ./getin.c > getin.asm
	java -jar KickAss.jar -vicesymbols -bytedump getchar.asm
	java -jar KickAss.jar -vicesymbols -bytedump getin.asm

line: line.c
	./compiler --kick --basic --code-segment 2061 --data-segment 21000 --memory-locations --no-asm-comments < ./line.c > line.asm
	cat mcplot.inc.asm >> line.asm
	cat segment.inc.asm >> line.asm
	cat registers.inc.asm >> line.asm
	cat memory.inc.asm >> line.asm
	cat getpixel.inc.asm >> line.asm
	cat pause.inc.asm >> line.asm
	cat bmprint.inc.asm >> line.asm
	cat setscreenmode.inc.asm >> line.asm
	cat getoffset.inc.asm >> line.asm
	java -jar KickAss.jar -vicesymbols -bytedump line.asm
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach line.d64 -dele line.prg -write line.prg

hires:	hires.c
	./compiler --unsafe-ifs --kick --basic --code-segment 2061 --data-segment 32768 --no-asm-comments < ./hires.c > hires.asm
	cat registers.inc.asm >> hires.asm
	cat memory.inc.asm >> hires.asm
	cat pause.inc.asm >> hires.asm
	java -jar KickAss.jar hires.asm

knight3: knight3.c keyup.inc.asm random.inc.asm memory.inc.asm segment.inc.asm registers.inc.asm modulus.inc.asm 
#	cat ./knight3.c common.c > knight3.tmp
	./compiler --unsafe-ifs --kick --basic --code-segment 2061 --data-segment 32768 --no-asm-comments < ./knight3.c > knight3.asm
	cat random.inc.asm >> knight3.asm
	cat keyup.inc.asm >> knight3.asm
	cat memory.inc.asm >> knight3.asm
	cat registers.inc.asm >> knight3.asm
	cat segment.inc.asm >> knight3.asm
	cat modulus.inc.asm >> knight3.asm
	java -jar KickAss.jar -define SAFEMCPLOT knight3.asm
#	java -jar KickAss.jar knight3.asm
	rm -f knight3.tmp
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -delete knight3 -write knight3.prg knight3

writesyn1: writesynopsis1.c
	./compiler --unsafe-ifs --kick --basic --code-segment 2061 --data-segment 26000 --no-asm-comments < ./writesynopsis1.c > writesynopsis1.asm
	java -jar KickAss.jar writesynopsis1.asm

knight3.op:
	java -jar KickAss.jar -define SAFEMCPLOT knight3.op.asm
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -delete knight3 -write knight3.op.prg knight3

array:	array.c
	./compiler --unsafe-ifs --kick --basic --code-segment 2061 --data-segment 8192 --no-asm-comments < ./array.c > array.asm
	java -jar KickAss.jar array.asm

8sprites: 8sprites.c
	./compiler --unsafe-ifs --kick --basic --code-segment 2061 --data-segment 8192 --no-asm-comments < ./8sprites.c > 8sprites.asm
	cat pause.inc.asm >> 8sprites.asm
	cat registers.inc.asm >> 8sprites.asm
#	cat setscreenmode.inc.asm >> 8sprites.asm
	cat memory.inc.asm >> 8sprites.asm
	java -jar KickAss.jar 8sprites.asm

bitmap2: bitmap2.c
	./compiler --unsafe-ifs --kick --basic --code-segment 2061 --data-segment 8192 --no-asm-comments < ./bitmap2.c > bitmap2.asm
	cat pause.inc.asm >> bitmap2.asm
	cat registers.inc.asm >> bitmap2.asm
	cat memory.inc.asm >> bitmap2.asm
	cat segment.inc.asm >> bitmap2.asm
	java -jar KickAss.jar bitmap2.asm

emptymap.op: emptymap.op.asm
	java -jar KickAss.jar emptymap.op.asm

emptymap: emptymap.c
	./compiler --unsafe-ifs --kick --basic --code-segment 2061 --data-segment 8192 --no-asm-comments < ./emptymap.c > emptymap.asm
	cat pause.inc.asm >> emptymap.asm
	cat registers.inc.asm >> emptymap.asm
	cat memory.inc.asm >> emptymap.asm
	cat segment.inc.asm >> emptymap.asm
	java -jar KickAss.jar emptymap.asm
	rm -f emptymap.c~

sprite: sprite.c
	./compiler --unsafe-ifs --kick --basic --code-segment 2061 --data-segment 8192 --no-asm-comments < ./sprite.c > sprite.asm
	cat pause.inc.asm >> sprite.asm
	cat registers.inc.asm >> sprite.asm
	cat setscreenmode.inc.asm >> sprite.asm
	cat memory.inc.asm >> sprite.asm
	java -jar KickAss.jar sprite.asm


cleanwriters:
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -dele savedata-levela -dele savedata-levelb -dele savedata-levelc -dele savedata-leveld -dele savedata-levele -dele savedata-levelf -dele savedata-levelg -dele savedata-levelh -dele savedata-leveli -dele savedata-levelj
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -list

wipeworld:
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -dele sprites1 -dele sprites2 -dele sprites3 -dele sprites4 -dele sprites5 -dele sprites6 -dele sprites7 -dele sprites8 -dele sprites9 -dele spritesa
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -dele world1 -dele world2 -dele world3 -dele world4 -dele world5 -dele world6 -dele world7 -dele world8 -dele world9 -dele worlda
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -dele synopsis1 -dele synopsis2 -dele synopsis3 -dele synopsis4 -dele synopsis5 -dele synopsis6 -dele synopsis7 -dele synopsis8 -dele synopsis9 -dele synopsisa

purgeoldworlds:
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -delete world1 -delete world2 -delete world3 -delete world4 -delete world5 -delete world6 -delete world7 -delete world8 -delete world9 -delete worlda
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -delete sprites1 -delete sprites2 -delete sprites3 -delete sprites4 -delete sprites5 -delete sprites6 -delete sprites7 -delete sprites8 -delete sprites9 -delete sprites8

savelevels:
	make cleanwriters
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -dele spritesa -dele spritesb -dele spritesc -dele spritesd -dele spritese -dele spritesf -dele spritesg -dele spritesh -dele spritesi -dele spritesj
	/opt/homebrew/Cellar/vice/3.9/bin/c1541 -attach KNIGHTSQUEST.d64 -dele worlda -dele worldb -dele worldc -dele worldd -dele worlde -dele worldf -dele worldg -dele worldh -dele worldi -dele worldj
	make savelevela
	make savelevelb
	make savelevelc
	make saveleveld
	make savelevele
	make savelevelf
	make savelevelg
	make savelevelh
	make saveleveli
	make savelevelj

clean:
	rm -fR *.*~
	rm -fR Makefile~
	rm -f *.tmp
	rm -f ~/Downloads/*.prg
	rm -f ~/Downloads/*.bin
