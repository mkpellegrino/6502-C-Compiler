 //  Variable Labels
.label characterset = $5208
.label HWtext = $520A
.label HWtext2 = $520C
.label Text3 = $520E
.label Text4 = $5210
.label bmpaddr = $5212
.label bmpaddrX = $5214
.label scraddr = $5216
.label scraddrX = $5218
.label k = $521A
.label j = $521B
.label i = $521C
* = $0801
BasicUpstart($0834)
* = $0834
	jsr saveregs
	lda #<LBL1L0
	sta characterset
	lda #>LBL1L0
	sta characterset+1
	lda #<STRLBL0
	sta HWtext
	lda #>STRLBL0
	sta HWtext+1
	lda #<STRLBL1
	sta HWtext2
	lda #>STRLBL1
	sta HWtext2+1
	lda #<STRLBL2
	sta Text3
	lda #>STRLBL2
	sta Text3+1
	lda #<STRLBL3
	sta Text4
	lda #>STRLBL3
	sta Text4+1
	lda #$03
	ora $DD02
	sta $DD02
	
	lda #$01
	sta $02
	lda $DD00
	and #$FC
	ora $02
	sta $DD00
	
	lda #$BF  // clear bit 6
	and $D011
	sta $02
	lda #$20  // set bit 5
	ora $02
	sta $D011
	
	lda #$10 // set bit 4
	ora $D016
	sta $D016

	
	lda #$18
	sta $D018
	
	sei
	lda $01
	and #$F8
	ora #$06
	sta $01
	cli
	
	lda $D018
	and #$08
	asl 
	asl 
	sta $FF
	
	lda $DD00
	eor #$FF
	and #$03
	asl 
	asl 
	asl 
	asl 
	asl 
	asl 
	adc $FF
	sta bmpaddr+1
	lda #$00
	sta bmpaddr

	clc 
	adc #$F8
	sta bmpaddrX
	lda bmpaddr+1
	adc #$1F
	sta bmpaddrX+1
	lda #$00
	sta $03

	lda $D018
	and #$F0
	lsr 
	lsr 

	clc 
	adc $03
	sta $03
	
	lda $DD00
	eor #$FF
	and #$03
	asl 
	asl 
	asl 
	asl 
	asl 
	asl 

	adc $03
	sta scraddr+1
	lda #$00
	sta scraddr

	clc 
	adc #$EF
	sta scraddrX
	lda scraddr+1
	adc #$03
	sta scraddrX+1

	lda #$D8
	pha 
	lda #$06
	pha 
	lda #$04
	pha 
	jsr fillmem
	lda #$84
	pha 
	lda #$7D
	pha 
	lda #$04
	pha 
	jsr fillmem
	lda #$A0
	pha 
	lda #$20
	pha 
	jsr clearmem
	lda #$A0
	pha 
	lda #$84
	pha 
	lda characterset
	pha 
	lda characterset+1
	pha 
	jsr bmPrintInit
LBL1L1:
	lda #$00
	sta k
LBL1L2:			 // Top of FOR Loop
	lda k
	cmp #$0A
	bcs LBL1L5 // jump out of FOR
LBL1L3:
LBL1L4:
LBL2L0:
	lda #$00
	sta j
LBL2L1:			 // Top of FOR Loop
	lda j
	cmp #$19
	bcs LBL2L4 // jump out of FOR
LBL2L2:
LBL2L3:
LBL3L0:
	lda #$00
	sta i
LBL3L1:			 // Top of FOR Loop
	lda i
	cmp #$28
	bcs LBL3L4 // jump out of FOR
LBL3L2:
LBL3L3:
	lda i
	pha 
	lda j
	pha 
	lda Text3
	pha 
	lda Text3+1
	pha 
	lda #$00
	pha 

	lda #$FF
	sta $D40E
	sta $D40F
	lda #$80
	sta $D412

	lda $D41B
	pha 
	jsr bmPrint
	clc 
	lda i
	adc #$01
	pha 
	lda j
	pha 
	lda Text4
	pha 
	lda Text4+1
	pha 
	lda #$00
	pha 
	lda $D41B
	pha 
	jsr bmPrint
	inc i
	inc i
	jmp LBL3L1

LBL3L4:
	inc j
	jmp LBL2L1

LBL2L4:
	jsr pause
	inc k
	jmp LBL1L2
