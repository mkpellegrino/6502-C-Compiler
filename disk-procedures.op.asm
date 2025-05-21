 //  Variable Labels
.label general8bit = $2000
.label userinput = $2001
.label filestatus = $2002
.label renameText = $2003
.label copyText = $2005
.label deleteText0 = $2007
.label deleteText1 = $2009
.label text0 = $200B
.label menu0 = $200D
.label menu1 = $200F
.label menu2 = $2011
.label menu3 = $2013
.label menu4 = $2015
.label menu5 = $2017
.label menu6 = $2019
.label menu7 = $201B
.label menu8 = $201D
.label menu9 = $201F
.label menuQ = $2021
.label writeaddr = $2023
.label bytesread = $2025
.label b = $2026
.label lnL = $2027
.label lnH = $2028
.label ln = $2029
.label writeuntil0ARG0 = $202C
.label keepreading = $202E
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

LBL1L1:			 // Top of WHILE Loop
	lda userinput
	cmp #$51
	beq LBL1L3 // if z==1 jump to ELSE

        // Top of IF statement
	lda userinput
	cmp #$30
	bne LBL2L3 // jump to ELSE
	jsr initdrive
LBL2L3:
	 // Top of IF statement
	//lda userinput
	cmp #$31
	bne LBL2L8 // jump to ELSE
	jsr createfile
LBL2L8:
	// Top of IF statement
	//lda userinput
	cmp #$32
	bne LBL2L13 // jump to ELSE
	jsr deletefile
LBL2L13:
	// Top of IF statement
	//lda userinput
	cmp #$33
	bne LBL2L18 // jump to ELSE
	jsr displayfile
LBL2L18:
	 // Top of IF statement
	//lda userinput
	cmp #$34
	bne LBL2L23 // jump to ELSE
	jsr copyfile
LBL2L23:
	 // Top of IF statement
	//lda userinput
	cmp #$35
	bne LBL2L28 // jump to ELSE
	jsr renamefile
LBL2L28:
	// Top of IF statement
	//lda userinput
	cmp #$36
	bne LBL2L33 // jump to ELSE
	jsr validate
LBL2L33:
	 // Top of IF statement
	//lda userinput
	cmp #$37
	bne LBL2L38 // jump to ELSE (OPTIMIZE)
	jsr derror
LBL2L38:
	 // Top of IF statement
	//lda userinput
	cmp #$38
	bne LBL2L43 // jump to ELSE
	jsr format
LBL2L43:
	 // Top of IF statement
	//lda userinput
	cmp #$39
	bne LBL2L48 // jump to ELSE
	jsr directory
LBL2L48:
	jsr closeall
	jsr menu
	jsr getuserinput

	lda #$0D
	jsr $FFD2
	lda #$0D
	jsr $FFD2

	jmp LBL1L1 // jump to top of WHILE loop
LBL1L3:
	rts


	
displayfile:
// setfilename( ''MYFILE,S,R'' );
	lda #$0A
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
	lda $90
	sta filestatus

LBL1L5:			 // Top of WHILE Loop
	lda filestatus
	cmp #$00
	bne LBL1L7 // jump out of WHILE Loop
	jsr $FFCF
	jsr $FFD2
	lda $90
	sta filestatus
	jmp LBL1L5 // jump to top of WHILE loop

LBL1L7:
	lda #$0D
	jsr $FFD2
// fclrchn();
	jsr $FFCC
// read the error string
	jsr derror
// fclose(1);
	lda #$01
	jsr $FFC3
	rts 


initdrive:
// Set Filename
	lda #$02
	ldx #<STRLBL17
	ldy #>STRLBL17
	jsr $FFBD
// Set Logical File System
	lda #$01
	ldx #$08
	ldy #$0F
	jsr $FFBA
// fopen
	jsr $FFC0
// fclrchn
	jsr $FFCC
	jsr derror
// fclose
	lda #$01
	jsr $FFC3
	rts

	
copyfile:
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

	lda copyText
	pha 
	lda copyText+1
	pha	
	jsr writeuntil0
	
// fclrchn
	jsr $FFCC
	jsr derror
// fclose
	lda #$0F
	jsr $FFC3
// fclrchn
	jsr $FFCC
	rts 

renamefile:
// setlfs(15,8,15);
// Set Logical File System
	lda #$0F
	ldx #$08
	ldy #$0F
	jsr $FFBA
// fopen()
// fopen
	jsr $FFC0
// fchkout(15);
// fchkout
	ldx #$0F
	jsr $FFC9
