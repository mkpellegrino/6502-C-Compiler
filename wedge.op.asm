// be sure to type "NEW" before sys 49152
// to install the wedge
* = $C000
	lda $0308
	sta !lv_L+
	lda $0309
	sta !lv_H+

	lda #<routine
	sta $0308
	lda #>routine
	sta $0309

	rts
!lv_L:  .byte $00
!lv_H:  .byte $00	
routine:
	ldy #$01
	lda ($7A),y
	cmp #$26
	bne !skip+
	jsr $0073

	// the routine that runs when the
	// character (#$26 - &) is found
	lda #$04
	sta $03
	tax
	ldy #$00
	sty $02
	lda #$20
!:
	sta ($02),Y
	iny
	bne !-
	inc $03
	dex
	bne !-
!skip:
	jmp (!lv_L-)
