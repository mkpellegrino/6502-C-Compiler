!lv_numlo:	.byte $00
!lv_numhi:	.byte $00
!lv_rootlo:	.byte $00
!lv_roothi:	.byte $00
!lv_bitlo:	.byte $00
!lv_bithi:	.byte $00
!lv_tmplo:	.byte $00
!lv_tmphi:	.byte $00
	
sqrtint:pla
	tax
	pla
	tay

	pla
	sta !lv_numhi-
	pla
	sta !lv_numlo-
	
	tya
	pha
	txa
	pha	
	
	lda #$00
	sta !lv_rootlo-
	sta !lv_roothi-
	sta !lv_bitlo-
	lda #$40
	sta !lv_bithi-
!:	lda !lv_bithi-
	cmp !lv_numhi-
	bcc !++
	bne !+
	lda !lv_bitlo-
	cmp !lv_numlo-
	
	bcc !++
	beq !++
!:	lsr !lv_bithi-
	ror !lv_bitlo-
	lsr !lv_bithi-
	ror !lv_bitlo-
	jmp !--
	
!:	lda !lv_bithi-
	ora !lv_bitlo-
	beq !++++
	lda !lv_rootlo-
	clc
	adc !lv_bitlo-
	sta !lv_tmplo-
	lda !lv_roothi-
	adc !lv_bithi-
	sta !lv_tmphi-	
	lda !lv_numhi-
	cmp !lv_tmphi-
	bcc !++
	bne !+
	lda !lv_numlo-
	cmp !lv_tmplo-
	bcc !++
!:	sec
	lda !lv_numlo-
	sbc !lv_tmplo-
	sta !lv_numlo-
	lda !lv_numhi-
	sbc !lv_tmphi-
	sta !lv_numhi-
	lsr !lv_roothi-
	ror !lv_rootlo-
	clc
	lda !lv_rootlo-
	adc !lv_bitlo-
	sta !lv_rootlo-
	lda !lv_roothi-
	adc !lv_bithi-
	sta !lv_roothi-
        jmp !++
!:	lsr !lv_roothi-
	ror !lv_rootlo-
!:	lsr !lv_bithi-
	ror !lv_bitlo-
	lsr !lv_bithi-
	ror !lv_bitlo-
        jmp !----

!:	pla
	tax
	pla
	tay
	
	lda !lv_rootlo-
	pha
	lda #$01
	pha
	
	tya
	pha
	txa
	pha
	
	rts
