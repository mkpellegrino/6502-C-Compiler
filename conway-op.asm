 //  Variable Labels
.label shadow = $0334
.label board = $0336
.label colour = $0338
.label n = $033A
.label alive = $033B
.label i = $033C
.label arg0 = $033E
.label arg1 = $0340
.label k = $0342
.label a = $0343
.label oldD020 = $0344
.label oldD021 = $0345
.label oldChar = $0346
* = $0801
BasicUpstart($0834)
* = $0834
	lda #$00
	ldx #$C0
	sta shadow
	stx shadow+1
	//lda #$00
	ldx #$04
	sta board
	stx board+1
	//lda #$00
	ldx #$D8
	sta colour
	stx colour+1

	//jsr saveregs
	lda $D020
	sta oldD020
	lda $D021
	sta oldD021
	lda $0286
	sta oldChar
	//----------
	
	//jsr SIDRND // initialize random number generator
	//pha 
	lda #$FF
	sta $D40E
	sta $D40F
	lda #$80
	sta $D412
	//pla 
	//---------
	sei 
	lda $01
	and #$F8
	ora #$06
	sta $01
	cli
	
	lda #$0C
	sta $D020
	//lda #$0C
	sta $D021
	jsr clearShadowAndBoard
	lda #$9B
	jsr $FFD2
	clc        // is THIS needed?
	ldy #$00
	ldx #$18
	jsr $FFF0
	lda #<STRLBL0
	sta $02
	lda #>STRLBL0
	sta $03
	jsr PRN
	jsr randomizeBoard
	ldy #$00
LBL1L0:
	lda $C028,Y
	sta $0428,Y
	iny 
	cpy #$FF
	beq LBL1L1
	jmp LBL1L0
LBL1L1:
	ldy #$00
LBL1L2:
	lda $C127,Y
	sta $0527,Y
	iny 
	cpy #$FF
	beq LBL1L3
	jmp LBL1L2
LBL1L3:
	ldy #$00
LBL1L4:
	lda $C226,Y
	sta $0626,Y
	iny 
	cpy #$FF
	beq LBL1L5
	jmp LBL1L4
LBL1L5:
	ldy #$00
LBL1L6:
	lda $C325,Y
	sta $0725,Y
	iny 
	cpy #$9A
	beq LBL1L7
	jmp LBL1L6
LBL1L7:
	lda $CB
	sta k

	// SAVE0203
	lda $02
	pha 
	lda $03
	pha
	
	php 
	clc 
LBL1L8:
LBL1L9:			 // Top of WHILE Loop
	lda k
	cmp #$3E
	bne !_skip+
	jmp LBL1L11 // if z==1 jump to ELSE
!_skip:
LBL1L10:
	// SAVE0203
	lda $02
	pha 
	lda $03
	pha 
	php 
	clc 
LBL2L0:
	lda #$28
	ldx #$00
	sta i
	stx i+1
LBL2L1:			 // Top of FOR Loop
	lda i+1
	cmp #$03
	bne !+
	lda i
	cmp #$98
!:
	.byte $B0, $03 // BCS +3
	jmp LBL2L3 // if c==0 jump to BODY
	jmp LBL2L4 // jump out of FOR
LBL2L2:
	clc 
	lda #$01
	adc i

	sta i
	//tay 
	lda #$00
	adc i+1

	// REWORK
	// tax 
	// tya 
	// sta i
	// stx i+1
	//----------
	sta i+1
	//sty i
	//----------
	
	jmp LBL2L1 // jump to top of FOR loop
LBL2L3:
	lda #$00
	sta n
	clc 
	lda i
	adc #$00
	//tay
	sta arg0
	lda i+1
	adc #$04

	// REWORKED
	sta arg0+1
	//sty arg0
	
	//tax 
	//tya 
	//sta arg0
	//stx arg0+1

	clc 
	lda i
	adc #$00
	//tay
	sta arg1
	lda i+1
	adc #$C0

	// REWORKED
	sta arg1+1
	//sty arg1
	//tax 
	//tya 
	//sta arg1
	//stx arg1+1
	php 
