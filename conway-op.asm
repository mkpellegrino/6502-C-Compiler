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
	ldx #$04
	sta board
	stx board+1
	ldx #$D8
	sta colour
	stx colour+1
	lda $D020
	sta oldD020
	lda $D021
	sta oldD021
	lda $0286
	sta oldChar
	lda #$FF
	sta $D40E
	sta $D40F
	lda #$80
	sta $D412
	sei 
	lda $01
	and #$F8
	ora #$06
	sta $01
	cli	
	lda #$0C
	sta $D020
	sta $D021
	jsr clearShadowAndBoard
	lda #$9B
	jsr $FFD2
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
	bne LBL1L0
	ldy #$00
LBL1L2:
	lda $C127,Y
	sta $0527,Y
	iny 
	cpy #$FF
	bne LBL1L2
	ldy #$00
LBL1L4:
	lda $C226,Y
	sta $0626,Y
	iny 
	cpy #$FF
	bne LBL1L4
	ldy #$00
LBL1L6:
	lda $C325,Y
	sta $0725,Y
	iny 
	cpy #$9A
	bne LBL1L6
	lda $CB
	sta k
	php 
	clc
LBL1L9:
	lda k
	cmp #$3E
	bne !_skip+
	jmp LBL1L11 // too far for a Branch Instr.
!_skip:
	php 
	clc
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
	bcc LBL2L3
	jmp LBL2L4 // jump out of FOR
LBL2L3:
	lda #$00
	sta n
	clc 
	lda i
	adc #$00
	sta arg0
	lda i+1
	adc #$04
	sta arg0+1
	clc 
	lda i
	adc #$00
	sta arg1
	lda i+1
	adc #$C0
	sta arg1+1
	php 
	sec 
	lda arg0
	sbc #$29
	sta $02
	lda arg0+1
	sbc #$00
	sta $03
	ldy #$00
	lda ($02),Y
	cmp #$20
	beq LBL3L3 // if z==1 jump to ELSE
	inc n
LBL3L3:
	sec 
	lda arg0
	sbc #$28
	sta $02
	lda arg0+1
	sbc #$00
	sta $03
	ldy #$00
	lda ($02),Y
	cmp #$20
	beq LBL3L8 // if z==1 jump to ELSE
	inc n
LBL3L8:
	sec 
	lda arg0
	sbc #$27
	sta $02
	lda arg0+1
	sbc #$00	
	sta $03
	ldy #$00
	lda ($02),Y
	tax 
	cmp #$20
	beq LBL3L13 // if z==1 jump to ELSE
	inc n
LBL3L13:
	sec 
	lda arg0
	sbc #$01
	sta $02
	lda arg0+1
	sbc #$00
	sta $03
	ldy #$00
	lda ($02),Y
	cmp #$20
	beq LBL3L18 // if z==1 jump to ELSE
	inc n
LBL3L18:
	clc 
	lda #$01
	adc arg0
	sta $02
	lda #$00
	adc arg0+1
	sta $03 // added
	ldy #$00
	lda ($02),Y
	cmp #$20
	beq LBL3L23 // if z==1 jump to ELSE
	inc n
LBL3L23:
	clc 
	lda #$27
	adc arg0
	sta $02
	lda #$00
	adc arg0+1
	sta $03
	ldy #$00
	lda ($02),Y
	cmp #$20
	beq LBL3L28 // if z==1 jump to ELSE
	inc n
LBL3L28:
	clc 
	lda #$28
	adc arg0
	sta $02
	lda #$00
	adc arg0+1
	sta $03
	ldy #$00
	lda ($02),Y
	cmp #$20
	beq LBL3L33 // if z==1 jump to ELSE
	inc n
LBL3L33:
	clc 
	lda #$29
	adc arg0
	sta $02
	lda #$00
	adc arg0+1
	sta $03
	ldy #$00
	lda ($02),Y
	cmp #$20
	beq LBL3L38 // if z==1 jump to ELSE
	inc n
