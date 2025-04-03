!lv_x:	.byte $00
!lv_y:	.byte $00
!lv_tmp1:.byte $00	
!lv_tmp2:.byte $00	
modulus:
	pla 
	tax 
	pla 
	tay 
	pla 
	sta !lv_y-
	sta _DIV16_FD
	pla 
	sta !lv_x-
	sta _DIV16_FB
	tya 
	pha 
	txa 
	pha
	lda #$00
	sta _DIV16_FE
	sta _DIV16_FC
	jsr DIV16	
	lda _DIV16_FB
	ldx _DIV16_FC
	sta !lv_tmp1-
	sta $02
	lda !lv_y-
	sta $03
	jsr UMUL
	ldx $03
	stx !lv_tmp1-
	
	pla 
	tax 
	pla 
	tay 
	sec 
	lda !lv_x-
	sbc !lv_tmp1-
	pha
	lda #$01
	pha
	tya 
	pha 
	txa 
	pha 
	rts 