LBL3L0:
	sec 
	lda arg0
	sbc #$29
	sta $02
	//pha 
	lda arg0+1
	sbc #$00
	sta $03
	//tax 
	//pla 
	//tay 
	//sty $02
	ldy #$00
	//stx $03
	lda ($02),Y
	//tax 

	//pha 
	//lda arg0+1
	//sbc #$00
	//tax 
	//pla 
	//tay 
	//sty $02
	//ldy #$00
	//stx $03
	//lda ($02),Y
	//tax 
LBL3L1:			 // Top of IF statement
	cmp #$20
	bne !_skip+
	jmp LBL3L3 // if z==1 jump to ELSE
!_skip:
LBL3L2:
	inc n
LBL3L3:
LBL3L4:
	//plp	 
	//php 
LBL3L5:
	;; sec 
	;; lda arg0
	;; sbc #$28
	;; pha 
	;; lda arg0+1
	;; sbc #$00
	;; tax 
	;; pla 
	;; tay 
	;; sty $02
	;; ldy #$00
	;; stx $03
	;; lda ($02),Y
	;; tax 

	sec 
	lda arg0
	sbc #$28
	sta $02
	//pha 
	lda arg0+1
	sbc #$00
	//tax 
	sta $03
	//pla 
	//tay 
	//sty $02

	ldy #$00
	//stx $03
	lda ($02),Y
	//tax 

LBL3L6:			 // Top of IF statement
	cmp #$20
	bne !_skip+
	jmp LBL3L8 // if z==1 jump to ELSE
!_skip:
LBL3L7:
	inc n
LBL3L8:
LBL3L9:
	//plp 
	//php 
LBL3L10:
	;; sec 
	;; lda arg0
	;; sbc #$27
	;; pha 
	;; lda arg0+1
	;; sbc #$00	
	;; tax 
	;; pla 
	;; tay 
	;; sty $02
	;; ldy #$00
	;; stx $03
	;; lda ($02),Y
	;; tax 

	sec 
	lda arg0
	sbc #$27
	sta $02
	//pha 
	lda arg0+1
	sbc #$00	
	sta $03
	//tax 
	//pla 
	//tay 
	//sty $02
	ldy #$00
	//stx $03
	lda ($02),Y
	tax 


LBL3L11:			 // Top of IF statement
	cmp #$20
	bne !_skip+
	jmp LBL3L13 // if z==1 jump to ELSE
!_skip:
LBL3L12:
	inc n
LBL3L13:
LBL3L14:
	//plp 
	//php 
LBL3L15:
	;; sec 
	;; lda arg0
	;; sbc #$01
	;; pha 
	;; lda arg0+1
	;; sbc #$00
	;; tax 
	;; pla 
	;; tay 
	;; sty $02
	;; ldy #$00
	;; stx $03
	;; lda ($02),Y
	;; tax 

	sec 
	lda arg0
	sbc #$01
	sta $02
	//pha 
	lda arg0+1
	sbc #$00
	sta $03
	//tax 
	//pla 
	//tay 
	//sty $02
	ldy #$00
	//stx $03
	lda ($02),Y
	//tax 

LBL3L16:			 // Top of IF statement
	cmp #$20
	bne !_skip+
	jmp LBL3L18 // if z==1 jump to ELSE
!_skip:
LBL3L17:
	inc n
LBL3L18:
LBL3L19:
	//plp 
	//php 
LBL3L20:

	clc 
	lda #$01
	adc arg0
	//tay
	sta $02
	
	lda #$00
	adc arg0+1

	sta $03 // added

	//tax 
	//tya 
	//sty $02
	ldy #$00
	//stx $03
	lda ($02),Y
	//tax 
LBL3L21:			 // Top of IF statement
	cmp #$20
	bne !_skip+
	jmp LBL3L23 // if z==1 jump to ELSE
!_skip:
LBL3L22:
	inc n
LBL3L23:
LBL3L24:
	//plp 
	//php 
LBL3L25:
	clc 
	lda #$27
	adc arg0
	sta $02
	
	//tay 
	lda #$00
	adc arg0+1
	sta $03
	//tax 
	//tya 
	//sty $02
	ldy #$00
	//stx $03
	lda ($02),Y
	//tax 
