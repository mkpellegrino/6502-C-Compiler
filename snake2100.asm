.OPT ILLEGALS
; RULE: datatype: int
.org $0834
; =========================================================
;                         main()
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D020
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT oldD020=A datatype#: 00
; UINT UintID A
	STA $0336;  oldD020
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D021
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT oldD021=A datatype#: 00
; UINT UintID A
	STA $0337;  oldD021
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $0286
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT oldChar=A datatype#: 00
; UINT UintID A
	STA $0338;  oldChar
; =========================================================
; Call a function as a statement
	JSR LBL0L4; introScreen()
; RULE: datatype: uint
; NULL expression
; RULE: init: '=' expression
; RULE: statement: datatype ID init
; UINT i=NULL datatype#: 00
; NULL expression... variable is ghosted
; =========================================================
; RULE: datatype: word
; NULL expression
; RULE: init: '=' expression
; RULE: statement: datatype ID init
; WORD j=NULL datatype#: 02
; NULL expression... variable is ghosted
; =========================================================
; RULE: datatype: uint
; NULL expression
; RULE: init: '=' expression
; RULE: statement: datatype ID init
; UINT x1=NULL datatype#: 00
; NULL expression... variable is ghosted
; =========================================================
; RULE: datatype: uint
; NULL expression
; RULE: init: '=' expression
; RULE: statement: datatype ID init
; UINT y1=NULL datatype#: 00
; NULL expression... variable is ghosted
; =========================================================
; RULE: datatype: uint
; NULL expression
; RULE: init: '=' expression
; RULE: statement: datatype ID init
; UINT length=NULL datatype#: 00
; NULL expression... variable is ghosted
; =========================================================
; RULE: datatype: uint
; NULL expression
; RULE: init: '=' expression
; RULE: statement: datatype ID init
; UINT lastx=NULL datatype#: 00
; NULL expression... variable is ghosted
; =========================================================
; RULE: datatype: uint
; NULL expression
; RULE: init: '=' expression
; RULE: statement: datatype ID init
; UINT lasty=NULL datatype#: 00
; NULL expression... variable is ghosted
; =========================================================
; RULE: datatype: uint
; NULL expression
; RULE: init: '=' expression
; RULE: statement: datatype ID init
; UINT gameover=NULL datatype#: 00
; NULL expression... variable is ghosted
; =========================================================
; RULE: datatype: uint
; NULL expression
; RULE: init: '=' expression
; RULE: statement: datatype ID init
; UINT newx1=NULL datatype#: 00
; NULL expression... variable is ghosted
; =========================================================
; RULE: datatype: uint
; NULL expression
; RULE: init: '=' expression
; RULE: statement: datatype ID init
; UINT c=NULL datatype#: 00
; NULL expression... variable is ghosted
; =========================================================
; RULE: datatype: word
; NULL expression
; RULE: init: '=' expression
; RULE: statement: datatype ID init
; WORD score=NULL datatype#: 02
; NULL expression... variable is ghosted
; =========================================================
; RULE: datatype: word
; NULL expression
; RULE: init: '=' expression
; RULE: statement: datatype ID init
; WORD r0=NULL datatype#: 02
; NULL expression... variable is ghosted
; =========================================================
; RULE: datatype: uint
; NULL expression
; RULE: init: '=' expression
; RULE: statement: datatype ID init
; UINT newy1=NULL datatype#: 00
; NULL expression... variable is ghosted
; =========================================================
; RULE: datatype: uint
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$51
; RULE: statement: datatype ID init
; UINT player=A datatype#: 00
; UINT UintID A
	STA $0349;  player
; =========================================================
; RULE: datatype: uint
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$57
; RULE: statement: datatype ID init
; UINT trail=A datatype#: 00
; UINT UintID A
	STA $034A;  trail
; =========================================================
; RULE: datatype: word
; RULE: init: '=' expression
; initialising WordIMM: 0
	LDA #$00
	TAX
; RULE: statement: datatype ID init
; WORD timer=XA datatype#: 02
	STA $034B;  timer
	STX $034C
; =========================================================
; RULE: datatype: word
; NULL expression
; RULE: init: '=' expression
; RULE: statement: datatype ID init
; WORD freq=NULL datatype#: 02
; NULL expression... variable is ghosted
; =========================================================
; Call a function as an expression
; function call
	JSR LBL0L1; XYtoMEMLOC()
; Pop Return Value off of Processor Stack - 2023 04 02
	PLA
	TAY
	LDA #$00
	LDX #$00
	CPY #$00
	BEQ LBL1L1
	CPY #$01
	BEQ LBL1L0
	PLA
	TAX
LBL1L0:
	PLA
LBL1L1:
; =========================================================
; poke( expression, expression );
	STA LBL1L2
	STX LBL1L3
	LDA $034A;  trail
	.BYTE $8D	;  STA absolute
LBL1L2:			;  <-- low byte
	.BYTE $00
LBL1L3:			;  <-- hi byte
	.BYTE $00
	LDA #$05
; =========================================================
;                         jsr(HEX_NUM)
; =========================================================
	JSR $FFD2
; RULE: datatype: uint
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$01
; RULE: statement: datatype ID init
; UINT keepplaying=A datatype#: 00
; UINT UintID A
	STA $034F;  keepplaying
; =========================================================
; =========================================================
;                         WHILE LOOP
; =========================================================
	PHA
LBL1L4:
; ---------------------------------------------------------
; UintID $034F vs. UintIMM u1
LBL1L5:			; Top of WHILE Loop
; UintID relop UintIMM
	LDA $034F;  keepplaying
	CMP #$01
	.BYTE #$F0, #$03;  BEQ +3
	JMP LBL1L7;  jump to ELSE
; =========================================================
LBL1L6:
; Call a function as a statement
	JSR LBL0L0; resetVariables()
; Call a function as a statement
	JSR LBL0L3; screenSetup()
; =========================================================
;                  getin()
; =========================================================
	LDA $CB
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: ID init
	STA $0343;  c
; =========================================================
; Call a function as a statement
	JSR LBL0L7; setcolours()
; =========================================================
;                         WHILE LOOP
; =========================================================
	PHA
LBL2L0:
; ---------------------------------------------------------
; UintID $0341 vs. UintIMM u0
LBL2L1:			; Top of WHILE Loop
; UintID relop UintIMM
	LDA $0341;  gameover
	CMP #$00
	.BYTE #$F0, #$03;  BEQ +3
	JMP LBL2L3;  jump to ELSE
