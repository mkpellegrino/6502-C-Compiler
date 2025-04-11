 //  Variable Labels
.label JSportA = $5208
.label JSbtnPressA = $5209
.label JSnorth = $520A
.label JSsouth = $520B
.label JSwest = $520C
.label JSeast = $520D
.label clock = $520E
.label playerx = $5210
.label playery = $5212
.label prizex = $5213
.label prizey = $5215
.label thrust = $5216
.label rtn8bit = $5217
.label midJump = $5218
.label jumpIndex = $5219
.label direction = $521A
.label playerHitCeiling = $521C
.label playerOnFloor = $521D
.label prizeOnFloor = $521E
.label toTheRight = $521F
.label toTheLeft = $5220
.label onFloorRET = $5221
.label xtocheck = $5222
.label ytocheck = $5224
.label byte0 = $5225
.label byte1 = $5226
.label byte2 = $5227
.label digits = $5228
.label letters = $522A
.label zeroText = $522C
.label spaces = $522E
.label plotDigitAddr = $5230
.label wordToPrint = $5232
.label plotNum = $5234
.label general16bit = $5236
.label plotDigitBindex = $5238
.label plotDigitX = $5239
.label plotDigitY = $523A
.label wordSize = $523B
.label general8bit = $523C
.label plotshapeColourValue0110 = $523D
.label plotshapeColourValue11 = $523E
.label textColour = $523F
.label sprite0data = $5240
.label sprite1data = $5242
.label bmpaddr = $5244
.label scraddr = $5246
.label saddr = $5248
.label i = $524A
.label sprptr0 = $524B
.label sprptr1 = $524D
.label floorplan = $524F
.label floorplanptr = $5251
.label floorplanptrX = $5253
.label j = $5255
.label keepPlaying = $5257
.label c = $5258
.label DELAY = $5259
.label RIGHT = $525A
.label C0 = $525C
.label Y2 = $525D
.label X2 = $525E
.label Y1 = $525F
.label X1 = $5260
.label plotshapeSize = $5261
.label plotshapeY = $5262
.label plotshapeX = $5263
.label plotshapeAddr = $5264
.label plotshapeBindex = $5266
.label plotshapeOffset = $5267
.label plotshapeColor1 = $5269
.label plotshapeColors2And3 = $526B
.label plotshapePixels = $526D
.label plotshapeJ = $526F
.label plotshapeI = $5270
.label printWordI = $5271
.label currentChar = $5272
.label plotDigitOffset = $5273
.label plotDigitColor1 = $5275
.label plotDigitColors2And3 = $5277
.label plotDigitPixels = $5279
.label plotDigitI = $527B
.label printUINTarg0 = $527C
.label printWORDarg0 = $527D
* = $0801
BasicUpstart($080D)
* = $080D
	lda #$50
	ldx #$00
	sta playerx
	stx playerx+1
	lda #$64
	sta playery
	//lda #$64
	//ldx #$00
	sta prizex
	stx prizex+1
	//lda #$64
	sta prizey
	//lda #$00
	stx thrust
	stx onFloorRET // $5221
	stx xtocheck // $5222
	stx xtocheck+1 // $5223
	stx ytocheck // $5224
	stx byte0 // $5225
	stx byte1 // $5226
	stx byte2 // $5227
// LETTER/DIGIT DEFINITIONS
	lda #<LBL1L0
	sta digits
	lda #>LBL1L0
	sta digits+1
	lda #<LBL1L1
	sta letters
	lda #>LBL1L1
	sta letters+1
	lda #<LBL1L2
	sta zeroText
	lda #>LBL1L2
	sta zeroText+1
	lda #<STRLBL0
	sta spaces
	lda #>STRLBL0
	sta spaces+1
	lda digits // digits
	ldx digits+1
	sta plotDigitAddr
	stx plotDigitAddr+1
	sta wordToPrint // $5232
	stx wordToPrint+1 // $5233
	sta plotNum // $5234
	stx plotNum+1 // $5235
	sta general16bit // $5236
	stx general16bit+1 // $5237
	sta plotDigitBindex // $5238
	sta plotDigitX // $5239
	sta plotDigitY // $523A
	sta wordSize // $523B
	sta general8bit // $523C
	sta plotshapeColourValue0110 // $523D
	sta plotshapeColourValue11 // $523E
	sta textColour // $523F
	inc textColour
	lda #<LBL1L3
	sta sprite0data
	lda #>LBL1L3
	sta sprite0data+1
	lda #<LBL1L4
	sta sprite1data
	lda #>LBL1L4
	sta sprite1data+1
	jsr saveregs
	lda #$03
	ora $DD02
	sta $DD02
	lda $02
	pha 
	lda #$01
	sta $02
	lda $DD00
	and #$FC
	ora $02
	sta $DD00
	pla 
	sta $02
	lda #$05
	sta $D020
	lda #$00
	sta $D021
// multicolour bitmap mode
	lda #$18
	sta $D018
	lda #$03
	pha 
	jsr setScreenMode
	sei 
	lda $01
	and #$F8
	ora #$06
	sta $01
	sei 
	lda $D018
	and #$08
	asl 
	asl 
	sta $FF
	lda $DD00
	eor #$FF
	and #$03
	asl 
	asl 
	asl 
	asl 
	asl 
	asl 
	adc $FF
	tax 
	lda #$00
	
	cli 
	sta bmpaddr
	stx bmpaddr+1
	lda #$00
	sta $03
	jsr SCRMEM
	pla
	
	clc 
	adc $03
	sta $03
	jsr BNKMEM
	pla

	clc
	adc $03
	sta scraddr+1
	lda #$00
	sta scraddr

	lda #$D8
	pha 
	lda #$05
	pha 
	lda #$04
	pha 
	jsr fillmem
	
	lda #$84
	pha 
	lda #$7D
	pha 
	lda #$04
	pha 
	jsr fillmem
	
	lda #$A0
	pha 
	lda #$20
	pha 
	jsr clearmem
	
// all sprites mono
	lda #$00
	sta $D01C
	ldx #$88
	sta saddr
	stx saddr+1
	
	lda $02
	pha 
	lda $03
	pha	
	php
	
	lda #$00
	sta i
	
!:			 // Top of FOR Loop
	lda i
	cmp #$80
	bcs !++++

	lda $02
	pha 
	lda $03
	pha

	
	clc 
	lda sprite0data
	adc i
	sta $02
	lda #$00
	adc sprite0data+1
	sta $03
	ldy #$00
	lda ($02),Y

	sta !+ +1
	lda saddr
	sta !++
	lda saddr+1
	sta !+++

!:	lda #$00
	
	.byte $8D // <-- STA absolute
!:	.byte $00
!:	.byte $00

	pla 
	sta $03
	pla 
	sta $02


	
	lda #$01
	clc 
	adc saddr
	sta saddr
	lda #$00
	adc saddr+1
	sta saddr+1
	inc i
	jmp !----
!:
	plp 
	pla 
	sta $03
	pla 
	sta $02
	
	clc 
	lda scraddr
	adc #$F8
	sta sprptr0
	lda scraddr+1
	adc #$03
	sta sprptr0+1
	
	clc 
	lda scraddr
	adc #$F9
	sta sprptr1
	lda scraddr+1
	adc #$03
	sta sprptr1+1

	lda sprptr0
	sta !+
	lda sprptr0+1
	sta !++
	lda #$20
	.byte $8D // <-- STA absolute
!:	.byte $00
!:	.byte $00
	lda sprptr1
	sta !+
	lda sprptr1+1
	sta !++
	lda #$21
	.byte $8D // <-- STA absolute
