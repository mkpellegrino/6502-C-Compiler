// Bresenham Line Algorithm in 6502 Assembler
!x0:	.byte $00
!y0:	.byte $00
!x1:	.byte $00
!y1:	.byte $00
!x:	.byte $00
!y:	.byte $00
!dx:	.byte $00
!acc:	.byte $00
!dy:	.byte $00
!dxm:	.byte $00
!dym:	.byte $00

	
segment:
bres:
	pla
	tax
	pla
	tay
	pla
	sta $FD // colour
	pla
	sta !y1-
	pla
	sta !x1-
	pla
	sta !y0-
	pla
	sta !x0-
	tya
	pha
	txa
	pha

	lda !x0-
	cmp !x1-
	bne !else1+ // [120] (OPTIMIZED)
!cond:	// (&&)
	lda !y0-
	cmp !y1-
	bne !else1+ // hand optimized
!cond_group_end:
!if_body1:
	// it's just a single point
	lda !x0-
	sta $FA
	lda !y0-
	sta $FC
	jsr _mcplot
	rts
!else1:
!if_out1:
// plot the endpoints
	lda !x1-
	sta $FA
	lda !y1-
	sta $FC
	jsr _mcplot
	
	lda !x0-
	sta $FA
	lda !y0-
	sta $FC
	jsr _mcplot
	
	lda !x0-
	cmp !x1-
	bcc !else1+ // [8] (OPTIMIZED)
	beq !else1+ // [3] (OPTIMIZED)
!if_body1:
	// swap coordinates
	jsr bres_swapxy
!else1:
!if_out1:
	lda !y0-
	cmp !y1-
	bne !else1+
!if_body1:

	// horizontal line
!for_init1:
	ldy !y0-
	sty $FC
	
	lda !x0-
	sta !x-
!for_top1:
	lda !x-
	cmp !x1-
	bcc !for_body1+
	bne !for_out1+ // [114] (OPTIMIZED)
!for_body1:
	lda !x-
	sta $FA
	jsr _mcplot
	inc !x-
	jmp !for_top1-
!for_out1:
	rts


!else1:
!if_out1:
	lda !x0-
	cmp !x1-
	bne !else1+
!if_body1:
	// vertical line
	lda !y0-
	cmp !y1-
	bcc !else2+ // [8] (OPTIMIZED)
	beq !else2+ // [3] (OPTIMIZED)
!if_body2:
	jsr bres_swapxy
!else2:
!if_out2:
!for_init1:
	ldx !x0-
	stx $FA
	lda !y0-
	sta !y-
!for_top1:
	lda !y-
	cmp !y1-
	bcc !for_body1+
	bne !for_out1+ // [114] (OPTIMIZED)
!for_body1:
	lda !y-
	sta $FC
	jsr _mcplot
	inc !y-
	jmp !for_top1-
!for_out1:
	rts


	
!else1:
!if_out1:
	lda !x1-
	sec 
	sbc !x0-
	sta !dx-
	lda #$00
	sta !acc-
		// y0 < !y1-
	lda !y0-
	cmp !y1-
	bcc !if_body1+
	jmp !else1+ // [172] (CANNOT BE OPTIMIZED)
!if_body1:
	lda !y1-
	sec 
	sbc !y0-
	sta !dy-
	lda !dx-
	cmp !dy-
	bcc !else2+
!if_body2:
	lda !y0-
	sta !y-
	ldx !dy-
	inx
	stx !dxm-
!for_init1:
	lda !x0-
	sta !x-
!for_top1:
	lda !x-
	cmp !x1-
	bcs !for_out1+
!for_body1:
	lda !x-
	sta $FA
	lda !y-
	sta $FC
	jsr _mcplot
	lda !acc-
	clc
	adc !dxm-
	sta !acc-
	cmp !dx-
	bcc !else3+ // [13] (OPTIMIZED)
!if_body3:
	inc !y-
	lda !acc-
	sec 
	sbc !dx-
	sta !acc-
!else3:
!if_out3:
	inc !x-
	jmp !for_top1-
!for_out1:
	jmp !if_out2+
!else2:
	lda !x0-
	sta !x-
	ldx !dx-
	inx
	stx !dym-
!for_init1:
	lda !y0-
	sta !y-
!for_top1:
	lda !y-
	cmp !y1-
	bcs !for_out1+
!for_body1:
	lda !x-
	sta $FA
	lda !y-
	sta $FC
	jsr _mcplot
	
	lda !acc-
	clc
	adc !dym-
	sta !acc-
	cmp !dy-
	bcc !else3+ // [13] (OPTIMIZED)
!if_body3:
	inc !x-
	lda !acc-
	sec 
	sbc !dy-
	sta !acc-
!else3:
!if_out3:
	inc !y-
	jmp !for_top1-
!for_out1:
!if_out2:
	jmp !if_out1+
!else1:
	// y0 >= !y1-
	lda !y0-
	sec 
	sbc !y1-
	sta !dy-
	lda !dx-
	cmp !dy-
	bcc !else2+
!if_body2:
	// not steep
	lda !y1-
	sta !y-
	ldx !dy-
	inx
	stx !dxm-
!for_init1:
	lda !x1-
	sta !x-
!for_top1:
	lda !x-
	cmp !x0-
	beq !for_out1+
!for_body1:
	lda !x-
	sta $FA
	lda !y-
	sta $FC
	jsr _mcplot
	lda !acc-
	clc
	adc !dxm-
	sta !acc-
	cmp !dx-
	bcc !else3+ // [13] (OPTIMIZED)
!if_body3:
	inc !y-
	lda !acc-
	sec 
	sbc !dx-
	sta !acc-
!else3:
!if_out3:
	dec !x-
	jmp !for_top1-
!for_out1:
	jmp !if_out2+
!else2:
	// steep
	lda !x0-
	sta !x-

	ldx !dx-
	inx
	stx !dym-
!for_init1:
	lda !y0-
	sta !y-
!for_top1:
	lda !y-
	cmp !y1-
	beq !for_out1+
!for_body1:
	lda !x-
	sta $FA
	lda !y-
	sta $FC
	jsr _mcplot
	lda !acc-
	clc
	adc !dym-
	sta !acc-
	cmp !dy-
	bcc !else3+ // [13] (OPTIMIZED)
!if_body3:
	inc !x-
	lda !acc-
	sec 
	sbc !dy-
	sta !acc-
!else3:
!if_out3:
	dec !y-
	jmp !for_top1-
!for_out1:
!if_out2:
!if_out1:
	rts

bres_swapxy:
	ldx !x0-
	ldy !x1-
	sty !x0-
	stx !x1-

	ldx !y0-
	ldy !y1-
	sty !y0-
	stx !y1-
	rts
