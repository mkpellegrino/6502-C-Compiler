	// converts the keypresses (digits 0-9)
	// into values in A
	// the starting value of A should contain:
	// 38, 3B, 08, 0B, 10, 13, 18, 1B, 20, 23
	// which correspond to the getin value of
	// when the following keys are pressed:
	//  1,  2,  3,  4,  5,  6,  7,  8,  9,  0
getinConvert0to9:
	clc
	lsr
	php
	lsr
	lsr
	plp
	rol
	cmp #$09
	beq !+
	bcc !+
	and #$01
!:	clc
	adc #$01
	cmp #$0A
	bne !+
	lda #$00
!:	rts