; =========================================================
LBL2L2:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL3L0:
; WordID $034B vs. WordID $034D
LBL3L1:			; Top of IF statement
; =========================================================
;                         WORD ID relop WORD ID
; =========================================================
	LDA $034C
	CMP $034E
	.BYTE $D0, $06;  BNE +6
	LDA $034B
	CMP $034D
	.BYTE #$F0, #$03;  BEQ +3
	JMP LBL3L3;  jump to ELSE
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL3L2:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL4L0:
; UintID $0343 vs. UintIMM u33
LBL4L1:			; Top of IF statement
; UintID relop UintIMM
	LDA $0343;  c
	CMP #$21
	.BYTE #$F0, #$03;  BEQ +3
	JMP LBL4L3;  jump to ELSE
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL4L2:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL5L0:
; UintID $033D vs. UintIMM u0
LBL5L1:			; Top of IF statement
; UintID relop UintIMM
	LDA $033D;  y1
	CMP #$00
	.BYTE $D0, $03;  BNE +3
	JMP LBL5L3;  if z==1 jump to ELSE
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL5L2:
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$00
; RULE: statement: ID init
	STA $033F;  lastx
; =========================================================
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$FF
; RULE: statement: ID init
	STA $0340;  lasty
; =========================================================
	JMP LBL5L4
LBL5L3:
; ---------------------------------------------------------
;                       ELSE:
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$00
; RULE: statement: ID init
	STA $0340;  lasty
; =========================================================
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL5L4:
	JMP LBL4L4
LBL4L3:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL4L4:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL4L5:
; UintID $0343 vs. UintIMM u37
LBL4L6:			; Top of IF statement
; UintID relop UintIMM
	LDA $0343;  c
	CMP #$25
	.BYTE #$F0, #$03;  BEQ +3
	JMP LBL4L8;  jump to ELSE
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL4L7:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL5L5:
; UintID $033D vs. UintIMM u24
LBL5L6:			; Top of IF statement
; UintID relop UintIMM
	LDA $033D;  y1
	CMP #$18
	.BYTE $D0, $03;  BNE +3
	JMP LBL5L8;  if z==1 jump to ELSE
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL5L7:
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$00
; RULE: statement: ID init
	STA $033F;  lastx
; =========================================================
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$01
; RULE: statement: ID init
	STA $0340;  lasty
; =========================================================
	JMP LBL5L9
LBL5L8:
; ---------------------------------------------------------
;                       ELSE:
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$00
; RULE: statement: ID init
	STA $0340;  lasty
; =========================================================
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL5L9:
	JMP LBL4L9
LBL4L8:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL4L9:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL4L10:
; UintID $0343 vs. UintIMM u30
LBL4L11:			; Top of IF statement
; UintID relop UintIMM
	LDA $0343;  c
	CMP #$1E
	.BYTE #$F0, #$03;  BEQ +3
	JMP LBL4L13;  jump to ELSE
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL4L12:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL5L10:
; UintID $033C vs. UintIMM u0
LBL5L11:			; Top of IF statement
; UintID relop UintIMM
	LDA $033C;  x1
	CMP #$00
	.BYTE $D0, $03;  BNE +3
	JMP LBL5L13;  if z==1 jump to ELSE
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL5L12:
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$FF
; RULE: statement: ID init
	STA $033F;  lastx
; =========================================================
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$00
; RULE: statement: ID init
	STA $0340;  lasty
; =========================================================
	JMP LBL5L14
LBL5L13:
; ---------------------------------------------------------
;                       ELSE:
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$00
; RULE: statement: ID init
	STA $033F;  lastx
; =========================================================
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL5L14:
	JMP LBL4L14
LBL4L13:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL4L14:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL4L15:
; UintID $0343 vs. UintIMM u38
LBL4L16:			; Top of IF statement
; UintID relop UintIMM
	LDA $0343;  c
	CMP #$26
	.BYTE #$F0, #$03;  BEQ +3
	JMP LBL4L18;  jump to ELSE
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL4L17:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL5L15:
; UintID $033C vs. UintIMM u39
LBL5L16:			; Top of IF statement
; UintID relop UintIMM
	LDA $033C;  x1
	CMP #$27
	.BYTE $D0, $03;  BNE +3
	JMP LBL5L18;  if z==1 jump to ELSE
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL5L17:
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$01
; RULE: statement: ID init
	STA $033F;  lastx
; =========================================================
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$00
; RULE: statement: ID init
	STA $0340;  lasty
; =========================================================
	JMP LBL5L19
LBL5L18:
; ---------------------------------------------------------
;                       ELSE:
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$00
; RULE: statement: ID init
	STA $033F;  lastx
; =========================================================
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL5L19:
	JMP LBL4L19
LBL4L18:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL4L19:
; RULE: init: '=' expression
; initialising WordIMM: 0
	LDA #$00
	TAX
; RULE: statement: ID init
; WordID = XA
	STA $034B;  timer
	STX $034C
; =========================================================
; =========================================================
;                  getin()
; =========================================================
	LDA $CB
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: ID init
	STA $0343;  c
; =========================================================
; OP2
; RULE: expression: expression arithmetic expression
; $033C + $033F
; $033C (0) + $033F (0)
	CLC
	LDA $033C
; UintID + UintID --> A
	ADC $033F
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: ID init
	STA $0342;  newx1
; =========================================================
; OP2
; RULE: expression: expression arithmetic expression
; $033D + $0340
; $033D (0) + $0340 (0)
	CLC
	LDA $033D
; UintID + UintID --> A
	ADC $0340
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: ID init
	STA $0348;  newy1
; =========================================================
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL4L20:
; UintID $0342 vs. UintIMM u255
LBL4L21:			; Top of IF statement
; UintID relop UintIMM
	LDA $0342;  newx1
	CMP #$FF
	.BYTE #$F0, #$03;  BEQ +3
	JMP LBL4L23;  jump to ELSE
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL4L22:
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$00
; RULE: statement: ID init
	STA $0342;  newx1
; =========================================================
	JMP LBL4L24
LBL4L23:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL4L24:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL4L25:
; UintID $0342 vs. UintIMM u40
LBL4L26:			; Top of IF statement
; UintID relop UintIMM
	LDA $0342;  newx1
	CMP #$28
	.BYTE #$F0, #$03;  BEQ +3
	JMP LBL4L28;  jump to ELSE
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL4L27:
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$27
; RULE: statement: ID init
	STA $0342;  newx1
; =========================================================
	JMP LBL4L29
LBL4L28:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL4L29:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL4L30:
; UintID $0348 vs. UintIMM u1
LBL4L31:			; Top of IF statement
; UintID relop UintIMM
	LDA $0348;  newy1
	CMP #$01
	.BYTE #$F0, #$03;  BEQ +3
	JMP LBL4L33;  jump to ELSE
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL4L32:
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$02
; RULE: statement: ID init
	STA $0348;  newy1
