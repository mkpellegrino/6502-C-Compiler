; uint : return_address_1 : $0334 (820)
; uint : return_address_2 : $0335 (821)
; uint : whichsprite : $0336 (822)
; word : x : $0337 (823)
; uint : y : $0339 (825)
; word : mem : $033A (826)
; word : cmem : $033C (828)
; uint : j : $033E (830)
; uint : i : $033F (831)
; uint : oldD011 : $0340 (832)
; uint : oldD016 : $0341 (833)
; uint : oldD018 : $0342 (834)
; uint : oldD020 : $0343 (835)
; uint : oldD021 : $0344 (836)
; uint : oldChar : $0345 (837)
; uint : timer : $0346 (838)
; uint : c : $0347 (839)
; uint : r : $0348 (840)
; uint : r1 : $0349 (841)
; uint : r2 : $034A (842)
; word : mem1 : $034B (843)
; uint : pausev : $034D (845)
; RULE: datatype: void
.org $0834
; =========================================================
;                         main()
; =========================================================
; =========================================================
;                         cls()
; =========================================================
	JSR CLS; cls()
	JSR LBL0L6; clearhires()
; RULE: datatype: uint
; RULE: value: NUMBER: (1)
; RULE: init: '=' expression
; whichsprite
; u1
	LDA #$01
; UINT whichsprite=A datatype#: 00
	STA $0336; 
; =========================================================
; RULE: datatype: word
; RULE: value: NUM: (0x0080)
; RULE: value: NUM: (0x0080)->(w128)
; RULE: init: '=' expression
; x
; w128
; unknown type
; w128
; WORD x=w128 datatype#: 02
	LDA #$80
	LDX #$00
	STA $0337
	STX $0338
; =========================================================
; RULE: datatype: uint
; RULE: value: NUMBER: (192)
; RULE: init: '=' expression
; y
; u192
	LDA #$C0
; UINT y=A datatype#: 00
	STA $0339; 
; =========================================================
; RULE: datatype: mob
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (192)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (15)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (63)
; RULE: value: NUMBER: (240)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (63)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (234)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (10)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (8)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (21)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (85)
; RULE: value: NUMBER: (64)
; RULE: value: NUMBER: (1)
; RULE: value: NUMBER: (93)
; RULE: value: NUMBER: (80)
; RULE: value: NUMBER: (1)
; RULE: value: NUMBER: (85)
; RULE: value: NUMBER: (20)
; RULE: value: NUMBER: (1)
; RULE: value: NUMBER: (29)
; RULE: value: NUMBER: (6)
; RULE: value: NUMBER: (1)
; RULE: value: NUMBER: (21)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (1)
; RULE: value: NUMBER: (42)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (2)
; RULE: value: NUMBER: (42)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (34)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (34)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (34)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (34)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (162)
; RULE: value: NUMBER: (128)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (162)
; RULE: value: NUMBER: (128)
; RULE: init: '=' expression
; sprite1
; m
; MOB
; MOB sprite1=m datatype#: 00
	LDA #$C0
	STA $07F8
	JSR LBL1L0
sprite1:
	.BYTE #$00, #$00, #$00, #$00, #$0F, #$00, #$00, #$3F, #$F0, #$00, #$3F, #$00, #$00, #$EA, #$00, #$00, #$0A, #$00, #$00, #$08, #$00, #$00, #$15, #$00, #$00, #$55, #$40, #$01, #$5D, #$50, #$01, #$55, #$14, #$01, #$1D, #$06, #$01, #$15, #$00, #$01, #$2A, #$00, #$02, #$2A, #$00, #$00, #$22, #$00, #$00, #$22, #$00, #$00, #$22, #$00, #$00, #$22, #$00, #$00, #$A2, #$80, #$00, #$A2, #$80
LBL1L0:
	PLA
	STA $FB
	PLA
	STA $FC
	INC $FB
	LDA #$00
	STA $FD
	LDA #$30
	STA $FE
	JSR MOBCPY
