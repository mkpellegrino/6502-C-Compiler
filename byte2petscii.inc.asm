// How to use:
//   word w = byte2petscii( 193 );
//   uint low = w;
//   uint high = getH(w);
	!arg0:  .byte $00
!mem0:  .byte $00  // F
!mem1:  .byte $00  // L	
byte2petscii:
	pla
	sta !mem0-
	pla
	sta !mem1-
	
	pla
	tax
	and #$0F
	jsr !+
	pha
	
	txa
	lsr
	lsr
	lsr
	lsr
	jsr !+
	pha

	lda #$02
	pha


	lda !mem1-
	pha
	lda !mem0-
	pha
	rts

!:
	cmp #$0A
	bcc !+
	adc #$06
!:
	adc #$30
	rts