; =========================================================
	JMP LBL4L34
LBL4L33:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL4L34:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL4L35:
; UintID $0348 vs. UintIMM u25
LBL4L36:			; Top of IF statement
; UintID relop UintIMM
	LDA $0348;  newy1
	CMP #$19
	.BYTE #$F0, #$03;  BEQ +3
	JMP LBL4L38;  jump to ELSE
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL4L37:
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$18
; RULE: statement: ID init
	STA $0348;  newy1
; =========================================================
	JMP LBL4L39
LBL4L38:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL4L39:
; Call a function as an expression
; function call
	JSR LBL0L1; XYtoMEMLOC()
; Pop Return Value off of Processor Stack - 2023 04 02
	PLA
	TAY
	LDA #$00
	LDX #$00
	CPY #$00
	BEQ LBL4L41
	CPY #$01
	BEQ LBL4L40
	PLA
	TAX
LBL4L40:
	PLA
LBL4L41:
; =========================================================
; poke( expression, expression );
	STA LBL4L42
	STX LBL4L43
	LDA $034A;  trail
	.BYTE $8D	;  STA absolute
LBL4L42:			;  <-- low byte
	.BYTE $00
LBL4L43:			;  <-- hi byte
	.BYTE $00
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL4L44:
; Call a function as an expression
; function call
	JSR LBL0L2; NextXYtoMEMLOC()
; Pop Return Value off of Processor Stack - 2023 04 02
	PLA
	TAY
	LDA #$00
	LDX #$00
	CPY #$00
	BEQ LBL5L21
	CPY #$01
	BEQ LBL5L20
	PLA
	TAX
LBL5L20:
	PLA
LBL5L21:
; =========================================================
; tPEEK '(' expression ')' 
; peek( XA );
	TAY
	LDA $02
	PHA
	LDA $03
	PHA
	STY $02
	LDY #$00
	STX $03
	LDA ($02),Y
	TAX
	PLA
	STA $03
	PLA
	STA $02
	TXA
; A A vs. UintID $034A
LBL4L45:			; Top of IF statement
; A relop UintID
	CMP $034A
	.BYTE #$F0, #$03;  BEQ +3
	JMP LBL4L47;  jump to ELSE
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL4L46:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL5L22:
; UintID $0342 vs. UintID $033C
LBL5L23:			; Top of IF statement
; UintID relop UintID
	LDA $0342
	CMP $033C
	.BYTE $D0, $03;  BNE +3
	JMP LBL5L25;  if z==1 jump to ELSE
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL5L24:
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$01
; RULE: statement: ID init
	STA $0341;  gameover
; =========================================================
	JMP LBL5L26
LBL5L25:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL5L26:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL5L27:
; UintID $0348 vs. UintID $033D
LBL5L28:			; Top of IF statement
; UintID relop UintID
	LDA $0348
	CMP $033D
	.BYTE $D0, $03;  BNE +3
	JMP LBL5L30;  if z==1 jump to ELSE
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL5L29:
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$01
; RULE: statement: ID init
	STA $0341;  gameover
; =========================================================
	JMP LBL5L31
LBL5L30:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL5L31:
	JMP LBL4L48
LBL4L47:
; ---------------------------------------------------------
;                       ELSE:
; OP2
; RULE: expression: expression arithmetic expression
; $0344 + u1
; $0344 (2) + u1 (-1)
	CLC
; WordID + (IntIMM || UintIMM)
	LDA #$01
	ADC $0344
	PHA
	LDA #$00
	ADC $0345
	TAX
	PLA
; RULE: init: '=' expression
; initialising a word with XA
; RULE: statement: ID init
; WordID = XA
	STA $0344;  score
	STX $0345
; =========================================================
; cursorxy(u7,u0)
	CLC
	LDY #$07
	LDX #$00
	JSR $FFF0
; =========================================================
;                         printf($0344);
; =========================================================
; printf(WordID);
	LDA $0344
	STA HTD_IN
	LDA $0345
	STA HTD_IN+1
	JSR WORD2DEC
	LDX #$00
LBL5L32:
	LDA HTD_STR,X
	CMP #$30
	.BYTE $D0, $04;  BNE SKIP
	INX
	JMP LBL5L32
	CPX #$06
	.BYTE $D0 $01;  BNE SKIP
	DEX
LBL5L33:
	LDA HTD_STR,X
	CMP #$00
	.BYTE $F0, $07;  BEQ #$07
	INX
	JSR $FFD2
	JMP LBL5L33
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL5L34:
; WordID $034D vs. WordIMM w48
LBL5L35:			; Top of IF statement
; =========================================================
;                         WORD ID relop  WORD IMM
; =========================================================
; $034D relop w48
	LDA $034E
	CMP #$00
	.BYTE #$D0, #$05;  BNE +5
	LDA $034D
	CMP #$30
	.BYTE #$B0, #$03;  BCS +3
	JMP LBL5L37;  if c==0 jump to ELSE
	.BYTE $D0, $03;  BNE +3
	JMP LBL5L37;  if z==1 jump to ELSE
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL5L36:
; OP2
; RULE: expression: expression arithmetic expression
; $034D - u3
; $034D (2) - u3 (-1)
	SEC
; WordID - (IntIMM || UintIMM)
	LDA $034D
	SBC #$03
	PHA
	LDA $034E
	SBC #$00
	TAX
	PLA
; RULE: init: '=' expression
; initialising a word with XA
; RULE: statement: ID init
; WordID = XA
	STA $034D;  freq
	STX $034E
; =========================================================
	JMP LBL5L38
LBL5L37:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL5L38:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL4L48:
; RULE: init: '=' expression
; initialising UintID
	LDA $0342;  newx1
; RULE: statement: ID init
	STA $033C;  x1
; =========================================================
; RULE: init: '=' expression
; initialising UintID
	LDA $0348;  newy1
; RULE: statement: ID init
	STA $033D;  y1
; =========================================================
; Call a function as an expression
; function call
	JSR LBL0L1; XYtoMEMLOC()
; Pop Return Value off of Processor Stack - 2023 04 02
	PLA
	TAY
	LDA #$00
	LDX #$00
	CPY #$00
	BEQ LBL4L50
	CPY #$01
	BEQ LBL4L49
	PLA
	TAX
LBL4L49:
	PLA
LBL4L50:
; =========================================================
; poke( expression, expression );
	STA LBL4L51
	STX LBL4L52
	LDA $0349;  player
	.BYTE $8D	;  STA absolute
LBL4L51:			;  <-- low byte
	.BYTE $00
LBL4L52:			;  <-- hi byte
	.BYTE $00
	JMP LBL3L4
