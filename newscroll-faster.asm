 //  Variable Labels
.label scrollindex = $2000
.label D016value = $2001
* = $0801
BasicUpstart($080E)
* = $080E
	lda #$00
	sta scrollindex
// 38 column mode
	lda $D016
	and #$F7
	sta D016value
//	lda D016value
	sta $D016
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
scrollBottomHalfOfScreen:
	asl $D019
	lda $D016
	and #$F8
	sta D016value
	clc 
	//lda D016value
	adc scrollindex
	sta D016value
	//lda D016value
	sta $D016
	php 
	clc 
LBL1L0:
LBL1L1:			 // Top of IF statement
	lda $0334
	cmp #$01
	beq !_skip+
	jmp LBL1L3 // jump to ELSE
!_skip:
LBL1L2:
	php 
	clc 
LBL2L0:
LBL2L1:			 // Top of IF statement
	ldx scrollindex
	beq !_skip+
	jmp LBL2L3 // jump to ELSE
!_skip:
LBL2L2:
	jsr moveTopL2R
LBL2L3:
LBL2L4:
	plp 
	inc scrollindex
	lda #$07
	and scrollindex
	sta scrollindex
	jmp LBL1L4
LBL1L3:
	php 
	clc 
LBL2L5:
LBL2L6:			 // Top of IF statement
	lda scrollindex
	cmp #$07
	beq !_skip+
	jmp LBL2L8 // jump to ELSE
!_skip:
LBL2L7:
	jsr moveTopR2L
LBL2L8:
LBL2L9:
	plp 
	dec scrollindex
	lda #$07
	and scrollindex
	sta scrollindex
LBL1L4:
	plp 
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
	jmp $EA31
scrollTopHalfOfScreen:
	asl $D019
	lda #$00
	sta $D016
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
	lda #>scrollBottomHalfOfScreen
	sta $0315
	lda #<scrollBottomHalfOfScreen
	sta $0314
	cli 
	jmp $EA31
moveTopR2L:
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
	txa
	cmp #$27
	bne !-
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
moveTopL2R:
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