; =========================================================
; RULE: datatype: mob
; RULE: value: NUMBER: (1)
; RULE: value: NUMBER: (193)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (15)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (63)
; RULE: value: NUMBER: (240)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (63)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (234)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (10)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (8)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (21)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (85)
; RULE: value: NUMBER: (64)
; RULE: value: NUMBER: (1)
; RULE: value: NUMBER: (93)
; RULE: value: NUMBER: (80)
; RULE: value: NUMBER: (1)
; RULE: value: NUMBER: (85)
; RULE: value: NUMBER: (20)
; RULE: value: NUMBER: (5)
; RULE: value: NUMBER: (29)
; RULE: value: NUMBER: (6)
; RULE: value: NUMBER: (4)
; RULE: value: NUMBER: (21)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (4)
; RULE: value: NUMBER: (42)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (8)
; RULE: value: NUMBER: (42)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (34)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (32)
; RULE: value: NUMBER: (128)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (32)
; RULE: value: NUMBER: (128)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (32)
; RULE: value: NUMBER: (128)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (40)
; RULE: value: NUMBER: (160)
; RULE: value: NUMBER: (0)
; RULE: value: NUMBER: (40)
; RULE: value: NUMBER: (160)
; RULE: init: '=' expression
; sprite2
; m
; MOB
; MOB sprite2=m datatype#: 00
	LDA #$C2
	STA $07F9
	JSR LBL1L1
sprite2:
	.BYTE #$00, #$00, #$00, #$00, #$0F, #$00, #$00, #$3F, #$F0, #$00, #$3F, #$00, #$00, #$EA, #$00, #$00, #$0A, #$00, #$00, #$08, #$00, #$00, #$15, #$00, #$00, #$55, #$40, #$01, #$5D, #$50, #$01, #$55, #$14, #$05, #$1D, #$06, #$04, #$15, #$00, #$04, #$2A, #$00, #$08, #$2A, #$00, #$00, #$22, #$00, #$00, #$20, #$80, #$00, #$20, #$80, #$00, #$20, #$80, #$00, #$28, #$A0, #$00, #$28, #$A0
LBL1L1:
	PLA
	STA $FB
	PLA
	STA $FC
	INC $FB
	LDA #$80
	STA $FD
	LDA #$30
	STA $FE
	JSR MOBCPY
; =========================================================
; RULE: value: NUMBER: (0)
; spritexy( u0, $0337, $0339 );
	LDA $0337
	STA $D000
	LDA $0338
	STA $D010
	LDA $0339
	STA $D001
; RULE: value: NUMBER: (1)
; spritexy( u1, $0337, $0339 );
	LDA $0337
	STA $D002
	LDA $0338
	STA $D010
	LDA $0339
	STA $D003
	LDA #$03
	STA $D01C
; RULE: value: NUMBER: (3)
	LDA #$03
	STA $D015
	JSR LBL0L7; pause()
; RULE: value: NUMBER: (1)
	LDA #$01
	STA $D015
	LDA #$06
	STA $D025
	LDA #$04
	STA $D026
	LDA #$07
	STA $D027
	LDA #$07
	STA $D028
; RULE: datatype: word
; RULE: value: NUM: (0x3E00)
; RULE: value: NUM: (0x3E00)->(w15872)
; RULE: init: '=' expression
; mem
; w15872
; unknown type
; w15872
; WORD mem=w15872 datatype#: 02
	LDA #$00
	LDX #$3E
	STA $033A
	STX $033B
; =========================================================
; RULE: datatype: word
; RULE: value: NUM: (0x07C0)
; RULE: value: NUM: (0x07C0)->(w1984)
; RULE: init: '=' expression
; cmem
; w1984
; unknown type
; w1984
; WORD cmem=w1984 datatype#: 02
	LDA #$C0
	LDX #$07
	STA $033C
	STX $033D
; =========================================================
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L2:
	PHA
; ---------------------------------------------------------
; RULE: datatype: uint
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; j
; u0
	LDA #$00
; UINT j=A datatype#: 00
	STA $033E; 
; ---------------------------------------------------------
; RULE: value: NUMBER: (40)
; UintID
; $033E
;  vs. 
; UintIMM
; u40
LBL1L3:			; Top of FOR Loop
	LDA $033E
	CMP #$28
	.BYTE #$B0, #$03
	JMP LBL1L5; if c==0 jump to BODY
	JMP LBL1L6; jump out of FOR
; =========================================================
; ---------------------------------------------------------
LBL1L4:
; inc(ID)
	INC $033E
	JMP LBL1L3; jump to top of FOR loop
; ---------------------------------------------------------
LBL1L5:
; =========================================================
;                         FOR LOOP
; =========================================================
LBL2L0:
	PHA
; ---------------------------------------------------------
; RULE: datatype: uint
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; i
; u0
	LDA #$00
; UINT i=A datatype#: 00
	STA $033F; 
; ---------------------------------------------------------
; RULE: value: NUMBER: (7)
; UintID
; $033F
;  vs. 
; UintIMM
; u7
LBL2L1:			; Top of FOR Loop
	LDA $033F
	CMP #$07
	.BYTE #$B0, #$03
	JMP LBL2L3; if c==0 jump to BODY
	JMP LBL2L4; jump out of FOR
