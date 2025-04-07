// store the random values here
!mem0:  .byte $00, $00, $00, $00, $00, $00, $00, $00
	.byte $00, $00, $00, $00, $00, $00, $00, $00
	.byte $00, $00, $00, $00, $00, $00, $00, $00
	.byte $00, $00, $00, $00, $00, $00, $00, $00
	.byte $00, $00, $00, $00, $00, $00, $00, $00
	.byte $00, $00, $00, $00, $00, $00, $00, $00
	.byte $00, $00, $00, $00, $00, $00, $00, $00
	.byte $00, $00, $00, $00, $00, $00, $00, $00

!mem1:  .byte $00, $00                                // ptr to rnd values
!mem2:  .byte $00 // flag to tell if the init process has already been run (rndinit)
!mem3:  .byte $00 // rvindex
!mem4:	.byte $00 // mySeedi
!mem5:	.byte $00 // my random return value
mySeed:	
	lda !mem2- // rndinit
	cmp #$00
	bne !+++++

	// SID RNG
	lda #$FF
	sta $D40E
	sta $D40F
	lda #$80
	sta $D412
	
	lda #$00
	sta !mem3-
	sta !mem4-

	lda #<!mem0-
	sta !mem1-
	lda #>!mem0-
	sta !mem1- +1
	
	//lda #$00
	//sta !mem4-
!:			 // Top of FOR Loop
	lda !mem4-
	cmp #$40
	bcs !+++

	clc 
	lda !mem1-
	adc !mem4-
	sta !+
	lda #$00
	adc !mem1- +1
	sta !++
	lda $D41B
	tay 
	.byte $8C	 // <-- STY absolute
!:
	.byte $00
!:
	.byte $00
	jsr shortDelay
	inc !mem4-
	jmp !---
!:
	lda #$01
	sta !mem2-
!:
	rts



	
myRand:
	clc 
	lda !mem1- // ptr (LB) to random values
	
	adc !mem3- // rvindex
	tay
	
	lda #$00
	adc !mem1- +1  // ptr (HB) to rnd values
	tax
		
	lda $02
	pha 
	lda $03
	pha 

	sty $02
	ldy #$00
	stx $03
	lda ($02),Y
	tax

	
	pla 
	sta $03
	pla 
	sta $02

	txa 
	sta !mem5- // the return value
	inc !mem3- // bump the index up by 1
	php 
// top of if
	lda !mem3-  // rvindex
	cmp #$40
	bne !+
	lda #$00
	sta !mem3-
!:

	plp 
	pla 
	tax 
	pla 
	tay 
	lda !mem5-
	pha 
	lda #$01
	pha 
	tya 
	pha 
	txa 
	pha 
	rts 


!mem0:	.byte $00, $00
shortDelay:
	lda #$00
	sta !mem0-
	sta !mem0- +1
	
!:			 // Top of FOR Loop
	lda !mem0- +1
	cmp #$01
	bne !+
	lda !mem0-
	cmp #$FF
!:
	bcs !+

	nop

	// iterator
	clc 
	lda !mem0-
	adc #$01
	sta !mem0-
	lda !mem0- +1
	adc #$00
	sta !mem0- +1
	jmp !--
!:
	rts 
