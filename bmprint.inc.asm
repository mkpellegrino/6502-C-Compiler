!ARG0:  .byte $00
//!ARG1:  .byte $00
!ARG2:  .byte $00, $00
//!ARG3:  .byte $00
//!ARG4:  .byte $00
//!MEM0:	.byte $00      // plotshapeColourValue11
//!MEM1:	.byte $00      // plotshapeColourValue0110	
!MEM2:  .byte $00, $00 // plotshapeColor1
!MEM3:  .byte $00, $00 // plotshapeOffset
!MEM4:  .byte $00, $00 // newPrintMEM4: which character to print
!MEM5:  .byte $00, $00 // plotshapeColors2And3
!MEM6:  .byte $00      // plotshapeBindex
!MEM7:  .byte $00      // plotshapeI	
!MEM8:  .byte $00, $00 // plotshapePixels
//!MEM9:  .byte $00, $00 // pointer to character data


// bmPrintInit( bmpaddr_hi, colouraddr_hi, ptr to chardata )
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
	//sta !ARG4-
	sta !ARG4+ +1
	sta !ARG4++ +1
	pla
	
	//sta !ARG3-
	sta !ARG3+ +1
	sta !ARG3++ +1
	pla
	
	sta !ARG2- +1
	sta !++
	pla
	
	sta !ARG2- 
	sta !+
	pla
	
	//sta !ARG1-
	sta !ARG1+ +1
	pla
	
	sta !ARG0-
	
	tya 
	pha 
	txa 
	pha 

!ARG3:	lda #$00 // will get overwritten
	//lda !ARG3-
	//sta !MEM0-
!ARG4:	lda #$00 // will get overwritten	
	//lda !ARG4-
	//sta !MEM1-
	ldy #$00
	//lda !ARG2- 
	//ldx !ARG2- +1
	//sta !+
	//stx !++
	
	.byte $AD // <-- LDA abs
!:	.byte $00
!:	.byte $00
	
	ldx #$00
	sta !MEM4- 
	stx !MEM4- +1
	//lda $02
	//pha 
	//lda $03
	//pha 
	//php
	
!START:			 // Top of WHILE Loop
	lda !MEM4- +1
	//cmp #$00
	bne !+
	lda !MEM4- 
	//cmp #$00
!:	bne !_skip+
	rts
	//jmp !END+
!_skip:
	//lda $02
	//pha 
	//lda $03
	//pha 
// ----------------------
	sec 
	lda !MEM4- 
	sbc #$20
	sta $02
	lda !MEM4- +1
	// sta $03
	asl $02
	rol // $03
	asl $02
	rol //$03
	asl $02		
	rol //$03
	sta !MEM4- +1
	//tax
	//ldx $03
	lda $02
// -------------------
	//pla 
	//sta $03
	//pla 
	//sta $02
	//tya 	
	//----------------
	sta !MEM4- 
	//stx !MEM4- +1

	clc 
!CHR:	lda #$00
	adc !MEM4- 
	sta !MEM4- 
!CHR:	lda #$00
	adc !MEM4- +1
	sta !MEM4- +1
	
	lda #$00
	sta !MEM6-
// SAVE ZP
//	lda $02
//	pha 
//	lda $03
//	pha 
//	lda $04
//	pha 
//	lda $05
//	pha 
// ----------------------
!ARG1:	lda #$00
//	lda !ARG1-
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
//	ldy $02
	lda $02
// -------------------
// RESTORE ZP	
//	pla 
//	sta $05
//	pla 
//	sta $04
//	pla 
//	sta $03
//	pla 
//	sta $02

// Needed if saving ZP
//	tya 
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
	adc #$84 // <-- This is the colour addr high byte
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

	// this can likely be optimised
!BMPDATA:
	adc #$A0 // <-- This is the bitmap addr high byte (will get overwritten during init)
	sta !MEM8- +1
	
	lda !MEM2- 
	sta !+
	lda !MEM2- +1
	sta !++
!ARG3:	lda #$00 // will get overwritten
	//lda !ARG3-
	.byte $8D // <-- STA abs
!:	.byte $00
!:	.byte $00
	
	lda !MEM5- 
	sta !+
	lda !MEM5- +1
	sta !++
!ARG4:	lda #$00 // Will get overwritten
	// lda !ARG4-
	.byte $8D // <-- STA abs
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
	.byte $8D // <-- STA abs
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
	// end of for-loop


!:	inc !ARG0-
	
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
	.byte $AD // <-- LDA abs
!:	.byte $00
!:	.byte $00
	sta !MEM4-
	
	lda #$00
	sta !MEM4- +1
	jmp !START- // jump to top of WHILE loop
	
//!END:
	
//	rts