; =========================================================
; ---------------------------------------------------------
LBL2L2:
; inc(ID)
	INC $033F
	JMP LBL2L1; jump to top of FOR loop
; ---------------------------------------------------------
LBL2L3:
	JSR LBL0L3; generateLand()
	JSR LBL0L1; incMem()
; ---------------------------------------------------------
	JMP LBL2L2; jump to iterator
LBL2L4:
	PLA
; ---------------------------------------------------------
	JSR LBL0L4; generateBottom()
	JSR LBL0L1; incMem()
	JSR LBL0L5; generateColours()
	JSR LBL0L2; incCmem()
; ---------------------------------------------------------
	JMP LBL1L4; jump to iterator
LBL1L6:
	PLA
; ---------------------------------------------------------
; RULE: datatype: uint
	LDA $D011
; RULE: init: '=' expression
; oldD011
; A
; initializing an unknown with A
; unknown type
; A
; UINT oldD011=A datatype#: 00
	STA $0340; 
; =========================================================
; RULE: datatype: uint
	LDA $D016
; RULE: init: '=' expression
; oldD016
; A
; initializing an unknown with A
; unknown type
; A
; UINT oldD016=A datatype#: 00
	STA $0341; 
; =========================================================
; RULE: datatype: uint
	LDA $D018
; RULE: init: '=' expression
; oldD018
; A
; initializing an unknown with A
; unknown type
; A
; UINT oldD018=A datatype#: 00
	STA $0342; 
; =========================================================
; RULE: datatype: uint
	LDA $D020
; RULE: init: '=' expression
; oldD020
; A
; initializing an unknown with A
; unknown type
; A
; UINT oldD020=A datatype#: 00
	STA $0343; 
; =========================================================
; RULE: datatype: uint
	LDA $D021
; RULE: init: '=' expression
; oldD021
; A
; initializing an unknown with A
; unknown type
; A
; UINT oldD021=A datatype#: 00
	STA $0344; 
; =========================================================
; RULE: datatype: uint
	LDA $0286
; RULE: init: '=' expression
; oldChar
; A
; initializing an unknown with A
; unknown type
; A
; UINT oldChar=A datatype#: 00
	STA $0345; 
; =========================================================
	LDA #$3B
	STA $D011
	LDA #$18
	STA $D016
	LDA #$18
	STA $D018
	LDA #$00
	STA $D020
	LDA #$00
	STA $D021
; RULE: datatype: uint
; RULE: value: NUMBER: (0)
; RULE: init: '=' expression
; timer
; u0
	LDA #$00
; UINT timer=A datatype#: 00
	STA $0346; 
; =========================================================
; RULE: datatype: uint
; =========================================================
;                  getin()
; =========================================================
	LDA $CB
; RULE: init: '=' expression
; c
; A
; initializing an unknown with A
; unknown type
; A
; UINT c=A datatype#: 00
	STA $0347; 
; =========================================================
; =========================================================
;                         WHILE LOOP
; =========================================================
	PHA
LBL1L7:
; ---------------------------------------------------------
; RULE: value: NUMBER: (62)
; UintID
; $0347
;  vs. 
; UintIMM
; u62
LBL1L8:			; Top of WHILE Loop
	LDA $0347
	CMP #$3E
	.BYTE #$D0, #$03
	JMP LBL1L10; if z==1 jump to ELSE
; =========================================================
LBL1L9:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL2L5:
; RULE: value: NUMBER: (0)
; UintID
; $0346
;  vs. 
; UintIMM
; u0
LBL2L6:			; Top of IF statement
	LDA $0346
	CMP #$00
	.BYTE #$F0, #$03
	JMP LBL2L8; jump to ELSE
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL2L7:
	JSR LBL0L9; checkLeft()
	JSR LBL0L10; checkRight()
	JMP LBL2L9
LBL2L8:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL2L9:
; inc(ID)
	INC $0346
; =========================================================
; =========================================================
;                  getin()
; =========================================================
	LDA $CB
; RULE: init: '=' expression
; c
; A
; initializing an int/uint with accumulator
; unknown type
; A
; RULE: statement: ID init
	STA $0347
; =========================================================
	JMP LBL1L8; jump to top of WHILE loop
LBL1L10:
	PLA
	JSR LBL0L0; clearkb()
; =========================================================
;                         cls()
; =========================================================
	JSR CLS; cls()
	LDA $0340; oldD011
	STA $D011
	LDA $0341; oldD016
	STA $D016
	LDA $0342; oldD018
	STA $D018
	LDA $0343; oldD020
	STA $D020
	LDA $0344; oldD021
	STA $D021
	LDA $0345; oldChar
	STA $0286
	RTS
