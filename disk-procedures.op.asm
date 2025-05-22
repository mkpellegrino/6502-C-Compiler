 //  Variable Labels
.label general8bit = $2000
.label userinput = $2001
.label filestatus = $2002
.label bytesread = $2003
.label lnL = $2004
.label lnH = $2005
.label ln = $2006
.label proceed = $2008
.label renameText = $2009
.label copyText = $200B
.label deleteText0 = $200D
.label deleteText1 = $200F
.label text0 = $2011
.label menu0 = $2013
.label menu1 = $2015
.label menu2 = $2017
.label menu3 = $2019
.label menu4 = $201B
.label menu5 = $201D
.label menu6 = $201F
.label menu7 = $2021
.label menu8 = $2023
.label menu9 = $2025
.label menuQ = $2027
.label writeaddr = $2029
.label writeuntil0ARG0 = $202C
* = $0801
BasicUpstart($080D)
* = $080D
	lda #$20
	sta userinput
	lda #<STRLBL0
	sta renameText
	lda #>STRLBL0
	sta renameText+1
	lda #<STRLBL1
	sta copyText
	lda #>STRLBL1
	sta copyText+1
	lda #<STRLBL2
	sta deleteText0
	lda #>STRLBL2
	sta deleteText0+1
	lda #<STRLBL3
	sta deleteText1
	lda #>STRLBL3
	sta deleteText1+1
	lda #<STRLBL4
	sta text0
	lda #>STRLBL4
	sta text0+1
	lda #<STRLBL5
	sta menu0
	lda #>STRLBL5
	sta menu0+1
	lda #<STRLBL6
	sta menu1
	lda #>STRLBL6
	sta menu1+1
	lda #<STRLBL7
	sta menu2
	lda #>STRLBL7
	sta menu2+1
	lda #<STRLBL8
	sta menu3
	lda #>STRLBL8
	sta menu3+1
	lda #<STRLBL9
	sta menu4
	lda #>STRLBL9
	sta menu4+1
	lda #<STRLBL10
	sta menu5
	lda #>STRLBL10
	sta menu5+1
	lda #<STRLBL11
	sta menu6
	lda #>STRLBL11
	sta menu6+1
	lda #<STRLBL12
	sta menu7
	lda #>STRLBL12
	sta menu7+1
	lda #<STRLBL13
	sta menu8
	lda #>STRLBL13
	sta menu8+1
	lda #<STRLBL14
	sta menu9
	lda #>STRLBL14
	sta menu9+1
	lda #<STRLBL15
	sta menuQ
	lda #>STRLBL15
	sta menuQ+1

!top:			
	lda userinput
	cmp #$51
	beq !bottom+ // if userinput == 'Q' then quit

	cmp #$30
	bne !+
	jsr initdrive
!:	cmp #$31
	bne !+
	jsr createfile
!:	cmp #$32
	bne !+
	jsr deletefile
!:	cmp #$33
	bne !+
	jsr displayfile
!:	cmp #$34
	bne !+
	jsr copyfile
!:	cmp #$35
	bne !+
	jsr renamefile
!:	cmp #$36
	bne !+
	jsr validate
!:	cmp #$37
	bne !+
	jsr derror
!:	cmp #$38
	bne !+
	jsr format
!:	cmp #$39
	bne !+
	jsr directory
!:
	// close all channels
	jsr closeall
	// display the menu
	jsr menu
	// get a keypress from user
	jsr getuserinput

	// display 2 carriage returns
	lda #$0D
	jsr $FFD2
	jsr $FFD2
	jmp !top- // jump to top of loop
!bottom:
	rts 


displayfile:
// setfilename( ''MYFILE'' );
	lda #$06
	ldx #<STRLBL16
	ldy #>STRLBL16
	jsr $FFBD
// setlfs(3,8,3);
	lda #$03
	ldx #$08
	ldy #$03
	jsr $FFBA
// fopen();
	jsr $FFC0
// fchkin(3);
	ldx #$03
	jsr $FFC6
// read and display file
	jsr $FFCF
	sta general8bit
	lda $90
	sta filestatus
!top:			 
	lda filestatus
	cmp #$00
	bne !bottom+
	lda general8bit
	jsr $FFD2
	jsr $FFCF
	sta general8bit
	lda $90
	sta filestatus
	jmp !top-
