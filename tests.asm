; RULE: datatype: int
.org $0834
; =========================================================
;                         main()
; =========================================================
	LDA #$00
; RULE: datatype: uint
; RULE: statement: datatype ID init
; UINT color=A datatype#: 00
; UINT UintID A
	STA $0336
; =========================================================
; ----------------------------------------------------------------------------------
; romout() : Swap out a ROM: Taken from https://sta.c64.org/cbm64mem.html
; %x00: RAM visible in all three areas.
; %x01: RAM visible at $A000-$BFFF and $E000-$FFFF.
; %x10: RAM visible at $A000-$BFFF; KERNAL ROM visible at $E000-$FFFF.
; %x11: BASIC ROM visible at $A000-$BFFF; KERNAL ROM visible at $E000-$FFFF.
; %0xx: Character ROM visible at $D000-$DFFF. (Except for the value %000, see above)
; %1xx: I/O area visible at $D000-$DFFF. (Except for the value %100, see above.)
; ----------------------------------------------------------------------------------
	SEI
	LDA $01
	AND #$F8
	ORA #$06
	STA $01
	CLI
	JSR LBL0L4; saveregs()
; =========================================================
;                         printf("PRESS A KEY TO BLANK SCREEN\n");
; =========================================================
	LDA #$09
	STA $03
	LDA #$E9
	STA $02
	JSR PRN
	JSR LBL0L2; pause()
; blank(exp); : set bit 4 of $D011 to LSB of expression
	LDX $02
	LDA #$00
	AND #$01
	ASL
	ASL
	ASL
	ASL
	STA $02
	LDA $D011
	AND #$EF
	ORA $02
	STA $D011
	STX $02
; Preserve $02
	LDA $02
	PHA
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L0:
	PHA
; ---------------------------------------------------------
; RULE: datatype: word
; RULE: init: '=' expression
	LDA #$00
	LDX #$00
; RULE: statement: datatype ID init
; WORD i=XA datatype#: 02
	STA $0337
	STX $0338
; ---------------------------------------------------------
; WordID $0337 vs. WordIMM w65534
LBL1L1:			; Top of FOR Loop
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $0337 v. w65534
	LDA $0338
	CMP #$FF
	.BYTE $D0, $05;  BNE +5
	LDA $0337
	CMP #$FE
	.BYTE #$B0, #$03; BCS +3
	JMP LBL1L3; if c==0 jump to BODY
	JMP LBL1L4; jump out of FOR
; =========================================================
; ---------------------------------------------------------
LBL1L2:
; OP2
; RULE: expression: expression arithmetic expression
; $0337 + u1
; $0337 (2) + u1 (-1)
	CLC
; WordID + (IntIMM || UintIMM)
	CLC
	LDA #$01
	ADC $0337
	PHA
	LDA #$00
	ADC $0338
	TAX
	PLA
; RULE: init: '=' expression
; initialising a word with XA
; RULE: statement: ID init
; WordID = XA
	STA $0337
	STX $0338
	JMP LBL1L1; jump to top of FOR loop
; ---------------------------------------------------------
LBL1L3:
; inc(expression)
	INC $0336
; =========================================================
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $0336
	STA $D020
; ---------------------------------------------------------
	JMP LBL1L2; jump to iterator
LBL1L4:
	PLA
; ---------------------------------------------------------
; Restore $02
	PLA
	STA $02
	JSR LBL0L2; pause()
; blank(exp); : set bit 4 of $D011 to LSB of expression
	LDX $02
	LDA #$01
	AND #$01
	ASL
	ASL
	ASL
	ASL
	STA $02
	LDA $D011
	AND #$EF
	ORA $02
	STA $D011
	STX $02
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$06
	STA $D020
; =========================================================
;                         printf("OKAY - WE'RE BACK!\n");
; =========================================================
	LDA #$0A
	STA $03
	LDA #$06
	STA $02
	JSR PRN
	JSR LBL0L2; pause()
	JSR LBL0L6; shortcls()
; Preserve $02
	LDA $02
	PHA
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L5:
	PHA
; ---------------------------------------------------------
; RULE: init: '=' expression
	LDA #$00
	LDX #$00
; RULE: statement: ID init
; WordID = XA
	STA $0337
	STX $0338
; ---------------------------------------------------------
; WordID $0337 vs. WordIMM w65534
LBL1L6:			; Top of FOR Loop
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $0337 v. w65534
	LDA $0338
	CMP #$FF
	.BYTE $D0, $05;  BNE +5
	LDA $0337
	CMP #$FE
	.BYTE #$B0, #$03; BCS +3
	JMP LBL1L8; if c==0 jump to BODY
	JMP LBL1L9; jump out of FOR
; =========================================================
; ---------------------------------------------------------
LBL1L7:
; OP2
; RULE: expression: expression arithmetic expression
; $0337 + u1
; $0337 (2) + u1 (-1)
	CLC
; WordID + (IntIMM || UintIMM)
	CLC
	LDA #$01
	ADC $0337
	PHA
	LDA #$00
	ADC $0338
	TAX
	PLA