LBL3L3:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL3L4:
; inc(expression)
	CLC
	LDA #$01
	ADC $034B
	STA $034B
	LDA #$00
	ADC $034C
	STA $034C
; =========================================================
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL3L5:
; UintID $0343 vs. UintIMM u62
LBL3L6:			; Top of IF statement
; UintID relop UintIMM
	LDA $0343;  c
	CMP #$3E
	.BYTE #$F0, #$03;  BEQ +3
	JMP LBL3L8;  jump to ELSE
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL3L7:
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$01
; RULE: statement: ID init
	STA $0341;  gameover
; =========================================================
; Call a function as a statement
	JSR LBL0L8; clearkb()
	JMP LBL3L9
LBL3L8:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL3L9:
	JMP LBL2L1;  jump to top of WHILE loop
LBL2L3:
	PLA
; Call a function as an expression
; function call
	JSR LBL0L5; playAgain()
; Pop Return Value off of Processor Stack - 2023 04 02
	PLA
	TAY
	LDA #$00
	LDX #$00
	CPY #$00
	BEQ LBL2L5
	CPY #$01
	BEQ LBL2L4
	PLA
	TAX
LBL2L4:
	PLA
LBL2L5:
; =========================================================
; RULE: init: '=' expression
; initialising a word with XA
; RULE: statement: ID init
	STA $034F;  keepplaying
; =========================================================
	JMP LBL1L5;  jump to top of WHILE loop
LBL1L7:
	PLA
; Call a function as a statement
	JSR LBL0L8; clearkb()
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $0336
	STA $D020
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $0337
	STA $D021
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $0338
	STA $0286
	RTS
; RULE: datatype: void
; ======================== resetVariables ========================
LBL0L0:
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$14
; RULE: statement: ID init
	STA $033C;  x1
; =========================================================
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$0C
; RULE: statement: ID init
	STA $033D;  y1
; =========================================================
; RULE: init: '=' expression
; initialising WordIMM: 1279
	LDA #$FF
	LDX #$04
; RULE: statement: ID init
; WordID = XA
	STA $034D;  freq
	STX $034E
; =========================================================
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$00
; RULE: statement: ID init
	STA $033E;  length
; =========================================================
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$00
; RULE: statement: ID init
	STA $033F;  lastx
; =========================================================
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$00
; RULE: statement: ID init
	STA $0340;  lasty
; =========================================================
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$00
; RULE: statement: ID init
	STA $0341;  gameover
; =========================================================
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$00
; RULE: statement: ID init
	STA $0342;  newx1
; =========================================================
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$00
; RULE: statement: ID init
	STA $0348;  newy1
; =========================================================
; RULE: init: '=' expression
; initialising WordIMM: 0
	LDA #$00
	TAX
; RULE: statement: ID init
; WordID = XA
	STA $0344;  score
	STX $0345
; =========================================================
	RTS
; RULE: datatype: word
; ======================== XYtoMEMLOC ========================
LBL0L1:
; OP2
; RULE: expression: expression arithmetic expression
; $033D * u40
; $033D (0) * u40 (-1)
; UintID arith UintIMM
	LDA $033D
; UintID * UintIMM (Using 16 bit operation)
	SEI
	LDA $033D
	STA $FB
	LDA #$00
	STA $FC
	LDA #$28
	STA $FD
	LDA #$00
	STA $FE
	JSR MUL16
	LDA MUL16R
	LDX MUL16R+1
	CLI
; OP2
; RULE: expression: expression arithmetic expression
; $033C + XA
; $033C (0) + XA (-1)
	CLC
; UintID arith XA
	TAY
	LDA $02
	PHA
	LDA $03
	PHA
	STY $02
	STX $03
	LDA $033C;  x1
	ADC $02
	TAY
	LDA #$00
	ADC $03
	TAX
	PLA
	STA $03
	PLA
	STA $02
	TYA
; OP2
; RULE: expression: expression arithmetic expression
; w1024 + XA
; w1024 (-1) + XA (-1)
	CLC
; WordIMM + XA
	CLC
	ADC #$00
	TAY
	TXA
	ADC #$04
	TAX
	TYA
; RULE: init: '=' expression
; initialising a word with XA
; RULE: statement: ID init
; WordID = XA
	STA $0346;  r0
	STX $0347
; =========================================================
; Deleted previous 5 Mneumonics
; return from function
	PLA
	TAX
	PLA
	TAY
	LDA $0346
	PHA
	LDA $0347
	PHA
	LDA #$02
	PHA
	TYA
	PHA
	TXA
	PHA
	RTS
; Returning a value via the stack
; RULE: datatype: word
; ======================== NextXYtoMEMLOC ========================
LBL0L2:
; OP2
; RULE: expression: expression arithmetic expression
; $0348 * u40
; $0348 (0) * u40 (-1)
; UintID arith UintIMM
	LDA $0348
; UintID * UintIMM (Using 16 bit operation)
	SEI
	LDA $0348
	STA $FB
	LDA #$00
	STA $FC
	LDA #$28
	STA $FD
	LDA #$00
	STA $FE
	JSR MUL16
	LDA MUL16R
	LDX MUL16R+1
	CLI
; OP2
; RULE: expression: expression arithmetic expression
; $0342 + XA
; $0342 (0) + XA (-1)
	CLC
; UintID arith XA
	TAY
	LDA $02
	PHA
	LDA $03
	PHA
	STY $02
	STX $03
	LDA $0342;  newx1
	ADC $02
	TAY
	LDA #$00
	ADC $03
	TAX
	PLA
	STA $03
	PLA
	STA $02
	TYA
; OP2
; RULE: expression: expression arithmetic expression
; w1024 + XA
; w1024 (-1) + XA (-1)
	CLC
; WordIMM + XA
	CLC
	ADC #$00
	TAY
	TXA
	ADC #$04
	TAX
	TYA
; RULE: init: '=' expression
; initialising a word with XA
; RULE: statement: ID init
; WordID = XA
	STA $0346;  r0
	STX $0347
; =========================================================
; Deleted previous 5 Mneumonics
; return from function
	PLA
	TAX
	PLA
	TAY
	LDA $0346
	PHA
	LDA $0347
	PHA
	LDA #$02
	PHA
	TYA
	PHA
	TXA
	PHA
	RTS
; Returning a value via the stack
; RULE: datatype: void
; ======================== screenSetup ========================
LBL0L3:
; =========================================================
;                         cls()
; =========================================================
	JSR CLS;  deep cls()
; cursorxy(u0,u0)
	CLC
	LDY #$00
	LDX #$00
	JSR $FFF0