; RULE: datatype: void
; ======================== clearkb ========================
LBL0L0:
; =========================================================
;                         poke 198, 0
; =========================================================
	LDA #$00
	STA $C6; 
; =========================================================
;                         jsr(NUMBER)
; =========================================================
	JSR $FFE4
	RTS
; RULE: datatype: void
; ======================== incMem ========================
LBL0L1:
; RULE: value: NUMBER: (1)
; $033A (2) + u1 (-1)
; WordID + (IntIMM || UintIMM)
	CLC
	LDA #$01
	ADC $033A
	PHA
	LDA #$00
	ADC $033B
	TAX
	PLA
; RULE: init: '=' expression
; mem
; XA
; unknown type
; XA
; RULE: statement: ID init
	STA $033A
	STX $033B
; =========================================================
	RTS
; RULE: datatype: void
; ======================== incCmem ========================
LBL0L2:
; RULE: value: NUMBER: (1)
; $033C (2) + u1 (-1)
; WordID + (IntIMM || UintIMM)
	CLC
	LDA #$01
	ADC $033C
	PHA
	LDA #$00
	ADC $033D
	TAX
	PLA
; RULE: init: '=' expression
; cmem
; XA
; unknown type
; XA
; RULE: statement: ID init
	STA $033C
	STX $033D
; =========================================================
	RTS
; RULE: datatype: void
; ======================== generateLand ========================
LBL0L3:
; RULE: datatype: uint
; RULE: value: NUMBER: (1)
; =========================================================
;            rnd(u1);
; =========================================================
	JSR SIDRND; initialize random number generator
	LDA $D41B
; RULE: init: '=' expression
; r
; A
; initializing an unknown with A
; unknown type
; A
; UINT r=A datatype#: 00
	STA $0348; 
; =========================================================
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L11:
; RULE: value: NUMBER: (65)
; UintID
; $0348
;  vs. 
; UintIMM
; u65
LBL1L12:			; Top of IF statement
	LDA $0348
	CMP #$41
	.BYTE #$90, #$03
	JMP LBL1L14; jump to ELSE
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L13:
; =========================================================
;                         poke mem, 170
; =========================================================
	LDA $033A
	STA LBL2L10
	LDA $033B
	STA LBL2L11
	LDA #$AA
	.BYTE #$8D;	  <-- STA absolute
LBL2L10:			; <-- low byte
	.BYTE #$00
LBL2L11:			; <-- hi byte
	.BYTE #$00
	JMP LBL1L15
LBL1L14:
; ---------------------------------------------------------
;                       ELSE:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL2L12:
; RULE: value: NUMBER: (128)
; UintID
; $0348
;  vs. 
; UintIMM
; u128
LBL2L13:			; Top of IF statement
	LDA $0348
	CMP #$80
	.BYTE #$90, #$03
	JMP LBL2L15; jump to ELSE
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL2L14:
; =========================================================
;                         poke mem, 166
; =========================================================
	LDA $033A
	STA LBL3L0
	LDA $033B
	STA LBL3L1
	LDA #$A6
	.BYTE #$8D;	  <-- STA absolute
LBL3L0:			; <-- low byte
	.BYTE #$00
LBL3L1:			; <-- hi byte
	.BYTE #$00
	JMP LBL2L16
LBL2L15:
; ---------------------------------------------------------
;                       ELSE:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL3L2:
; RULE: value: NUMBER: (196)
; UintID
; $0348
;  vs. 
; UintIMM
; u196
LBL3L3:			; Top of IF statement
	LDA $0348
	CMP #$C4
	.BYTE #$90, #$03
	JMP LBL3L5; jump to ELSE
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL3L4:
; =========================================================
;                         poke mem, 149
; =========================================================
	LDA $033A
	STA LBL4L0
	LDA $033B
	STA LBL4L1
	LDA #$95
	.BYTE #$8D;	  <-- STA absolute
LBL4L0:			; <-- low byte
	.BYTE #$00
LBL4L1:			; <-- hi byte
	.BYTE #$00
	JMP LBL3L6
LBL3L5:
; ---------------------------------------------------------
;                       ELSE:
; =========================================================
;                         poke mem, 90
; =========================================================
	LDA $033A
	STA LBL4L2
	LDA $033B
	STA LBL4L3
	LDA #$5A
	.BYTE #$8D;	  <-- STA absolute
LBL4L2:			; <-- low byte
	.BYTE #$00
LBL4L3:			; <-- hi byte
	.BYTE #$00
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL3L6:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL2L16:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L15:
	RTS