!:	.byte $00
!:	.byte $00
	lda #$01
	sta $D027
	lda #$06
	sta $D028
	lda playerx // (this _wasn't_ working)
	sta $D000
	lda playery
	sta $D001
	
	lda #$01
	bit playerx+1
	beq !+
	//lda #$01
	ora $D010
	jmp !++
!:
	lda #$FE
	and $D010
!:
	sta $D010
	lda prizex // (this _wasn't_ working)
	sta $D002
	lda prizey
	sta $D003
	lda #$01
	bit prizex+1
	beq !+
	lda #$02
	ora $D010
	jmp !++
!:
	lda #$FD
	and $D010
!:
	sta $D010
	lda #$03
	sta $D015
	
	lda #<LBL1L14
	sta floorplan
	sta floorplanptr
	
	lda #>LBL1L14
	sta floorplan+1
	sta floorplanptr+1
	
	clc 
	lda floorplan
	adc #$24
	sta floorplanptrX
	lda floorplan+1
	adc #$00
	sta floorplanptrX+1

	lda $02
	pha 
	lda $03
	pha 
	php 

	lda floorplanptr // floorplanptr
	ldx floorplanptr+1
	sta j
	stx j+1
!:			 // Top of FOR Loop
	lda j+1
	cmp floorplanptrX+1
	bne !+
	lda j
	cmp floorplanptrX
!:
	bcs !+++ // jump out of FOR
	// -------------------------
	ldy #$00
	lda j
	ldx j+1
	sta !+
	stx !++
	.byte $AD
!:	.byte $00
!:	.byte $00
	pha
	
	clc 
	lda j
	adc #$01
	sta $02
	lda j+1
	adc #$00
	stx $03
	ldy #$00
	lda ($02),Y
	pha 

	clc 
	lda j
	adc #$02
	sta $02
	lda j+1
	adc #$00
	sta $03
	ldy #$00
	lda ($02),Y
	pha
	
	clc 
	lda j
	adc #$03
	sta $02
	lda j+1
	adc #$00
	sta $03
	ldy #$00
	lda ($02),Y
	pha

	lda #$03
	pha 
	jsr line
	
	clc 
	lda j
	adc #$04
	sta j
	lda j+1
	adc #$00
	sta j+1
	// -------------------------
	jmp !----

!:
	lda #$00
	sta keepPlaying
	lda $CB
	sta c
LBL1L21:			 // Top of WHILE Loop
	lda keepPlaying
	cmp #$01
	bne !_skip+
	jmp LBL1L23 // if z==1 jump to ELSE (CANNOT OPTIMIZE)
!_skip:
	jsr getJS
	jsr onFloor
	pla 
	pla 
	sta playerOnFloor
	
	jsr hitCeiling
	pla 
	pla 
	sta playerHitCeiling
	
	jsr prizeOnFloorFunc
	pla 
	pla 
	sta prizeOnFloor
	
	lda $02
	pha 
	lda $03
	pha 
	php 

	lda c
	cmp #$3C
	bne !+ // jump to ELSE
	lda #$00
	sta JSbtnPressA

!:	lda c
	cmp #$21
	bne !+ // jump to ELSE
	lda #$00
	sta JSnorth
!:

	lda c
	cmp #$25
	bne !+ // jump to ELSE
	lda #$00
	sta JSsouth
!:
	lda c
	cmp #$1E
	bne !+ // jump to ELSE
	lda #$00
	sta JSwest
!:
	lda c
	cmp #$26
	bne !+ // jump to ELSE
	lda #$00
	sta JSeast
!:
	lda c
	cmp #$3E
	bne !+ // jump to ELSE
	lda #$01
	sta keepPlaying
!:
	lda JSbtnPressA
	cmp #$00
	bne !+
	lda playerOnFloor
	cmp #$00
	beq !+ // if z==1 jump to ELSE

	lda playerHitCeiling
	cmp #$00
	bne !+ // jump to ELSE

	lda #$01
	sta midJump
	lda #$00
	sta jumpIndex
!:
	lda playerHitCeiling
	cmp #$00
	beq !+ // if z==1 jump to ELSE
	lda #$00
	sta midJump
	sta thrust
!:
	lda JSsouth
	cmp #$00
	bne !+
	lda playerOnFloor
	cmp #$00
	bne !+ // jump to ELSE
	inc playery
!:
	lda playerOnFloor
	cmp #$00
	bne !_skip+
	jmp !++++++ // if z==1 jump to ELSE (CANNOT OPTIMIZE)
!_skip:
	lda JSeast
	cmp #$00
	bne !+++
	lda playerx+1
	cmp #$01
	bne !+
	lda playerx
	cmp #$40
!:	bcs !++ // jump to ELSE
	jsr whatsToTheRight
	pla 
	pla 
	sta toTheRight

	//lda toTheRight
	cmp #$01
	bne !+ // jump to ELSE
	sec 
	lda playery
	sbc #$01
	sta playery
!:

	lda toTheRight
	cmp #$FF
	beq !+ // if z==1 jump to ELSE
	ldx #$01
	stx direction
	dex
	stx direction+1
	
	clc 
	lda playerx
	adc #$01
	sta playerx
	lda playerx+1
	adc #$00
	sta playerx+1
!:	lda JSwest
	cmp #$00
	bne !+++

	lda playerx+1
	cmp #$00
	bne !+
	lda playerx
	cmp #$18
!:
	bcc !++ // if c==0 jump to ELSE
	beq !++ // if z==1 jump to ELSE
	jsr whatsToTheLeft
	pla 
	pla 
	sta toTheLeft
	//lda toTheLeft
	cmp #$01
	bne !+ // jump to ELSE

	sec 
	lda playery
	sbc #$01
	sta playery
!:
	lda toTheLeft
	cmp #$FF
	beq !+ // if z==1 jump to ELSE

	lda #$FF
	sta direction
	sta direction+1
	
	sec 
	lda playerx
	sbc #$01
	sta playerx
	lda playerx+1
	sbc #$00
	sta playerx+1
!:

	lda midJump
	cmp #$00
	beq !+ // if z==1 jump to ELSE

	clc 
	lda playery
	adc #$FD
	sta playery
	
	inc jumpIndex
	lda #$0F
	and jumpIndex
	sta jumpIndex
	//lda jumpIndex
	sta midJump
	clc 
	lda playerx
	adc direction
	sta playerx
	
	lda playerx+1
	adc direction+1
	sta playerx+1
	jsr limitxposition
!:
	jsr gravity
	lda thrust
	cmp #$00
	beq !+ // if z==1 jump to ELSE

	sec 
	lda playery
	sbc thrust
	sta playery
	dec thrust
!:
	lda #$00
	sta DELAY
!:			 // Top of FOR Loop
	lda DELAY
	cmp #$7F
	bcs !+ // jump out of FOR
	inc DELAY
	jmp !-

	
!:
	plp 
	pla 
	sta $03
	pla 
	sta $02
	
	jsr positionMOBS
	lda $CB
	sta c
	jmp LBL1L21 // jump to top of WHILE loop
	
LBL1L23:
	plp 
	pla 
	sta $03
	pla 
	sta $02

	
	jsr clearkb
	sei 
	lda #$37 // Default Value
	sta $01
	cli 
	lda #$03
	ora $DD02
	sta $DD02
	
	lda $02
	pha 

	lda #$03
	sta $02
	lda $DD00
	and #$FC
	ora $02
	sta $DD00

	pla 
	sta $02

	jsr restoreregs
	rts

	
