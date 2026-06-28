// setScreenMode( uint m )
// 0: Standard Character Mode
// 1: Multicolor Character Mode
// 2: Standard Bitmap Mode
// 3: Multicolor Bitmap Mode
// 4: Extended Background Color Mode
// 5: Extended Background Color Multicolor Character Mode (invalid)
// 6: Extended Background Color Standard Bitmap Mode (invalid)
// 7: Extended Background Color Multicolor Bitmap Mode (invalid)

// This only needs to be used if you're switching back and forth
// between screen modes multiple times, otherwise you can hard code it.

// Control Register 1
!mem0:	.byte $00
// Control Register 2
!mem1:	.byte $00
setScreenMode:
	pla 
	tax 
	pla
	tay
	
	pla 
	asl
	asl
	asl
	asl
	sta !arg0+ +1
	sta !arg0++ +1
	
	tya 
	pha 
	txa 
	pha

	// get the current values and clear out ECM, BMM, and MCM
	lda $D011
	and #$9F
	sta !mem0-

	lda $D016
	and #$EF
	sta !mem1-
	
!arg0:	lda #$00 // <<-- self modifyied cody
	and #$60
	ora !mem0-
	sta $D011

!arg0:	lda #$00 // <<-- self modifyied cody
	and #$10
	ora !mem1-
	sta $D016

	rts
