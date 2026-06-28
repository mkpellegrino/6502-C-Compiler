// setScreenMode( uint m )
// 0: Standard Character Mode
// 1: Multicolor Character Mode
// 2: Standard Bitmap Mode
// 3: Multicolor Bitmap Mode
// 4: Extended Background Color Mode
// 5: 
// 6: 
// 7: 
// 8:

// This really only needs to be used if you're switching back and forth
// between screen modes lots of times.   otherwise you can hard code it.
setScreenMode:
	pla 
	tax 
	pla
	tay
	
	pla 
	sta !arg0+ +1
	
	tya 
	pha 
	txa 
	pha
	
// 0: Standard Character Mode	
!arg0:	lda #$00
	bne !+

	// clear ECM & BMM
	lda #$9F
	and $D011
	sta $D011	

	// clear MCM
	lda #$EF
	and $D016
	sta $D016
	rts

	
// 1: Multicolor Character Mode	
!:	cmp #$01
	bne !+

	// clear ECM & BMM
	lda #$9F
	and $D011
	sta $D011

	// set MCM
	lda #$10
	ora $D016
	sta $D016
	rts


// 2: Standard Bitmap Mode
!:	cmp #$02
	bne !+

	// clear ECM
	lda #$BF
	and $D011
	// set BMM
	ora #$20
	sta $D011

	// clear MCM
	lda #$EF
	and $D016
	sta $D016
	rts


// 3: Multicolor Bitmap Mode
!:	cmp #$03
	bne !+
	
	// clear ECM
	lda #$BF
	and $D011
	// set BMM
	ora #$20
	sta $D011

	// set MCM
	lda #$10
	ora $D016
	sta $D016
	rts


// 4: Extended Background Color Mode
!:	cmp #$04
	bne !+

	// set ECM
	lda $D011
	ora #$40
	// clear BMM
	and #$DF
	sta $D011

	// clear MCM
	lda #$EF
	and $D016
	sta $D016
	
!:

	rts