limitxposition:
	lda playerx+1
	cmp #$01
	bne !+
	lda playerx
	cmp #$40
!:
	bcc !+ // if c==0 jump to ELSE
	beq !+ // if z==1 jump to ELSE
	lda #$40
	ldx #$01
	sta playerx
	stx playerx+1
!:
	lda playerx+1
	cmp #$00
	bne !+
	lda playerx
	cmp #$18
!:
	bcs !+ // jump to ELSE
	lda #$18
	ldx #$00
	sta playerx
	stx playerx+1
!:
	rts


	
positionMOBS:
	lda playerx // (this _wasn't_ working)
	sta $D000
	lda playery
	sta $D001
	lda #$01
	bit playerx+1
	beq !+
	lda #$01
	ora $D010
	jmp !++
!:
	lda #$FE
	and $D010
!:
	sta $D010
	lda prizex // (this _wasn't_ working)
	sta $D002
	lda prizey
	sta $D003
	lda #$01
	bit prizex+1
	beq !+
	lda #$02
	ora $D010
	jmp !++
!:
	lda #$FD
	and $D010
!:
	sta $D010
	rts

	
gravity:
	lda playerOnFloor
	cmp #$00
	bne !+ // jump to ELSE
	inc playery
	
	clc 
	lda playerx
	adc direction
	sta playerx
	lda playerx+1
	adc direction+1
	sta playerx+1
	jsr limitxposition
!:
	lda prizeOnFloor
	cmp #$00
	bne !+ // jump to ELSE
	inc prizey
!:
	rts


	
whatsToTheRight:
	
	lda #$00
	sta rtn8bit
	
	sec 
	lda playerx
	sbc #$04
	sta xtocheck
	lda playerx+1
	sbc #$00
	sta xtocheck+1

	sec 
	lda playery
	sbc #$1E
	sta ytocheck

	lda xtocheck
	pha 
	lda xtocheck+1
	pha 
	lda ytocheck
	pha 
	jsr getpixel

	pla // should be #$02
	pla // rtn value 1
	sta $03
	pla // rtn value 2
	sta $02
	ldy #$00
	lda ($02),Y

	sta byte0
	lda xtocheck
	pha 
	lda xtocheck+1
	pha 
	sec 
	lda ytocheck
	sbc #$01
	pha
	jsr getpixel
	pla 
	pla 
	sta $03
	pla
	sta $02
	ldy #$00
	lda ($02),Y
	sta byte1

	lda byte0
	cmp #$00
	bne !+ // branch to body of IF
	lda byte1
	cmp #$00
	beq !+++ // if z==1 jump to ELSE
!:
	lda byte1
	cmp #$00
	bne !+ // jump to ELSE
	inc rtn8bit
	jmp !++
	
!:
	dec rtn8bit
!:
	// ================

	
	pla 
	tax 
	pla 
	tay 
	lda rtn8bit
	pha 
	lda #$01
	pha 
	tya 
	pha 
	txa 
	pha 
	rts


	
whatsToTheLeft:
	lda #$00
	sta rtn8bit
	
	sec 
	lda playerx
	sbc #$0C
	sta xtocheck
	lda playerx+1
	sbc #$00
	sta xtocheck+1

	sec 
	lda playery
	sbc #$1E
	sta ytocheck
	lda xtocheck

	pha 
	lda xtocheck+1
	pha 
	lda ytocheck
	pha
	
	jsr getpixel
	pla 
	pla 
	sta $03
	pla
	sta $02
	ldy #$00
	lda ($02),Y
	sta byte0
	
	lda xtocheck
	pha 
	lda xtocheck+1
	pha
	
	sec 
	lda ytocheck
	sbc #$01
	pha

	jsr getpixel
	pla 
	pla 
	sta $03
	pla 
	sta $02
	ldy #$00
	lda ($02),Y
	sta byte1

	lda byte0
	cmp #$00
	bne !+ // branch to body of IF
	lda byte1
	cmp #$00
	beq !+++ // if z==1 jump to ELSE
!:
	lda byte1
	cmp #$00
	bne !+ // jump to ELSE
	inc rtn8bit
	jmp !++
!:
	dec rtn8bit
!:
	pla
	tax 
	pla 
	tay
	
	lda rtn8bit
	pha 
	lda #$01
	pha
	
	tya 
	pha 
	txa 
	pha 
	rts

	
onFloor:	
	sec 
	lda playerx
	sbc #$04
	pha 
	lda playerx+1
	sbc #$00
	pha
	
	sec 
	lda playery
	sbc #$1D
	pha

	
	jsr getpixel
	pla 
	pla 
	sta RIGHT+1
	sta !++
	pla 
	sta RIGHT
	sta !+
	ldy #$00
	.byte $AD
!:	.byte $00
!:	.byte $00
	sta byte0
	
	sec 
	lda RIGHT
	sbc #$08
	sta $02
	lda RIGHT+1
	sbc #$00
	sta $03
	ldy #$00
	lda ($02),Y
	sta byte1

	
	sec 
	lda RIGHT
	sbc #$10
	sta $02
	lda RIGHT+1
	sbc #$00
	sta $03
	ldy #$00
	lda ($02),Y

	
	sta byte2
	lda byte0
	ora byte1
	sta rtn8bit
	lda rtn8bit
	ora byte2
	sta rtn8bit
	
	pla 
	tax 
	pla 
	tay 
	lda rtn8bit
	pha 
	lda #$01
	pha 
	tya 
	pha 
	txa 
	pha 
	rts

	
hitCeiling:
// -----------------------
	sec 
	lda playerx
	sbc #$04
	pha
	lda playerx+1
	sbc #$00
	pha

	
	sec 
	lda playery
	sbc #$32
	pha 
	jsr getpixel
	pla 
	pla
	sta RIGHT+1
	sta !++
	pla 
	sta RIGHT
	sta !+
	ldy #$00
	.byte $AD
!:	.byte $00
!:	.byte $00
	sta byte0
	
	sec 
	lda RIGHT
	sbc #$08
	sta $02
	lda RIGHT+1
	sbc #$00
	sta $03
	ldy #$00
	lda ($02),Y
	sta byte1

	sec 
	lda RIGHT
	sbc #$10
	sta $02
	
	lda RIGHT+1
	sbc #$00
	sta $03
	ldy #$00
	lda ($02),Y	
	sta byte2

	
	lda byte0
	ora byte1
	sta rtn8bit
	lda rtn8bit
	ora byte2
	sta rtn8bit

	pla 
	tax 
	pla 
	tay
	
	lda rtn8bit
	pha 
	lda #$01
	pha 

	tya 
	pha 
	txa 
	pha 
	rts
	
prizeOnFloorFunc:

// =======================
	
	sec 
	lda prizex
	sbc #$04
	pha
	lda prizex+1
	sbc #$00
	pha 
	sec 
	lda prizey
	sbc #$1D
	pha

	
	jsr getpixel
	pla 
	pla 
	sta RIGHT+1
	sta !++
	pla 
	sta RIGHT
	sta !+
	ldy #$00
	.byte $AD
!:	.byte $00
!:	.byte $00
	sta byte0

	
	sec 
	lda RIGHT
	sbc #$08
	sta $02
	lda RIGHT+1
	sbc #$00
	sta $03
	ldy #$00
	lda ($02),Y
	sta byte1


	sec 
	lda RIGHT
	sbc #$10
	sta $02
	lda RIGHT+1
	sbc #$00
	sta $03
	ldy #$00
	lda ($02),Y
	sta byte2

	lda byte0
	ora byte1
	sta rtn8bit
	lda rtn8bit
	ora byte2
	sta rtn8bit


	pla 
	tax 
	pla 
	tay 
	lda rtn8bit
	pha 
	lda #$01
	pha 
	tya 
	pha 
	txa 
	pha 
	rts	
