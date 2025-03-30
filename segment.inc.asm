 //  Variable Labels

!lv_colour:	.byte $00 // colour
!lv_y2:		.byte $00 // y2
!lv_x2:		.byte $00 // x2
!lv_y1:		.byte $00 // y1
!lv_x1:		.byte $00 // x1

!lv_dy:		.byte $00, $00// dy
!lv_dx:		.byte $00, $00 // dx

!lv_Z1:		.byte $00, $00 // Z1

!lv_Zy:		.byte $00, $00 // Zy
!lv_Zx:		.byte $00, $00 // Zx

!lv_CASE:	.byte $00 // CASE

!lv_X:		.byte $00 // X
!lv_Y:		.byte $00 // Y
!lv_i:		.byte $00 // i


segment:
	pla 
	tax 
	pla 
	tay 
	pla
	
	sta !lv_colour-
	pla 
	sta !lv_y2-
	pla 
	sta !lv_x2-
	pla 
	sta !lv_y1-
	pla 
	sta !lv_x1-
	
	tya 
	pha 
	txa 
	pha 
// ************************************
	lda #$04
	sta !lv_CASE-
	
// Top of IF statement
	lda !lv_y1-
	cmp !lv_y2-
	bcc !+
	beq !+
// &&
	lda !lv_x1-
	cmp !lv_x2-
	bcc !+ 

	lda #$01
	sta !lv_CASE-
!:
	
// Top of IF statement
	lda !lv_y1-
	cmp !lv_y2-
	bcc !+
	beq !+
	jmp !++
!:
	
// Top of IF statement
	lda !lv_x1-
	cmp !lv_x2-
	bcc !+ // if c==0 jump to ELSE
	beq !+ // if z==1 jump to ELSE ()
	
	lda #$02
	sta !lv_CASE-
!:
// &&
	lda !lv_y1-
	cmp !lv_y2-
	bcc !+
	beq !+

	lda !lv_x1-
	cmp !lv_x2-
	bcs !+ // jump to ELSE ()
	
	lda #$03
	sta !lv_CASE-
!:

	
// Top of IF statement
	lda !lv_CASE-
	cmp #$01
	beq !+
// ||
	lda !lv_CASE-
	cmp #$02
	bne !++ // jump to ELSE ()
!:
// swap (x1,y1) and (x2,y2)
	ldx !lv_x1- // 4 cy
	ldy !lv_x2- // 4 cy
	stx !lv_x2- // 4 cy
	sty !lv_x1- // 4 cy
	ldx !lv_y1- // 4 cy
	ldy !lv_y2- // 4 cy
	stx !lv_y2- // 4 cy
	sty !lv_y1- // 4 cy
!:

	

// Top of IF statement
	lda !lv_CASE-
	cmp #$01
	beq !+
// ||
	lda !lv_CASE-
	cmp #$04
	bne !++ // jump to ELSE ()
!:
	sec 
	lda !lv_x2-
	sbc !lv_x1-
	sta !lv_dx-
	lda #$00
	sta !lv_dx-+1
	
	// moved to here from below
	sta !lv_dy-+1
	
	sec 
	lda !lv_y2-
	sbc !lv_y1-
	sta !lv_dy-
	//lda #$00
	//sta !lv_dy-+1
!:


	
// Top of IF statement
	lda !lv_CASE-
	cmp #$02
	beq !+
// ||
	lda !lv_CASE-
	cmp #$03
	bne !++ // jump to ELSE ()
!:
	sec 
	lda !lv_x2-
	sbc !lv_x1-
	sta !lv_dx-
	lda #$00
	sta !lv_dx-+1
	// moved to here from below
	sta !lv_dy-+1
	sec 
	lda !lv_y1-
	sbc !lv_y2-
	sta !lv_dy-

	//lda #$00
	//sta !lv_dy-+1
	
	lda #$03
	sta !lv_CASE-
!:
	lda !lv_x1-
	sta !lv_X-

	lda !lv_y1-
	sta !lv_Y-

// Top of IF statement   if( x2 == x1 )
	lda !lv_x2-
	cmp !lv_x1-
	beq !+
	jmp !++++ // jump to ELSE (CANNOT OPTIMIZE)
!:

	// Plot a Vertical Line from (x1,y1) to (x1,y2)
	lda !lv_y1-
	sta !lv_i-
!:
// Top of FOR Loop
	lda !lv_i-
	cmp !lv_y2-
	
	beq !+ // jump out of FOR () and then to rts
	
	lda !lv_X-
	sta $FA	
	lda !lv_i-
	sta $FC
	lda !lv_colour-
	sta $FD
	jsr MCPLOT

	inc !lv_i-

	jmp !-
!:
	rts
!:


// Top of IF statement if( y2 == y1 )
	lda !lv_y2-
	cmp !lv_y1-
	beq !+
	jmp !++++ // jump to ELSE (CANNOT OPTIMIZE)
!:
	// Plot a Horiz Line from (x1,y1) to (x2,y1)
	lda !lv_x1-
	sta !lv_i-
!:			 // Top of FOR Loop
	lda !lv_i-
	cmp !lv_x2-
	
	beq !+ // jump out of FOR () and on to rts
	
	lda !lv_i-
	sta $FA

	lda !lv_Y-
	sta $FC

	lda !lv_colour-
	sta $FD

	jsr MCPLOT

	inc !lv_i-

	jmp !-
!:
	rts
!:

