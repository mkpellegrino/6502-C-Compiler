.label SETNAM = $FFBD
.label SETFLS = $FFBA
.label OPEN   = $FFC0
.label CHKOUT = $FFC9
.label CHKIN  = $FFC6
.label READST = $FFB7
.label CLOSE  = $FFC3
.label CLRCHN = $FFCC
.label CHROUT = $FFD2
.label CHRIN  = $FFCF	

.label spriteaddr = $3000 // block 192

* = $033C
	lda #07
	ldx #<fname
	ldy #>fname
	jsr SETNAM

	lda #$03
	ldx #$08
	ldy #$03
	jsr SETFLS

	jsr OPEN

	
	ldx #$03
	jsr CHKIN


	lda #<spriteaddr
	sta $02
	lda #>spriteaddr
	sta $03
	
	ldy #$00
topofloop:
	tya
	pha
	jsr CHRIN
	tax
	pla
	tay
	txa
	sta ($02),Y
	iny
	cpy #$3F
	bne topofloop

	
	// close the file
	lda #$03
	jsr $FFC3
	jsr $FFCC

	// turn on sprite #0
	lda #$01
	sta $D015

	// set an x and a y
	lda #$64
	sta $D000
	sta $D001

	// set the point to #192 (
	lda #$C0
	sta $07F8
	
	rts

fname:
	//    A   B   C   ,   S   ,   R	
	.byte 65, 66, 67, 44, 83, 44, 82