clearkb:
	lda #$00
	sta $C6
	jsr $FFE4
	rts 
getJS:
	lda $DC00
	sta JSportA
	lda #$10
	and JSportA
	sta JSbtnPressA
	lda #$01
	and JSportA
	sta JSnorth
	lda #$02
	and JSportA
	sta JSsouth
	lda #$04
	and JSportA
	sta JSwest
	lda #$08
	and JSportA
	sta JSeast
	rts
	
line:
	pla 
	tax 
	pla 
	tay

	
	pla 
	sta C0
	pla 
	sta Y2
	pla 
	sta X2
	pla 
	sta Y1
	pla 
	sta X1
	tya 
	pha 
	txa 
	pha 
	lda X1
	pha 
	lda Y1
	pha 
	lda X2
	pha 
	lda Y2
	pha 
	lda C0
	pha 
	jsr segment
	inc Y1
	inc Y2
	lda X1
	pha 
	lda Y1
	pha 
	lda X2
	pha 
	lda Y2
	pha 
	lda C0
	pha 
	jsr segment
	rts


	
plotshape:
	pla 
	tax 
	pla 
	tay 
	pla 
	sta plotshapeSize
	pla 
	sta plotshapeY
	pla 
	sta plotshapeX
	pla 
	sta plotshapeAddr+1
	pla 
	sta plotshapeAddr
	tya 
	pha 
	txa 
	pha 
	lda #$00
	sta plotshapeBindex
	lda plotshapeY
	sta _MUL16_FB
	lda #$00
	sta _MUL16_FC
	sta _MUL16_FE
	lda #$28
	sta _MUL16_FD
	jsr MUL16
	lda MUL16R
	ldx MUL16R+1
	clc 
	adc plotshapeX
	sta plotshapeOffset
	txa 
	adc #$00
	sta plotshapeOffset+1
	
	clc 
	lda plotshapeOffset
	adc #$00
	sta plotshapeColor1
	lda plotshapeOffset+1
	adc #$D8
	sta plotshapeColor1+1

	clc 
	lda plotshapeOffset
	adc scraddr
	sta plotshapeColors2And3
	lda plotshapeOffset+1
	adc scraddr+1
	sta plotshapeColors2And3+1

	lda plotshapeOffset
	asl 
	tay 
	lda plotshapeOffset+1
	rol 
	tax 
	tya 
	asl 
	tay 
	txa 
	rol 
	tax 
	tya 
	asl 
	tay 
	txa 
	rol 
	tax 
	tya 
	clc 
	adc bmpaddr
	sta plotshapePixels
	txa 
	adc bmpaddr+1
	sta plotshapePixels+1
	
	lda $02
	pha 
	lda $03
	pha 
	php 
LBL1L70:
	lda #$00
	sta plotshapeJ
LBL1L71:			 // Top of FOR Loop
	lda plotshapeJ
	cmp plotshapeSize
	bcs !_skip+
	jmp LBL1L73 // if c==0 jump to BODY
!_skip:
	jmp LBL1L74 // jump out of FOR (CANNOT OPTIMIZE)
LBL1L72:
LBL1L73:
	lda plotshapeColor1
	sta LBL2L85
	lda plotshapeColor1+1
	sta LBL2L86
	lda plotshapeColourValue11
	.byte $8D	 // STA absolute
LBL2L85:			 // <-- low byte
	.byte $00
LBL2L86:			 // <-- hi byte
	.byte $00
	lda plotshapeColors2And3
	sta LBL2L87
	lda plotshapeColors2And3+1
	sta LBL2L88
	lda plotshapeColourValue0110
	.byte $8D	 // STA absolute
LBL2L87:			 // <-- low byte
	.byte $00
LBL2L88:			 // <-- hi byte
	.byte $00
	clc 
	lda #$01
	adc plotshapeColor1
	sta plotshapeColor1
	lda #$00
	adc plotshapeColor1+1
	sta plotshapeColor1+1

	clc 
	lda #$01
	adc plotshapeColors2And3
	sta plotshapeColors2And3
	lda #$00
	adc plotshapeColors2And3+1
	sta plotshapeColors2And3+1

	lda $02
	pha 
	lda $03
	pha 
	php 
LBL2L89:
	lda #$00
	sta plotshapeI
LBL2L90:			 // Top of FOR Loop
	lda plotshapeI
	cmp #$08
	bcs LBL2L93 // jump out of FOR (OPTIMIZE)
LBL2L91:
LBL2L92:
	lda plotshapeAddr
	sta LBL3L17
	lda plotshapeAddr+1
	sta LBL3L17+1
	ldx plotshapeBindex
	.byte $BD		 // lda ABS,X
LBL3L17:
	.byte $00, $00
	sta LBL3L18-2
	lda plotshapePixels
	sta !+
	lda plotshapePixels+1
	sta !++
	lda #$00
	.byte $8D // <-- STA absolute
!:
LBL3L18:			 // <-- low byte
	.byte $00
!:
LBL3L19:			 // <-- hi byte
	.byte $00
	clc 
	lda #$01
	adc plotshapePixels
	sta plotshapePixels
	lda #$00
	adc plotshapePixels+1
	sta plotshapePixels+1
	inc plotshapeBindex
	inc plotshapeI
	jmp LBL2L90
LBL2L93:
	plp 
	pla 
	sta $03
	pla 
	sta $02


	
	inc plotshapeJ
	jmp LBL1L71
LBL1L74:
	plp 
	pla 
	sta $03
	pla 
	sta $02
	rts

	
plotNumber:
LBL1L75:
LBL1L76:			 // Top of IF statement
	lda plotNum+1
	cmp #$00
	bne !+
	lda plotNum
	cmp #$00
!:
	bne LBL1L78 // jump to ELSE
LBL1L77:
	lda zeroText // zeroText
	ldx zeroText+1
	sta wordToPrint
	stx wordToPrint+1
	lda #$01
	sta wordSize
	jsr printWord
	dec plotDigitX
	lda #$00
	sta plotDigitBindex
	jsr plotDigit
	jmp LBL1L79
LBL1L78:
LBL2L94:
LBL2L95:			 // Top of WHILE Loop
	lda plotNum+1
	cmp #$00
	bne !+
	lda plotNum
	cmp #$00
!:
	bcc LBL2L97 // if c==0 jump to ELSE
	beq LBL2L97 // if z==1 jump to ELSE
LBL2L96:
	//sei 
	lda plotNum
	sta _DIV16_FB
	lda plotNum+1
	sta _DIV16_FC
	lda #$0A
	sta _DIV16_FD
	lda #$00
	sta _DIV16_FE
	jsr DIV16
	lda _DIV16_FB
	ldx _DIV16_FC
	//cli 
	sta plotNum
	stx plotNum+1
	lda $02
	asl 
	asl 
	asl 
	sta plotDigitBindex
	jsr plotDigit
	dec plotDigitX
	jmp LBL2L95 // jump to top of WHILE loop
LBL2L97:
LBL1L79:
	rts 


printWord:
	lda letters // letters
	ldx letters+1
	sta plotDigitAddr
	stx plotDigitAddr+1
	
LBL1L80:
	lda #$00
	sta printWordI