; RULE: datatype: void
; ======================== generateBottom ========================
LBL0L4:
; RULE: datatype: uint
; RULE: value: NUMBER: (1)
; =========================================================
;            rnd(u1);
; =========================================================
	LDA $D41B
; RULE: init: '=' expression
; r1
; A
; initializing an unknown with A
; unknown type
; A
; UINT r1=A datatype#: 00
	STA $0349; 
; =========================================================
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L16:
; RULE: value: NUMBER: (65)
; UintID
; $0349
;  vs. 
; UintIMM
; u65
LBL1L17:			; Top of IF statement
	LDA $0349
	CMP #$41
	.BYTE #$90, #$03
	JMP LBL1L19; jump to ELSE
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L18:
; =========================================================
;                         poke mem, 24
; =========================================================
	LDA $033A
	STA LBL2L17
	LDA $033B
	STA LBL2L18
	LDA #$18
	.BYTE #$8D;	  <-- STA absolute
LBL2L17:			; <-- low byte
	.BYTE #$00
LBL2L18:			; <-- hi byte
	.BYTE #$00
	JMP LBL1L20
LBL1L19:
; ---------------------------------------------------------
;                       ELSE:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL2L19:
; RULE: value: NUMBER: (128)
; UintID
; $0349
;  vs. 
; UintIMM
; u128
LBL2L20:			; Top of IF statement
	LDA $0349
	CMP #$80
	.BYTE #$90, #$03
	JMP LBL2L22; jump to ELSE
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL2L21:
; =========================================================
;                         poke mem, 8
; =========================================================
	LDA $033A
	STA LBL3L7
	LDA $033B
	STA LBL3L8
	LDA #$08
	.BYTE #$8D;	  <-- STA absolute
LBL3L7:			; <-- low byte
	.BYTE #$00
LBL3L8:			; <-- hi byte
	.BYTE #$00
	JMP LBL2L23
LBL2L22:
; ---------------------------------------------------------
;                       ELSE:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL3L9:
; RULE: value: NUMBER: (196)
; UintID
; $0349
;  vs. 
; UintIMM
; u196
LBL3L10:			; Top of IF statement
	LDA $0349
	CMP #$C4
	.BYTE #$90, #$03
	JMP LBL3L12; jump to ELSE
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL3L11:
; =========================================================
;                         poke mem, 0
; =========================================================
	LDA $033A
	STA LBL4L4
	LDA $033B
	STA LBL4L5
	LDA #$00
	.BYTE #$8D;	  <-- STA absolute
LBL4L4:			; <-- low byte
	.BYTE #$00
LBL4L5:			; <-- hi byte
	.BYTE #$00
	JMP LBL3L13
LBL3L12:
; ---------------------------------------------------------
;                       ELSE:
; =========================================================
;                         poke mem, 32
; =========================================================
	LDA $033A
	STA LBL4L6
	LDA $033B
	STA LBL4L7
	LDA #$20
	.BYTE #$8D;	  <-- STA absolute
LBL4L6:			; <-- low byte
	.BYTE #$00
LBL4L7:			; <-- hi byte
	.BYTE #$00
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL3L13:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL2L23:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L20:
	RTS
; RULE: datatype: void
; ======================== generateColours ========================
LBL0L5:
; RULE: datatype: uint
; RULE: value: NUMBER: (2)
; =========================================================
;            rnd(u2);
; =========================================================
	LDA $D41B
; RULE: init: '=' expression
; r2
; A
; initializing an unknown with A
; unknown type
; A
; UINT r2=A datatype#: 00
	STA $034A; 
; =========================================================
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L21:
; RULE: value: NUMBER: (128)
; UintID
; $034A
;  vs. 
; UintIMM
; u128
LBL1L22:			; Top of IF statement
	LDA $034A
	CMP #$80
	.BYTE #$90, #$03
	JMP LBL1L24; jump to ELSE
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L23:
; =========================================================
;                         poke cmem, 89
; =========================================================
	LDA $033C
	STA LBL2L24
	LDA $033D
	STA LBL2L25
	LDA #$59
	.BYTE #$8D;	  <-- STA absolute
LBL2L24:			; <-- low byte
	.BYTE #$00
LBL2L25:			; <-- hi byte
	.BYTE #$00
	JMP LBL1L25
LBL1L24:
; ---------------------------------------------------------
;                       ELSE:
; =========================================================
;                         poke cmem, 149
; =========================================================
	LDA $033C
	STA LBL2L26
	LDA $033D
	STA LBL2L27
	LDA #$95
	.BYTE #$8D;	  <-- STA absolute
LBL2L26:			; <-- low byte
	.BYTE #$00
LBL2L27:			; <-- hi byte
	.BYTE #$00
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L25:
	RTS
