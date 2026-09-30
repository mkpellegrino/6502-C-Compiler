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

!col:	.byte $00

	
segment:
bres:
	pla
	tax
	pla
	tay
	
	pla
	sta !col- // colour
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

	ldx !x0-
	cpx !x1-
	bne !else1+ // [120] (OPTIMIZED)
!cond:	// (&&)
	ldy !y0-
	cpy !y1-
	bne !else1+ // hand optimized
!cond_group_end:
!if_body1:
	// it's just a single point
	//ldx !x0-
	//ldy !y0-
	lda !col-
	jsr mplot
	rts
!else1:
//!if_out1:
// plot the endpoints
	ldx !x1-
	ldy !y1-
	lda !col-
	jsr mplot
	
	ldx !x0-
	ldy !y0-
	lda !col-
	jsr mplot
	
	lda !x0-
	cmp !x1-
	bcc !else1+ // [8] (OPTIMIZED)
	beq !else1+ // [3] (OPTIMIZED)
	// swap coordinates
	jsr bres_swapxy
!else1:
//!if_out1:
	lda !y0-
	cmp !y1-
	bne !else1+
!if_body1:

	// horizontal line
!for_init1:
	//ldy !y0-	
	lda !x0-
	sta !x-
!for_top1:
	ldx !x-
	cpx !x1-
	bcc !for_body1+
	bne !for_out1+ // [114] (OPTIMIZED)
!for_body1:
	//ldx !x-
	lda !col-
	ldy !y0-	
	jsr mplot
	inc !x-
	jmp !for_top1-
!for_out1:
	rts


!else1:
//!if_out1:
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
	//ldx !x0-
	lda !y0-
	sta !y-
!for_top1:
	ldy !y-
	cpy !y1-
	bcc !for_body1+
	bne !for_out1+ // [114] (OPTIMIZED)
!for_body1:
	//ldy !y-
	lda !col-
	ldx !x0-
	jsr mplot
	inc !y-
	jmp !for_top1-
!for_out1:
	rts


	
!else1:
//!if_out1:
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
	ldx !x-
	cpx !x1-
	bcs !if_out2+
//	bcs !for_out1+
!for_body1:
	ldy !y-
	lda !col-
	jsr mplot
	
	lda !acc-
	clc
	adc !dxm-
	sta !acc-
	cmp !dx-
	bcc !else3+ // [13] (OPTIMIZED)
!if_body3:
	inc !y-
	sec 
	sbc !dx-
	sta !acc-
!else3:
!if_out3:
	inc !x-
	jmp !for_top1-

	
//!for_out1:
//	jmp !if_out2+
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
	ldy !y-
	cpy !y1-
	bcs !for_out1+
!for_body1:
	ldx !x-
	lda !col-
	jsr mplot
	
	lda !acc-
	clc
	adc !dym-
	sta !acc-
	cmp !dy-
	bcc !else3+ // [13] (OPTIMIZED)
!if_body3:
	inc !x-
	sec 
	sbc !dy-
	sta !acc-
!else3:
!if_out3:
	inc !y-
	jmp !for_top1-
!for_out1:
!if_out2:
	rts
	//jmp !if_out1+
!else1:
	// y0 >= !y1-
	lda !y0-
	sec 
	sbc !y1-
	sta !dy-

	// since !dy- is already in a
	// could we do this as a < instead
	// of a >= ?
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
	ldx !x-
	cpx !x0-
	//beq !for_out1+
	beq !if_out2+
!for_body1:
	ldy !y-
	lda !col-
	jsr mplot
	
	lda !acc-
	clc
	adc !dxm-
	sta !acc-
	cmp !dx-
	bcc !else3+ // [13] (OPTIMIZED)
!if_body3:
	inc !y-
	sec 
	sbc !dx-
	sta !acc-
!else3:
!if_out3:
	dec !x-
	jmp !for_top1-


	
//!for_out1:
//	jmp !if_out2+
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
	ldy !y-
	cpy !y1-
	beq !for_out1+
!for_body1:
	ldx !x-
	lda !col-
	jsr mplot
	
	lda !acc-
	clc
	adc !dym-
	sta !acc-
	cmp !dy-
	bcc !else3+ // [13] (OPTIMIZED)
!if_body3:
	inc !x-
	sec 
	sbc !dy-
	sta !acc-
!else3:
!if_out3:
	dec !y-
	jmp !for_top1-


	
!for_out1:
!if_out2:
//!if_out1:
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


	// mplot.inc.asm
	// michael k. pellegrino
	// 
	
_mplot_pand:	.byte $3F, $CF, $F3, $FC
_mplot_por:	.byte $C0, $30, $0C, $03
_mplot_colk:   .byte $00, $55, $AA, $FF
	
