	// sets the sign byte at $6F (zp)
	// if FAC & ARG have the same sign then
	// this is a #$00, otherwise #$80
fpsigns:
	lda $6A
	and #$80
	sta $6F
	lda $62
	and #$80
	eor $6F
	sta $6F
	rts
