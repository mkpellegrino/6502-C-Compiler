 //  Variable Labels
.label general8bit = $0005
.label filestatus = $0006
.label ln = $0003
//* = $080D
* = $CEB3
	lda #$00
	sta filestatus

	lda #$02
	ldx #$08
	ldy #$00
	jsr $FFBA	
	lda #$01
	ldx #<STRLBL0
	ldy #>STRLBL0
	jsr $FFBD
	jsr $FFC0
	ldx #$02
	jsr $FFC6
	jsr $FFCF
	jsr $FFCF
!top:	lda filestatus
	cmp #$00
	beq !+
	jmp !myelse+ // jump to ELSE
!:	jsr $FFCF
	jsr $FFCF

	lda $90
	cmp #$00
	bne !+

	jsr $FFCF
	sta ln 
	jsr $FFCF
	sta ln + 1
	
!:	lda $90
	cmp #$00
	bne !bottom+ // jump to ELSE
	lda ln
	sta HTD_IN
	lda ln+1
	sta HTD_IN+1
	jsr WORD2DEC
	ldx #$00
!:	lda HTD_STR,X
	cmp #$30
	bne !+
	inx 
	jmp !-
!:	cpx #$06
	bne !+
	dex 
!:	lda HTD_STR,X
	cmp #$00
	beq !+
	inx 
	jsr $FFD2
	jmp !-
!:	lda #$20
	jsr $FFD2
	jsr $FFCF
	sta general8bit
	lda $90
	sta filestatus
!top:			 // Top of WHILE Loop
	lda filestatus
	cmp #$00
	bne !bottom+
	lda general8bit
	jsr $FFD2

	jsr $FFCF
	sta general8bit
	lda $90
	sta filestatus

	lda general8bit
	cmp #$00
	bne !+ // jump to ELSE
	
	lda #$01
	sta filestatus
!:
	jmp !top- // jump to top of loop
	
!bottom:
	lda #$0D
	jsr $FFD2
	lda $90
	sta filestatus
	jmp !top-- // jump to top of loop
!myelse:
	jsr $FFCC
	lda #$02
	jsr $FFC3
	rts 
HTD_STR:
	.byte $00, $00, $00, $00, $00, $00, $00
// ------------------------------------------------------------
// This chunk of code is by: Andrew Jacobs, 28-Feb-2004
// Taken from: http://6502.org/source/integers/hex2dec-more.htm
// ------------------------------------------------------------
TMP_01:	.byte $00
TMP_02:	.byte $00
HTD_IN:
	.byte $00, $00
HTD_OUT:
	.byte $00, $00, $00
WORD2DEC:		 // 2 Byte Word to Decimal
	pla
	sta TMP_01
	pla 
	sta TMP_02
	sed 
	lda #$00
	sta HTD_OUT
	sta HTD_OUT+1
	sta HTD_OUT+2
	ldx #$10
!:
	asl HTD_IN
	rol HTD_IN+1
	lda HTD_OUT
	adc HTD_OUT
	sta HTD_OUT
	lda HTD_OUT+1
	adc HTD_OUT+1
	sta HTD_OUT+1
	lda HTD_OUT+2
	adc HTD_OUT+2
	sta HTD_OUT+2
	dex 
	bne !-
	cld 
// ------------------------------------------------------------
	lda HTD_OUT
	pha 
	lsr 
	lsr 
	lsr 
	lsr 
	ora #$30
	sta HTD_STR+4
	pla 
	and #$0F
	ora #$30
	sta HTD_STR+5
	lda HTD_OUT+1
	pha 
	lsr 
	lsr 
	lsr 
	lsr 
	ora #$30
	sta HTD_STR+2
	pla 
	and #$0F
	ora #$30
	sta HTD_STR+3
	lda HTD_OUT+2
	pha 
	lsr 
	lsr 
	lsr 
	lsr 
	ora #$30
	sta HTD_STR
	pla 
	and #$0F
	ora #$30
	sta HTD_STR+1
	lda TMP_02
	pha 
	lda TMP_01
	pha 
	rts 

STRLBL0:
	.byte  $24, $00