; =========================================================
;                         printf("SCORE:");
; =========================================================
	LDA #$10
	STA $03
	LDA #$F9
	STA $02
	JSR PRN
; cursorxy(u11,u0)
	CLC
	LDY #$0B
	LDX #$00
	JSR $FFF0
; =========================================================
;                         printf("MOVE:  UP:I  DN:K  LT:U  RT:O");
; =========================================================
	LDA #$11
	STA $03
	LDA #$00
	STA $02
	JSR PRN
; Preserve $02
	LDA $02
	PHA
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L8:
	PHA
; ---------------------------------------------------------
; RULE: init: '=' expression
; initialising WordIMM: 1064
	LDA #$28
	LDX #$04
; RULE: statement: ID init
; WordID = XA
	STA $033A;  j
	STX $033B
; ---------------------------------------------------------
; WordID $033A vs. WordIMM w1104
LBL1L9:			; Top of FOR Loop
; =========================================================
;                         WORD ID relop  WORD IMM
; =========================================================
; $033A relop w1104
	LDA $033B
	CMP #$04
	.BYTE #$D0, #$05;  BNE +5
	LDA $033A
	CMP #$50
	.BYTE #$B0, #$03; BCS +3
	JMP LBL1L11;  if c==0 jump to BODY
	JMP LBL1L12;  jump out of FOR
; =========================================================
; ---------------------------------------------------------
LBL1L10:
; OP2
; RULE: expression: expression arithmetic expression
; $033A + u1
; $033A (2) + u1 (-1)
	CLC
; WordID + (IntIMM || UintIMM)
	LDA #$01
	ADC $033A
	PHA
	LDA #$00
	ADC $033B
	TAX
	PLA
; RULE: init: '=' expression
; initialising a word with XA
; RULE: statement: ID init
; WordID = XA
	STA $033A;  j
	STX $033B
	JMP LBL1L9;  jump to top of FOR loop
; ---------------------------------------------------------
LBL1L11:
; poke( expression, expression );
	LDA $033A
	STA LBL2L6
	LDA $033B
	STA LBL2L7
	LDA #$43
	.BYTE $8D;	  <-- STA absolute
LBL2L6:			; <-- low byte
	.BYTE $00
LBL2L7:			; <-- hi byte
	.BYTE $00
; ---------------------------------------------------------
	JMP LBL1L10;  jump to iterator
LBL1L12:
	PLA
; ---------------------------------------------------------
; Restore $02
	PLA
	STA $02
	RTS
; RULE: datatype: void
; ======================== introScreen ========================
LBL0L4:
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
; =========================================================
;                         cls()
; =========================================================
	JSR CLS;  deep cls()
; cursorxy(u2,u1)
	CLC
	LDY #$02
	LDX #$01
	JSR $FFF0
; =========================================================
;                         printf(" SSSSS  N     N  AAAA  K    K EEEEEE");
; =========================================================
	LDA #$11
	STA $03
	LDA #$1E
	STA $02
	JSR PRN
; cursorxy(u2,u2)
	CLC
	LDY #$02
	LDX #$02
	JSR $FFF0
; =========================================================
;                         printf("SS   SS NN    N A    A K  K   E");
; =========================================================
	LDA #$11
	STA $03
	LDA #$43
	STA $02
	JSR PRN
; cursorxy(u2,u3)
	CLC
	LDY #$02
	LDX #$03
	JSR $FFF0
; =========================================================
;                         printf("SS      N N   N A    A KK     E");
; =========================================================
	LDA #$11
	STA $03
	LDA #$63
	STA $02
	JSR PRN
; cursorxy(u2,u4)
	CLC
	LDY #$02
	LDX #$04
	JSR $FFF0
; =========================================================
;                         printf("  SS    N  N  N AAAAAA K K    EEEE");
; =========================================================
	LDA #$11
	STA $03
	LDA #$83
	STA $02
	JSR PRN
; cursorxy(u2,u5)
	CLC
	LDY #$02
	LDX #$05
	JSR $FFF0
; =========================================================
;                         printf("   SS   N   N N A    A K  K   E");
; =========================================================
	LDA #$11
	STA $03
	LDA #$A6
	STA $02
	JSR PRN
; cursorxy(u2,u6)
	CLC
	LDY #$02
	LDX #$06
	JSR $FFF0
; =========================================================
;                         printf("     SS N    NN A    A K   K  E");
; =========================================================
	LDA #$11
	STA $03
	LDA #$C6
	STA $02
	JSR PRN
; cursorxy(u2,u7)
	CLC
	LDY #$02
	LDX #$07
	JSR $FFF0
; =========================================================
;                         printf("SS   SS N     N A    A K    K EEEEEE");
; =========================================================
	LDA #$11
	STA $03
	LDA #$E6
	STA $02
	JSR PRN
; cursorxy(u2,u8)
	CLC
	LDY #$02
	LDX #$08
	JSR $FFF0
; =========================================================
;                         printf(" SSSSS ");
; =========================================================
	LDA #$12
	STA $03
	LDA #$0B
	STA $02
	JSR PRN
; cursorxy(u8,u12)
	CLC
	LDY #$08
	LDX #$0C
	JSR $FFF0
; =========================================================
;                         printf("BY: MICHAEL PELLEGRINO");
; =========================================================
	LDA #$12
	STA $03
	LDA #$13
	STA $02
	JSR PRN
; cursorxy(u14,u14)
	CLC
	LDY #$0E
	LDX #$0E
	JSR $FFF0
; =========================================================
;                         printf("MARCH 2023");
; =========================================================
	LDA #$12
	STA $03
	LDA #$2A
	STA $02
	JSR PRN
; cursorxy(u2,u18)
	CLC
	LDY #$02
	LDX #$12
	JSR $FFF0
; =========================================================
;                         printf("UP: I   DOWN: K   LEFT: U   RIGHT: O");
; =========================================================
	LDA #$12
	STA $03
	LDA #$35
	STA $02
	JSR PRN
; cursorxy(u8,u20)
	CLC
	LDY #$08
	LDX #$14
	JSR $FFF0
; =========================================================
;                         printf("PRESS ANY KEY TO START");
; =========================================================
	LDA #$12
	STA $03
	LDA #$5A
	STA $02
	JSR PRN
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
	STA $0350;  pausev
; =========================================================
; =========================================================
;                         WHILE LOOP
; =========================================================
	PHA
LBL1L13:
; ---------------------------------------------------------
; UintID $0350 vs. UintIMM u0
LBL1L14:			; Top of WHILE Loop
; UintID relop UintIMM
	LDA $0350;  pausev
	CMP #$00
	.BYTE #$F0, #$03;  BEQ +3
	JMP LBL1L16;  jump to ELSE