LBL1L81:			 // Top of FOR Loop
	lda printWordI
	cmp wordSize
	bcc LBL1L83 // if c==0 jump to BODY
	jmp LBL1L84 // jump out of FOR (CANNOT OPTIMIZE)
LBL1L82:
LBL1L83:
	lda wordToPrint
	sta LBL2L98
	lda wordToPrint+1
	sta LBL2L98+1
	ldx printWordI
	.byte $BD		 // lda ABS,X
LBL2L98:
	.byte $00, $00
	sta currentChar
LBL2L99:
LBL2L100:			 // Top of IF statement
	lda currentChar
	cmp #$2C
	bne LBL2L102 // jump to ELSE
LBL2L101:
	lda #$1F
	sta currentChar
	jmp LBL2L103
LBL2L102:
LBL3L20:
LBL3L21:			 // Top of IF statement
	lda currentChar
	cmp #$29
	bne LBL3L23 // jump to ELSE
LBL3L22:
	lda #$1E
	sta currentChar
	jmp LBL3L24
LBL3L23:
LBL4L24:
LBL4L25:			 // Top of IF statement
	lda currentChar
	cmp #$28
	bne LBL4L27 // jump to ELSE
LBL4L26:
	lda #$1D
	sta currentChar
	jmp LBL4L28
LBL4L27:
LBL5L0:
LBL5L1:			 // Top of IF statement
	lda currentChar
	cmp #$2E
	bne LBL5L3 // jump to ELSE
LBL5L2:
	lda #$1C
	sta currentChar
	jmp LBL5L4
LBL5L3:
LBL6L0:
LBL6L1:			 // Top of IF statement
	lda currentChar
	cmp #$3A
	beq !_skip+
	jmp LBL6L3 // jump to ELSE (OPTIMIZE)
!_skip:
LBL6L2:
	lda #$1B
	sta currentChar
	jmp LBL6L4
LBL6L3:
LBL7L0:
LBL7L1:			 // Top of IF statement
	lda currentChar
	cmp #$20
	bne LBL7L3 // jump to ELSE
LBL7L2:
	lda #$1A
	sta currentChar
	jmp LBL7L4
LBL7L3:
	sec 
	lda currentChar
	sbc #$41
	sta currentChar
LBL7L4:
LBL6L4:
LBL5L4:
LBL4L28:
LBL3L24:
LBL2L103:
	lda currentChar
	asl 
	asl 
	asl 
	sta plotDigitBindex
	jsr plotDigit
	inc plotDigitX
	inc printWordI
	jmp LBL1L81
LBL1L84:
	lda digits // digits
	ldx digits+1
	sta plotDigitAddr
	stx plotDigitAddr+1
	rts
	
plotDigit:
	lda plotDigitY
	sta _MUL16_FB
	lda #$00
	sta _MUL16_FC
	sta _MUL16_FE
	lda #$28
	sta _MUL16_FD
	jsr MUL16
	lda MUL16R
	ldx MUL16R+1
	sta plotDigitOffset
	stx plotDigitOffset+1
	clc 
	lda plotDigitOffset
	adc plotDigitX
	sta plotDigitOffset
	lda #$00
	adc plotDigitOffset+1
	sta plotDigitOffset+1
	
	clc 
	lda plotDigitOffset
	adc #$00
	sta plotDigitColor1
	lda plotDigitOffset+1
	adc #$D8
	sta plotDigitColor1+1
	
	clc 
	lda plotDigitOffset
	adc scraddr
	sta plotDigitColors2And3
	lda plotDigitOffset+1
	adc scraddr+1
	sta plotDigitColors2And3+1
	lda plotDigitColor1
	sta LBL1L85
	lda plotDigitColor1+1
	sta LBL1L86
	lda textColour
	.byte $8D	 // STA absolute
LBL1L85:			 // <-- low byte
	.byte $00
LBL1L86:			 // <-- hi byte
	.byte $00
	lda plotDigitColors2And3
	sta LBL1L87
	lda plotDigitColors2And3+1
	sta LBL1L88
	lda #$00
	.byte $8D // <-- STA absolute
LBL1L87:			 // <-- low byte
	.byte $00
LBL1L88:			 // <-- hi byte
	.byte $00
	lda plotDigitOffset
	asl 
	tay 
	lda plotDigitOffset+1
	rol 
	tax 
	tya 
	asl 
	tay 
	txa 
	rol 
	tax 
	tya 
	asl 
	tay 
	txa 
	rol 
	tax 
	tya 

	clc 
	adc bmpaddr
	sta plotDigitPixels
	txa 
	adc bmpaddr+1
	sta plotDigitPixels+1

	lda $02
	pha 
	lda $03
	pha 
	php 
LBL1L89:
	lda #$00
	sta plotDigitI
LBL1L90:			 // Top of FOR Loop
	lda plotDigitI
	cmp #$08
	bcs LBL1L93 // jump out of FOR
LBL1L92:
	lda plotDigitAddr
	sta LBL2L104
	lda plotDigitAddr+1
	sta LBL2L104+1
	ldx plotDigitBindex
	.byte $BD		 // lda ABS,X
LBL2L104:
	.byte $00, $00
	sta LBL2L105-2
	lda plotDigitPixels
	sta !+
	lda plotDigitPixels+1
	sta !++
	lda #$00
	.byte $8D // <-- STA absolute
!:
LBL2L105:			 // <-- low byte
	.byte $00
!:
LBL2L106:			 // <-- hi byte
	.byte $00
	clc 
	lda #$01
	adc plotDigitPixels
	sta plotDigitPixels
	lda #$00
	adc plotDigitPixels+1
	sta plotDigitPixels+1

	inc plotDigitBindex
	inc plotDigitI
	jmp LBL1L90
LBL1L93:
	plp 
	pla 
	sta $03
	pla 
	sta $02
	rts


	
printUINT:
	pla 
	tax 
	pla 
	tay 
	pla 
	sta printUINTarg0
	tya 
	pha 
	txa 
	pha 
	lda #$01
	sta textColour
	lda #$0A
	sta plotDigitX
	lda #$02
	sta plotDigitY
	lda printUINTarg0
	sta plotNum
	lda #$00
	sta plotNum+1
	jsr plotNumber
	rts 
printWORD:
	pla 
	tax 
	pla 
	tay 
	pla 
	sta printWORDarg0+1
	pla 
	sta printWORDarg0
	tya 
	pha 
	txa 
	pha 
	lda #$01
	sta textColour
	lda #$0A
	sta plotDigitX
	lda #$02
	sta plotDigitY
	lda printWORDarg0 // printWORDarg0
	ldx printWORDarg0+1
	sta plotNum
	stx plotNum+1
	jsr plotNumber
	rts 
_DIV16_FD:
	.byte $00
_DIV16_FE:
	.byte $00
_DIV16_FB:
	.byte $00
_DIV16_FC:
	.byte $00
DIV16:
	sei 
	lda #$00
	sta $02
	sta $03
	ldx #$10
_DIV16_L1:
	asl _DIV16_FB
	rol _DIV16_FC
	rol $02
	rol $03
	lda $02
	sec 
	sbc _DIV16_FD
	tay 
	lda $03
	sbc _DIV16_FE
	bcc _DIV16_L2
	sta $03
	sty $02
	inc _DIV16_FB
_DIV16_L2:
	dex 
	bne _DIV16_L1
	cli 
	rts 
 // x = $FA, y = $FC, colour = $FD
 // STORE is at $FE(l), $FF(h)
 // LOC is at $02(l), $03(h)
MCPLOT:
	sei 
	lda $FA // xcoord
	and #$03
	sta $FE // store
	lda #$00
	sta $02 // loc
	sta $FF // store + 1
	lda $FD // colcode
	clc 
	ror 
