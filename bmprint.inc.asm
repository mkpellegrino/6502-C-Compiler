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
	lda $02
	pha 
	lda $03
	pha 
	php
	
!START:			 // Top of WHILE Loop
	lda !MEM4- +1
	cmp #$00
	bne !+
	lda !MEM4- 
	cmp #$00
!:
	bne !_skip+
	jmp !END+
!_skip:
	sec 
	lda !MEM4- 
	sbc #$20
	sta _MUL16_FB
	lda !MEM4- +1
	sta _MUL16_FC

	lda #$08
	sta _MUL16_FD
	lda #$00
	sta _MUL16_FE
	jsr MUL16
	lda MUL16R
	ldx MUL16R+1
	
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
	
	lda !ARG1-
	sta _MUL16_FB
	lda #$00
	sta _MUL16_FC
	sta _MUL16_FE
	lda #$28
	sta _MUL16_FD
	jsr MUL16
	lda MUL16R
	ldx MUL16R+1

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
	
!END:
	plp 
	pla 
	sta $03
	pla 
	sta $02
	
	rts