LBL3L26:			 // Top of IF statement
	cmp #$20
	bne !_skip+
	jmp LBL3L28 // if z==1 jump to ELSE
!_skip:
LBL3L27:
	inc n
LBL3L28:
LBL3L29:
	//plp 
	//php 
LBL3L30:
	clc 
	lda #$28
	adc arg0
	sta $02
	//tay 
	lda #$00
	adc arg0+1
	sta $03
	//tax 
	//tya 
	//sty $02
	ldy #$00
	//stx $03
	lda ($02),Y
	//tax 
LBL3L31:			 // Top of IF statement
	cmp #$20
	bne !_skip+
	jmp LBL3L33 // if z==1 jump to ELSE
!_skip:
LBL3L32:
	inc n
LBL3L33:
LBL3L34:
	//plp 
	//php 
LBL3L35:
	clc 
	lda #$29
	adc arg0
	sta $02
	//tay 
	lda #$00
	adc arg0+1
	sta $03
	//tax 
	//tya 
	//sty $02
	ldy #$00
	//stx $03
	lda ($02),Y
	//tax 
LBL3L36:			 // Top of IF statement
	cmp #$20
	bne !_skip+
	jmp LBL3L38 // if z==1 jump to ELSE
!_skip:
LBL3L37:
	inc n
LBL3L38:
LBL3L39:
	//plp 
	//php 
	//clc 
LBL3L40:
	ldy #$00
	lda arg0
	ldx arg0+1
	sta !+
	stx !++
	.byte $AD
!:
	.byte $00
!:
	.byte $00
LBL3L41:			 // Top of IF statement
	cmp #$20
	beq !_skip+
	jmp LBL3L43 // jump to ELSE
!_skip:
LBL3L42:
	php 
	//clc 
LBL4L0:
LBL4L1:			 // Top of IF statement
	lda n
	cmp #$03
	beq !_skip+
	jmp LBL4L3 // jump to ELSE
!_skip:
LBL4L2:
	lda arg1
	sta LBL5L0
	lda arg1+1
	sta LBL5L1
	lda #$51
	.byte $8D // <-- STA absolute
LBL5L0:			 // <-- low byte
	.byte $00
LBL5L1:			 // <-- hi byte
	.byte $00
LBL4L3:
LBL4L4:
	plp 
	jmp LBL3L44
LBL3L43:
	php 
	//clc 
LBL4L5:
LBL4L6:			 // Top of IF statement
	lda n
	cmp #$02
	bcc !_skip+
	jmp LBL4L8 // jump to ELSE
!_skip:
LBL4L7:
	lda arg1
	sta LBL5L2
	lda arg1+1
	sta LBL5L3
	lda #$20
	.byte $8D // <-- STA absolute
LBL5L2:			 // <-- low byte
	.byte $00
LBL5L3:			 // <-- hi byte
	.byte $00
LBL4L8:
LBL4L9:
	//plp 
	//php 
	clc 
LBL4L10:
LBL4L11:			 // Top of IF statement
	lda n
	cmp #$03
	bcs !_skip+
	jmp LBL4L13 // if c==0 jump to ELSE
!_skip:
	bne !_skip+
	jmp LBL4L13 // if z==1 jump to ELSE
!_skip:
LBL4L12:
	lda arg1
	sta LBL5L4
	lda arg1+1
	sta LBL5L5
	lda #$20
	.byte $8D // <-- STA absolute
LBL5L4:			 // <-- low byte
	.byte $00
LBL5L5:			 // <-- hi byte
	.byte $00
LBL4L13:
LBL4L14:
	plp 
LBL3L44:
	plp 
	jmp LBL2L2 // jump to iterator
LBL2L4:
	plp 

	// RESTORE0203
	pla 
	sta $03
	pla 
	sta $02
	
	ldy #$00
LBL2L5:
	lda $C028,Y
	sta $0428,Y
	iny 
	cpy #$FF
	beq LBL2L6
	jmp LBL2L5
LBL2L6:
	ldy #$00
LBL2L7:
	lda $C127,Y
	sta $0527,Y
	iny 
	cpy #$FF
	beq LBL2L8
	jmp LBL2L7
LBL2L8:
	ldy #$00
