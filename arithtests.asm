 //  Variable Labels
.label wID0 = $C000
.label wID1 = $C002
.label wID2 = $C004
.label uID0 = $C006
.label uID1 = $C007
.label uID2 = $C008
.label f = $C009
* = $0801
BasicUpstart($080D)
* = $080D
// =========================================================
//                         main()
// =========================================================
	sta wID0
	stx wID0 +1
// initialising with WordIMM
	lda #$34
	ldx #$12
// word WordID = XA
	sta wID1
	stx wID1 +1
	sta wID2
	stx wID2 +1
// initialising with UintIMM
	lda #$0A
// uint UintID = A
	sta uID0
	sta uID1
	sta uID2
// initialising with UintIMM
	lda #$24
// UintID = A
	sta uID1
// initialising with UintIMM
	lda #$05
// UintID = A
	sta uID2
// printf("A VS. A\n\n");
	lda #<STRLBL0
	sta $02
	lda #>STRLBL0
	sta $03
	jsr _prn
// touint(WordID|UintID) --> A
	lda uID1
// OP1 (A)
	pha
// touint(WordID|UintID) --> A
	lda uID2
// A math A: TOC
// A + A --> A (12 cycles)
	sta !+ +1
	pla
	clc
!:	adc #$00 // will be overwritten
// initialising with A
// UintID = A
	sta uID0
	jsr showUint
// printf("41");
	lda #<STRLBL1
	sta $02
	lda #>STRLBL1
	sta $03
	jsr _prn
// touint(WordID|UintID) --> A
	lda uID1
// OP1 (A)
	pha
// touint(WordID|UintID) --> A
	lda uID2
// A math A: TOC
// A - A --> A (12 cycles)
	sta !+
	pla
	sec 
	.byte $E9 // <-- SBC imm
!:	.byte $00
// initialising with A
// UintID = A
	sta uID0
	jsr showUint
// printf("31");
	lda #<STRLBL2
	sta $02
	lda #>STRLBL2
	sta $03
	jsr _prn
// touint(WordID|UintID) --> A
	lda uID1
// OP1 (A)
	pha
// touint(WordID|UintID) --> A
	lda uID2
// A math A: TOC
// A * A --> A
	pha
	lda $02
	tay
	lda $03
	tax
	pla
	sta $02
	pla
	sta $03
	jsr UMUL
	ldx $03
	pla
	sta $03
	pla
	sta $02
	txa
// initialising with A
// UintID = A
	sta uID0
	jsr showUint
// printf("180");
	lda #<STRLBL3
	sta $02
	lda #>STRLBL3
	sta $03
	jsr _prn
// touint(WordID|UintID) --> A
	lda uID1
// OP1 (A)
	pha
// touint(WordID|UintID) --> A
	lda uID2
// A math A: TOC
// A / A --> A
	sta _DIV16_FD
	pla
	sta _DIV16_FB
	lda #$00
	sta _DIV16_FC
	sta _DIV16_FE
	jsr DIV16
// initialising with XA
// IntID = XA
	sta uID0
	jsr showUint
// printf("7");
	lda #<STRLBL4
	sta $02
	lda #>STRLBL4
	sta $03
	jsr _prn
// touint(UintIMM) --> A
	lda #$03
// OP1 (A)
	pha
// touint(UintIMM) --> A
	lda #$05
// A math A: TOC
// A ** A --> XA
	tax
	lda #$00
	pha
	txa
	pha
	jsr _pow16
	pla
	tax
	pla
// initialising with XA
// IntID = XA
	sta uID0
	jsr showUint
// printf("243");
	lda #<STRLBL5
	sta $02
	lda #>STRLBL5
	sta $03
	jsr _prn
	jsr Pause
// printf("A VS. FAC\n\n");
	lda #<STRLBL6
	sta $02
	lda #>STRLBL6
	sta $03
	jsr _prn
brkpt:
// vvvvvvv
// touint(WordID|UintID) --> A
	lda uID1
// OP1 (A)
// ^^^--- OPTIMIZE ---^^^
// A math FloatIMM: TOC
	tay
	lda #$00
	sta $6F
	jsr $B3A2 // WORD -> FAC
	jsr $BC0F // FAC -> ARG