// send the string to the device
	lda renameText
	pha 
	lda renameText+1
	pha 
	jsr writeuntil0
// fclrchn();
// fclrchn
	jsr $FFCC
// read the error string
	jsr derror
// fclose(15);
	lda #$0F
	jsr $FFC3
	rts

	
deletefile:
// setlfs(15,8,15);
	lda #$0F
	ldx #$08
	ldy #$0F
	jsr $FFBA
// fopen()
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
// do it again with
// the other string
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
	rts
	
createfile:
// setfilename( ''0:MYFILE,S,W'' );
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
	lda text0 // text0
	ldx text0+1
	sta writeaddr
	stx writeaddr+1
	ldy #$00
	//lda writeaddr
	//ldx writeaddr+1
	sta !+
	stx !++
	.byte $AD
!:
	.byte $00
!:
	.byte $00
	sta general8bit

LBL1L9:			 // Top of WHILE Loop
	lda general8bit
	cmp #$00
	beq LBL1L11 // if z==1 jump to ELSE
// fchrout
	lda $2000
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
!:
	.byte $00
!:
	.byte $00
	sta general8bit
	jmp LBL1L9 // jump to top of WHILE loop
LBL1L11:
// fclrchn();
	jsr $FFCC
// read the error string
	jsr derror
// fclose(1);
	lda #$01
	jsr $FFC3
	rts 


derror:
	lda #$00
	sta $90

	lda #$08
	sta $BA
	jsr $FFB4

	lda #$6F
	sta $B9
	jsr $FF96
!:
	ldy $90
	bne !+
	jsr $FFA5
	jsr $FFD2
	cmp #$0D
	bne !-
!:
	jsr $FFAB
	lda #$0D
	jsr $FFD2
	rts

	
directory:
// Set Logical File System
	lda #$02
	ldx #$08
	ldy #$00
	jsr $FFBA
// Set Filename
	lda #$01
	ldx #<STRLBL19
	ldy #>STRLBL19
	jsr $FFBD
// fopen
	jsr $FFC0
// fchkin
	ldx #$02
	jsr $FFC6
	lda #$00
	sta bytesread
	lda #$00
	sta filestatus
	// skip 2 bytes
	jsr $FFCF
	jsr $FFCF

	//lda $02
	//pha 
	//lda $03
	//pha 
	//php
	
LBL1L13:			 // Top of WHILE Loop
	lda filestatus
	cmp #$00
	beq LBL1L14
	jmp LBL1L15 // jump to ELSE (OPTIMIZE)
LBL1L14:
	// skip 2 more bytes
	jsr $FFCF
	jsr $FFCF
	
	lda $90
	sta filestatus

	
	//lda $02
	//pha 
	//lda $03
	//pha 
	//php


	
	 // Top of IF statement
	lda filestatus
	cmp #$00
	bne LBL2L53 // jump to ELSE
	jsr $FFCF
	sta lnL
	jsr $FFCF
	sta lnH

	//lda lnH
	sta _MUL16_FD
	lda #$00
	sta _MUL16_FE
	sta _MUL16_FB
	lda #$01
	sta _MUL16_FC
	jsr MUL16
	lda MUL16R
	ldx MUL16R+1
	
	clc 
	adc lnL
	sta ln
	txa 
	adc #$00
	sta ln+1
LBL2L53:
	lda $90
	sta filestatus
	 // Top of IF statement
	//lda filestatus
	cmp #$00
	bne LBL2L58 // jump to ELSE

	lda ln
	sta HTD_IN
	lda ln+1
	sta HTD_IN+1
	jsr WORD2DEC
	ldx #$00
LBL3L0:
	lda HTD_STR,X
	cmp #$30
	bne !+
	inx 
	jmp LBL3L0
!:
	cpx #$06
	bne !+
	dex 
!:
LBL3L1:
	lda HTD_STR,X
	cmp #$00
	beq !+
	inx 
	jsr $FFD2
	jmp LBL3L1
!:
	lda #$20
	jsr $FFD2
	jsr readuntil0
LBL2L58:

	
	//plp 
	//pla 
	//sta $03
	//pla 
	//sta $02


	lda #$0D
	jsr $FFD2

	lda $90
	sta filestatus
	jmp LBL1L13 // jump to top of WHILE loop
LBL1L15:
// Restore status register
	//plp 
	//pla 
	//sta $03
	//pla 
	//sta $02
// fclrchn
	jsr $FFCC
	jsr derror