; RULE: init: '=' expression
; initialising a word with XA
; RULE: statement: ID init
; WordID = XA
	STA $0337
	STX $0338
	JMP LBL1L6; jump to top of FOR loop
; ---------------------------------------------------------
LBL1L8:
; inc(expression)
	INC $0336
; =========================================================
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $0336
	STA $D020
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $0336
	STA $D021
; ---------------------------------------------------------
	JMP LBL1L7; jump to iterator
LBL1L9:
	PLA
; ---------------------------------------------------------
; Restore $02
	PLA
	STA $02
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$06
	STA $D021
; =========================================================
;                         printf("DONE\n");
; =========================================================
	LDA #$0A
	STA $03
	LDA #$1A
	STA $02
	JSR PRN
	JSR LBL0L3; clearkb()
	JSR LBL0L5; restoreregs()
; ------------------------------------------------
; romin() : Restore the default ROMS configuration
	SEI
	LDA #$37; Default Value
	STA $01
	CLI
; ------------------------------------------------
	RTS
; RULE: datatype: void
; ======================== cr ========================
LBL0L0:
	LDA #$0D
; =========================================================
;                         jsr(HEX_NUM)
; =========================================================
	JSR $FFD2
	RTS
; RULE: datatype: void
; ======================== sp ========================
LBL0L1:
	LDA #$20
; =========================================================
;                         jsr(HEX_NUM)
; =========================================================
	JSR $FFD2
	RTS
; RULE: datatype: void
; ======================== pause ========================
LBL0L2:
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$00
	STA $C6
; =========================================================
;                         jsr(HEX_NUM)
; =========================================================
	JSR $FFE4
; RULE: datatype: uint
; =========================================================
;                  getchar()
; =========================================================
	JSR $FFE4
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT pausev=A datatype#: 00
; UINT UintID A
	STA $0339
; =========================================================
; =========================================================
;                         WHILE LOOP
; =========================================================
	PHA
LBL1L10:
; ---------------------------------------------------------
; UintID $0339 vs. UintIMM u0
LBL1L11:			; Top of WHILE Loop
; UintID relop UintIMM
	LDA $0339
	CMP #$00
	.BYTE #$F0, #$03; BEQ +3
	JMP LBL1L13; jump to ELSE
; =========================================================
LBL1L12:
; =========================================================
;                  getchar()
; =========================================================
	JSR $FFE4
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: ID init
	STA $0339
; =========================================================
	JMP LBL1L11; jump to top of WHILE loop
LBL1L13:
	PLA
	RTS
; RULE: datatype: void
; ======================== clearkb ========================
LBL0L3:
; poke( expression, expression );
; POKE( (U)Int, IMM); Zero Page
	LDA #$00
	STA $C6
; =========================================================
;                         jsr(NUMBER)
; =========================================================
	JSR $FFE4
	RTS
; RULE: datatype: void
; ======================== saveregs ========================
LBL0L4:
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D011
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT oldD011=A datatype#: 00
; UINT UintID A
	STA $033A
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D016
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT oldD016=A datatype#: 00
; UINT UintID A
	STA $033B
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D018
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT oldD018=A datatype#: 00
; UINT UintID A
	STA $033C
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D020
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT oldD020=A datatype#: 00
; UINT UintID A
	STA $033D
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D021
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT oldD021=A datatype#: 00
; UINT UintID A
	STA $033E
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $0286
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT oldChar=A datatype#: 00
; UINT UintID A
	STA $033F
; =========================================================
	RTS
; RULE: datatype: void
; ======================== restoreregs ========================
LBL0L5:
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $033A
	STA $D011
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $033B
	STA $D016
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $033C
	STA $D018
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $033D
	STA $D020
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $033E
	STA $D021
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $033F
	STA $0286
	RTS
; RULE: datatype: void
; ======================== shortcls ========================
LBL0L6:
	LDA #$93
; =========================================================
;                         jsr(HEX_NUM)
; =========================================================
	JSR $FFD2
	RTS
PRN:
	LDY #$00
PRN_LOOP:
	LDA ($02),Y
	BEQ PRN_END
	JSR $FFD2
	INY
	JMP PRN_LOOP
PRN_END:
	RTS
; ; $9e9			"PRESS A KEY TO BLANK SCREEN\n"
STRLBL0:
	.byte $50, $52, $45, $53, $53, $20, $41, $20, $4B, $45, $59, $20, $54, $4F, $20, $42, $4C, $41, $4E, $4B, $20, $53, $43, $52, $45, $45, $4E, $0D, $00
; ; $a06			"OKAY - WE'RE BACK!\n"
STRLBL1:
	.byte $4F, $4B, $41, $59, $20, $2D, $20, $57, $45, $27, $52, $45, $20, $42, $41, $43, $4B, $21, $0D, $00
; ; $a1a			"DONE\n"
STRLBL2:
	.byte $44, $4F, $4E, $45, $0D, $00