// inline float: 5.0
// 6 Byte FAC: .byte  $83, $A0, $00, $00, $00, $20
// 5 Byte MEM: .byte  $83, $20, $00, $00, $00
	lda #$83
	sta $19
	lda #$20
	sta $1A
	lda #$00
	sta $1B
	sta $1C
	sta $1D
	lda #$19 // OPTIMIZE?
	ldy #$00
	jsr $BBA2 // MEM -> FAC
	jsr $BC2B // SIGN of FAC
	bpl !skip+
	dec $6F
!skip:
	jsr $B86A // ARG + FAC -> FAC
// initialising with FAC
// float FloatID = FAC
	ldx #<f
	ldy #>f
	jsr $BBD4 // FAC -> MEM
// ^^^^^^^
	jsr showFloat
// printf("41");
	lda #<STRLBL7
	sta $02
	lda #>STRLBL7
	sta $03
	jsr _prn
// touint(WordID|UintID) --> A
	lda uID1
// OP1 (A)
// ^^^--- OPTIMIZE ---^^^
// A math FloatIMM: TOC
	tay
	lda #$00
	sta $6F
	jsr $B3A2 // WORD -> FAC
	jsr $BC0F // FAC -> ARG
// inline float: 5.0
// 6 Byte FAC: .byte  $83, $A0, $00, $00, $00, $20
// 5 Byte MEM: .byte  $83, $20, $00, $00, $00
	lda #$83
	sta $19
	lda #$20
	sta $1A
	lda #$00
	sta $1B
	sta $1C
	sta $1D
	lda #$19 // OPTIMIZE?
	ldy #$00
	jsr $BBA2 // MEM -> FAC
	jsr $BC2B // SIGN of FAC
	bpl !skip+
	dec $6F
!skip:
	jsr $B853 // ARG - FAC -> FAC
// initialising with FAC
// UintID = FAC
	jsr $B1AA // FAC -> WORD (y-lo a-hi)
	sty uID0
	jsr showUint
// printf("31");
	lda #<STRLBL8
	sta $02
	lda #>STRLBL8
	sta $03
	jsr _prn
// touint(WordID|UintID) --> A
	lda uID1
// OP1 (A)
// ^^^--- OPTIMIZE ---^^^
// A math FloatIMM: TOC
	tay
	lda #$00
	sta $6F
	jsr $B3A2 // WORD -> FAC
	jsr $BC0F // FAC -> ARG
// inline float: 5.0
// 6 Byte FAC: .byte  $83, $A0, $00, $00, $00, $20
// 5 Byte MEM: .byte  $83, $20, $00, $00, $00
	lda #$83
	sta $19
	lda #$20
	sta $1A
	lda #$00
	sta $1B
	sta $1C
	sta $1D
	lda #$19 // OPTIMIZE?
	ldy #$00
	jsr $BBA2 // MEM -> FAC
	jsr $BC2B // SIGN of FAC
	bpl !skip+
	dec $6F
!skip:
	jsr $BA2B // ARG * FAC -> FAC
// initialising with FAC
// FloatID = FAC
	ldx #<f
	ldy #>f
	jsr $BBD4 // FAC -> MEM
	jsr showFloat
// printf("180");
	lda #<STRLBL9
	sta $02
	lda #>STRLBL9
	sta $03
	jsr _prn
// touint(WordID|UintID) --> A
	lda uID1
// OP1 (A)
// ^^^--- OPTIMIZE ---^^^
// A math FloatIMM: TOC
	tay
	lda #$00
	sta $6F
	jsr $B3A2 // WORD -> FAC
	jsr $BC0F // FAC -> ARG
// inline float: 5.0
// 6 Byte FAC: .byte  $83, $A0, $00, $00, $00, $20
// 5 Byte MEM: .byte  $83, $20, $00, $00, $00
	lda #$83
	sta $19
	lda #$20
	sta $1A
	lda #$00
	sta $1B
	sta $1C
	sta $1D
	lda #$19 // OPTIMIZE?
	ldy #$00
	jsr $BBA2 // MEM -> FAC
	jsr $BC2B // SIGN of FAC
	bpl !skip+
	dec $6F
!skip:
	jsr $BB12 // ARG / FAC -> FAC
// initialising with FAC
// UintID = FAC
	jsr $B1AA // FAC -> WORD (y-lo a-hi)
	sty uID0
	jsr showUint
// printf("7");
	lda #<STRLBL10
	sta $02
	lda #>STRLBL10
	sta $03
	jsr _prn