!:
	ror 
	ror 
	dec $FE // store
	bpl !-
	sta $50 // mask
	lda $FA // xcoord
	and #$FC
	asl 
	rol $FF // store + 1
	sta $FE // store
	lda $FC // ycoord
	lsr 
	lsr 
	lsr 
	sta $03 // loc + 1
	lsr 
	ror $02 // loc
	lsr 
	ror $02 // loc
	clc 
	adc $03 // loc + 1
	sta $03 // loc + 1
	lda $FC // ycoord
	and #$07
	adc $02 // loc
	adc $FE // store 
	sta $02 // loc
	lda $03 // loc+1
	adc $FF // store + 1
	sta $22 // tmpstore
 //  These subroutines I added to calculate the addresses based on VICII settings
	jsr BNKMEM
	pla 
	clc 
	adc $22
	sta $22 // tmpstore
	jsr BMPMEM
	pla 
	clc 
	adc $22 // tmpstore
	sta $03 // loc + 1
	ldy #$00
	lda ($02),Y
	ora $50 // mask
	sta ($02),Y // what is @ $50?
	cli 
	rts 
!:
_MUL16_FB:
	.byte $00
!:
_MUL16_FC:
	.byte $00
!:
_MUL16_FD:
	.byte $00
!:
_MUL16_FE:
	.byte $00
MUL16R:
	.byte $00, $00, $00, $00
MUL16:
	lda #$00
	sta MUL16R
	sta MUL16R+1
	sta MUL16R+2
	sta MUL16R+3
	ldx #$10
!:
	lsr !--
	ror !---
	bcc !+
	tay 
	clc 
	lda !-----
	adc MUL16R+2
	sta MUL16R+2
	tya 
	adc !----
!:
	ror 
	ror MUL16R+2
	ror MUL16R+1
	ror MUL16R
	dex 
	bne !--
	sta MUL16R+3
	rts 
BMPMEM:		 // Get the bitmap mem location from the vic II
	pla 
	tax 
	pla 
	tay 
	lda $D018
	and #$08
	asl 
	asl 
	pha 
	tya 
	pha 
	txa 
	pha 
	rts 
SCRMEM:		 // Get the screen mem location from the vic II
	pla 
	tax 
	pla 
	tay 
	lda $D018
	and #$F0
	lsr 
	lsr 
	pha 
	tya 
	pha 
	txa 
	pha 
	rts 
BNKMEM:		 // Get the bank memory from the vic II
	pla 
	tax 
	pla 
	tay 
	lda $DD00
	eor #$FF
	and #$03
	asl 
	asl 
	asl 
	asl 
	asl 
	asl 
	pha 
	tya 
	pha 
	txa 
	pha 
	rts 
!:
	.byte $00
!:
	.byte $00
PUSH:
	stx !-
	ldx !--
	inx 
	sta $CF00,X
	stx !--
	ldx !-
	rts 
POP:
	stx !-
	ldx !--
	lda $CF00,X
	dex 
	stx !--
	ldx !-
	rts 
 // ; $19c3			"   "
STRLBL0:
	.byte  $20, $20, $20, $00
LBL1L0: .byte $00, $30, $CC, $CC, $CC, $CC, $CC, $30, $00, $30, $30, $30, $30, $30, $30, $30, $00, $30, $CC, $0C, $30, $C0, $C0, $FC, $00, $30, $CC, $0C, $30, $0C, $CC, $30, $00, $0C, $CC, $CC, $FC, $0C, $0C, $0C, $00, $FC, $C0, $F0, $0C, $0C, $CC, $30, $00, $30, $CC, $C0, $F0, $CC, $CC, $30, $00, $FC, $0C, $0C, $30, $30, $30, $30, $00, $30, $CC, $CC, $30, $CC, $CC, $30, $00, $FC, $CC, $CC, $FC, $0C, $0C, $0C, $00, $00, $00, $00, $00, $00, $00, $00 // $19c7
LBL1L1: .byte $00, $30, $FC, $CC, $FC, $CC, $CC, $CC, $00, $F0, $CC, $CC, $F0, $CC, $CC, $F0, $00, $30, $CC, $C0, $C0, $C0, $CC, $30, $00, $F0, $CC, $CC, $CC, $CC, $CC, $F0, $00, $FC, $C0, $C0, $F0, $C0, $C0, $FC, $00, $FC, $C0, $C0, $F0, $C0, $C0, $C0, $00, $30, $CC, $C0, $FC, $CC, $CC, $30, $00, $CC, $CC, $CC, $FC, $CC, $CC, $CC, $00, $FC, $30, $30, $30, $30, $30, $FC, $00, $FC, $0C, $0C, $0C, $CC, $CC, $30, $00, $CC, $CC, $CC, $F0, $CC, $CC, $CC, $00, $C0, $C0, $C0, $C0, $C0, $C0, $FC, $00, $CC, $FC, $FC, $CC, $CC, $CC, $CC, $00, $00, $00, $C0, $FC, $CC, $CC, $CC, $00, $FC, $CC, $CC, $CC, $CC, $CC, $FC, $00, $F0, $CC, $CC, $F0, $C0, $C0, $C0, $00, $30, $CC, $CC, $CC, $CC, $F0, $3C, $00, $F0, $CC, $CC, $F0, $CC, $CC, $CC, $00, $30, $CC, $C0, $30, $0C, $CC, $30, $00, $FC, $30, $30, $30, $30, $30, $30, $00, $CC, $CC, $CC, $CC, $CC, $CC, $FC, $00, $CC, $CC, $CC, $CC, $30, $30, $30, $00, $CC, $CC, $CC, $FC, $FC, $FC, $CC, $00, $CC, $CC, $CC, $30, $CC, $CC, $CC, $00, $CC, $CC, $CC, $3C, $0C, $CC, $30, $00, $FC, $0C, $0C, $30, $C0, $C0, $FC, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $3C, $00, $3C, $00, $00, $00, $00, $00, $00, $00, $00, $C0, $C0, $0C, $30, $30, $30, $30, $30, $30, $0C, $C0, $30, $30, $30, $30, $30, $30, $C0, $00, $00, $00, $00, $00, $00, $30, $C0 // $1a1f
LBL1L2: .byte $30 // $1b1f
LBL1L3: .byte $00, $3C, $00, $01, $C3, $80, $06, $00, $60, $08, $00, $10, $10, $00, $08, $10, $00, $08, $20, $00, $04, $20, $00, $04, $20, $00, $04, $40, $00, $02, $40, $00, $02, $40, $00, $02, $20, $00, $04, $20, $00, $04, $20, $00, $04, $10, $00, $08, $10, $00, $08, $08, $00, $10, $06, $00, $60, $01, $C3, $80, $00, $3C, $00, $00 // $1b20
LBL1L4: .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $00, $FF, $FF, $00, $FF, $FF, $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $00, $FF, $FF, $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF // $1b60
LBL1L14: .byte $01, $14, $9F, $14, $01, $30, $48, $30, $60, $30, $9F, $30, $18, $4C, $88, $4C, $01, $68, $40, $68, $18, $84, $88, $78, $01, $A0, $48, $A0, $60, $A0, $9F, $A0, $01, $BC, $9F, $C3 // $1ba0
 //  Variable Labels

!lv_colour:	.byte $00 // colour
!lv_y2:		.byte $00 // y2
!lv_x2:		.byte $00 // x2
!lv_y1:		.byte $00 // y1
!lv_x1:		.byte $00 // x1

