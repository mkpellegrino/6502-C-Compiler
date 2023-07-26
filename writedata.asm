.label SETNAM = $FFBD
.label SETFLS = $FFBA
.label OPEN   = $FFC0
.label CHKOUT = $FFC9
.label READST = $FFB7
.label CLOSE  = $FFC3
.label CLRCHN = $FFCC
.label CHROUT = $FFD2     

* = $033C
	lda #$07
	ldx #<fname
	ldy #>fname
	jsr SETNAM

	lda #$03
	ldx #$08
	ldy #$03
	jsr SETFLS

	jsr OPEN

	ldx #$03
	jsr CHKOUT

	lda #<data
        sta $02
        lda #>data
        sta $03


	ldy #$00
topofloop:	
	lda ($02),Y
	jsr CHROUT
	iny
	cpy #$3F
	bne topofloop

	// close the file
	lda #$03
	jsr CLOSE
	jsr CLRCHN
	rts

fname:
	//    A   B   C   ,   S   ,   W
	.byte 65, 66, 67, 44, 83, 44, 87

data:	
	.byte 255, 255, 255
	.byte 128,   0,   1
	.byte 128,   0,   1
	.byte 128,   0,   1
	.byte 128,   0,   1
	.byte 128,   0,   1
	.byte 128,   0,   1
	.byte 128,   0,   1
	.byte 128,   0,   1
	.byte 128,   0,   1
	.byte 128,   0,   1
	.byte 128,   0,   1
	.byte 128,   0,   1
	.byte 128,   0,   1
	.byte 128,   0,   1
	.byte 128,   0,   1
	.byte 128,   0,   1
	.byte 128,   0,   1
	.byte 128,   0,   1
	.byte 128,   0,   1
	.byte 255, 255, 255