LBL1L5:
	lda #$A0
	pha 
	lda #$20
	pha 
	jsr clearmem
	lda #$00
	pha 
	lda #$00
	pha 
	lda HWtext
	pha 
	lda HWtext+1
	pha 
	lda #$00
	pha 
	lda #$12
	pha 
	jsr bmPrint
	lda #$00
	pha 
	lda #$01
	pha 
	lda HWtext2
	pha 
	lda HWtext2+1
	pha 
	lda #$01
	pha 
	lda #$02
	pha 
	jsr bmPrint
	jsr pause
	sei 
	lda #$37 // Default Value
	sta $01
	cli 
	lda #$03
	ora $DD02
	sta $DD02
	lda $02
	pha 
	lda #$03
	sta $02
	lda $DD00
	and #$FC
	ora $02
	sta $DD00
	pla 
	sta $02
	jsr restoreregs
	rts 

 // ; $aa7			"HELLO WORLD!  HELLO WORLD!  HELLO WORLD!"
STRLBL0:
	.byte  $48, $45, $4C, $4C, $4F, $20, $57, $4F, $52, $4C, $44, $21, $20, $20, $48, $45, $4C, $4C, $4F, $20, $57, $4F, $52, $4C, $44, $21, $20, $20, $48, $45, $4C, $4C, $4F, $20, $57, $4F, $52, $4C, $44, $21, $00
 // ; $ad0			"01234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ/^%"
STRLBL1:
	.byte  $30, $31, $32, $33, $34, $35, $36, $37, $38, $39, $30, $41, $42, $43, $44, $45, $46, $47, $48, $49, $4A, $4B, $4C, $4D, $4E, $4F, $50, $51, $52, $53, $54, $55, $56, $57, $58, $59, $5A, $2F, $5E, $25, $00
 // ; $af9			"["
STRLBL2:
	.byte  $5B, $00
 // ; $afb			"]"
STRLBL3:
	.byte  $5D, $00
LBL1L0: .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $30, $30, $30, $30, $00, $30, $30, $00, $CC, $CC, $00, $00, $00, $00, $00, $00, $3C, $30, $30, $FC, $30, $33, $FF, $00, $00, $00, $00, $00, $00, $00, $00, $00, $30, $F0, $F0, $30, $3C, $3C, $30, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0C, $30, $30, $30, $30, $30, $30, $0C, $C0, $30, $30, $30, $30, $30, $30, $C0, $FF, $FF, $C0, $C0, $D5, $D5, $EA, $EA, $FF, $FF, $00, $00, $55, $55, $AA, $AA, $00, $00, $00, $00, $00, $00, $30, $C0, $00, $00, $00, $3C, $3C, $00, $00, $00, $00, $00, $00, $00, $00, $00, $C0, $C0, $03, $03, $0C, $0C, $30, $30, $C0, $C0, $00, $30, $CC, $CC, $CC, $CC, $CC, $30, $00, $30, $30, $30, $30, $30, $30, $30, $00, $30, $CC, $0C, $30, $C0, $C0, $FC, $00, $30, $CC, $0C, $30, $0C, $CC, $30, $00, $0C, $CC, $CC, $FC, $0C, $0C, $0C, $00, $FC, $C0, $F0, $0C, $0C, $CC, $30, $00, $30, $CC, $C0, $F0, $CC, $CC, $30, $00, $FC, $0C, $0C, $30, $30, $30, $30, $00, $30, $CC, $CC, $30, $CC, $CC, $30, $00, $FC, $CC, $CC, $FC, $0C, $0C, $0C, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $3C, $00, $3C, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $30, $FC, $CC, $FC, $CC, $CC, $CC, $00, $F0, $CC, $CC, $F0, $CC, $CC, $F0, $00, $30, $CC, $C0, $C0, $C0, $CC, $30, $00, $F0, $CC, $CC, $CC, $CC, $CC, $F0, $00, $FC, $C0, $C0, $F0, $C0, $C0, $FC, $00, $FC, $C0, $C0, $F0, $C0, $C0, $C0, $00, $30, $CC, $C0, $FC, $CC, $CC, $30, $00, $CC, $CC, $CC, $FC, $CC, $CC, $CC, $00, $FC, $30, $30, $30, $30, $30, $FC, $00, $FC, $0C, $0C, $0C, $CC, $CC, $30, $00, $CC, $CC, $CC, $F0, $CC, $CC, $CC, $00, $C0, $C0, $C0, $C0, $C0, $C0, $FC, $00, $CC, $FC, $FC, $CC, $CC, $CC, $CC, $00, $00, $00, $C0, $FC, $CC, $CC, $CC, $00, $FC, $CC, $CC, $CC, $CC, $CC, $FC, $00, $F0, $CC, $CC, $F0, $C0, $C0, $C0, $00, $30, $CC, $CC, $CC, $CC, $F0, $3C, $00, $F0, $CC, $CC, $F0, $CC, $CC, $CC, $00, $30, $CC, $C0, $30, $0C, $CC, $30, $00, $FC, $30, $30, $30, $30, $30, $30, $00, $CC, $CC, $CC, $CC, $CC, $CC, $FC, $00, $CC, $CC, $CC, $CC, $30, $30, $30, $00, $CC, $CC, $CC, $FC, $FC, $FC, $CC, $00, $CC, $CC, $CC, $30, $CC, $CC, $CC, $00, $CC, $CC, $CC, $3C, $0C, $CC, $30, $00, $FC, $0C, $0C, $30, $C0, $C0, $FC, $0F, $35, $D5, $D5, $EA, $EA, $3A, $0F, $00, $00, $00, $00, $00, $00, $00, $00, $F0, $5C, $57, $57, $AB, $AB, $AC, $F0, $00, $3C, $C3, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $FF, $00, $00, $00 // $afd
saveregs:
	lda $D011
	sta !reg1+
	lda $D020
	sta !reg2+
	lda $D021
	sta !reg3+
	lda $D016
	sta !reg4+
	lda $D018
	sta !reg5+
	rts
	