!bottom:
// display a carriage return
	lda #$0D
	jsr $FFD2	
// fclrchn();
	jsr $FFCC
// read the error string
	jsr derror
// fclose(3);
	lda #$03
	jsr $FFC3
	rts


	
initdrive:
// for a command like this, filename
// IS the command (I0 for INITIALISE
// Set Filename
	lda #$02
	ldx #<STRLBL17
	ldy #>STRLBL17
	jsr $FFBD
// setlfs(1,8,15);
	lda #$01
	ldx #$08
	ldy #$0F
	jsr $FFBA
// fopen();
	jsr $FFC0
// fclrchn();
	jsr $FFCC
// read the error string
	jsr derror
// fclose(1);
	lda #$01
	jsr $FFC3
	rts

	
copyfile:
// for a command like this, filename
// should be "unset"... so set it with zeroes
	jsr clearfilename
// setlfs(15,8,15);
	lda #$0F
	ldx #$08
	ldy #$0F
	jsr $FFBA
// fopen();
	jsr $FFC0
// fchkout(15);
	ldx #$0F
	jsr $FFC9
// send the string to the device
	lda copyText
	pha 
	lda copyText+1
	pha 
	jsr writeuntil0
// fclrchn();
	jsr $FFCC
// read the error string
	jsr derror
// fclose(15);
	lda #$0F
	jsr $FFC3
	rts

	
renamefile:
// for a command like this, filename
// should be "unset"... so set it with zeroes
	jsr clearfilename
// setlfs(15,8,15);
	lda #$0F
	ldx #$08
	ldy #$0F
	jsr $FFBA
// fopen();
	jsr $FFC0
// fchkout(15);
	ldx #$0F
	jsr $FFC9
// send the string to the device
	lda renameText
	pha 
	lda renameText+1
	pha 
	jsr writeuntil0
// fclrchn();
	jsr $FFCC
// read the error string
	jsr derror
// fclose(15);
	lda #$0F
	jsr $FFC3
	rts 

clearfilename:
	lax #$00
	tay
	jsr $FDF9
	rts
	
deletefile:
// for a command like this, filename
// should be "unset"... so set it with zeroes
	jsr clearfilename
// setlfs(15,8,15);
	lda #$0F
	ldx #$08
	ldy #$0F
	jsr $FFBA
// fopen();
	jsr $FFC0
// fchkout(15);
	ldx #$0F
	jsr $FFC9
// send the string to the device
	lda deleteText0
	pha 
	lda deleteText0+1
	pha 
	jsr writeuntil0
// fclrchn();
	jsr $FFCC
// read the error string
	jsr derror
// fclose(15);
	lda #$0F
	jsr $FFC3

	
// do it all again with
// the other string
// vvvvvvvvvvvvvvvv
// Set Logical File System
	lda #$0F
	ldx #$08
	ldy #$0F
	jsr $FFBA
// fopen
	jsr $FFC0
// fchkout
	ldx #$0F
	jsr $FFC9
	lda deleteText1
	pha 
	lda deleteText1+1
	pha 
	jsr writeuntil0
// fclrchn
	jsr $FFCC
	jsr derror
// fclose
	lda #$0F
	jsr $FFC3
// ^^^^^^^^^^^^^^^^
	rts


	
createfile:
// setfilename( ''0:MYFILE,S,W'' );
// Set Filename
	lda #$0C
	ldx #<STRLBL18
	ldy #>STRLBL18
	jsr $FFBD
// setlfs( 1, 8, 2 );
	lda #$01
	ldx #$08
	ldy #$02
	jsr $FFBA
// fopen();
	jsr $FFC0
// fchkout(1);
	ldx #$01
	jsr $FFC9
// write the data from the file
	lda text0
	ldx text0+1
	sta writeaddr
	stx writeaddr+1

	ldy #$00
	lda writeaddr
	ldx writeaddr+1
	sta !+
	stx !++
	.byte $AD
!:	.byte $00
!:	.byte $00

!top:			 // Top of Loop
	cmp #$00
	beq !bottom+ // if z==1 jump to bottom

	jsr $FFD2

	lda #$01
	clc 
	adc writeaddr
	sta writeaddr
	lda #$00
	adc writeaddr+1
	sta writeaddr+1

	ldy #$00
	lda writeaddr
	ldx writeaddr+1
	sta !+
	stx !++
	.byte $AD