// Top of IF statement
	lda !lv_dx-+1
	cmp !lv_dy-+1
	bne !+
	lda !lv_dx-
	cmp !lv_dy-
!:
	bcc !_skip+
	jmp !+++++ // jump to ELSE (CANNOT OPTIMIZE)
!_skip:

// Top of IF statement (if CASE == 3)
	lda !lv_CASE-
	cmp #$03
	bne !+++ // jump to ELSE ()

	lda !lv_y1-
	sta !lv_i-
!:			 // Top of FOR Loop
	lda !lv_i-
	cmp !lv_y2-
	beq !+
	
	sec 
	lda !lv_y1-
	sbc !lv_i-
	
	//sta !lv_Z1-
	sta _MUL16_FB

	ldx #$00
	stx _MUL16_FC

	//sta _MUL16_FB
	lda !lv_dx-
	sta _MUL16_FD
	lda !lv_dx-+1
	sta _MUL16_FE
	jsr MUL16
	
	lda MUL16R
	ldx MUL16R+1
	sta !lv_Zx-
	sta _DIV16_FB
	
	stx _DIV16_FC
	lda !lv_dy-
	sta _DIV16_FD
	lda !lv_dy-+1
	sta _DIV16_FE
	jsr DIV16
	
	lda _DIV16_FB
	
	clc 
	adc !lv_x1-

	sta $FA
	lda !lv_i-
	sta $FC
	lda !lv_colour-
	sta $FD
	jsr MCPLOT

	
	dec !lv_i-
	jmp !-
!:
	rts
	
	// if (dx < dy )
	//  and CASE != 3
!:
	lda !lv_y1-
	sta !lv_i-
!:			 // Top of FOR Loop
	lda !lv_i-
	cmp !lv_y2-	
	beq !+ // jump out of FOR ()
	
	sec 
	lda !lv_i-
	sbc !lv_y1-
	sta !lv_Z1-
	lda #$00
	sta !lv_Z1-+1
	sta _MUL16_FC
	
	lda !lv_Z1-
	sta _MUL16_FB
	
	lda !lv_dx-
	sta _MUL16_FD
	lda !lv_dx-+1
	sta _MUL16_FE
	jsr MUL16
	
	lda MUL16R
	ldx MUL16R+1
	sta !lv_Zx-
	stx !lv_Zx- +1

	sta _DIV16_FB
	stx _DIV16_FC
	
	lda !lv_dy-
	sta _DIV16_FD
	lda !lv_dy- +1
	sta _DIV16_FE
	jsr DIV16
	
	lda _DIV16_FB
	//ldx _DIV16_FC
	
	sta !lv_Zx-
	clc 
	adc !lv_x1-
	sta $FA
	lda !lv_i-
	sta $FC
	lda !lv_colour-
	sta $FD
	jsr MCPLOT
	inc !lv_i-
	jmp !-
	
!:

// Top of IF statement
	lda !lv_CASE-
	cmp #$03
	bne !+++ // jump to ELSE 
	lda !lv_x2-
	sta !lv_i-

!:			 // Top of FOR Loop
	lda !lv_i-
	cmp !lv_x1-
	beq !+ // jump out of FOR ()
	sec 
	lda !lv_x2-
	sbc !lv_i-
	sta !lv_Z1-
	sta _MUL16_FB
	lda #$00
	sta _MUL16_FC
	lda !lv_dy-
	sta _MUL16_FD
	lda !lv_dy-+1
	sta _MUL16_FE
	jsr MUL16
	
	lda MUL16R
	ldx MUL16R+1
	//sta !lv_Zy-
	//stx !lv_Zy-+1

	sta _DIV16_FB
	stx _DIV16_FC
	lda !lv_dx-
	sta _DIV16_FD
	lda !lv_dx-+1
	sta _DIV16_FE
	jsr DIV16

	
	lda _DIV16_FB
	//ldx _DIV16_FC

	// not sure is THIS is needed!
	//sta !lv_Zy-
	//stx !lv_Zy- +1
	
	clc 
	//lda !lv_Zy-
	adc !lv_y2-
	//sta !lv_Y-
	sta $FC

	lda !lv_i-
	sta $FA
	//lda !lv_Y-
	//sta $FC
	lda !lv_colour-
	sta $FD
	jsr MCPLOT
	dec !lv_i-
	jmp !-
!:
	rts
	
!:


	lda !lv_x1-
	sta !lv_i-
!:			 // Top of FOR Loop
	lda !lv_i-
	cmp !lv_x2-
	beq !--- // jump out of FOR ()
	sec 
	lda !lv_i-
	sbc !lv_x1-
	sta !lv_Z1-
	sta _MUL16_FB

	lda #$00
	sta !lv_Z1-+1
	sta _MUL16_FC
	
	lda !lv_dy-
	sta _MUL16_FD
	lda !lv_dy-+1
	sta _MUL16_FE
	jsr MUL16
	
	lda MUL16R
	ldx MUL16R+1

	sta !lv_Zy-
	sta _DIV16_FB
	stx !lv_Zy-+1
	stx _DIV16_FC

	lda !lv_dx-
	sta _DIV16_FD
	lda !lv_dx-+1
	sta _DIV16_FE
	jsr DIV16
	
	lda _DIV16_FB
	clc 
	adc !lv_y1-

	// not sure this next line is needed
	//sta !lv_Y-
	
	sta $FC
	lda !lv_i-
	sta $FA
	
	lda !lv_colour-
	sta $FD
	jsr MCPLOT
	inc !lv_i-
	jmp !-
!:
	rts