LBL2L9:
	lda $C226,Y
	sta $0626,Y
	iny 
	cpy #$FF
	beq LBL2L10
	jmp LBL2L9
LBL2L10:
	ldy #$00
LBL2L11:
	lda $C325,Y
	sta $0725,Y
	iny 
	cpy #$9A
	beq LBL2L12
	jmp LBL2L11
LBL2L12:
	lda $CB
	sta k
	php 
	clc 
LBL2L13:
LBL2L14:			 // Top of IF statement
	lda k
	cmp #$11
	beq !_skip+
	jmp LBL2L16 // jump to ELSE
!_skip:
LBL2L15:
	jsr randomizeBoard
LBL2L16:
LBL2L17:
	//plp 
	//php 
	//clc 
LBL2L18:
LBL2L19:			 // Top of IF statement
	lda k
	cmp #$1D
	beq !_skip+
	jmp LBL2L21 // jump to ELSE
!_skip:
LBL2L20:
	clc 
	ldy #$00
	ldx #$18
	jsr $FFF0
	lda #<STRLBL1
	sta $02
	lda #>STRLBL1
	sta $03
	jsr PRN
LBL2L21:
LBL2L22:
	plp 
	jmp LBL1L9 // jump to top of WHILE loop
LBL1L11:
	
	plp

	// RESTORE0203
	pla 
	sta $03
	pla 
	sta $02
	// keep
	
	lda #$00
	sta $C6
	jsr $FFE4
	jsr clearShadowAndBoard
	//jsr restoreregs
	lda oldD020
	sta $D020
	lda oldD021
	sta $D021
	lda oldChar
	sta $0286
	//----------
	clc 
	ldy #$0A
	ldx #$0A
	jsr $FFF0
	lda #$05
	jsr $FFD2
	lda #<STRLBL2
	sta $02
	lda #>STRLBL2
	sta $03
	jsr PRN
	lda #$9A
	jsr $FFD2
	lda #<STRLBL3
	sta $02
	lda #>STRLBL3
	sta $03
	jsr PRN
	sei 
	lda #$37 // Default Value
	sta $01
	cli 
	rts 
randomizeBoard:

	// SAVE0203
	lda $02
	pha 
	lda $03
	pha 
	php 
	//clc 
LBL1L12:
	lda #$28
	ldx #$00
	sta i
	stx i+1
LBL1L13:			 // Top of FOR Loop
	lda i+1
	cmp #$03
	bne !+
	lda i
	cmp #$98
!:
	.byte $B0, $03 // BCS +3
	jmp LBL1L15 // if c==0 jump to BODY
	jmp LBL1L16 // jump out of FOR
LBL1L14:
	clc 
	lda #$01
	adc i
	//tay
	sta i
	lda #$00
	adc i+1
	// REWORKED
	sta i+1
	//sty i
	//tax 
	//tya 
	//sta i
	//stx i+1
	jmp LBL1L13 // jump to top of FOR loop
LBL1L15:
	lda $D41B
	sta a
	php 
	//clc 
LBL2L23:
LBL2L24:			 // Top of IF statement
	lda a
	cmp #$7F
	bcs !_skip+
	jmp LBL2L26 // if c==0 jump to ELSE
!_skip:
	bne !_skip+
	jmp LBL2L26 // if z==1 jump to ELSE
!_skip:
LBL2L25:
	lda #$51
	sta a
	jmp LBL2L27
LBL2L26:
	lda #$20
	sta a
LBL2L27:
	plp 
	clc 
	lda board
	adc i
	sta !+
	//tay 
	lda board+1
	adc i+1

	// REWORKED
	sta !++
	//sty !+
	//tax
	//tya 
	//sta !+
	//stx !++
	lda a
	.byte $8D	 // <-- STA absolute
!:
	.byte $00
!:
	.byte $00
	clc 
	lda shadow
	adc i
	//tay
	sta !+
	lda shadow+1
	adc i+1

	// REWORKED
	sta !++
	//sty !+
	//tax 
	//tya 
	//sta !+
	//stx !++
	lda a
	.byte $8D	 // <-- STA absolute
!:
	.byte $00
!:
	.byte $00
	jmp LBL1L14 // jump to iterator