_mplot_mplotrowL: .byte $00, $01, $02, $03, $04, $05, $06, $07, $40, $41, $42, $43, $44, $45, $46, $47, $80, $81, $82, $83, $84, $85, $86, $87, $C0, $C1, $C2, $C3, $C4, $C5, $C6, $C7, $00, $01, $02, $03, $04, $05, $06, $07, $40, $41, $42, $43, $44, $45, $46, $47, $80, $81, $82, $83, $84, $85, $86, $87, $C0, $C1, $C2, $C3, $C4, $C5, $C6, $C7, $00, $01, $02, $03, $04, $05, $06, $07, $40, $41, $42, $43, $44, $45, $46, $47, $80, $81, $82, $83, $84, $85, $86, $87, $C0, $C1, $C2, $C3, $C4, $C5, $C6, $C7, $00, $01, $02, $03, $04, $05, $06, $07, $40, $41, $42, $43, $44, $45, $46, $47, $80, $81, $82, $83, $84, $85, $86, $87, $C0, $C1, $C2, $C3, $C4, $C5, $C6, $C7, $00, $01, $02, $03, $04, $05, $06, $07, $40, $41, $42, $43, $44, $45, $46, $47, $80, $81, $82, $83, $84, $85, $86, $87, $C0, $C1, $C2, $C3, $C4, $C5, $C6, $C7, $00, $01, $02, $03, $04, $05, $06, $07, $40, $41, $42, $43, $44, $45, $46, $47, $80, $81, $82, $83, $84, $85, $86, $87, $C0, $C1, $C2, $C3, $C4, $C5, $C6, $C7, $00, $01, $02, $03, $04, $05, $06, $07

_mplot_mplotrowH: .byte $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A1, $A1, $A1, $A1, $A1, $A1, $A1, $A1, $A2, $A2, $A2, $A2, $A2, $A2, $A2, $A2, $A3, $A3, $A3, $A3, $A3, $A3, $A3, $A3, $A5, $A5, $A5, $A5, $A5, $A5, $A5, $A5, $A6, $A6, $A6, $A6, $A6, $A6, $A6, $A6, $A7, $A7, $A7, $A7, $A7, $A7, $A7, $A7, $A8, $A8, $A8, $A8, $A8, $A8, $A8, $A8, $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AA, $AB, $AB, $AB, $AB, $AB, $AB, $AB, $AB, $AC, $AC, $AC, $AC, $AC, $AC, $AC, $AC, $AD, $AD, $AD, $AD, $AD, $AD, $AD, $AD, $AF, $AF, $AF, $AF, $AF, $AF, $AF, $AF, $B0, $B0, $B0, $B0, $B0, $B0, $B0, $B0, $B1, $B1, $B1, $B1, $B1, $B1, $B1, $B1, $B2, $B2, $B2, $B2, $B2, $B2, $B2, $B2, $B4, $B4, $B4, $B4, $B4, $B4, $B4, $B4, $B5, $B5, $B5, $B5, $B5, $B5, $B5, $B5, $B6, $B6, $B6, $B6, $B6, $B6, $B6, $B6, $B7, $B7, $B7, $B7, $B7, $B7, $B7, $B7, $B9, $B9, $B9, $B9, $B9, $B9, $B9, $B9, $BA, $BA, $BA, $BA, $BA, $BA, $BA, $BA, $BB, $BB, $BB, $BB, $BB, $BB, $BB, $BB, $BC, $BC, $BC, $BC, $BC, $BC, $BC, $BC, $BE, $BE, $BE, $BE, $BE, $BE, $BE, $BE
_mplot:
	ldx $FA // X
	ldy $FC // Y
	lda $FD // Colour

	// x is x (0-159)
	// y is y (0-199)
	// a is colour (0-3)
mplot:	sty !_y+ +1
	sta !_c+ +1
	txa
	sta !_x+ +1
	and #$FC
	asl
	tay
	lda #$00
	rol
	tax
	tya
	
!_y:	ldy #$00 // immediate will be overwritten
	clc
	adc _mplot_mplotrowL,Y
	sta !loc+ +1
	sta !loc++ +1
 
	txa
	adc _mplot_mplotrowH,Y
	sta !loc+ +2
	sta !loc++ +2
	
!_x:	lda #$00 // immediate will be overwritten 
	and #$03
	tay
!_c:	ldx #$00 // immediate will be overwritten
	lda _mplot_colk,X
	and _mplot_por,Y
	sta !_byte+ +1
		
!loc:	lda $1234 // address will be overwritten	
	and _mplot_pand,Y
!_byte:	ora #$00 // immediate will be overwritten
!loc:	sta $1234 // address will be overwritten
	
	rts
	