; RULE: datatype: void
; ======================== clearhires ========================
LBL0L6:
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L26:
	PHA
; ---------------------------------------------------------
; RULE: datatype: word
; RULE: value: NUM: (0x2000)
; RULE: value: NUM: (0x2000)->(w8192)
; RULE: init: '=' expression
; mem1
; w8192
; unknown type
; w8192
; WORD mem1=w8192 datatype#: 02
	LDA #$00
	LDX #$20
	STA $034B
	STX $034C
; ---------------------------------------------------------
; RULE: value: NUM: (0x3FFF)
; RULE: value: NUM: (0x3FFF)->(w16383)
; WordID
; $034B
;  vs. 
; WordIMM
; w16383
LBL1L27:			; Top of FOR Loop
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $034B v. w16383
	LDA $034C
	CMP #$3F
	.BYTE #$D0, #$05
	LDA $034B
	CMP #$FF
	.BYTE #$B0, #$03
	JMP LBL1L29; if c==0 jump to BODY
	JMP LBL1L30; jump out of FOR
; =========================================================
; ---------------------------------------------------------
LBL1L28:
; RULE: value: NUMBER: (1)
; $034B (2) + u1 (-1)
; WordID + (IntIMM || UintIMM)
	CLC
	LDA #$01
	ADC $034B
	PHA
	LDA #$00
	ADC $034C
	TAX
	PLA
; RULE: init: '=' expression
; mem1
; XA
; unknown type
; XA
; RULE: statement: ID init
	STA $034B
	STX $034C
	JMP LBL1L27; jump to top of FOR loop
; ---------------------------------------------------------
LBL1L29:
; =========================================================
;                         poke mem1, 0
; =========================================================
	LDA $034B
	STA LBL2L28
	LDA $034C
	STA LBL2L29
	LDA #$00
	.BYTE #$8D;	  <-- STA absolute
LBL2L28:			; <-- low byte
	.BYTE #$00
LBL2L29:			; <-- hi byte
	.BYTE #$00
; ---------------------------------------------------------
	JMP LBL1L28; jump to iterator
LBL1L30:
	PLA
; ---------------------------------------------------------
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L31:
	PHA
; ---------------------------------------------------------
; RULE: value: NUM: (0x0400)
; RULE: value: NUM: (0x0400)->(w1024)
; RULE: init: '=' expression
; mem1
; w1024
	LDA #$00
	LDX #$04
; RULE: statement: ID init
	STA $034B
	STX $034C
; ---------------------------------------------------------
; RULE: value: NUM: (0x07FF)
; RULE: value: NUM: (0x07FF)->(w2047)
; WordID
; $034B
;  vs. 
; WordIMM
; w2047
LBL1L32:			; Top of FOR Loop
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $034B v. w2047
	LDA $034C
	CMP #$07
	.BYTE #$D0, #$05
	LDA $034B
	CMP #$FF
	.BYTE #$B0, #$03
	JMP LBL1L34; if c==0 jump to BODY
	JMP LBL1L35; jump out of FOR
; =========================================================
; ---------------------------------------------------------
LBL1L33:
; RULE: value: NUMBER: (1)
; $034B (2) + u1 (-1)
; WordID + (IntIMM || UintIMM)
	CLC
	LDA #$01
	ADC $034B
	PHA
	LDA #$00
	ADC $034C
	TAX
	PLA
; RULE: init: '=' expression
; mem1
; XA
; unknown type
; XA
; RULE: statement: ID init
	STA $034B
	STX $034C
	JMP LBL1L32; jump to top of FOR loop
; ---------------------------------------------------------
LBL1L34:
; =========================================================
;                         poke mem1, 0
; =========================================================
	LDA $034B
	STA LBL2L30
	LDA $034C
	STA LBL2L31
	LDA #$00
	.BYTE #$8D;	  <-- STA absolute
LBL2L30:			; <-- low byte
	.BYTE #$00
LBL2L31:			; <-- hi byte
	.BYTE #$00
; RULE: value: NUMBER: (1)
; $034B (2) + u1 (-1)
; WordID + (IntIMM || UintIMM)
	CLC
	LDA #$01
	ADC $034B
	PHA
	LDA #$00
	ADC $034C
	TAX
	PLA
; RULE: init: '=' expression
; mem1
; XA
; unknown type
; XA
; RULE: statement: ID init
	STA $034B
	STX $034C
; =========================================================
; =========================================================
;                         poke mem1, 0
; =========================================================
	LDA $034B
	STA LBL2L32
	LDA $034C
	STA LBL2L33
	LDA #$00
	.BYTE #$8D;	  <-- STA absolute
