!lv_mem0:
	.byte $00
keyup:	
	lda #$00
	sta $C6
	jsr $FFE4
	lda $CB
	sta !lv_mem0-
!:	
	lda !lv_mem0-
	cmp #$40
	beq !+
	lda $CB
	sta !lv_mem0-
	jmp !-
!:
	rts