// touint(UintIMM) --> A
	lda #$03
// OP1 (A)
// ^^^--- OPTIMIZE ---^^^
// A math FloatIMM: TOC
	tay
	lda #$00
	sta $6F
	jsr $B3A2 // WORD -> FAC
	jsr $BC0F // FAC -> ARG
// inline float: 5.0
// 6 Byte FAC: .byte  $83, $A0, $00, $00, $00, $20
// 5 Byte MEM: .byte  $83, $20, $00, $00, $00
	lda #$83
	sta $19
	lda #$20
	sta $1A
	lda #$00
	sta $1B
	sta $1C
	sta $1D
	lda #$19 // OPTIMIZE?
	ldy #$00
	jsr $BBA2 // MEM -> FAC
	jsr $BC2B // SIGN of FAC
	bpl !skip+
	dec $6F
!skip:
	jsr $BF7B // ARG ** FAC -> FAC
// initialising with FAC
// UintID = FAC
	jsr $B1AA // FAC -> WORD (y-lo a-hi)
	sty uID0
	jsr showUint
// printf("243");
	lda #<STRLBL11
	sta $02
	lda #>STRLBL11
	sta $03
	jsr _prn
	jsr Pause
// initialising with UintIMM
	lda #$0A
// UintID = A
	sta uID0
// initialising with WordIMM
	lda #$34
	ldx #$12
// WordID = XA
	sta wID1
	stx wID1 +1
// touint(WordID|UintID) --> A
	lda uID0
// WordID math A: TOC
// WordID + A --> XA
	clc
	adc wID1
	tay
	lda #$00
	adc wID1 +1
	tax
	tya
// initialising with XA
// WordID = XA
	sta wID0
	stx wID0 +1
	jsr showWord
// printf("4670");
	lda #<STRLBL12
	sta $02
	lda #>STRLBL12
	sta $03
	jsr _prn
// touint(WordID|UintID) --> A
	lda uID0
// WordID math A: TOC
// WordID - A --> XA
	sec 
	sta !+
	lda wID1
	.byte $E9 // <-- SBC imm
!:	.byte $00
	tay
	lda wID1 +1
	sbc #$00
	tax
	tya
// initialising with XA
// WordID = XA
	sta wID0
	stx wID0 +1
	jsr showWord
// printf("4650");
	lda #<STRLBL13
	sta $02
	lda #>STRLBL13
	sta $03
	jsr _prn
// touint(WordID|UintID) --> A
	lda uID0
// WordID math A: TOC
// WordID * A --> XA
	sta _MUL16_FD
	lda #$00
	sta _MUL16_FE
	lda wID1 +1
	sta _MUL16_FC
	lda wID1
	sta _MUL16_FB
	jsr MUL16
// initialising with XA
// WordID = XA
	sta wID0
	stx wID0 +1
	jsr showWord
// printf("46600");
	lda #<STRLBL14
	sta $02
	lda #>STRLBL14
	sta $03
	jsr _prn
// touint(WordID|UintID) --> A
	lda uID0
// WordID math A: TOC
// WordID / A --> XA
	sta _DIV16_FD
	lda #$00
	sta _DIV16_FE
	lda wID1 +1
	sta _DIV16_FC
	lda wID1
	sta _DIV16_FB
	jsr DIV16
// initialising with XA
// WordID = XA
	sta wID0
	stx wID0 +1
	jsr showWord
// printf("466");
	lda #<STRLBL15
	sta $02
	lda #>STRLBL15
	sta $03
	jsr _prn
// initialising with UintIMM
	lda #$02
// UintID = A
	sta uID0
// initialising with WordIMM
	lda #$F0
	ldx #$00
// WordID = XA
	sta wID1
	stx wID1 +1
// touint(WordID|UintID) --> A
	lda uID0
// WordID math A: TOC
// WordID ** A --> XA
	tax
	lda wID1
	pha
	lda wID1 +1
	pha
	txa
	pha
	jsr _pow16
	pla
	tax
	pla
// initialising with XA
// WordID = XA
	sta wID0
	stx wID0 +1
	jsr showWord
// printf("57600");
	lda #<STRLBL16
	sta $02
	lda #>STRLBL16
	sta $03
	jsr _prn
	jsr Pause // JSR+RTS chain (OPTIMIZE)
	rts