LBL2L32:			; <-- low byte
	.BYTE #$00
LBL2L33:			; <-- hi byte
	.BYTE #$00
; ---------------------------------------------------------
	JMP LBL1L33; jump to iterator
LBL1L35:
	PLA
; ---------------------------------------------------------
	RTS
; RULE: datatype: void
; ======================== pause ========================
LBL0L7:
; =========================================================
;                         poke 198, 0
; =========================================================
	LDA #$00
	STA $C6; 
; =========================================================
;                         jsr(NUMBER)
; =========================================================
	JSR $FFE4
; RULE: datatype: uint
; =========================================================
;                  getchar()
; =========================================================
	JSR $FFE4
; RULE: init: '=' expression
; pausev
; A
; initializing an unknown with A
; unknown type
; A
; UINT pausev=A datatype#: 00
	STA $034D; 
; =========================================================
; =========================================================
;                         WHILE LOOP
; =========================================================
	PHA
LBL1L36:
; ---------------------------------------------------------
; RULE: value: NUMBER: (0)
; UintID
; $034D
;  vs. 
; UintIMM
; u0
LBL1L37:			; Top of WHILE Loop
	LDA $034D
	CMP #$00
	.BYTE #$F0, #$03
	JMP LBL1L39; jump to ELSE
; =========================================================
LBL1L38:
; =========================================================
;                  getchar()
; =========================================================
	JSR $FFE4
; RULE: init: '=' expression
; pausev
; A
; initializing an int/uint with accumulator
; unknown type
; A
; RULE: statement: ID init
	STA $034D
; =========================================================
	JMP LBL1L37; jump to top of WHILE loop
LBL1L39:
	PLA
	RTS
; RULE: datatype: void
; ======================== cr ========================
LBL0L8:
; RULE: value: NUM: (0x0D)
; RULE: value: NUM: (0x0D)->(u13)
	LDA #$0D
; =========================================================
;                         jsr(HEX_NUM)
; =========================================================
	JSR $FFD2
	RTS
; RULE: datatype: void
; ======================== checkLeft ========================
LBL0L9:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L40:
; RULE: value: NUMBER: (30)
; UintID
; $0347
;  vs. 
; UintIMM
; u30
LBL1L41:			; Top of IF statement
	LDA $0347
	CMP #$1E
	.BYTE #$F0, #$03
	JMP LBL1L43; jump to ELSE
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L42:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL2L34:
; RULE: value: NUM: (0x0017)
; RULE: value: NUM: (0x0017)->(w23)
; WordID
; $0337
;  vs. 
; WordIMM
; w23
LBL2L35:			; Top of IF statement
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $0337 v. w23
	LDA $0338
	CMP #$00
	.BYTE #$D0, #$05
	LDA $0337
	CMP #$17
	.BYTE #$B0, #$03
	JMP LBL2L37; if c==0 jump to ELSE
	.BYTE #$D0, #$03
	JMP LBL2L37; if z==1 jump to ELSE
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL2L36:
; RULE: value: NUMBER: (1)
; $0337 (2) - u1 (-1)
; WordID - (IntIMM || UintIMM)
	SEC
	LDA $0337
	SBC #$01
	PHA
	LDA $0338
	SBC #$00
	TAX
	PLA
; RULE: init: '=' expression
; x
; XA
; unknown type
; XA
; RULE: statement: ID init
	STA $0337
	STX $0338
; =========================================================
; RULE: value: NUMBER: (0)
; spritex( u0, $0337 );
	LDA $0337
	STA $D000
	LDA $0338
	STA $2A
	LDA #$01
	EOR #$FF
	AND $D010
	STA $A7
	LDA $2A
	CLC
	ADC $A7
	STA $D010
; RULE: value: NUMBER: (1)
; spritex( u1, $0337 );
	LDA $0337
	STA $D002
	LDA $0338
	STA $2A
	LDA #$01
	ASL
	ASL $2A
	EOR #$FF
	AND $D010
	STA $A7
	LDA $2A
	CLC
	ADC $A7
	STA $D010
	JSR LBL0L11; moveLegs()
	JMP LBL2L38
LBL2L37:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL2L38:
	JMP LBL1L44
LBL1L43:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L44:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L45:
; RULE: value: NUM: (0x0017)
; RULE: value: NUM: (0x0017)->(w23)
; WordID
; $0337
;  vs. 
; WordIMM
; w23
LBL1L46:			; Top of IF statement
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $0337 v. w23
	LDA $0338
	CMP #$00
	.BYTE #$D0, #$05
	LDA $0337
	CMP #$17
	.BYTE #$90, #$03
	JMP LBL1L48; jump to ELSE
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L47:
; RULE: value: NUM: (0x0017)
; RULE: value: NUM: (0x0017)->(w23)
; RULE: init: '=' expression
; x
; w23
	LDA #$17
	LDX #$00