LBL3L38:
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
	cmp #$20
	bne LBL3L43 // jump to ELSE mkp
	php 
	lda n
	cmp #$03
	bne LBL4L3 // jump to ELSE
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
	plp 
	jmp LBL3L44
LBL3L43:
	php 
	lda n
	cmp #$02
	bcs LBL4L8
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
	clc
	lda n
	cmp #$03
	bcc LBL4L13
	beq LBL4L13 // if z==1 jump to ELSE
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
	plp 
LBL3L44:
	plp

	clc 
	lda #$01
	adc i
	sta i
	lda #$00
	adc i+1
	sta i+1
	
	
	jmp LBL2L1 // jump to top of for
LBL2L4:
	plp 
	ldy #$00
LBL2L5:
	lda $C028,Y
	sta $0428,Y
	iny 
	cpy #$FF
	bne LBL2L5
	ldy #$00
LBL2L7:
	lda $C127,Y
	sta $0527,Y
	iny 
	cpy #$FF
	bne LBL2L7
	ldy #$00
LBL2L9:
	lda $C226,Y
	sta $0626,Y
	iny 
	cpy #$FF
	bne LBL2L9
	ldy #$00
LBL2L11:
	lda $C325,Y
	sta $0725,Y
	iny 
	cpy #$9A
	bne LBL2L11
	lda $CB
	sta k
	php 
	clc 
	lda k
	cmp #$11
	bne LBL2L16 // jump to ELSE
	jsr randomizeBoard
LBL2L16:
	lda k
	cmp #$1D
	bne LBL2L21 // jump to ELSE
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
	plp 
	jmp LBL1L9 // jump to top of WHILE loop
LBL1L11:
	plp
	lda #$00
	sta $C6
	jsr $FFE4
	jsr clearShadowAndBoard
	lda oldD020
	sta $D020
	lda oldD021
	sta $D021
	lda oldChar
	sta $0286
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
	php 
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
	bcc LBL1L15
	plp
	rts

LBL1L15:
	lda $D41B
	sta a
	php 
	lda a
	cmp #$7F
	bcc LBL2L26 // if c==0 jump to ELSE
	beq LBL2L26 // if z==1 jump to ELSE
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
	lda board+1
	adc i+1
	sta !++
	lda a
	.byte $8D	 // <-- STA absolute
!:
	.byte $00
!:
	.byte $00
	clc 
	lda shadow
	adc i
	sta !+
	lda shadow+1
	adc i+1
	sta !++
	lda a
	.byte $8D	 // <-- STA absolute
!:
	.byte $00
!:
	.byte $00
	clc 
	lda #$01
	adc i
	sta i
	lda #$00
	adc i+1
	sta i+1
	jmp LBL1L13 // jump to top of FOR loop
	plp 
	rts 

clearShadowAndBoard:
	lda #$00
	sta i
	sta i+1

	
LBL1L18:    // Top of FOR Loop
	cmp #$03
	bne !+
	lda i
	cmp #$E8
!:
	bcc LBL1L20
	rts

LBL1L20:
	clc 
	lda board
	adc i
	sta !+
	lda board+1
	adc i+1
	sta !++
	lda #$20
	.byte $8D	 // <-- STA absolute
!:
	.byte $00
!:
	.byte $00
	clc 
	lda shadow
	adc i
	sta !+
	lda shadow+1
	adc i+1
	sta !++
	lda #$20
	.byte $8D	 // <-- STA absolute
!:
	.byte $00
!:
	.byte $00
	clc 
	lda colour
	adc i
	sta !+
	lda colour+1
	adc i+1
	sta !++
	lda #$01
	.byte $8D	 // <-- STA absolute
!:
	.byte $00
!:
	.byte $00


	clc 
	lda #$01
	adc i
	sta i
	lda #$00
	adc i+1
	sta i+1
	jmp LBL1L18 // jump to top of FOR loop

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
