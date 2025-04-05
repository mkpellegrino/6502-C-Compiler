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
	//ldy #$00
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