!lv_dy:		.byte $00, $00// dy
!lv_dx:		.byte $00, $00 // dx

!lv_Z1:		.byte $00, $00 // Z1

!lv_Zy:		.byte $00, $00 // Zy
!lv_Zx:		.byte $00, $00 // Zx

!lv_CASE:	.byte $00 // CASE

!lv_X:		.byte $00 // X
!lv_Y:		.byte $00 // Y
!lv_i:		.byte $00 // i


segment:
	pla 
	tax 
	pla 
	tay 
	pla
	
	sta !lv_colour-
	pla 
	sta !lv_y2-
	pla 
	sta !lv_x2-
	pla 
	sta !lv_y1-
	pla 
	sta !lv_x1-
	
	tya 
	pha 
	txa 
	pha 
// ************************************
	lda #$04
	sta !lv_CASE-
	
// Top of IF statement
	lda !lv_y1-
	cmp !lv_y2-
	bcc !+
	beq !+
// &&
	lda !lv_x1-
	cmp !lv_x2-
	bcc !+ 

	lda #$01
	sta !lv_CASE-
!:
	
// Top of IF statement
	lda !lv_y1-
	cmp !lv_y2-
	bcc !+
	beq !+
	jmp !++
!:
	
// Top of IF statement
	lda !lv_x1-
	cmp !lv_x2-
	bcc !+ // if c==0 jump to ELSE
	beq !+ // if z==1 jump to ELSE ()
	
	lda #$02
	sta !lv_CASE-
!:
// &&
	lda !lv_y1-
	cmp !lv_y2-
	bcc !+
	beq !+

	lda !lv_x1-
	cmp !lv_x2-
	bcs !+ // jump to ELSE ()
	
	lda #$03
	sta !lv_CASE-
!:

	
// Top of IF statement
	lda !lv_CASE-
	cmp #$01
	beq !+
// ||
	lda !lv_CASE-
	cmp #$02
	bne !++ // jump to ELSE ()
!:
// swap (x1,y1) and (x2,y2)
	ldx !lv_x1- // 4 cy
	ldy !lv_x2- // 4 cy
	stx !lv_x2- // 4 cy
	sty !lv_x1- // 4 cy
	ldx !lv_y1- // 4 cy
	ldy !lv_y2- // 4 cy
	stx !lv_y2- // 4 cy
	sty !lv_y1- // 4 cy
!:

	

// Top of IF statement
	lda !lv_CASE-
	cmp #$01
	beq !+
// ||
	lda !lv_CASE-
	cmp #$04
	bne !++ // jump to ELSE ()
!:
	sec 
	lda !lv_x2-
	sbc !lv_x1-
	sta !lv_dx-
	lda #$00
	sta !lv_dx-+1
	
	// moved to here from below
	sta !lv_dy-+1
	
	sec 
	lda !lv_y2-
	sbc !lv_y1-
	sta !lv_dy-
!:
	lda !lv_CASE-
	cmp #$02
	beq !+
	lda !lv_CASE-
	cmp #$03
	bne !++ // jump to ELSE ()
!:
	sec 
	lda !lv_x2-
	sbc !lv_x1-
	sta !lv_dx-
	lda #$00
	sta !lv_dx-+1
	sta !lv_dy-+1
	sec 
	lda !lv_y1-
	sbc !lv_y2-
	sta !lv_dy-
	lda #$03
	sta !lv_CASE-
!:
	lda !lv_x1-
	sta !lv_X-

	lda !lv_y1-
	sta !lv_Y-
	lda !lv_x2-
	cmp !lv_x1-
	beq !+
	jmp !++++ // jump to ELSE (CANNOT OPTIMIZE)
!:
	lda !lv_y1-
	sta !lv_i-
!:
	lda !lv_i-
	cmp !lv_y2-	
	beq !+ // jump out of FOR () and then to rts
	lda !lv_X-
	sta $FA	
	lda !lv_i-
	sta $FC
	lda !lv_colour-
	sta $FD
	jsr MCPLOT
	inc !lv_i-
	jmp !-
!:
	rts
!:
	lda !lv_y2-
	cmp !lv_y1-
	beq !+
	jmp !++++ // jump to ELSE (CANNOT OPTIMIZE)
!:
	lda !lv_x1-
	sta !lv_i-
!:			 // Top of FOR Loop
	lda !lv_i-
	cmp !lv_x2-
	
	beq !+ // jump out of FOR () and on to rts
	
	lda !lv_i-
	sta $FA

	lda !lv_Y-
	sta $FC

	lda !lv_colour-
	sta $FD

	jsr MCPLOT

	inc !lv_i-

	jmp !-
!:
	rts
!:

// Top of IF statement
	lda !lv_dx-+1
	cmp !lv_dy-+1
	bne !+
	lda !lv_dx-
	cmp !lv_dy-
!:
	bcc !_skip+
	jmp !+++++ // jump to ELSE (CANNOT OPTIMIZE)
!_skip:

// Top of IF statement (if CASE == 3)
	lda !lv_CASE-
	cmp #$03
	bne !+++ // jump to ELSE ()

	lda !lv_y1-
	sta !lv_i-
!:			 // Top of FOR Loop
	lda !lv_i-
	cmp !lv_y2-
	beq !+
	
	sec 
	lda !lv_y1-
	sbc !lv_i-
	
	//sta !lv_Z1-
	sta _MUL16_FB

	ldx #$00
	stx _MUL16_FC

	//sta _MUL16_FB
	lda !lv_dx-
	sta _MUL16_FD
	lda !lv_dx-+1
	sta _MUL16_FE
	jsr MUL16
	
	lda MUL16R
	ldx MUL16R+1
	sta !lv_Zx-
	sta _DIV16_FB
	
	stx _DIV16_FC
	lda !lv_dy-
	sta _DIV16_FD
	lda !lv_dy-+1
	sta _DIV16_FE
	jsr DIV16
	
	lda _DIV16_FB
	
	clc 
	adc !lv_x1-

	sta $FA
	lda !lv_i-
	sta $FC
	lda !lv_colour-
	sta $FD
	jsr MCPLOT

	
	dec !lv_i-
	jmp !-
!:
	rts
	
!:
	lda !lv_y1-
	sta !lv_i-
!:			 // Top of FOR Loop
	lda !lv_i-
	cmp !lv_y2-	
	beq !+ // jump out of FOR ()
	
	sec 
	lda !lv_i-
	sbc !lv_y1-
	sta !lv_Z1-
	lda #$00
	sta !lv_Z1-+1
	sta _MUL16_FC
	
	lda !lv_Z1-
	sta _MUL16_FB
	
	lda !lv_dx-
	sta _MUL16_FD
	lda !lv_dx-+1
	sta _MUL16_FE
	jsr MUL16
	
	lda MUL16R
	ldx MUL16R+1
	sta !lv_Zx-
	stx !lv_Zx- +1

	sta _DIV16_FB
	stx _DIV16_FC
	
	lda !lv_dy-
	sta _DIV16_FD
	lda !lv_dy- +1
	sta _DIV16_FE
	jsr DIV16
	
	lda _DIV16_FB
	
	sta !lv_Zx-
	clc 
	adc !lv_x1-
	sta $FA
	lda !lv_i-
	sta $FC
	lda !lv_colour-
	sta $FD
	jsr MCPLOT
	inc !lv_i-
	jmp !-
	
!:

// Top of IF statement
	lda !lv_CASE-
	cmp #$03
	bne !+++ // jump to ELSE 
	lda !lv_x2-
	sta !lv_i-

