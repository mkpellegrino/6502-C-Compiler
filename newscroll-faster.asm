 //  Variable Labels
.label scrollindex = $2000
.label D016value = $2001
* = $0801
BasicUpstart($080E)
* = $080E
	lda #$00
	sta scrollindex
	
	lda $D016           // 38 Column Mode
	and #$F7
	sta D016value
	sta $D016

	// setup the first int routine
	// at scanline #$82
	sei 
	lda #$7F
	sta $DC0D
	sta $DD0D
	lda #$01
	sta $D01A
	lda #$82
	sta $D012
	lda $D011
	and #$7F
	sta $D011
	lda #>scrollTopHalfOfScreen
	sta $0315
	lda #<scrollTopHalfOfScreen
	sta $0314
	cli 
	rts

	
	
scrollTopHalfOfScreen:

	// Ack
	asl $D019

	// Get the XScroll and
	// add the current index to it
	lda $D016
	and #$F8
	clc 
	adc scrollindex
	sta D016value
	sta $D016

	

	// Top of IF statement
	// if Memory (820 dec) is 1, scroll Right
	lda $0334	
	cmp #$01	
	bne LBL1L3 //                        (branch to ELSE)

	// Top of IF statement
	// if xscroll is !=0 branch out of IF
	ldx scrollindex                    //
	bne LBL2L3                         //
	
	// memcopy                         //
	jsr moveTopL2R                     //

	// increase the scroll index   <---//
LBL2L3:
	inc scrollindex
	lda #$07
	and scrollindex
	sta scrollindex
	jmp LBL1L4

	//                                              ELSE
LBL1L3:
	// Top of IF statement
	// if xscroll index is 7 perform memcopy	
	lda scrollindex
	cmp #$07
	bne LBL2L8   // branch out of IF

	// memcopy
	jsr moveTopR2L

	// Subtract 1 from Scroll Index
LBL2L8:
	dec scrollindex
	lda #$07
	and scrollindex
	sta scrollindex

	// setup next interrupt routine
	// at scan line: #$82
LBL1L4:
	sei 
	lda #$7F
	sta $DC0D
	sta $DD0D
	lda #$01
	sta $D01A
	lda #$82
	sta $D012
	lda $D011
	and #$7F
	sta $D011
	lda #>scrollBottomHalfOfScreen
	sta $0315
	lda #<scrollBottomHalfOfScreen
	sta $0314
	cli 
	jmp $EA31


	// Doesn't Actually Scroll Bottom Half of Screen
scrollBottomHalfOfScreen:

	// ack
	asl $D019
	
	// set X Scroll to 0
	lda #$00	
	sta $D016

	// set up next interrupt routine
	// @ scanline #$FF
	sei 
	lda #$7F
	sta $DC0D
	sta $DD0D
	lda #$01
	sta $D01A
	lda #$FF
	sta $D012
	lda $D011
	and #$7F
	sta $D011
	lda #>scrollTopHalfOfScreen
	sta $0315
	lda #<scrollTopHalfOfScreen
	sta $0314
	cli 
	jmp $EA31


	// Mem Copy for scrolling Right to Left
moveTopR2L:

	// Temporarily store the Left column
	lda $0400
	pha
	lda $0428
	pha
	lda $0450
	pha
	lda $0478
	pha
	lda $04A0
	pha
	lda $04C8
	pha
	lda $04F0
	pha
	lda $0518
	pha
	lda $0540
	pha
	lda $0568
	pha
	ldx #$00
!:
	lda $0401,X
	sta $0400,X
	lda $0429,X
	sta $0428,X
	lda $0451,X
	sta $0450,X
	lda $0479,X
	sta $0478,X
	lda $04A1,X
	sta $04A0,X
	lda $04C9,X
	sta $04C8,X
	lda $04F1,X
	sta $04F0,X
	lda $0519,X
	sta $0518,X
	lda $0541,X
	sta $0540,X
	lda $0569,X
	sta $0568,X
	inx
	cpx #$27
	bne !-

	// put what _used_ to be in the left column in
	// the right column
	pla
	sta $058F
	pla
	sta $0567
	pla
	sta $053F
	pla
	sta $0517
	pla
	sta $04EF
	pla
	sta $04C7
	pla
	sta $049F
	pla
	sta $0477
	pla
	sta $044F
	pla
	sta $0427
	rts


	// Mem Copy for scrolling Left to Right
moveTopL2R:

	// temp. store right column
	lda $0427
	pha
	lda $044F
	pha
	lda $0477
	pha
	lda $049F
	pha
	lda $04C7
	pha
	lda $04EF
	pha
	lda $0517
	pha
	lda $053F
	pha
	lda $0567
	pha
	lda $058F
	pha
	ldx #$27
!:
	lda $03FF,X
	sta $0400,X
	lda $0427,X
	sta $0428,X
	lda $044F,X
	sta $0450,X
	lda $0477,X
	sta $0478,X
	lda $049F,X
	sta $04A0,X
	lda $04C7,X
	sta $04C8,X
	lda $04EF,X
	sta $04F0,X
	lda $0517,X
	sta $0518,X
	lda $053F,X
	sta $0540,X
	lda $0567,X
	sta $0568,X
	dex
	bne !-

	// put what _used_ to be in right column into
	// left column
	pla
	sta $0568
	pla
	sta $0540
	pla
	sta $0518
	pla
	sta $04F0
	pla
	sta $04C8
	pla
	sta $04A0
	pla
	sta $0478
	pla
	sta $0450
	pla
	sta $0428
	pla
	sta $0400
	rts 