!:	.byte $00
!:	.byte $00
	jmp !top- // jump to top of Loop
!bottom:
// fclrchn();
	jsr $FFCC
// read the error string
	jsr derror
// fclose(1);
	lda #$01
	jsr $FFC3
	rts 


derror:
// Send TALK command to serial bus
	lda #$00
	sta $90
	lda #$08
	sta $BA
	jsr $FFB4

// Send TALK secondary address to serial bus
	lda #$6F
	sta $B9
	jsr $FF96
!:	ldy $90
	bne !+
// Read byte from serial bus
	jsr $FFA5
	jsr $FFD2
	cmp #$0D
	bne !-
// Send UNTALK command to serial bus
!:	jsr $FFAB
	// diplay carriage return
	lda #$0D
	jsr $FFD2
	rts

	
directory:
// zero out the # of bytes read and filestatus
// initialising UintIMM
	lda #$00
	sta bytesread
	sta filestatus
// setlfs(2,8,0);
	lda #$02
	ldx #$08
	ldy #$00
	jsr $FFBA
// set the filename to '$' for
// directory
	lda #$01
	ldx #<STRLBL19
	ldy #>STRLBL19
	jsr $FFBD
// fopen();
	jsr $FFC0
// fchkin(2);
	ldx #$02
	jsr $FFC6
	
// skip first 2 bytes
	jsr $FFCF
	jsr $FFCF
	
!top:
	lda filestatus
	cmp #$00
	beq !+
	jmp !bottom+ // jump to Bottom of Loop (CANNOT OPTIMIZE)
!:

// also skip 2 bytes of each
// line in the directory	
	jsr $FFCF
	jsr $FFCF
	
// get filestatus
	lda $90
	cmp #$00
	bne !+ // jump to ELSE

// read the low and high bytes
// of the line number
	jsr $FFCF
	sta lnL
	jsr $FFCF
	sta lnH
	sta _MUL16_FD

// put them together to form the
// actual line number
	lda #$00
	sta _MUL16_FE
	sta _MUL16_FB
	lda #$01
	sta _MUL16_FC
	jsr MUL16
	lda MUL16R
	
	clc 
	adc lnL
	sta ln

	lda MUL16R+1
	adc #$00
	sta ln+1
!:

// get filestatus
	lda $90
	cmp #$00
	bne !+++++ // jump to ELSE

// display the line #
	lda ln
	sta HTD_IN
	lda ln+1
	sta HTD_IN+1
	jsr WORD2DEC
	ldx #$00
!:	lda HTD_STR,X
	cmp #$30
	bne !+
	inx 
	jmp !-
!:	cpx #$06
	bne !+
	dex 
!:	lda HTD_STR,X
	cmp #$00
	beq !+
	inx 
	jsr $FFD2
	jmp !-
// display a space
!:	lda #$20
	jsr $FFD2
// read and display the
// zero-terminated line
	jsr readuntil0

// display a newline
!:	lda #$0D
	jsr $FFD2

// get the filestatus (again)
	lda $90
	sta filestatus
// get next line of directory
	jmp !top- // jump to top of WHILE loop
	
// fclrchn();
!bottom:jsr $FFCC
// read the error string
	jsr derror
// fclose(2);
	lda #$02
	jsr $FFC3
	rts

format2:
// for a command like this, filename
// should be "unset"... so set it with zeroes
	jsr clearfilename
// setlfs(15,8,15);
	lda #$0F
	ldx #$08
	ldy #$0F
	jsr $FFBA
// fopen();
	jsr $FFC0
// fchkout(15);
	ldx #$0F
	jsr $FFC9
// send the string to the device
	lda #<STRLBL20
	pha 
	lda #>STRLBL20
	pha 
	jsr writeuntil0
// fclrchn();
	jsr $FFCC
// read the error string
	jsr derror
// fclose(15);
	lda #$0F
	jsr $FFC3
	rts
	
format:
// setlfs(1,8,15);
	lda #$01
	ldx #$08
	ldy #$0F
	jsr $FFBA
// setfilename( ''NEW:BLANK DISK,60'' );
	lda #$11
	ldx #<STRLBL20
	ldy #>STRLBL20
	jsr $FFBD
// fopen();
	jsr $FFC0
// fclrchn();
	jsr $FFCC
// derror();
	jsr derror
