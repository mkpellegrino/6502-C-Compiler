 //  Variable Labels
.label general8bit = $0334
.label portA = $0335
.label btnPressA = $0336
.label north = $0337
.label south = $0338
.label east = $0339
.label west = $033A
* = $0801
BasicUpstart($080D)
* = $080D
	lda #$01
	sta general8bit
	lda $02
	pha 
	lda $03
	pha 
	php 
	clc 
LBL1L1:			 // Top of WHILE Loop
	lda general8bit // $0334
	cmp #$00
	.byte $D0, $03 // BNE +3
	jmp LBL1L3 // if z==1 jump to ELSE
	jsr shortcls
	jsr getJoystickA
	lda $02
	pha 
	lda $03
	pha 
	php 
	clc 
	lda btnPressA // $0336
	cmp #$00
	.byte $F0, $03 // BEQ +3
	jmp LBL2L3 // jump to ELSE
	lda $02
	pha 
	lda $03
	pha 
	lda #<STRLBL0
	sta $02
	lda #>STRLBL0
	sta $03
	jsr PRN
	pla 
	sta $03
	pla 
	sta $02
LBL2L3:
	clc 
	lda north // $0337
	cmp #$00
	.byte $F0, $03 // BEQ +3
	jmp LBL2L8 // jump to ELSE
	lda $02
	pha 
	lda $03
	pha 
	lda #<STRLBL1
	sta $02
	lda #>STRLBL1
	sta $03
	jsr PRN
	pla 
	sta $03
	pla 
	sta $02
LBL2L8:
	clc 
	lda south // $0338
	cmp #$00
	.byte $F0, $03 // BEQ +3
	jmp LBL2L13 // jump to ELSE
	lda $02
	pha 
	lda $03
	pha 
	lda #<STRLBL2
	sta $02
	lda #>STRLBL2
	sta $03
	jsr PRN
	pla 
	sta $03
	pla 
	sta $02
LBL2L13:
	clc 
	lda west // $033A
	cmp #$00
	.byte $F0, $03 // BEQ +3
	jmp LBL2L18 // jump to ELSE
	lda $02
	pha 
	lda $03
	pha 
	lda #<STRLBL3
	sta $02
	lda #>STRLBL3
	sta $03
	jsr PRN
	pla 
	sta $03
	pla 
	sta $02
LBL2L18:
	clc 
	lda east // $0339
	cmp #$00
	.byte $F0, $03 // BEQ +3
	jmp LBL2L23 // jump to ELSE
	lda $02
	pha 
	lda $03
	pha 
	lda #<STRLBL4
	sta $02
	lda #>STRLBL4
	sta $03
	jsr PRN
	pla 
	sta $03
	pla 
	sta $02
LBL2L23:
	plp 
	pla 
	sta $03
	pla 
	sta $02
	jmp LBL1L1 // jump to top of WHILE loop
LBL1L3:
	plp 
	pla 
	sta $03
	pla 
	sta $02
	rts 

getJoystickA:
	lda $DC00
	sta portA // 0335
	lda #$10
	and $0335
	sta btnPressA // 0336
	lda #$01
	and $0335
	sta north // 0337
	lda #$02
	and $0335
	sta south // 0338
	lda #$04
	and $0335
	sta west // 033A
	lda #$08
	and $0335
	sta east // 0339
	rts 

shortcls:
	lda #$93
	jsr $FFD2
	rts 
PRN:
	ldy #$00
PRN_LOOP:
	lda ($02),Y
	beq PRN_END
	jsr $FFD2
	iny 
	jmp PRN_LOOP
PRN_END:
	rts 
 
STRLBL0: // "FIRE "
	.byte  $46, $49, $52, $45, $20, $00
STRLBL1: // "N"
	.byte  $4E, $00
STRLBL2: // "S"
	.byte  $53, $00
STRLBL3: // "W"
	.byte  $57, $00
STRLBL4: // "E"
	.byte  $45, $00