!:			 // Top of FOR Loop
	lda !lv_i-
	cmp !lv_x1-
	beq !+ // jump out of FOR ()
	sec 
	lda !lv_x2-
	sbc !lv_i-
	sta !lv_Z1-
	sta _MUL16_FB
	lda #$00
	sta _MUL16_FC
	lda !lv_dy-
	sta _MUL16_FD
	lda !lv_dy-+1
	sta _MUL16_FE
	jsr MUL16
	
	lda MUL16R
	ldx MUL16R+1

	sta _DIV16_FB
	stx _DIV16_FC
	lda !lv_dx-
	sta _DIV16_FD
	lda !lv_dx-+1
	sta _DIV16_FE
	jsr DIV16

	
	lda _DIV16_FB
	clc 
	adc !lv_y2-
	sta $FC

	lda !lv_i-
	sta $FA
	lda !lv_colour-
	sta $FD
	jsr MCPLOT
	dec !lv_i-
	jmp !-
!:
	rts
	
!:


	lda !lv_x1-
	sta !lv_i-
!:			 // Top of FOR Loop
	lda !lv_i-
	cmp !lv_x2-
	beq !--- // jump out of FOR ()
	sec 
	lda !lv_i-
	sbc !lv_x1-
	sta !lv_Z1-
	sta _MUL16_FB

	lda #$00
	sta !lv_Z1-+1
	sta _MUL16_FC
	
	lda !lv_dy-
	sta _MUL16_FD
	lda !lv_dy-+1
	sta _MUL16_FE
	jsr MUL16
	
	lda MUL16R
	ldx MUL16R+1

	sta !lv_Zy-
	sta _DIV16_FB
	stx !lv_Zy-+1
	stx _DIV16_FC

	lda !lv_dx-
	sta _DIV16_FD
	lda !lv_dx-+1
	sta _DIV16_FE
	jsr DIV16
	
	lda _DIV16_FB
	clc 
	adc !lv_y1-

	// not sure this next line is needed
	//sta !lv_Y-
	
	sta $FC
	lda !lv_i-
	sta $FA
	
	lda !lv_colour-
	sta $FD
	jsr MCPLOT
	inc !lv_i-
	jmp !-
!:
	rts

saveregs:
	lda $D011
	sta !reg1+
	lda $D020
	sta !reg2+
	lda $D021
	sta !reg3+
	lda $D016
	sta !reg4+
	lda $D018
	sta !reg5+
	rts
	
!reg1:	.byte $00
!reg2:	.byte $00
!reg3:	.byte $00
!reg4:	.byte $00
!reg5:	.byte $00

restoreregs:
	lda !reg1-
	sta $D011
	lda !reg2-
	sta $D020
	lda !reg3-
	sta $D021
	lda !reg4-
	sta $D016
	lda !reg5-
	sta $D018
	rts 
!arg0:	.byte $00
!arg1:	.byte $00
!arg2:	.byte $00

	// clearmem( PG, # or loops );
clearmem:
	pla 
	tax 
	pla 
	tay

	pla
	sta !arg1-

	// arg0
	pla
	sta $03

	tya 
	pha 
	txa 
	pha 

	ldx !arg1-
	
	lda #$00
	sta $02
	tay
	//ldy #$00
!:
	sta ($02),Y
	iny
	bne !-
	inc $03
	dex
	bne !-

	rts


	// fillmem( PG, char, # or loops );
fillmem:
	pla 
	tax 
	pla 
	tay

	pla
	sta !arg2-

	pla
	sta !arg1-
	
	// arg0
	pla
	sta $03

	tya 
	pha 
	txa 
	pha 

	ldx !arg2-
	
	ldy #$00
	sty $02
	
	lda !arg1-
!:
	sta ($02),Y
	iny
	bne !-
	inc $03
	dex
	bne !-

	rts


clearsid:	
	lda #$D4
	sta $03	
	lda #$18
	sta $02	
	ldx #$18
	lda #$00
	tay
!:
	sta ($02),Y
	dex
	bne !-
	rts
cell_addr_hi:	.byte $A0,$A1,$A2,$A3,$A5,$A6,$A7,$A8,$Aa,$Ab,$Ac,$Ad,$Af,$B0,$B1,$B2,$B4,$B5,$B6,$B7,$B9,$Ba,$Bb,$Bc,$Be
cell_addr_lo:	.byte $00,$40,$80,$c0,$00,$40,$80,$c0,$00,$40,$80,$c0,$00,$40,$80,$c0,$00,$40,$80,$c0,$00,$40,$80,$c0,$00

!lv_arg0: .byte $00 // y
!lv_arg1: .byte $00, $00
!lv_addr_hi: .byte $00
!lv_addr_lo: .byte $00
	
getpixel:	
	pla
	tax 
	pla 
	tay
	
	pla 
	sta !lv_arg0-
	pla 
	sta !lv_arg1- +1
	pla 
	sta !lv_arg1-
	tya 
	pha
	txa 
	pha
	lda !lv_arg0-
	lsr
	lsr
	lsr
	tax            //  x = Y/8	
	lda !lv_arg1-
	and #$f8       // x /8 * 8 = clear lower 3 bits to 0
	clc
	adc cell_addr_lo,x // (Y/8)*320
	sta !lv_addr_lo-     // so this is BASE+Y/8*320+((X/8)*8)
	lda cell_addr_hi,x
	adc !lv_arg1- +1 // xhi byte
	sta !lv_addr_hi-  // and the upper 8 bits
	lda !lv_arg0-
	and #$07         // get the Line we want to set
	adc !lv_addr_lo-
	sta !lv_addr_lo-
	pla 
	tax 
	pla 
	tay 

	lda !lv_addr_lo-
	pha
	lda !lv_addr_hi-
	pha
	lda #$02
	pha
	
	tya 
	pha 
	txa 
	pha 

	rts
!mem:	.byte $00
pause:	
	lda #$00
	sta $C6
	jsr $FFE4
	sta !mem-
!:
	lda !mem- // this $00 will change
	cmp #$00
	bne !+
	jsr $FFE4
	sta !mem-
	jmp !-
!:	rts 
!mem0:   .byte $00
setScreenMode:
	pla 
	tax 
	pla
	tay
	
	pla 
	sta !mem0-
	
	tya 
	pha 
	txa 
	pha
	
	lda !mem0-
	cmp #$00
	bne !+
	
	lda #$BF
	and $D011
	sta !mem0-
	lda #$20
	ora !mem0-
	sta $D011
	
	lda #$EF
	and $D016
	sta $D016
	rts
!:

	lda !mem0-
	cmp #$01
	bne !+
	
	lda #$9F
	and $D011
	sta $D011
	lda #$10
	ora $D016
	sta $D016
	rts
!:

	lda !mem0-
	cmp #$02
	bne !+
	
	lda #$BF
	and $D011
	sta !mem0-
	lda #$20
	ora !mem0-
	sta $D011
	lda #$EF
	and $D016
	sta $D016
	rts
!:

	// multicolour bitmode (3)
	lda !mem0-
	cmp #$03
	bne !+
	lda #$BF  // clear bit 6
	and $D011
	sta !mem0-
	lda #$20  // set bit 5
	ora !mem0-
	sta $D011
	
	lda #$10 // set bit 4
	ora $D016
	sta $D016
	rts
!:

	lda !mem0-
	cmp #$04
	bne !+
	
	lda #$DF
	and $D011
	sta !mem0-
	lda #$40
	ora !mem0-
	sta $D011
	lda #$EF
	and $D016
	sta $D016
!:
	rts