!reg1:	.byte $00
!reg2:	.byte $00
!reg3:	.byte $00
!reg4:	.byte $00
!reg5:	.byte $00

restoreregs:
	lda !reg1-
	sta $D011
	lda !reg2-
	sta $D020
	lda !reg3-
	sta $D021
	lda !reg4-
	sta $D016
	lda !reg5-
	sta $D018
	rts 
!arg0:	.byte $00
!arg1:	.byte $00
!arg2:	.byte $00

	// clearmem( PG, # or loops );
clearmem:
	pla 
	tax 
	pla 
	tay

	pla
	sta !arg1-

	// arg0
	pla
	sta $03

	tya 
	pha 
	txa 
	pha 

	ldx !arg1-
	
	lda #$00
	sta $02
	tay
!:
	sta ($02),Y
	iny
	bne !-
	inc $03
	dex
	bne !-

	rts


	// fillmem( PG, char, # or loops );
fillmem:
	pla 
	tax 
	pla 
	tay

	pla
	sta !arg2-

	pla
	sta !arg1-
	
	// arg0
	pla
	sta $03

	tya 
	pha 
	txa 
	pha 

	ldx !arg2-
	
	ldy #$00
	sty $02
	
	lda !arg1-
!:
	sta ($02),Y
	iny
	bne !-
	inc $03
	dex
	bne !-

	rts

!mem:	.byte $00
pause:	
	lda #$00
	sta $C6
	jsr $FFE4
	sta !mem-
!:
	lda !mem- // this $00 will change
	cmp #$00
	bne !+
	jsr $FFE4
	sta !mem-
	jmp !-
!:	rts 
// $0E3A
!ARG0:  .byte $00
!ARG1:  .byte $00
!ARG2:  .byte $00, $00
!ARG3:  .byte $00
!ARG4:  .byte $00
!MEM0:	.byte $00      // plotshapeColourValue11
!MEM1:	.byte $00      // plotshapeColourValue0110	
!MEM2:  .byte $00, $00 // plotshapeColor1
!MEM3:  .byte $00, $00 // plotshapeOffset
!MEM4:  .byte $00, $00 // newPrintMEM4: which character to print
!MEM5:  .byte $00, $00 // plotshapeColors2And3
!MEM6:  .byte $00      // plotshapeBindex
!MEM7:  .byte $00      // plotshapeI	
!MEM8:  .byte $00, $00 // plotshapePixels
//!MEM9:  .byte $00, $00 // pointer to character data
// bmPrintInit( BMhi, CLRhi, ptr to chardata )
bmPrintInit:
	pla 
	tax 
	pla 
	tay 

	pla
	sta !CHR++ +1
	pla
	sta !CHR+ +1
	pla
	sta !CLRDTA+ +1
	pla
	sta !BMPDATA+ +1
	
	tya
	pha
	txa
	pha
	rts
	