; =========================================================
LBL1L15:
; =========================================================
;                  getchar()
; =========================================================
	JSR $FFE4
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: ID init
	STA $0350;  pausev
; =========================================================
	JMP LBL1L14;  jump to top of WHILE loop
LBL1L16:
	PLA
	LDA #$93
; =========================================================
;                         jsr(HEX_NUM)
; =========================================================
	JSR $FFD2
	RTS
; RULE: datatype: uint
; ======================== playAgain ========================
LBL0L5:
; Preserve $02
	LDA $02
	PHA
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L17:
	PHA
; ---------------------------------------------------------
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$09
; RULE: statement: ID init
	STA $0339;  i
; ---------------------------------------------------------
; UintID $0339 vs. UintIMM u15
LBL1L18:			; Top of FOR Loop
; UintID relop UintIMM
	LDA $0339;  i
	CMP #$0F
	.BYTE #$B0, #$03; BCS +3
	JMP LBL1L20;  if c==0 jump to BODY
	JMP LBL1L21;  jump out of FOR
; =========================================================
; ---------------------------------------------------------
LBL1L19:
; inc(expression)
	INC $0339
	JMP LBL1L18;  jump to top of FOR loop
; ---------------------------------------------------------
LBL1L20:
; cursorxy(u4,$0339)
	CLC
	LDY #$04
	LDX $0339
	JSR $FFF0
; =========================================================
;                         printf("                               ");
; =========================================================
	LDA #$12
	STA $03
	LDA #$71
	STA $02
	JSR PRN
; ---------------------------------------------------------
	JMP LBL1L19;  jump to iterator
LBL1L21:
	PLA
; ---------------------------------------------------------
; Restore $02
	PLA
	STA $02
; cursorxy(u14,u10)
	CLC
	LDY #$0E
	LDX #$0A
	JSR $FFF0
; =========================================================
;                         printf("GAME OVER!!");
; =========================================================
	LDA #$12
	STA $03
	LDA #$91
	STA $02
	JSR PRN
; Call a function as a statement
	JSR LBL0L6; longdelay()
; cursorxy(u12,u12)
	CLC
	LDY #$0C
	LDX #$0C
	JSR $FFF0
; =========================================================
;                         printf("PRESS Q TO QUIT");
; =========================================================
	LDA #$12
	STA $03
	LDA #$9D
	STA $02
	JSR PRN
; cursorxy(u6,u13)
	CLC
	LDY #$06
	LDX #$0D
	JSR $FFF0
; =========================================================
;                         printf("ANY OTHER KEY TO PLAY AGAIN");
; =========================================================
	LDA #$12
	STA $03
	LDA #$AD
	STA $02
	JSR PRN
; Call a function as a statement
	JSR LBL0L8; clearkb()
; =========================================================
;                  getchar()
; =========================================================
	JSR $FFE4
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: ID init
	STA $0339;  i
; =========================================================
; =========================================================
;                         WHILE LOOP
; =========================================================
	PHA
LBL1L22:
; ---------------------------------------------------------
; UintID $0339 vs. UintIMM u0
LBL1L23:			; Top of WHILE Loop
; UintID relop UintIMM
	LDA $0339;  i
	CMP #$00
	.BYTE #$F0, #$03;  BEQ +3
	JMP LBL1L25;  jump to ELSE
; =========================================================
LBL1L24:
; =========================================================
;                  getchar()
; =========================================================
	JSR $FFE4
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: ID init
	STA $0339;  i
; =========================================================
	JMP LBL1L23;  jump to top of WHILE loop
LBL1L25:
	PLA
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L26:
; UintID $0339 vs. UintIMM u81
LBL1L27:			; Top of IF statement
; UintID relop UintIMM
	LDA $0339;  i
	CMP #$51
	.BYTE #$F0, #$03;  BEQ +3
	JMP LBL1L29;  jump to ELSE
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L28:
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$00
; RULE: statement: ID init
	STA $0339;  i
; =========================================================
	JMP LBL1L30
LBL1L29:
; ---------------------------------------------------------
;                       ELSE:
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$01
; RULE: statement: ID init
	STA $0339;  i
; =========================================================
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L30:
; Deleted previous 5 Mneumonics
; return from function
	PLA
	TAX
	PLA
	TAY
	LDA $0339
	PHA
	LDA #$01
	PHA
	TYA
	PHA
	TXA
	PHA
	RTS
; Returning a value via the stack
; RULE: datatype: void
; ======================== longdelay ========================
LBL0L6:
; Preserve $02
	LDA $02
	PHA
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L31:
	PHA
; ---------------------------------------------------------
; RULE: init: '=' expression
; initialising WordIMM: 0
	LDA #$00
	TAX
; RULE: statement: ID init
; WordID = XA
	STA $033A;  j
	STX $033B
; ---------------------------------------------------------
; WordID $033A vs. WordIMM w63748
LBL1L32:			; Top of FOR Loop
; =========================================================
;                         WORD ID relop  WORD IMM
; =========================================================
; $033A relop w63748
	LDA $033B
	CMP #$F9
	.BYTE #$D0, #$05;  BNE +5
	LDA $033A
	CMP #$04
	.BYTE #$B0, #$03; BCS +3
	JMP LBL1L34;  if c==0 jump to BODY
	JMP LBL1L35;  jump out of FOR
; =========================================================
; ---------------------------------------------------------
LBL1L33:
; OP2
; RULE: expression: expression arithmetic expression
; $033A + u1
; $033A (2) + u1 (-1)
	CLC
; WordID + (IntIMM || UintIMM)
	LDA #$01
	ADC $033A
	PHA
	LDA #$00
	ADC $033B
	TAX
	PLA
; RULE: init: '=' expression
; initialising a word with XA
; RULE: statement: ID init
; WordID = XA
	STA $033A;  j
	STX $033B
	JMP LBL1L32;  jump to top of FOR loop
; ---------------------------------------------------------
LBL1L34:
	NOP
; ---------------------------------------------------------
	JMP LBL1L33;  jump to iterator
LBL1L35:
	PLA
; ---------------------------------------------------------
; Restore $02
	PLA
	STA $02
; Call a function as a statement
	JSR LBL0L8; clearkb()
	RTS
; RULE: datatype: void
; ======================== setcolours ========================
LBL0L7:
; Preserve $02
	LDA $02
	PHA
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L36:
	PHA
; ---------------------------------------------------------
; RULE: init: '=' expression
; initialising WordIMM: 55296
	LDA #$00
	LDX #$D8
; RULE: statement: ID init
; WordID = XA
	STA $033A;  j
	STX $033B