// Function: VOID: showWord
// return address (OPTIMIZE)
!rx:	.byte $00
!ry:	.byte $00
showWord:
// vvv--- this is a work in progress ---vvv
	lda wID0
	pha
	lda wID0 +1
	pha
	lda #$02 // Word Type
	ldy #<STRLBL17
	ldx #>STRLBL17
	jsr _new_formatted_printf
// ^^^--- this is a work in progress ---^^^
	rts
// Function: VOID: showUint
// return address (OPTIMIZE)
!rx:	.byte $00
!ry:	.byte $00
showUint:
// vvv--- this is a work in progress ---vvv
	lda uID0
	pha
	lda #$00 // Uint Type
	ldy #<STRLBL18
	ldx #>STRLBL18
	jsr _new_formatted_printf
// ^^^--- this is a work in progress ---^^^
	rts
// Function: VOID: showFloat
// return address (OPTIMIZE)
!rx:	.byte $00
!ry:	.byte $00
showFloat:
// vvv--- this is a work in progress ---vvv
	lda #<f
	ldy #>f
	jsr $BBA2 // MEM -> FAC
	lda #$03 // Float Type
	ldy #<STRLBL19
	ldx #>STRLBL19
	jsr _new_formatted_printf
// ^^^--- this is a work in progress ---^^^
	rts
// Function: VOID: Pause
// return address (OPTIMIZE)
!rx:	.byte $00
!ry:	.byte $00
Pause:
// printf("\n\nPRESS ANY KEY TO CONTINUE\n");
	lda #<STRLBL20
	sta $02
	lda #>STRLBL20
	sta $03
	jsr _prn
	jsr pause // JSR+RTS chain (OPTIMIZE)
	rts
// -----------------------------------
// string of PETSCII bytes tmp storage
!mem0:	.byte $00, $00, $00, $00, $00, $00, $00
// ------------------------------------------------------------
//     This chunk of code is by: Andrew Jacobs, 28-Feb-2004
// Taken from: http://6502.org/source/integers/hex2dec-more.htm
//  Modified to make jumps and addressing relative for KickAsm 
// ------------------------------------------------------------
!mem1:	.byte $00, $00, $00
!arg0:	.byte $00, $00
_display_word:		 // 2 Byte Word to Decimal
	stx !arg0- +1
	sta !arg0-
	sed 
	lda #$00
	sta !mem1-
	sta !mem1- +1
	sta !mem1- +2
	ldx #$10
!:	asl !arg0-
	rol !arg0- +1
	lda !mem1-
	adc !mem1-
	sta !mem1-
	lda !mem1- +1
	adc !mem1- +1
	sta !mem1- +1
	lda !mem1- +2
	adc !mem1- +2
	sta !mem1- +2
	dex 
	bne !-
	cld
// ------------------------------------------------------------
	lda !mem1-
	tay
	lsr 
	lsr 
	lsr 
	lsr 
	ora #$30
	sta !mem0- +4
	tya
	and #$0F
	ora #$30
	sta !mem0- +5
	lda !mem1- +1
	tay
	lsr 
	lsr 
	lsr 
	lsr 
	ora #$30
	sta !mem0- +2
	tya
	and #$0F
	ora #$30
	sta !mem0- +3
	lda !mem1- +2
	tay
	lsr 
	lsr 
	lsr 
	lsr 
	ora #$30
	sta !mem0-
	tya
	and #$0F
	ora #$30
	sta !mem0- +1
	ldx #$00
!:	lda !mem0-,X
	cmp #$30
	bne !+
	inx
	jmp !-
!:	cpx #$06
	bne !+
	dex 
!:	lda !mem0-,X
	beq !+
	inx
	jsr $FFD2
	jmp !-
!:	rts
// --------------------------
_DIV16_FD:
	.byte $00
_DIV16_FE:
	.byte $00
_DIV16_FB:
	.byte $00
_DIV16_FC:
	.byte $00
DIV16:
	lda #$00
	sta $02
	sta $03
	ldx #$10
!:
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
	bcc !+
	sta $03
	sty $02
	inc _DIV16_FB
!:
	dex 
	bne !--
	lda _DIV16_FB
	ldx _DIV16_FC
	rts