// fclose
	lda #$02
	jsr $FFC3
	rts 

format:
// Set Logical File System
	lda #$01
	ldx #$08
	ldy #$0F
	jsr $FFBA
// Set Filename
	lda #$11
	ldx #<STRLBL20
	ldy #>STRLBL20
	jsr $FFBD
// fopen
	jsr $FFC0
// fclrchn
	jsr $FFCC
	jsr derror
// fclose
	lda #$01
	jsr $FFC3
	rts

	
closeall:
	ldx #$0F
!:
	txa
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
!:
	.byte $00
!:
	.byte $00
	sta general8bit
 
LBL1L17:			 // Top of WHILE Loop
	lda general8bit
	cmp #$00
	beq LBL1L19 // if z==1 jump to ELSE (OPTIMIZE)
// fchrout
	lda $2000
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
!:
	.byte $00
!:
	.byte $00
	sta general8bit
	jmp LBL1L17 // jump to top of WHILE loop
LBL1L19:
	rts

	
readuntil0:
	lda #$01
	sta keepreading
	lda $90
	sta filestatus
	lda #$00
	sta general8bit

	//lda $02
	//pha 
	//lda $03
	//pha 
	//php 
LBL1L21:			 // Top of WHILE Loop
	lda keepreading
	cmp #$01
	bne LBL1L23 // jump to ELSE
	jsr $FFCF
	sta general8bit
	lda $90
	sta filestatus
	 // Top of IF statement
	lda filestatus
	cmp #$00
	bne LBL2L63 // branch to body of IF
	 // Top of IF statement
	lda general8bit
	cmp #$00
	bne LBL2L64 // jump to ELSE
LBL2L63:
	dec keepreading
	jmp LBL2L65
LBL2L64:
	lda general8bit
	jsr $FFD2
LBL2L65:
	jmp LBL1L21 // jump to top of WHILE loop
LBL1L23:
// Restore status register
	//plp 
	//pla 
	//sta $03
	//pla 
	//sta $02
	rts 


validate:
// Set Logical File System
	lda #$01
	ldx #$08
	ldy #$0F
	jsr $FFBA
// Set Filename
	lda #$02
	ldx #<STRLBL21
	ldy #>STRLBL21
	jsr $FFBD
// fopen
	jsr $FFC0
// fclrchn
	jsr $FFCC
	jsr derror
// fclose
	lda #$01
	jsr $FFC3
	rts

	
getuserinput:
	lda #$00
	sta $C6
	lda #$00
	sta userinput
LBL1L25:			 // Top of WHILE Loop
	lda userinput
	cmp #$00
	bne LBL1L27 // jump to ELSE (OPTIMIZE)
	jsr $FFE4
	sta userinput
	jmp LBL1L25 // jump to top of WHILE loop
LBL1L27:
	rts 

menu:
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
!:
	lsr !--
	ror !---
	bcc !+
	tay 
	clc 
	lda !-----
	adc MUL16R+2
	sta MUL16R+2
	tya 
	adc !----
!:
	ror 
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
!:
	adc #$30
	jsr $FFD2
// 	txa 
// 	and #$0F
	xaa #$0F // Undocumented Opcode (replaces the two lines above)
	cmp #$0A
	bcc !+
	clc 
	adc #$07
!:
	adc #$30
	jsr $FFD2
	jsr POP
	pha 
	jsr POP
	pha 
	rts 
PRN:
	ldy #$00
!:
	lda ($02),Y
	beq !+
	jsr $FFD2
	iny 
	jmp !-
!:
	rts 
!:
	.byte $00
!:
	.byte $00
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
 // ; $101c			"R0:HAROLD=MYFILE"
STRLBL0:
	.byte  $52, $30, $3A, $48, $41, $52, $4F, $4C, $44, $3D, $4D, $59, $46, $49, $4C, $45, $00
 // ; $102d			"C0:MAUDE=HAROLD"
STRLBL1:
	.byte  $43, $30, $3A, $4D, $41, $55, $44, $45, $3D, $48, $41, $52, $4F, $4C, $44, $00
 // ; $103d			"S0:MYFILE"
STRLBL2:
	.byte  $53, $30, $3A, $4D, $59, $46, $49, $4C, $45, $00
 // ; $1047			"S0:HAROLD"
STRLBL3:
	.byte  $53, $30, $3A, $48, $41, $52, $4F, $4C, $44, $00
 // ; $1051			"THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG."
