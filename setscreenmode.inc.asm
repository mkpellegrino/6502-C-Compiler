!mem0:   .byte $00
setScreenMode:
	pla 
	tax 
	pla
	tay
	
	pla 
	sta !mem0-
	
	tya 
	pha 
	txa 
	pha
	
	lda !mem0-
	cmp #$00
	bne !+
	
	lda #$BF
	and $D011
	sta !mem0-
	lda #$20
	ora !mem0-
	sta $D011
	
	lda #$EF
	and $D016
	sta $D016
	rts
!:

	lda !mem0-
	cmp #$01
	bne !+
	
	lda #$9F
	and $D011
	sta $D011
	lda #$10
	ora $D016
	sta $D016
	rts
!:

	lda !mem0-
	cmp #$02
	bne !+
	
	lda #$BF
	and $D011
	sta !mem0-
	lda #$20
	ora !mem0-
	sta $D011
	lda #$EF
	and $D016
	sta $D016
	rts
!:

	// multicolour bitmode (3)
	lda !mem0-
	cmp #$03
	bne !+
	lda #$BF  // clear bit 6
	and $D011
	sta !mem0-
	lda #$20  // set bit 5
	ora !mem0-
	sta $D011
	
	lda #$10 // set bit 4
	ora $D016
	sta $D016
	rts
!:

	lda !mem0-
	cmp #$04
	bne !+
	
	lda #$DF
	and $D011
	sta !mem0-
	lda #$40
	ora !mem0-
	sta $D011
	lda #$EF
	and $D016
	sta $D016
!:
	rts