// fclose(1);
	lda #$01
	jsr $FFC3
	rts


// Closes all open channels
closeall:
	ldx #$0F
!:	txa
	jsr $FFC3
	dex
	beq !-
	jsr $FFCC
	rts

	
writeuntil0:
	pla 
	tax 
	pla 
	tay 
	pla 
	sta writeuntil0ARG0+1
	pla 
	sta writeuntil0ARG0
	tya 
	pha 
	txa 
	pha 
	ldy #$00
	lda writeuntil0ARG0
	ldx writeuntil0ARG0+1
	sta !+
	stx !++
	.byte $AD
!:      .byte $00
!:      .byte $00
	sta general8bit

!:	cmp #$00
	beq !+++ // if z==1 jump out of Loop
	
	lda general8bit
	jsr $FFD2
	
	lda #$01
	clc 
	adc writeuntil0ARG0
	sta writeuntil0ARG0
	lda #$00
	adc writeuntil0ARG0+1
	sta writeuntil0ARG0+1
	
	ldy #$00
	lda writeuntil0ARG0
	ldx writeuntil0ARG0+1
	
	sta !+
	stx !++
	.byte $AD
!:      .byte $00
!:      .byte $00
	sta general8bit
	jmp !--- // jump to top of loop
!:	rts 

readuntil0:
	jsr $FFCF
	sta general8bit
	
	lda $90
	sta filestatus
!:	lda filestatus
	cmp #$00
	bne !+ // jump to ELSE

	lda general8bit
	jsr $FFD2
	jsr $FFCF
	sta general8bit
	ldx $90
	stx filestatus
	cmp #$00
	bne !- // jump to ELSE

	lda #$01
	sta filestatus
	jmp !- // jump to top of loop
!:	rts
	
validate:
// setlfs( 1, 8, 15 );
	lda #$01
	ldx #$08
	ldy #$0F
	jsr $FFBA
// setfilename( ''V0'' );
	lda #$02
	ldx #<STRLBL21
	ldy #>STRLBL21
	jsr $FFBD
// fopen();
	jsr $FFC0
// fclrchn();
	jsr $FFCC
// derror();
	jsr derror
// fclose(1);
	lda #$01
	jsr $FFC3
	rts 


getuserinput:
// zero out keyboard buffer
	lda #$00
	sta $C6
	sta userinput
// call getchar() repeatedly until
// it returns something other than 0
!:	lda userinput
	cmp #$00
	bne !+
	jsr $FFE4
	sta userinput
	jmp !-
!:	rts 


menu:
	// this is just a basic menu
	// it's not efficient at all
	lda menu0
	sta $02
	lda menu0+1
	sta $03
	jsr PRN
	lda menu1
	sta $02
	lda menu1+1
	sta $03
	jsr PRN
	lda menu2
	sta $02
	lda menu2+1
	sta $03
	jsr PRN
	lda menu3
	sta $02
	lda menu3+1
	sta $03
	jsr PRN
	lda menu4
	sta $02
	lda menu4+1
	sta $03
	jsr PRN
	lda menu5
	sta $02
	lda menu5+1
	sta $03
	jsr PRN
	lda menu6
	sta $02
	lda menu6+1
	sta $03
	jsr PRN
	lda menu7
	sta $02
	lda menu7+1
	sta $03
	jsr PRN
	lda menu8
	sta $02
	lda menu8+1
	sta $03
	jsr PRN
	lda menu9
	sta $02
	lda menu9+1
	sta $03
	jsr PRN
	lda menuQ
	sta $02
	lda menuQ+1
	sta $03
	jsr PRN
	rts 
HTD_STR:
	.byte $00, $00, $00, $00, $00, $00, $00
// ------------------------------------------------------------
// This chunk of code is by: Andrew Jacobs, 28-Feb-2004
// Taken from: http://6502.org/source/integers/hex2dec-more.htm
// ------------------------------------------------------------
HTD_IN:
	.byte $00, $00
HTD_OUT:
	.byte $00, $00, $00
WORD2DEC:		 // 2 Byte Word to Decimal
	pla 
	jsr PUSH
	pla 
	jsr PUSH
	sed 
	lda #$00
	sta HTD_OUT
	sta HTD_OUT+1
	sta HTD_OUT+2
	ldx #$10
