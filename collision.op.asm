.label location = $2004

.label x = $2000
.label y = $2001
.label timer = $2002
.label collisiontracker = $2003
.label sprite1 = $2006
.label saddr = $2008
.label addr = $200A
.label c = $200C
.label coll = $200D
* = $0801
BasicUpstart($080D)
* = $080D
	jsr CLS
	lda #$50
	sta x
	lda #$E6
	sta y
	lda #$00
	sta timer
	sta collisiontracker
	lda #$0A
	ldx #$04
	sta location
	stx location +1
	lda #$C0
	sta $07F8
	
	clc 
	ldx #$17
	ldy #$14
	jsr $FFF0
	
	lda #<LBL1L0
	sta sprite1
	sta saddr
	lda #>LBL1L0
	sta sprite1 +1
	sta saddr +1	

	lda #$00
	ldx #$30
	sta addr
	stx addr +1
	
LBL1L2:	lda addr +1
	cmp #$30
	bne !+
	lda addr
	cmp #$40
!:	bcs LBL1L5
	lda saddr
	ldx saddr +1
	sta !+
	stx !++
	
	.byte $AD // <-- LDA Absolute
!:	.byte $00 // lo byte
!:	.byte $00 // hi byte
	
	ldy addr
	sty !+
	ldy addr +1
	sty !++
	
	.byte $8D // <-- STA absolute
!:	.byte $00
!:	.byte $00

	clc 
	lda saddr
	adc #$01
	sta saddr
	lda saddr +1
	adc #$00
	sta saddr +1

	clc 
	lda addr
	adc #$01
	sta addr
	lda addr +1
	adc #$00
	sta addr +1
	jmp LBL1L2
	
LBL1L5:	lda #$01
	sta $D015
	lda x
	sta $D000
	lda y
	sta $D001
	lda #$FE
	and $D010
	sta $D010
	lda $CB
	sta c

LBL1L7: // Top of WHILE Loop
	lda c
	cmp #$3E
	beq LBL1L9

	lda location
	sta !+
	lda location+1
	sta !++
	
	lda #$01
	.byte $8D // <-- STA absolute
!:	.byte $00
!:	.byte $00

// Top of IF statement
	lda timer
	cmp #$00
	bne LBL3L2 // jump to ELSE

	jsr checkLeft
	jsr checkRight
	jsr bkgcoll
	
	lda location
	sta !+
	lda location+1
	sta !++
	
	lda #$20
	.byte $8D // <-- STA absolute
!:	.byte $00
!:	.byte $00
	
	clc 
	lda #$28
	adc location
	sta location
	
	lda #$00
	adc location +1
	sta location +1
	
// Top of IF statement
	lda location +1
	cmp #$07
	bne !+
	lda location
	cmp #$E7
!:	bcc LBL3L2
	beq LBL3L2

	lda #$0A
	ldx #$04
	sta location
	stx location +1
LBL3L2:	inc timer
	lda $CB
	sta c
	jmp LBL1L7
LBL1L9:	lda #$00
	sta $D015
	jsr clearkb
	rts

bkgcoll:lda $D01F // MOB-Background Collision Register
	and #$01
	sta coll
	
	clc 
	ldx #$01
	ldy #$01
	jsr $FFF0

// Top of IF statement
	lda coll
	cmp #$00
	bcc LBL1L12
	beq LBL1L12

	ldx $02
	lda $03
	pha 
	lda #<STRLBL0
	sta $02
	lda #>STRLBL0
	jmp !+
LBL1L12:ldx $02
	lda $03
	pha 
	lda #<STRLBL1
	sta $02
	lda #>STRLBL1
	
!:	sta $03
	jsr PRN
	pla 
	sta $03
	stx $02
LBL1L13:rts
	
checkLeft:

// Top of IF statement
	lda c
	cmp #$1E
	bne LBL2L6

// Top of IF statement
	lda x
	cmp #$17
	bcc LBL2L6
	beq LBL2L6

	lda x
	sec 
	sbc #$02
	sta x
	sta $D000
	
	lda #$FE
	and $D010
	sta $D010
LBL2L6:	rts
	
checkRight:
// Top of IF statement
	lda c
	cmp #$26
	bne LBL2L10

// Top of IF statement
	lda x
	cmp #$F0
	bcs LBL2L10

	lda x
	clc 
	adc #$02
	sta x
	sta $D000
	lda #$FE
	and $D010
	sta $D010
LBL2L10:rts
	
clearkb:lda #$00
	sta $C6
	jsr $FFE4
	rts
	
CLS:	lda #$20
	ldx #$00
!:	sta $0400,X
	sta $0500,X
	sta $0600,X
	sta $06E8,X
	dex 
	bne !-
	rts 

PRN:	ldy #$00
!:	lda ($02),Y
	beq !+
	jsr $FFD2
	iny 
	jmp !-
!:	rts

STRLBL0: .text "COLLISION"
	.byte $00
	
STRLBL1: .text "         "

LBL1L0: .byte $00, $18, $00, $00, $18, $00, $00, $24, $00, $00, $24, $00, $00, $42, $00, $00, $42, $00, $00, $99, $00, $00, $99, $00, $00, $99, $00, $11, $18, $88, $12, $00, $48, $14, $00, $28, $18, $00, $18, $10, $00, $08, $20, $00, $04, $40, $00, $02, $40, $66, $02, $3F, $99, $FC, $00, $00, $00, $00, $00, $00, $00, $00, $00