; ---------------------------------------------------------
; WordID $033A vs. WordIMM w55376
LBL1L37:			; Top of FOR Loop
; =========================================================
;                         WORD ID relop  WORD IMM
; =========================================================
; $033A relop w55376
	LDA $033B
	CMP #$D8
	.BYTE #$D0, #$05;  BNE +5
	LDA $033A
	CMP #$50
	.BYTE #$B0, #$03; BCS +3
	JMP LBL1L39;  if c==0 jump to BODY
	JMP LBL1L40;  jump out of FOR
; =========================================================
; ---------------------------------------------------------
LBL1L38:
; OP2
; RULE: expression: expression arithmetic expression
; $033A + u1
; $033A (2) + u1 (-1)
	CLC
; WordID + (IntIMM || UintIMM)
	LDA #$01
	ADC $033A
	PHA
	LDA #$00
	ADC $033B
	TAX
	PLA
; RULE: init: '=' expression
; initialising a word with XA
; RULE: statement: ID init
; WordID = XA
	STA $033A;  j
	STX $033B
	JMP LBL1L37;  jump to top of FOR loop
; ---------------------------------------------------------
LBL1L39:
; poke( expression, expression );
	LDA $033A
	STA LBL2L8
	LDA $033B
	STA LBL2L9
	LDA #$01
	.BYTE $8D;	  <-- STA absolute
LBL2L8:			; <-- low byte
	.BYTE $00
LBL2L9:			; <-- hi byte
	.BYTE $00
; ---------------------------------------------------------
	JMP LBL1L38;  jump to iterator
LBL1L40:
	PLA
; ---------------------------------------------------------
; Restore $02
	PLA
	STA $02
; Preserve $02
	LDA $02
	PHA
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L41:
	PHA
; ---------------------------------------------------------
; RULE: init: '=' expression
; initialising WordIMM: 55376
	LDA #$50
	LDX #$D8
; RULE: statement: ID init
; WordID = XA
	STA $033A;  j
	STX $033B
; ---------------------------------------------------------
; WordID $033A vs. WordIMM w56296
LBL1L42:			; Top of FOR Loop
; =========================================================
;                         WORD ID relop  WORD IMM
; =========================================================
; $033A relop w56296
	LDA $033B
	CMP #$DB
	.BYTE #$D0, #$05;  BNE +5
	LDA $033A
	CMP #$E8
	.BYTE #$B0, #$03; BCS +3
	JMP LBL1L44;  if c==0 jump to BODY
	JMP LBL1L45;  jump out of FOR
; =========================================================
; ---------------------------------------------------------
LBL1L43:
; OP2
; RULE: expression: expression arithmetic expression
; $033A + u1
; $033A (2) + u1 (-1)
	CLC
; WordID + (IntIMM || UintIMM)
	LDA #$01
	ADC $033A
	PHA
	LDA #$00
	ADC $033B
	TAX
	PLA
; RULE: init: '=' expression
; initialising a word with XA
; RULE: statement: ID init
; WordID = XA
	STA $033A;  j
	STX $033B
	JMP LBL1L42;  jump to top of FOR loop
; ---------------------------------------------------------
LBL1L44:
; =========================================================
;            rnd(u1);
; =========================================================
	JSR SIDRND; initialize random number generator
	LDA $D41B
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: ID init
	STA $0339;  i
; =========================================================
	LDA #$0F
	AND $0339
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: ID init
	STA $0339;  i
; =========================================================
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL2L10:
; UintID $0339 vs. UintIMM u6
LBL2L11:			; Top of IF statement
; UintID relop UintIMM
	LDA $0339;  i
	CMP #$06
	.BYTE #$F0, #$03;  BEQ +3
	JMP LBL2L13;  jump to ELSE
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL2L12:
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$01
; RULE: statement: ID init
	STA $0339;  i
; =========================================================
	JMP LBL2L14
LBL2L13:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL2L14:
; poke( expression, expression );
	LDA $033A;  j
	STA LBL2L15
	LDA $033B
	STA LBL2L16
	LDA $0339
	.BYTE $8D	;  STA absolute
LBL2L15:			; <-- low byte
	.BYTE $00
LBL2L16:			; <-- hi byte
	.BYTE $00
; ---------------------------------------------------------
	JMP LBL1L43;  jump to iterator
LBL1L45:
	PLA
; ---------------------------------------------------------
; Restore $02
	PLA
	STA $02
	RTS
; RULE: datatype: void
; ======================== clearkb ========================
LBL0L8:
; poke( expression, expression );
; POKE( (U)Int, IMM); Zero Page
	LDA #$00
	STA $C6
; =========================================================
;                         jsr(NUMBER)
; =========================================================
	JSR $FFE4
	RTS
HTD_STR:
	.BYTE #$00, #$00, #$00, #$00, #$00, #$00, #$00
; ------------------------------------------------------------
; This chunk of code is by: Andrew Jacobs, 28-Feb-2004
; Taken from: http://6502.org/source/integers/hex2dec-more.htm
; ------------------------------------------------------------
HTD_IN:
	.BYTE #$00, #$00
HTD_OUT:
	.BYTE #$00, #$00, #$00
WORD2DEC:		;2 Byte Word to Decimal
	PLA
	STA $0334
	PLA
	STA $0335
	SED
	LDA #$00
	STA HTD_OUT
	STA HTD_OUT+1
	STA HTD_OUT+2
	LDX #$10
CNVBIT:
	ASL HTD_IN
	ROL HTD_IN+1
	LDA HTD_OUT
	ADC HTD_OUT
	STA HTD_OUT
	LDA HTD_OUT+1
	ADC HTD_OUT+1
	STA HTD_OUT+1
	LDA HTD_OUT+2
	ADC HTD_OUT+2
	STA HTD_OUT+2
	DEX
	BNE CNVBIT
	CLD
; ------------------------------------------------------------
	LDA HTD_OUT
	PHA
	LSR
	LSR
	LSR
	LSR
	ORA #$30
	STA HTD_STR+4
	PLA
	AND #$0F
	ORA #$30
	STA HTD_STR+5
	LDA HTD_OUT+1
	PHA
	LSR
	LSR
	LSR
	LSR
	ORA #$30
	STA HTD_STR+2
	PLA
	AND #$0F
	ORA #$30
	STA HTD_STR+3
	LDA HTD_OUT+2
	PHA
	LSR
	LSR
	LSR
	LSR
	ORA #$30
	STA HTD_STR
	PLA
	AND #$0F
	ORA #$30
	STA HTD_STR+1
	LDA $0335
	PHA
	LDA $0334
	PHA
	RTS
MUL16R:
	.BYTE #$00, #$00, #$00, #$00