CNVBIT:
	asl HTD_IN
	rol HTD_IN+1
	lda HTD_OUT
	adc HTD_OUT
	sta HTD_OUT
	lda HTD_OUT+1
	adc HTD_OUT+1
	sta HTD_OUT+1
	lda HTD_OUT+2
	adc HTD_OUT+2
	sta HTD_OUT+2
	dex 
	bne CNVBIT
	cld 
// ------------------------------------------------------------
	lda HTD_OUT
	pha 
	lsr 
	lsr 
	lsr 
	lsr 
	ora #$30
	sta HTD_STR+4
	pla 
	and #$0F
	ora #$30
	sta HTD_STR+5
	lda HTD_OUT+1
	pha 
	lsr 
	lsr 
	lsr 
	lsr 
	ora #$30
	sta HTD_STR+2
	pla 
	and #$0F
	ora #$30
	sta HTD_STR+3
	lda HTD_OUT+2
	pha 
	lsr 
	lsr 
	lsr 
	lsr 
	ora #$30
	sta HTD_STR
	pla 
	and #$0F
	ora #$30
	sta HTD_STR+1
	jsr POP
	pha 
	jsr POP
	pha 
	rts 
!:
_MUL16_FB:
	.byte $00
!:
_MUL16_FC:
	.byte $00
!:
_MUL16_FD:
	.byte $00
!:
_MUL16_FE:
	.byte $00
MUL16R:
	.byte $00, $00, $00, $00
MUL16:
	lda #$00
	sta MUL16R
	sta MUL16R+1
	sta MUL16R+2
	sta MUL16R+3
	ldx #$10
!:	lsr !--
	ror !---
	bcc !+
	tay 
	clc 
	lda !-----
	adc MUL16R+2
	sta MUL16R+2
	tya 
	adc !----
!:	ror 
	ror MUL16R+2
	ror MUL16R+1
	ror MUL16R
	dex 
	bne !--
	sta MUL16R+3
	rts 
BYTE2HEX:		 // Display a Hexadecimal Byte
	pla 
	jsr PUSH
	pla 
	jsr PUSH
	cld 
	pla 
	tax 
// 	and #$F0
// 	lsr 
	alr #$F0 // Undocumented Opcode (replaces the two lines above)
	lsr 
	lsr 
	lsr 
	cmp #$0A
	bcc !+
	clc 
	adc #$07
!:	adc #$30
	jsr $FFD2
// 	txa 
// 	and #$0F
	xaa #$0F // Undocumented Opcode (replaces the two lines above)
	cmp #$0A
	bcc !+
	clc 
	adc #$07
!:	adc #$30
	jsr $FFD2
	jsr POP
	pha 
	jsr POP
	pha 
	rts 
PRN:
	ldy #$00
!:	lda ($02),Y
	beq !+
	jsr $FFD2
	iny 
	jmp !-
!:	rts 

// software stack
!:	.byte $00
!:	.byte $00
PUSH:
	stx !-
	ldx !--
	inx 
	sta $CF00,X
	stx !--
	ldx !-
	rts 
POP:
	stx !-
	ldx !--
	lda $CF00,X
	dex 
	stx !--
	ldx !-
	rts 
 // ; $102c			"R0:HAROLD=MYFILE"
STRLBL0:
	.byte  $52, $30, $3A, $48, $41, $52, $4F, $4C, $44, $3D, $4D, $59, $46, $49, $4C, $45, $00
 // ; $103d			"C0:MAUDE=HAROLD"
STRLBL1:
	.byte  $43, $30, $3A, $4D, $41, $55, $44, $45, $3D, $48, $41, $52, $4F, $4C, $44, $00
 // ; $104d			"S0:MYFILE"
STRLBL2:
	.byte  $53, $30, $3A, $4D, $59, $46, $49, $4C, $45, $00
 // ; $1057			"S0:HAROLD"
STRLBL3:
	.byte  $53, $30, $3A, $48, $41, $52, $4F, $4C, $44, $00
 // ; $1061			"THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG."
STRLBL4:
	.byte  $54, $48, $45, $20, $51, $55, $49, $43, $4B, $20, $42, $52, $4F, $57, $4E, $20, $46, $4F, $58, $20, $4A, $55, $4D, $50, $53, $20, $4F, $56, $45, $52, $20, $54, $48, $45, $20, $4C, $41, $5A, $59, $20, $44, $4F, $47, $2E, $00
 // ; $108e			"1) CREATE FILE      (MYFILE)\n"