!lv_arg0:	.byte $00, $00
!lv_arg1:	.byte $00, $00
!lv_ret:	.byte $00, $00
!lv_mem0:	.byte $00, $00
!rx:	.byte $00
!ry:	.byte $00
_pow16:
	pla
	sta !rx-
	pla
	sta !ry-
	pla
	sta !lv_arg1-
	pla
	sta !lv_arg0- +1
	pla
	sta !lv_arg0-
	lda #$01
	ldx #$00
	sta !lv_ret-
	stx !lv_ret- +1
	stx !lv_mem0-
	stx !lv_mem0- +1
	lda !lv_arg1- +1
	bne !+
	lda !lv_arg1-
	cmp #$01
!:	bne !_skip+
	lda !lv_arg0-
	ldx !lv_arg0- +1
	sta !lv_ret-
	stx !lv_ret- +1
!_skip:	lda !lv_arg1- +1
	bne !+
	lda !lv_arg1-
	cmp #$01
!:	bcc !+++
	beq !+++
	lda #$00
	sta !lv_mem0-
	sta !lv_mem0- +1
!:	lda !lv_mem0- +1
	cmp !lv_arg1- +1
	bne !+
	lda !lv_mem0-
	cmp !lv_arg1-
!:	bcs !+
	lda !lv_ret-
	sta _MUL16_FB
	lda !lv_ret- +1
	sta _MUL16_FC
	lda !lv_arg0-
	sta _MUL16_FD
	lda !lv_arg0- +1
	sta _MUL16_FE
	jsr MUL16
	sta !lv_ret-
	stx !lv_ret- +1
	clc
	lda !lv_mem0-
	adc #$01
	sta !lv_mem0-
	lda !lv_mem0- +1
	adc #$00
	sta !lv_mem0- +1
	jmp !--
!:	lda !lv_ret-
	pha
	lda !lv_ret- +1
	pha
	lda !ry-
	pha
	lda !rx-
	pha
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
	sta MUL16R +1
	sta MUL16R +2
	sta MUL16R +3
	ldx #$10
!:	lsr !--
	ror !---
	bcc !+
	tay
	clc
	lda !-----
	adc MUL16R +2
	sta MUL16R +2
	tya
	adc !----
!:	ror 
	ror MUL16R +2
	ror MUL16R +1
	ror MUL16R
	dex 
	bne !--
	sta MUL16R+3
	lda MUL16R
	ldx MUL16R+1
	rts
UMUL:
	lda #$00
	ldx #$08
!:	lsr $03
	bcc !+
	clc
	adc $02
!:	asl $02
	dex 
	bne !--
	sta $03
	rts
// Turns a 1 byte value in A into 3 PETSCII chars in A, Y, and X
// Destroys $61 & $62 in ZP
_byte_to_string:
// Taken from: codebase64.org/doku.php?id=base:tiny_.a_to_ascii_routine
	ldy #$2F
	ldx #$3A
	sec 
!:	iny
	sbc #$64
	bcs !-
!:	dex 
	adc #$0A
	bmi !-
	adc #$2F
	sta $62
	stx $61
	tya
	ldx $62
	ldy $61
	rts
!rx:	.byte $00
!ry:	.byte $00
_new_formatted_printf:
	sty $02
	stx $03
	tax // save the type until later
	ldy #$00
!:	lda ($02),Y
	beq !+++
	cmp #$25 // (%)
	beq !+
	jsr $FFD2
	iny
	jmp !-
!:	iny
	lda ($02),Y
	cmp #$75 // (u)
	bne !+
	sty $04
	cpx #$00
	bne !a+
	jmp _printf_uint
!a:	cpx #$02
	bne !a+
	jmp _printf_word
!a:	cpx #$03
	bne !a+
	jmp _printf_float
!a:
_back_to_printf:
	ldy $04
	iny
	jmp !--
!:	lda #$25
	jsr $FFD2
	jmp !---
!:	rts
_printf_uint:	 // _printf_uint
	pla
	sta !rx-
	pla
	sta !ry-
	pla
	jsr _byte_to_string
	cmp #$30 // ----------
	beq !a+++
	jsr $FFD2
	tya
!a:	jsr $FFD2
!a:	txa
	jsr $FFD2
	jmp !a++
!a:	tya
	cmp #$30
	beq !a--
	jmp !a--- // ----------
!a:
	lda !ry-
	pha
	lda !rx-
	pha
	jmp _back_to_printf
_printf_word:	 // _printf_word
	pla
	sta !rx-
	pla
	sta !ry-
	pla
	tax
	pla
	jsr _display_word
	lda !ry-
	pha
	lda !rx-
	pha
	jmp _back_to_printf
