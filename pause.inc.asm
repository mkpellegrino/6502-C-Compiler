!mem:	.byte $00
pause:	
	lda #$00
	sta $C6
	jsr $FFE4
	sta !mem-
!:
	lda !mem- // this $00 will change
	cmp #$00
	bne !+
	jsr $FFE4
	sta !mem-
	jmp !-
!:	rts 
