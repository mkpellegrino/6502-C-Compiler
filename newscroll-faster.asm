 //  Variable Labels
.label scrollindex = $2000
.label D016value = $2001
.label c = $2002
.label j = $2004
.label i = $2006
* = $0801
BasicUpstart($080E)
* = $080E

	// Set Scroll Index to 0
	lda #$00
	sta scrollindex

	// 38 Column Mode
	lda $D016           
	and #$F7
	sta $D016
	sta D016value

	// Set Colour Map
	jsr setColours
	
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

	// BG and BDR colours for top
	lda #$00
	sta $D021
	sta $D020

	// Get the XScroll and
	// add the current index to it
	lda $D016
	// also 38 col mode
	and #$F0
	clc 
	adc scrollindex
	sta D016value
	//ora #$08
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


	// BG and BDR colours for botttom
	lda #$06
	sta $D021
	lda #$0E
	sta $D020

	// set X Scroll to 0
	lda #$08	
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

setColours:
	lda #<COLOURMAP
	sta c
	lda #>COLOURMAP
	sta c+1
	lda c // c
	ldx c+1
	sta j
	stx j+1
	lda $02
	pha 
	lda $03
	pha 
	php 
	clc 
LBL1L6:
	lda #$00
	ldx #$D8
	sta i
	stx i+1
LBL1L7:			 // Top of FOR Loop
	lda i+1
	cmp #$D9
	bne !+
	lda i
	cmp #$90
!:
	.byte $B0, $03 // BCS +3
	jmp LBL1L9 // if c==0 jump to BODY
	jmp LBL1L10 // jump out of FOR
LBL1L8:
	clc 
	lda #$01
	adc i
	sta i
	lda #$00
	adc i+1
	sta i+1
	jmp LBL1L7 // jump to top of FOR loop
LBL1L9:
	ldy #$00
	lda j
	ldx j+1
	sta !+
	stx !++
	.byte $AD
!:
	.byte $00
!:
	.byte $00
	sta LBL2L10-2
	lda i
	sta !+
	lda i+1
	sta !++
	lda #$00
	.byte $A9, $00
	.byte $8D // <-- STA absolute
!:
LBL2L10:			 // <-- low byte
	.byte $00
!:
LBL2L11:			 // <-- hi byte
	.byte $00
	clc 
	lda #$01
	adc j
	sta j
	lda #$00
	adc j+1
	sta j+1
	jmp LBL1L8 // jump to iterator
LBL1L10:
	plp 
	pla 
	sta $03
	pla 
	sta $02
	rts 
COLOURMAP: 
	.byte $00, $00, $00, $00, $00, $00, $0B, $0B, $0C, $0C, $0C, $0F, $0F, $01, $01, $01, $01, $01, $01, $01
	.byte $01, $01, $01, $01, $01, $01, $01, $01, $0F, $0F, $0C, $0C, $0C, $0B, $0B, $00, $00, $00, $00, $00

	.byte $00, $00, $00, $00, $00, $00, $0B, $0B, $0C, $0C, $0C, $0F, $0F, $01, $01, $01, $01, $01, $01, $01
	.byte $01, $01, $01, $01, $01, $01, $01, $01, $0F, $0F, $0C, $0C, $0C, $0B, $0B, $00, $00, $00, $00, $00

	.byte $00, $00, $00, $0B, $0B, $0B, $0B, $0B, $0C, $0C, $0F, $01, $01, $01, $01, $01, $01, $01, $01, $01
	.byte $01, $01, $01, $01, $01, $01, $01, $01, $01, $0F, $0C, $0C, $0B, $0B, $0B, $0B, $0B, $00, $00, $00

	.byte $00, $00, $0B, $0B, $0B, $0B, $0B, $0C, $0C, $0C, $0F, $01, $01, $01, $01, $01, $01, $01, $01, $01
	.byte $01, $01, $01, $01, $01, $01, $01, $01, $01, $0F, $0C, $0C, $0C, $0B, $0B, $0B, $0B, $0B, $00, $00

	.byte $00, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $0C, $0C, $0F, $01, $01, $01, $01, $01, $01, $01, $01, $01
	.byte $01, $01, $01, $01, $01, $01, $01, $01, $01, $0F, $0C, $0C, $0B, $0B, $0B, $0B, $0B, $0B, $0B, $00

	.byte $0B, $0B, $0B, $0B, $0C, $0C, $0C, $0C, $0F, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
	.byte $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $0F, $0C, $0C, $0C, $0C, $0B, $0B, $0B, $0B

	.byte $0B, $0B, $0B, $0B, $0C, $0C, $0C, $0C, $0F, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
	.byte $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $0F, $0C, $0C, $0C, $0C, $0B, $0B, $0B, $0B

	.byte $00, $00, $00, $00, $00, $0B, $0B, $0B, $0C, $0C, $0F, $01, $01, $01, $01, $01, $01, $01, $01, $01
	.byte $01, $01, $01, $01, $01, $01, $01, $01, $01, $0F, $0C, $0C, $0B, $0B, $0B, $00, $00, $00, $00, $00

	.byte $00, $00, $00, $00, $00, $0B, $0B, $0B, $0C, $0C, $0F, $01, $01, $01, $01, $01, $01, $01, $01, $01
	.byte $01, $01, $01, $01, $01, $01, $01, $01, $01, $0F, $0C, $0C, $0B, $0B, $0B, $00, $00, $00, $00, $00

	.byte $00, $00, $00, $00, $00, $0B, $0B, $0B, $0C, $0C, $0F, $01, $01, $01, $01, $01, $01, $01, $01, $01
	.byte $01, $01, $01, $01, $01, $01, $01, $01, $01, $0F, $0C, $0C, $0B, $0B, $0B, $00, $00, $00, $00, $00 