; RULE: statement: ID init
	STA $0337
	STX $0338
; =========================================================
	JMP LBL1L49
LBL1L48:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L49:
	RTS
; RULE: datatype: void
; ======================== checkRight ========================
LBL0L10:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L50:
; RULE: value: NUMBER: (38)
; UintID
; $0347
;  vs. 
; UintIMM
; u38
LBL1L51:			; Top of IF statement
	LDA $0347
	CMP #$26
	.BYTE #$F0, #$03
	JMP LBL1L53; jump to ELSE
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L52:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL2L39:
; RULE: value: NUMBER: (320)
; WordID
; $0337
;  vs. 
; WordIMM
; w320
LBL2L40:			; Top of IF statement
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $0337 v. w320
	LDA $0338
	CMP #$01
	.BYTE #$D0, #$05
	LDA $0337
	CMP #$40
	.BYTE #$90, #$03
	JMP LBL2L42; jump to ELSE
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL2L41:
; RULE: value: NUMBER: (1)
; $0337 (2) + u1 (-1)
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
; x
; XA
; unknown type
; XA
; RULE: statement: ID init
	STA $0337
	STX $0338
; =========================================================
; RULE: value: NUMBER: (0)
; spritex( u0, $0337 );
	LDA $0337
	STA $D000
	LDA $0338
	STA $2A
	LDA #$01
	EOR #$FF
	AND $D010
	STA $A7
	LDA $2A
	CLC
	ADC $A7
	STA $D010
; RULE: value: NUMBER: (1)
; spritex( u1, $0337 );
	LDA $0337
	STA $D002
	LDA $0338
	STA $2A
	LDA #$01
	ASL
	ASL $2A
	EOR #$FF
	AND $D010
	STA $A7
	LDA $2A
	CLC
	ADC $A7
	STA $D010
	JSR LBL0L11; moveLegs()
	JMP LBL2L43
LBL2L42:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL2L43:
	JMP LBL1L54
LBL1L53:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L54:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L55:
; RULE: value: NUMBER: (320)
; WordID
; $0337
;  vs. 
; WordIMM
; w320
LBL1L56:			; Top of IF statement
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $0337 v. w320
	LDA $0338
	CMP #$01
	.BYTE #$D0, #$05
	LDA $0337
	CMP #$40
	.BYTE #$B0, #$03
	JMP LBL1L58; if c==0 jump to ELSE
	.BYTE #$D0, #$03
	JMP LBL1L58; if z==1 jump to ELSE
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L57:
; RULE: value: NUMBER: (320)
; RULE: init: '=' expression
; x
; w320
	LDA #$40
	LDX #$01
; RULE: statement: ID init
	STA $0337
	STX $0338
; =========================================================
	JMP LBL1L59
LBL1L58:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L59:
	RTS
; RULE: datatype: void
; ======================== moveLegs ========================
LBL0L11:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L60:
; RULE: value: NUMBER: (1)
; UintID
; $0336
;  vs. 
; UintIMM
; u1
LBL1L61:			; Top of IF statement
	LDA $0336
	CMP #$01
	.BYTE #$F0, #$03
	JMP LBL1L63; jump to ELSE
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L62:
; RULE: value: NUMBER: (2)
; RULE: init: '=' expression
; whichsprite
; u2
	LDA #$02
; RULE: statement: ID init
	STA $0336
; =========================================================
; RULE: value: NUMBER: (2)
	LDA #$02
	STA $D015
	JMP LBL1L64
LBL1L63:
; ---------------------------------------------------------
;                       ELSE:
; RULE: value: NUMBER: (1)
; RULE: init: '=' expression
; whichsprite
; u1
	LDA #$01
; RULE: statement: ID init
	STA $0336
; =========================================================
; RULE: value: NUMBER: (1)
	LDA #$01
	STA $D015
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L64:
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
CLS:		; Clear Screen Routine
	LDA #$20
	LDX #$00
CLSLOOP:
	STA $0400,X
	STA $0500,X
	STA $0600,X
	STA $06E8,X
	DEX
	BNE CLSLOOP
	RTS
MOBCPY:		; Copy 63 bytes from $FB/$FC to $FD/$FE
	LDY #$3F
MOBCPL1:
	CPY #$00
	BEQ MOBCPL2
	LDA ($FB),Y
	STA ($FD),Y
	DEY
	JMP MOBCPL1
MOBCPL2:
	RTS