MUL16:
	LDA #$00
	STA MUL16R
	STA MUL16R+1
	STA MUL16R+2
	STA MUL16R+3
	LDX #$10
	LSR $FE
	ROR $FD
	.BYTE #$90, #$0D
	TAY
	CLC
	LDA $FB
	ADC MUL16R+2
	STA MUL16R+2
	TYA
	ADC $FC
	ROR A
	ROR MUL16R+2
	ROR MUL16R+1
	ROR MUL16R
	DEX
	.BYTE #$D0, #$E0
	STA MUL16R+3
	RTS
SIDRND:
	PHA
	LDA #$FF
	STA $D40E
	STA $D40F
	LDA #$80
	STA $D412
	PLA
	RTS
BYTE2HEX:		;Display a Hexadecimal Byte
	PLA
	STA $0334
	PLA
	STA $0335
	CLD
	PLA
	TAX
; 	AND #$F0
; 	LSR
	ALR #$F0;  Illegal Opcode (replaces the two lines above)
	LSR
	LSR
	LSR
	CMP #$0A
	.BYTE #$90, #$03
	CLC
	ADC #$07
	ADC #$30
	JSR $FFD2
	TXA
	AND #$0F
	CMP #$0A
	.BYTE #$90, #$03
	CLC
	ADC #$07
	ADC #$30
	JSR $FFD2
	LDA $0335
	PHA
	LDA $0334
	PHA
	RTS
CLS:		; Clear Screen Routine
	LDA #$20
	LDX #$00
; top-of-loop
	STA $0400,X
	STA $0500,X
	STA $0600,X
	STA $06E8,X
	DEX
	.BYTE #$D0, #$F1
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
; ; $10f9			"SCORE:"
STRLBL0:
	.byte $53, $43, $4F, $52, $45, $3A, $00
; ; $1100			"MOVE:  UP:I  DN:K  LT:U  RT:O"
STRLBL1:
	.byte $4D, $4F, $56, $45, $3A, $20, $20, $55, $50, $3A, $49, $20, $20, $44, $4E, $3A, $4B, $20, $20, $4C, $54, $3A, $55, $20, $20, $52, $54, $3A, $4F, $00
; ; $111e			" SSSSS  N     N  AAAA  K    K EEEEEE"
STRLBL2:
	.byte $20, $53, $53, $53, $53, $53, $20, $20, $4E, $20, $20, $20, $20, $20, $4E, $20, $20, $41, $41, $41, $41, $20, $20, $4B, $20, $20, $20, $20, $4B, $20, $45, $45, $45, $45, $45, $45, $00
; ; $1143			"SS   SS NN    N A    A K  K   E"
STRLBL3:
	.byte $53, $53, $20, $20, $20, $53, $53, $20, $4E, $4E, $20, $20, $20, $20, $4E, $20, $41, $20, $20, $20, $20, $41, $20, $4B, $20, $20, $4B, $20, $20, $20, $45, $00
; ; $1163			"SS      N N   N A    A KK     E"
STRLBL4:
	.byte $53, $53, $20, $20, $20, $20, $20, $20, $4E, $20, $4E, $20, $20, $20, $4E, $20, $41, $20, $20, $20, $20, $41, $20, $4B, $4B, $20, $20, $20, $20, $20, $45, $00
; ; $1183			"  SS    N  N  N AAAAAA K K    EEEE"
STRLBL5:
	.byte $20, $20, $53, $53, $20, $20, $20, $20, $4E, $20, $20, $4E, $20, $20, $4E, $20, $41, $41, $41, $41, $41, $41, $20, $4B, $20, $4B, $20, $20, $20, $20, $45, $45, $45, $45, $00
; ; $11a6			"   SS   N   N N A    A K  K   E"
STRLBL6:
	.byte $20, $20, $20, $53, $53, $20, $20, $20, $4E, $20, $20, $20, $4E, $20, $4E, $20, $41, $20, $20, $20, $20, $41, $20, $4B, $20, $20, $4B, $20, $20, $20, $45, $00
; ; $11c6			"     SS N    NN A    A K   K  E"
STRLBL7:
	.byte $20, $20, $20, $20, $20, $53, $53, $20, $4E, $20, $20, $20, $20, $4E, $4E, $20, $41, $20, $20, $20, $20, $41, $20, $4B, $20, $20, $20, $4B, $20, $20, $45, $00
; ; $11e6			"SS   SS N     N A    A K    K EEEEEE"
STRLBL8:
	.byte $53, $53, $20, $20, $20, $53, $53, $20, $4E, $20, $20, $20, $20, $20, $4E, $20, $41, $20, $20, $20, $20, $41, $20, $4B, $20, $20, $20, $20, $4B, $20, $45, $45, $45, $45, $45, $45, $00
; ; $120b			" SSSSS "
STRLBL9:
	.byte $20, $53, $53, $53, $53, $53, $20, $00
; ; $1213			"BY: MICHAEL PELLEGRINO"
STRLBL10:
	.byte $42, $59, $3A, $20, $4D, $49, $43, $48, $41, $45, $4C, $20, $50, $45, $4C, $4C, $45, $47, $52, $49, $4E, $4F, $00
; ; $122a			"MARCH 2023"
STRLBL11:
	.byte $4D, $41, $52, $43, $48, $20, $32, $30, $32, $33, $00
; ; $1235			"UP: I   DOWN: K   LEFT: U   RIGHT: O"
STRLBL12:
	.byte $55, $50, $3A, $20, $49, $20, $20, $20, $44, $4F, $57, $4E, $3A, $20, $4B, $20, $20, $20, $4C, $45, $46, $54, $3A, $20, $55, $20, $20, $20, $52, $49, $47, $48, $54, $3A, $20, $4F, $00
; ; $125a			"PRESS ANY KEY TO START"
STRLBL13:
	.byte $50, $52, $45, $53, $53, $20, $41, $4E, $59, $20, $4B, $45, $59, $20, $54, $4F, $20, $53, $54, $41, $52, $54, $00
; ; $1271			"                               "
STRLBL14:
	.byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $00
; ; $1291			"GAME OVER!!"
STRLBL15:
	.byte $47, $41, $4D, $45, $20, $4F, $56, $45, $52, $21, $21, $00
; ; $129d			"PRESS Q TO QUIT"
STRLBL16:
	.byte $50, $52, $45, $53, $53, $20, $51, $20, $54, $4F, $20, $51, $55, $49, $54, $00
; ; $12ad			"ANY OTHER KEY TO PLAY AGAIN"
STRLBL17:
	.byte $41, $4E, $59, $20, $4F, $54, $48, $45, $52, $20, $4B, $45, $59, $20, $54, $4F, $20, $50, $4C, $41, $59, $20, $41, $47, $41, $49, $4E, $00