STRLBL5:
	.byte  $31, $29, $20, $43, $52, $45, $41, $54, $45, $20, $46, $49, $4C, $45, $20, $20, $20, $20, $20, $20, $28, $4D, $59, $46, $49, $4C, $45, $29, $0D, $00
 // ; $10ac			"2) DELETE FILES     (MYFILE & HAROLD)\n"
STRLBL6:
	.byte  $32, $29, $20, $44, $45, $4C, $45, $54, $45, $20, $46, $49, $4C, $45, $53, $20, $20, $20, $20, $20, $28, $4D, $59, $46, $49, $4C, $45, $20, $26, $20, $48, $41, $52, $4F, $4C, $44, $29, $0D, $00
 // ; $10d3			"3) DISPLAY FILE     (MYFILE)\n"
STRLBL7:
	.byte  $33, $29, $20, $44, $49, $53, $50, $4C, $41, $59, $20, $46, $49, $4C, $45, $20, $20, $20, $20, $20, $28, $4D, $59, $46, $49, $4C, $45, $29, $0D, $00
 // ; $10f1			"4) COPY FILE        (HAROLD -> MAUDE)\n"
STRLBL8:
	.byte  $34, $29, $20, $43, $4F, $50, $59, $20, $46, $49, $4C, $45, $20, $20, $20, $20, $20, $20, $20, $20, $28, $48, $41, $52, $4F, $4C, $44, $20, $2D, $3E, $20, $4D, $41, $55, $44, $45, $29, $0D, $00
 // ; $1118			"5) RENAME FILE      (MYFILE -> HAROLD)\n"
STRLBL9:
	.byte  $35, $29, $20, $52, $45, $4E, $41, $4D, $45, $20, $46, $49, $4C, $45, $20, $20, $20, $20, $20, $20, $28, $4D, $59, $46, $49, $4C, $45, $20, $2D, $3E, $20, $48, $41, $52, $4F, $4C, $44, $29, $0D, $00
 // ; $1140			"6) VALIDATE DISK\n"
STRLBL10:
	.byte  $36, $29, $20, $56, $41, $4C, $49, $44, $41, $54, $45, $20, $44, $49, $53, $4B, $0D, $00
 // ; $1152			"7) READ DISK STATUS\n"
STRLBL11:
	.byte  $37, $29, $20, $52, $45, $41, $44, $20, $44, $49, $53, $4B, $20, $53, $54, $41, $54, $55, $53, $0D, $00
 // ; $1167			"8) FORMAT DISK\n"
STRLBL12:
	.byte  $38, $29, $20, $46, $4F, $52, $4D, $41, $54, $20, $44, $49, $53, $4B, $0D, $00
 // ; $1177			"9) DISPLAY DIRECTORY\n"
STRLBL13:
	.byte  $39, $29, $20, $44, $49, $53, $50, $4C, $41, $59, $20, $44, $49, $52, $45, $43, $54, $4F, $52, $59, $0D, $00
 // ; $118d			"0) INITIALISE DRIVE\n"
STRLBL14:
	.byte  $30, $29, $20, $49, $4E, $49, $54, $49, $41, $4C, $49, $53, $45, $20, $44, $52, $49, $56, $45, $0D, $00
 // ; $11a2			"Q) EXIT\n"
STRLBL15:
	.byte  $51, $29, $20, $45, $58, $49, $54, $0D, $00
 // ; $11ab			"MYFILE"
STRLBL16:
	.byte  $4D, $59, $46, $49, $4C, $45, $00
 // ; $11b2			"I0"
STRLBL17:
	.byte  $49, $30, $00
 // ; $11b5			"0:MYFILE,S,W"
STRLBL18:
	.byte  $30, $3A, $4D, $59, $46, $49, $4C, $45, $2C, $53, $2C, $57, $00
 // ; $11c2			"$"
STRLBL19:
	.byte  $24, $00
 // ; $11c4			"NEW:BLANK DISK,60"
STRLBL20:
	.byte  $4E, $45, $57, $3A, $42, $4C, $41, $4E, $4B, $20, $44, $49, $53, $4B, $2C, $36, $30, $00
 // ; $11d6			"V0"
STRLBL21:
	.byte  $56, $30, $00
