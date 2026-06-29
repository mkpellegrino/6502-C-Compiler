
// compares 2 buffers <= 255 bytes
// uint cmpdata( addr1, addr2, size );
// returns 0 if equal
// otherwise it returns the number of
// bytes from the right at which the
// 2 buffers were NOT equal	
!rx:	.byte $00 // return address
!ry:	.byte $00 // return address
cmpdata:
	pla
	sta !rx-
	pla
	sta !ry-
	
	pla
	tax // size
	
	pla
	sta !arg0+ +2
	pla
	sta !arg0+ +1
	
	pla
	sta !arg1+ +2
	pla
	sta !arg1+ +1
	
!:	dex
	
!arg0:	.byte $BD // <-- LDA abs,X
	.byte $00
	.byte $00

!arg1:	.byte $DD // <-- CMP abs,X
	.byte $00
	.byte $00

	bne !+
	cpx #$00
	bne !-

!:	txa // return value
	pha
	// vvv--- can be optimised out ---vvv
	lda #$01 // return size
	pha
	// ^^^--- --- -- --------- --- ---^^^
	lda !ry-
	pha
	lda !rx-
	pha
	rts