_printf_float:	 // _printf_float
	lda $02
	pha
	lda $03
	pha
	jsr $BDDD // FAC -> PETSCII (Stored at $0100)
	lda #$00
	sta $02
	lda #$01
	sta $03
	jsr _prn
	pla
	sta $03
	pla
	sta $02
	jmp _back_to_printf
_prn:
	ldy #$00
!:	lda ($02),Y
	beq !+
	jsr $FFD2
	iny
	jmp !-
!:	rts
STRLBL0:
	 // .text "A VS. A\n\n"
	 // .byte $00
	.byte  $41, $20, $56, $53, $2E, $20, $41, $0D, $0D, $00
STRLBL1:
	 // .text "41"
	 // .byte $00
	.byte  $34, $31, $00
STRLBL2:
	 // .text "31"
	 // .byte $00
	.byte  $33, $31, $00
STRLBL3:
	 // .text "180"
	 // .byte $00
	.byte  $31, $38, $30, $00
STRLBL4:
	 // .text "7"
	 // .byte $00
	.byte  $37, $00
STRLBL5:
	 // .text "243"
	 // .byte $00
	.byte  $32, $34, $33, $00
STRLBL6:
	 // .text "A VS. FAC\n\n"
	 // .byte $00
	.byte  $41, $20, $56, $53, $2E, $20, $46, $41, $43, $0D, $0D, $00
STRLBL7:
	 // .text "41"
	 // .byte $00
	.byte  $34, $31, $00
STRLBL8:
	 // .text "31"
	 // .byte $00
	.byte  $33, $31, $00
STRLBL9:
	 // .text "180"
	 // .byte $00
	.byte  $31, $38, $30, $00
STRLBL10:
	 // .text "7"
	 // .byte $00
	.byte  $37, $00
STRLBL11:
	 // .text "243"
	 // .byte $00
	.byte  $32, $34, $33, $00
STRLBL12:
	 // .text "4670"
	 // .byte $00
	.byte  $34, $36, $37, $30, $00
STRLBL13:
	 // .text "4650"
	 // .byte $00
	.byte  $34, $36, $35, $30, $00
STRLBL14:
	 // .text "46600"
	 // .byte $00
	.byte  $34, $36, $36, $30, $30, $00
STRLBL15:
	 // .text "466"
	 // .byte $00
	.byte  $34, $36, $36, $00
STRLBL16:
	 // .text "57600"
	 // .byte $00
	.byte  $35, $37, $36, $30, $30, $00
STRLBL17:
	 // .text "\nRESULT: %u  SHOULD BE:"
	 // .byte $00
	.byte  $0D, $52, $45, $53, $55, $4C, $54, $3A, $20, $25, $75, $20, $20, $53, $48, $4F, $55, $4C, $44, $20, $42, $45, $3A, $00
STRLBL18:
	 // .text "\nRESULT: %u  SHOULD BE:"
	 // .byte $00
	.byte  $0D, $52, $45, $53, $55, $4C, $54, $3A, $20, $25, $75, $20, $20, $53, $48, $4F, $55, $4C, $44, $20, $42, $45, $3A, $00
STRLBL19:
	 // .text "\nRESULT: %u  SHOULD BE:"
	 // .byte $00
	.byte  $0D, $52, $45, $53, $55, $4C, $54, $3A, $20, $25, $75, $20, $20, $53, $48, $4F, $55, $4C, $44, $20, $42, $45, $3A, $00
STRLBL20:
	 // .text "\n\nPRESS ANY KEY TO CONTINUE\n"
	 // .byte $00
	.byte  $0D, $0D, $50, $52, $45, $53, $53, $20, $41, $4E, $59, $20, $4B, $45, $59, $20, $54, $4F, $20, $43, $4F, $4E, $54, $49, $4E, $55, $45, $0D, $00
!mem:	.byte $00 // <----+
pause:            //      |    OPTIMIZE:
	lda #$00  //      |    These lines can
	sta $C6   //      |    be commented out
	jsr $FFE4 //      |    unless you need
	sta !mem- // <----|    the value from
!:                //      |    which key was
	lda !mem- // <----|    pressed
	bne !+    //      |
	jsr $FFE4 //      |
	sta !mem- // <----+
	jmp !-
!:	rts 