STRLBL4:
	.byte  $54, $48, $45, $20, $51, $55, $49, $43, $4B, $20, $42, $52, $4F, $57, $4E, $20, $46, $4F, $58, $20, $4A, $55, $4D, $50, $53, $20, $4F, $56, $45, $52, $20, $54, $48, $45, $20, $4C, $41, $5A, $59, $20, $44, $4F, $47, $2E, $00
 // ; $107e			"1) CREATE FILE (MYFILE)\n"
STRLBL5:
	.byte  $31, $29, $20, $43, $52, $45, $41, $54, $45, $20, $46, $49, $4C, $45, $20, $28, $4D, $59, $46, $49, $4C, $45, $29, $0D, $00
 // ; $1097			"2) DELETE FILES (MYFILE & HAROLD)\n"
STRLBL6:
	.byte  $32, $29, $20, $44, $45, $4C, $45, $54, $45, $20, $46, $49, $4C, $45, $53, $20, $28, $4D, $59, $46, $49, $4C, $45, $20, $26, $20, $48, $41, $52, $4F, $4C, $44, $29, $0D, $00
 // ; $10ba			"3) DISPLAY FILE (MYFILE)\n"
STRLBL7:
	.byte  $33, $29, $20, $44, $49, $53, $50, $4C, $41, $59, $20, $46, $49, $4C, $45, $20, $28, $4D, $59, $46, $49, $4C, $45, $29, $0D, $00
 // ; $10d4			"4) COPY FILE (HAROLD -> MAUDE)\n"
STRLBL8:
	.byte  $34, $29, $20, $43, $4F, $50, $59, $20, $46, $49, $4C, $45, $20, $28, $48, $41, $52, $4F, $4C, $44, $20, $2D, $3E, $20, $4D, $41, $55, $44, $45, $29, $0D, $00
 // ; $10f4			"5) RENAME FILE (MYFILE -> HAROLD)\n"
STRLBL9:
	.byte  $35, $29, $20, $52, $45, $4E, $41, $4D, $45, $20, $46, $49, $4C, $45, $20, $28, $4D, $59, $46, $49, $4C, $45, $20, $2D, $3E, $20, $48, $41, $52, $4F, $4C, $44, $29, $0D, $00
 // ; $1117			"6) VALIDATE DISK\n"
STRLBL10:
	.byte  $36, $29, $20, $56, $41, $4C, $49, $44, $41, $54, $45, $20, $44, $49, $53, $4B, $0D, $00
 // ; $1129			"7) READ DISK STATUS\n"
STRLBL11:
	.byte  $37, $29, $20, $52, $45, $41, $44, $20, $44, $49, $53, $4B, $20, $53, $54, $41, $54, $55, $53, $0D, $00
 // ; $113e			"8) FORMAT DISK\n"
STRLBL12:
	.byte  $38, $29, $20, $46, $4F, $52, $4D, $41, $54, $20, $44, $49, $53, $4B, $0D, $00
 // ; $114e			"9) DISPLAY DIRECTORY\n"
STRLBL13:
	.byte  $39, $29, $20, $44, $49, $53, $50, $4C, $41, $59, $20, $44, $49, $52, $45, $43, $54, $4F, $52, $59, $0D, $00
 // ; $1164			"0) INITIALISE DRIVE\n"
STRLBL14:
	.byte  $30, $29, $20, $49, $4E, $49, $54, $49, $41, $4C, $49, $53, $45, $20, $44, $52, $49, $56, $45, $0D, $00
 // ; $1179			"Q) EXIT\n"
STRLBL15:
	.byte  $51, $29, $20, $45, $58, $49, $54, $0D, $00
 // ; $1182			"MYFILE,S,R"
STRLBL16:
	.byte  $4D, $59, $46, $49, $4C, $45, $2C, $53, $2C, $52, $00
 // ; $118d			"I0"
STRLBL17:
	.byte  $49, $30, $00
 // ; $1190			"0:MYFILE,S,W"
STRLBL18:
	.byte  $30, $3A, $4D, $59, $46, $49, $4C, $45, $2C, $53, $2C, $57, $00
 // ; $119d			"$"
STRLBL19:
	.byte  $24, $00
 // ; $119f			"NEW:BLANK DISK,60"
STRLBL20:
	.byte  $4E, $45, $57, $3A, $42, $4C, $41, $4E, $4B, $20, $44, $49, $53, $4B, $2C, $36, $30, $00
 // ; $11b1			"V0"
STRLBL21:
	.byte  $56, $30, $00