bmPrint:
	pla 
	tax 
	pla 
	tay 
	pla 
	sta !ARG4-
	pla 
	sta !ARG3-
	pla 
	sta !ARG2- +1
	pla 
	sta !ARG2- 
	pla 
	sta !ARG1-
	pla 
	sta !ARG0-
	tya 
	pha 
	txa 
	pha 
	lda !ARG3-
	sta !MEM0-
	lda !ARG4-
	sta !MEM1-
	ldy #$00
	lda !ARG2- 
	ldx !ARG2- +1
	sta !+
	stx !++
	.byte $AD
!:	.byte $00
!:	.byte $00
	ldx #$00
	sta !MEM4- 
	stx !MEM4- +1
	
!START:			 // Top of WHILE Loop
	lda !MEM4- +1
	cmp #$00
	bne !+
	lda !MEM4- 
	cmp #$00
!:
	bne !_skip+
	rts
!_skip:
	lda $02
	pha 
	lda $03
	pha 
// ----------------------
	sec 
	lda !MEM4- 
	sbc #$20
	sta $02
	lda !MEM4- +1
	sta $03
	asl $02
	rol $03
	asl $02
	rol $03
	asl $02		
	rol $03
	ldx $03
	ldy $02
// -------------------
	pla 
	sta $03
	pla 
	sta $02
	tya 	
	//----------------
	sta !MEM4- 
	stx !MEM4- +1

	clc 
!CHR:	lda #$00
	adc !MEM4- 
	sta !MEM4- 
!CHR:	lda #$00
	adc !MEM4- +1
	sta !MEM4- +1
	
	lda #$00
	sta !MEM6-

	lda $02
	pha 
	lda $03
	pha 
	lda $04
	pha 
	lda $05
	pha 
// ----------------------
	lda !ARG1-
	sta $02
	sta $04
	lda #$00
	sta $03
	sta $05
	asl $02
	rol $03
	asl $02
	rol $03
	asl $02
	rol $03
	asl $04
	rol $05
	clc 
	lda $02
	adc $04
	sta $02
	lda $03
	adc $05
	sta $03
	asl $02
	rol $03
	asl $02
	rol $03
	ldx $03
	ldy $02
// -------------------
	pla 
	sta $05
	pla 
	sta $04
	pla 
	sta $03
	pla 
	sta $02
	tya 
	//========================

	clc 
	adc !ARG0-
	sta !MEM3-
	sta !MEM2- 
	txa 
	adc #$00
	sta !MEM3- +1
	
	clc
	lda !MEM3- +1
	adc #$D8
	sta !MEM2- +1
	
	clc 
	lda !MEM3-
	sta !MEM5- 
	lda !MEM3- +1
!CLRDTA:
	adc #$84
	sta !MEM5- +1
	
	lda !MEM3-
	asl 
	tay 
	lda !MEM3- +1
	rol 
	tax 
	tya 
	asl 
	tay 
	txa 
	rol 
	tax 
	tya 
	asl 
	sta !MEM8- 
	txa 
	rol 
	
	clc 
!BMPDATA:
	adc #$A0
	sta !MEM8- +1
	
	lda !MEM2- 
	sta !+
	lda !MEM2- +1
	sta !++
	lda !ARG3-
	.byte $8D	 // STA absolute
!:	.byte $00
!:	.byte $00
	lda !MEM5- 
	sta !+
	lda !MEM5- +1
	sta !++
	lda !ARG4-
	.byte $8D	 // STA absolute
!:	.byte $00
!:	.byte $00

	lda #$00
	sta !MEM7- 

!:	lda !MEM7- 
	cmp #$08
	
	bcs !+++++ // jump out of FOR
	lda !MEM4- 
	sta !+
	lda !MEM4- +1
	sta !++
	ldx !MEM6- 
	.byte $BD // <-- LDA ABS,X
!:	.byte $00
!:	.byte $00
	ldx !MEM8- 
	stx !+
	ldx !MEM8- +1
	stx !++
	.byte $8D // <-- STA absolute
!:	.byte $00
!:	.byte $00
	
	clc 
	lda !MEM8- 
	adc #$01
	sta !MEM8- 
	lda !MEM8- +1
	adc #$00
	sta !MEM8- +1
	
	inc !MEM6- 
	inc !MEM7- 
	jmp !-----
	
!:
	inc !ARG0-
	
	clc 
	lda !ARG2- 
	adc #$01
	sta !ARG2-
	sta !+
	lda !ARG2- +1
	adc #$00
	sta !ARG2- +1
	sta !++

	ldy #$00
	.byte $AD
!:	.byte $00
!:	.byte $00
	sta !MEM4-
	
	lda #$00
	sta !MEM4- +1
	jmp !START- // jump to top of WHILE loop