LBL1L16:
	plp 

	// RESTORE0203
	pla 
	sta $03
	pla 
	sta $02

	rts 



clearShadowAndBoard:

	// SAVE0203
	//lda $02
	//pha 
	//lda $03
	//pha 
	//php 
	//clc 
LBL1L17:
	lda #$00
	//tax 
	sta i
	sta i+1
LBL1L18:    // Top of FOR Loop

	// i+1 is already in a
	//lda i+1
	cmp #$03
	bne !+
	lda i
	cmp #$E8
!:
	.byte $B0, $03 // BCS +3
	jmp LBL1L20 // if c==0 jump to BODY
	jmp LBL1L21 // jump out of FOR
LBL1L19:
	clc 
	lda #$01
	adc i
	//tay
	sta i
	lda #$00
	adc i+1

	// REWORKED
	sta i+1
	//sty i
	
	//tax 
	//tya 
	//sta i
	//stx i+1
	jmp LBL1L18 // jump to top of FOR loop
LBL1L20:
	clc 
	lda board
	adc i
	//tay
	sta !+
	lda board+1
	adc i+1
	// REWORKED
	sta !++
	//sty !+
	//tax 
	//tya 
	//sta !+
	//stx !++
	lda #$20
	.byte $8D	 // <-- STA absolute
!:
	.byte $00
!:
	.byte $00
	clc 
	lda shadow
	adc i
	//tay
	sta !+
	lda shadow+1
	adc i+1
	// REWORKED
	sta !++
	//sty !+
	//tax 
	//tya 
	//sta !+
	//stx !++
	lda #$20
	.byte $8D	 // <-- STA absolute
!:
	.byte $00
!:
	.byte $00
	clc 
	lda colour
	adc i
	//
	sta !+
	//tay 
	lda colour+1
	adc i+1
	// REWORKED
	sta !++
	//sty !+
	//tax 
	//tya 
	//sta !+
	//stx !++
	lda #$01
	.byte $8D	 // <-- STA absolute
!:
	.byte $00
!:
	.byte $00
	jmp LBL1L19 // jump to iterator
LBL1L21:
	//plp

	// RESTORE0203
	//pla 
	//sta $03
	//pla 
	//sta $02
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

// ; $de5			" CONWAYS GAME OF LIFE    HOLD H, R OR Q"
STRLBL0:
	.byte  $20, $43, $4F, $4E, $57, $41, $59, $53, $20, $47, $41, $4D, $45, $20, $4F, $46, $20, $4C, $49, $46, $45, $20, $20, $20, $20, $48, $4F, $4C, $44, $20, $48, $2C, $20, $52, $20, $4F, $52, $20, $51, $00
 // ; $e0d			"                                       "
STRLBL1:
	.byte  $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $00
 // ; $e35			"CONWAYS GAME OF LIFE\n\n"
STRLBL2:
	.byte  $43, $4F, $4E, $57, $41, $59, $53, $20, $47, $41, $4D, $45, $20, $4F, $46, $20, $4C, $49, $46, $45, $0D, $0D, $00
 // ; $e4c			"  PROGRAMMED BY: MICHAEL K. PELLEGRINO\n USING HIS 6502 C COMPILER   2023 04 07\n\n         GITHUB.COM/MKPELLEGRINO\n"
STRLBL3:
	.byte  $20, $20, $50, $52, $4F, $47, $52, $41, $4D, $4D, $45, $44, $20, $42, $59, $3A, $20, $4D, $49, $43, $48, $41, $45, $4C, $20, $4B, $2E, $20, $50, $45, $4C, $4C, $45, $47, $52, $49, $4E, $4F, $0D, $20, $55, $53, $49, $4E, $47, $20, $48, $49, $53, $20, $36, $35, $30, $32, $20, $43, $20, $43, $4F, $4D, $50, $49, $4C, $45, $52, $20, $20, $20, $32, $30, $32, $33, $20, $30, $34, $20, $30, $37, $0D, $0D, $20, $20, $20, $20, $20, $20, $20, $20, $20, $47, $49, $54, $48, $55, $42, $2E, $43, $4F, $4D, $2F, $4D, $4B, $50, $45, $4C, $4C, $45, $47, $52, $49, $4E, $4F, $0D, $00
