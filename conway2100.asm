; uint : return_address_1 : $0334 (820)
; uint : return_address_2 : $0335 (821)
; word : shadow : $0336 (822)
; word : board : $0338 (824)
; word : colour : $033A (826)
; uint : n : $033C (828)
; uint : alive : $033D (829)
; word : i : $033E (830)
; word : arg0 : $0340 (832)
; word : arg1 : $0342 (834)
; uint : k : $0344 (836)
; uint : a : $0345 (837)
; uint : oldD020 : $0346 (838)
; uint : oldD021 : $0347 (839)
; uint : oldChar : $0348 (840)
; RULE: datatype: void
.org $0834
; =========================================================
;                         main()
; =========================================================
; RULE: datatype: word
; RULE: init: '=' expression
; initialising WordIMM: 49152
	LDA #$00; ; 0834
	LDX #$C0; ; 0836
; RULE: statement: datatype ID init
; WORD shadow=XA datatype#: 02
	STA $0336;  shadow; ; 0838
	STX $0337; ; 083B
; =========================================================
; RULE: datatype: word
; RULE: init: '=' expression
; initialising WordIMM: 1024
	LDA #$00; ; 083E
	LDX #$04; ; 0840
; RULE: statement: datatype ID init
; WORD board=XA datatype#: 02
	STA $0338;  board; ; 0842
	STX $0339; ; 0845
; =========================================================
; RULE: datatype: word
; RULE: init: '=' expression
; initialising WordIMM: 55296
	LDA #$00; ; 0848
	LDX #$D8; ; 084A
; RULE: statement: datatype ID init
; WORD colour=XA datatype#: 02
	STA $033A;  colour; ; 084C
	STX $033B; ; 084F
; =========================================================
; RULE: datatype: uint
; NULL expression
; RULE: init: '=' expression
; RULE: statement: datatype ID init
; UINT n=NULL datatype#: 00
; NULL expression... variable is ghosted
; =========================================================
; RULE: datatype: uint
; NULL expression
; RULE: init: '=' expression
; RULE: statement: datatype ID init
; UINT alive=NULL datatype#: 00
; NULL expression... variable is ghosted
; =========================================================
; RULE: datatype: word
; NULL expression
; RULE: init: '=' expression
; RULE: statement: datatype ID init
; WORD i=NULL datatype#: 02
; NULL expression... variable is ghosted
; =========================================================
; RULE: datatype: word
; NULL expression
; RULE: init: '=' expression
; RULE: statement: datatype ID init
; WORD arg0=NULL datatype#: 02
; NULL expression... variable is ghosted
; =========================================================
; RULE: datatype: word
; NULL expression
; RULE: init: '=' expression
; RULE: statement: datatype ID init
; WORD arg1=NULL datatype#: 02
; NULL expression... variable is ghosted
; =========================================================
; Call a function as a statement
	JSR LBL0L2; saveregs(); ; 0852
; =========================================================
;                          seed();
; =========================================================
	JSR SIDRND; initialize random number generator; ; 0855
; ----------------------------------------------------------------------------------
; romout() : Swap out a ROM: Taken from https://sta.c64.org/cbm64mem.html
; %x00: RAM visible in all three areas.
; %x01: RAM visible at $A000-$BFFF and $E000-$FFFF.
; %x10: RAM visible at $A000-$BFFF; KERNAL ROM visible at $E000-$FFFF.
; %x11: BASIC ROM visible at $A000-$BFFF; KERNAL ROM visible at $E000-$FFFF.
; %0xx: Character ROM visible at $D000-$DFFF. (Except for the value %000, see above)
; %1xx: I/O area visible at $D000-$DFFF. (Except for the value %100, see above.)
; ----------------------------------------------------------------------------------
	SEI; ; 0858
	LDA $01; ; 0859
	AND #$F8; ; 085B
	ORA #$06; ; 085D
	STA $01; ; 085F
	CLI; ; 0861
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$0C; ; 0862
	STA $D020; ; 0864
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$0C; ; 0867
	STA $D021; ; 0869
; Call a function as a statement
	JSR LBL0L1; clearShadowAndBoard(); ; 086C
	LDA #$9B; ; 086F
; =========================================================
;                         jsr(HEX_NUM)
; =========================================================
	JSR $FFD2; ; 0871
; cursorxy(u0,u24)
	CLC; ; 0874
	LDY #$00; ; 0875
	LDX #$18; ; 0877
	JSR $FFF0; ; 0879
; =========================================================
;                         printf(" CONWAYS GAME OF LIFE       HOLD R OR Q");
; =========================================================
	LDA #$0D; ; 087C
	STA $03; ; 087E
	LDA #$57; ; 0880
	STA $02; ; 0882
	JSR PRN; ; 0884
; Call a function as a statement
	JSR LBL0L0; randomizeBoard(); ; 0887
; memcpy(w49192,w1064,u255);
	LDY #$FF; ; 088A
LBL1L0:
	CPY #$00; ; 088C
	BEQ LBL1L1; ; 088E
	LDA $C028,Y; ; 0890
	STA $0428,Y; ; 0893
	DEY; ; 0896
	JMP LBL1L0; ; 0897
LBL1L1:
; memcpy(w49447,w1319,u255);
	LDY #$FF; ; 089A
LBL1L2:
	CPY #$00; ; 089C
	BEQ LBL1L3; ; 089E
	LDA $C127,Y; ; 08A0
	STA $0527,Y; ; 08A3
	DEY; ; 08A6
	JMP LBL1L2; ; 08A7
LBL1L3:
; memcpy(w49702,w1574,u255);
	LDY #$FF; ; 08AA
LBL1L4:
	CPY #$00; ; 08AC
	BEQ LBL1L5; ; 08AE
	LDA $C226,Y; ; 08B0
	STA $0626,Y; ; 08B3
	DEY; ; 08B6
	JMP LBL1L4; ; 08B7
LBL1L5:
; memcpy(w49957,w1829,u154);
	LDY #$9A; ; 08BA
LBL1L6:
	CPY #$00; ; 08BC
	BEQ LBL1L7; ; 08BE
	LDA $C325,Y; ; 08C0
	STA $0725,Y; ; 08C3
	DEY; ; 08C6
	JMP LBL1L6; ; 08C7
LBL1L7:
; RULE: datatype: uint
; =========================================================
;                  getin()
; =========================================================
	LDA $CB; ; 08CA
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT k=A datatype#: 00
; UINT UintID A
	STA $0344;  k; ; 08CC
; =========================================================
; =========================================================
;                         WHILE LOOP
; =========================================================
	PHA; ; 08CF
LBL1L8:
; ---------------------------------------------------------
; UintID $0344 vs. UintIMM u62
LBL1L9:			; Top of WHILE Loop
; UintID relop UintIMM
	LDA $0344;  k; ; 08D0
	CMP #$3E; ; 08D3
	.BYTE $D0, $03;  BNE +3; ; 08D5
	JMP LBL1L11;  if z==1 jump to ELSE; ; 08D7
; =========================================================
LBL1L10:
; Preserve $02
	LDA $02; ; 08DA
	PHA; ; 08DC
; =========================================================
;                         FOR LOOP
; =========================================================
LBL2L0:
	PHA; ; 08DD
; ---------------------------------------------------------
; RULE: init: '=' expression
; initialising WordIMM: 40
	LDA #$28; ; 08DE
	LDX #$00; ; 08E0
; RULE: statement: ID init
; WordID = XA
	STA $033E;  i; ; 08E2
	STX $033F; ; 08E5
; ---------------------------------------------------------
; WordID $033E vs. WordIMM w920
LBL2L1:			; Top of FOR Loop
; =========================================================
;                         WORD ID relop  WORD IMM
; =========================================================
; $033E relop w920
	LDA $033F; ; 08E8
	CMP #$03; ; 08EB
	.BYTE #$D0, #$05;  BNE +5; ; 08ED
	LDA $033E; ; 08EF
	CMP #$98; ; 08F2
	.BYTE #$B0, #$03; BCS +3; ; 08F4
	JMP LBL2L3;  if c==0 jump to BODY; ; 08F6
	JMP LBL2L4;  jump out of FOR; ; 08F9
; =========================================================
; ---------------------------------------------------------
LBL2L2:
; OP2
; RULE: expression: expression arithmetic expression
; $033E + u1
; $033E (2) + u1 (-1)
	CLC; ; 08FC
; WordID + (IntIMM || UintIMM)
	LDA #$01; ; 08FD
	ADC $033E; ; 08FF
	PHA; ; 0902
	LDA #$00; ; 0903
	ADC $033F; ; 0905
	TAX; ; 0908
	PLA; ; 0909
; RULE: init: '=' expression
; initialising a word with XA
; RULE: statement: ID init
; WordID = XA
	STA $033E;  i; ; 090A
	STX $033F; ; 090D
	JMP LBL2L1;  jump to top of FOR loop; ; 0910
; ---------------------------------------------------------
LBL2L3:
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$00; ; 0913
; RULE: statement: ID init
	STA $033C;  n; ; 0915
; =========================================================
; OP2
; RULE: expression: expression arithmetic expression
; $0338 + $033E
; $0338 (2) + $033E (2)
	CLC; ; 0918
; WordID arith WordID
; WordID + WordID
	LDA $0338; ; 0919
	ADC $033E; ; 091C
	TAY; ; 091F
	LDA $0339; ; 0920
	ADC $033F; ; 0923
	TAX; ; 0926
	TYA; ; 0927
; RULE: init: '=' expression
; initialising a word with XA
; RULE: statement: ID init
; WordID = XA
	STA $0340;  arg0; ; 0928
	STX $0341; ; 092B
; =========================================================
; OP2
; RULE: expression: expression arithmetic expression
; $0336 + $033E
; $0336 (2) + $033E (2)
	CLC; ; 092E
; WordID arith WordID
; WordID + WordID
	LDA $0336; ; 092F
	ADC $033E; ; 0932
	TAY; ; 0935
	LDA $0337; ; 0936
	ADC $033F; ; 0939
	TAX; ; 093C
	TYA; ; 093D
; RULE: init: '=' expression
; initialising a word with XA
; RULE: statement: ID init
; WordID = XA
	STA $0342;  arg1; ; 093E
	STX $0343; ; 0941
; =========================================================
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL3L0:
; OP2
; RULE: expression: expression arithmetic expression
; $0340 - u41
; $0340 (2) - u41 (-1)
	SEC; ; 0944
; WordID - (IntIMM || UintIMM)
	LDA $0340; ; 0945
	SBC #$29; ; 0948
	PHA; ; 094A
	LDA $0341; ; 094B
	SBC #$00; ; 094E
	TAX; ; 0950
	PLA; ; 0951
; tPEEK '(' expression ')' 
; peek( XA );
	TAY; ; 0952
	LDA $02; ; 0953
	PHA; ; 0955
	LDA $03; ; 0956
	PHA; ; 0958
	STY $02; ; 0959
	LDY #$00; ; 095B
	STX $03; ; 095D
	LDA ($02),Y; ; 095F
	TAX; ; 0961
	PLA; ; 0962
	STA $03; ; 0963
	PLA; ; 0965
	STA $02; ; 0966
	TXA; ; 0968
; A A vs. UintIMM u32
LBL3L1:			; Top of IF statement
; A relop UintIMM
	CMP #$20; ; 0969
	.BYTE $D0, $03;  BNE +3; ; 096B
	JMP LBL3L3;  if z==1 jump to ELSE; ; 096D
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL3L2:
; inc(expression)
	INC $033C; ; 0970
; =========================================================
	JMP LBL3L4; ; 0973
LBL3L3:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL3L4:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL3L5:
; OP2
; RULE: expression: expression arithmetic expression
; $0340 - u40
; $0340 (2) - u40 (-1)
	SEC; ; 0976
; WordID - (IntIMM || UintIMM)
	LDA $0340; ; 0977
	SBC #$28; ; 097A
	PHA; ; 097C
	LDA $0341; ; 097D
	SBC #$00; ; 0980
	TAX; ; 0982
	PLA; ; 0983
; tPEEK '(' expression ')' 
; peek( XA );
	TAY; ; 0984
	LDA $02; ; 0985
	PHA; ; 0987
	LDA $03; ; 0988
	PHA; ; 098A
	STY $02; ; 098B
	LDY #$00; ; 098D
	STX $03; ; 098F
	LDA ($02),Y; ; 0991
	TAX; ; 0993
	PLA; ; 0994
	STA $03; ; 0995
	PLA; ; 0997
	STA $02; ; 0998
	TXA; ; 099A
; A A vs. UintIMM u32
LBL3L6:			; Top of IF statement
; A relop UintIMM
	CMP #$20; ; 099B
	.BYTE $D0, $03;  BNE +3; ; 099D
	JMP LBL3L8;  if z==1 jump to ELSE; ; 099F
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL3L7:
; inc(expression)
	INC $033C; ; 09A2
; =========================================================
	JMP LBL3L9; ; 09A5
LBL3L8:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL3L9:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL3L10:
; OP2
; RULE: expression: expression arithmetic expression
; $0340 - u39
; $0340 (2) - u39 (-1)
	SEC; ; 09A8
; WordID - (IntIMM || UintIMM)
	LDA $0340; ; 09A9
	SBC #$27; ; 09AC
	PHA; ; 09AE
	LDA $0341; ; 09AF
	SBC #$00; ; 09B2
	TAX; ; 09B4
	PLA; ; 09B5
; tPEEK '(' expression ')' 
; peek( XA );
	TAY; ; 09B6
	LDA $02; ; 09B7
	PHA; ; 09B9
	LDA $03; ; 09BA
	PHA; ; 09BC
	STY $02; ; 09BD
	LDY #$00; ; 09BF
	STX $03; ; 09C1
	LDA ($02),Y; ; 09C3
	TAX; ; 09C5
	PLA; ; 09C6
	STA $03; ; 09C7
	PLA; ; 09C9
	STA $02; ; 09CA
	TXA; ; 09CC
; A A vs. UintIMM u32
LBL3L11:			; Top of IF statement
; A relop UintIMM
	CMP #$20; ; 09CD
	.BYTE $D0, $03;  BNE +3; ; 09CF
	JMP LBL3L13;  if z==1 jump to ELSE; ; 09D1
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL3L12:
; inc(expression)
	INC $033C; ; 09D4
; =========================================================
	JMP LBL3L14; ; 09D7
LBL3L13:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL3L14:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL3L15:
; OP2
; RULE: expression: expression arithmetic expression
; $0340 - u1
; $0340 (2) - u1 (-1)
	SEC; ; 09DA
; WordID - (IntIMM || UintIMM)
	LDA $0340; ; 09DB
	SBC #$01; ; 09DE
	PHA; ; 09E0
	LDA $0341; ; 09E1
	SBC #$00; ; 09E4
	TAX; ; 09E6
	PLA; ; 09E7
; tPEEK '(' expression ')' 
; peek( XA );
	TAY; ; 09E8
	LDA $02; ; 09E9
	PHA; ; 09EB
	LDA $03; ; 09EC
	PHA; ; 09EE
	STY $02; ; 09EF
	LDY #$00; ; 09F1
	STX $03; ; 09F3
	LDA ($02),Y; ; 09F5
	TAX; ; 09F7
	PLA; ; 09F8
	STA $03; ; 09F9
	PLA; ; 09FB
	STA $02; ; 09FC
	TXA; ; 09FE
; A A vs. UintIMM u32
LBL3L16:			; Top of IF statement
; A relop UintIMM
	CMP #$20; ; 09FF
	.BYTE $D0, $03;  BNE +3; ; 0A01
	JMP LBL3L18;  if z==1 jump to ELSE; ; 0A03
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL3L17:
; inc(expression)
	INC $033C; ; 0A06
; =========================================================
	JMP LBL3L19; ; 0A09
LBL3L18:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL3L19:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL3L20:
; OP2
; RULE: expression: expression arithmetic expression
; $0340 + u1
; $0340 (2) + u1 (-1)
	CLC; ; 0A0C
; WordID + (IntIMM || UintIMM)
	LDA #$01; ; 0A0D
	ADC $0340; ; 0A0F
	PHA; ; 0A12
	LDA #$00; ; 0A13
	ADC $0341; ; 0A15
	TAX; ; 0A18
	PLA; ; 0A19
; tPEEK '(' expression ')' 
; peek( XA );
	TAY; ; 0A1A
	LDA $02; ; 0A1B
	PHA; ; 0A1D
	LDA $03; ; 0A1E
	PHA; ; 0A20
	STY $02; ; 0A21
	LDY #$00; ; 0A23
	STX $03; ; 0A25
	LDA ($02),Y; ; 0A27
	TAX; ; 0A29
	PLA; ; 0A2A
	STA $03; ; 0A2B
	PLA; ; 0A2D
	STA $02; ; 0A2E
	TXA; ; 0A30
; A A vs. UintIMM u32
LBL3L21:			; Top of IF statement
; A relop UintIMM
	CMP #$20; ; 0A31
	.BYTE $D0, $03;  BNE +3; ; 0A33
	JMP LBL3L23;  if z==1 jump to ELSE; ; 0A35
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL3L22:
; inc(expression)
	INC $033C; ; 0A38
; =========================================================
	JMP LBL3L24; ; 0A3B
LBL3L23:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL3L24:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL3L25:
; OP2
; RULE: expression: expression arithmetic expression
; $0340 + u39
; $0340 (2) + u39 (-1)
	CLC; ; 0A3E
; WordID + (IntIMM || UintIMM)
	LDA #$27; ; 0A3F
	ADC $0340; ; 0A41
	PHA; ; 0A44
	LDA #$00; ; 0A45
	ADC $0341; ; 0A47
	TAX; ; 0A4A
	PLA; ; 0A4B
; tPEEK '(' expression ')' 
; peek( XA );
	TAY; ; 0A4C
	LDA $02; ; 0A4D
	PHA; ; 0A4F
	LDA $03; ; 0A50
	PHA; ; 0A52
	STY $02; ; 0A53
	LDY #$00; ; 0A55
	STX $03; ; 0A57
	LDA ($02),Y; ; 0A59
	TAX; ; 0A5B
	PLA; ; 0A5C
	STA $03; ; 0A5D
	PLA; ; 0A5F
	STA $02; ; 0A60
	TXA; ; 0A62
; A A vs. UintIMM u32
LBL3L26:			; Top of IF statement
; A relop UintIMM
	CMP #$20; ; 0A63
	.BYTE $D0, $03;  BNE +3; ; 0A65
	JMP LBL3L28;  if z==1 jump to ELSE; ; 0A67
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL3L27:
; inc(expression)
	INC $033C; ; 0A6A
; =========================================================
	JMP LBL3L29; ; 0A6D
LBL3L28:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL3L29:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL3L30:
; OP2
; RULE: expression: expression arithmetic expression
; $0340 + u40
; $0340 (2) + u40 (-1)
	CLC; ; 0A70
; WordID + (IntIMM || UintIMM)
	LDA #$28; ; 0A71
	ADC $0340; ; 0A73
	PHA; ; 0A76
	LDA #$00; ; 0A77
	ADC $0341; ; 0A79
	TAX; ; 0A7C
	PLA; ; 0A7D
; tPEEK '(' expression ')' 
; peek( XA );
	TAY; ; 0A7E
	LDA $02; ; 0A7F
	PHA; ; 0A81
	LDA $03; ; 0A82
	PHA; ; 0A84
	STY $02; ; 0A85
	LDY #$00; ; 0A87
	STX $03; ; 0A89
	LDA ($02),Y; ; 0A8B
	TAX; ; 0A8D
	PLA; ; 0A8E
	STA $03; ; 0A8F
	PLA; ; 0A91
	STA $02; ; 0A92
	TXA; ; 0A94
; A A vs. UintIMM u32
LBL3L31:			; Top of IF statement
; A relop UintIMM
	CMP #$20; ; 0A95
	.BYTE $D0, $03;  BNE +3; ; 0A97
	JMP LBL3L33;  if z==1 jump to ELSE; ; 0A99
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL3L32:
; inc(expression)
	INC $033C; ; 0A9C
; =========================================================
	JMP LBL3L34; ; 0A9F
LBL3L33:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL3L34:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL3L35:
; OP2
; RULE: expression: expression arithmetic expression
; $0340 + u41
; $0340 (2) + u41 (-1)
	CLC; ; 0AA2
; WordID + (IntIMM || UintIMM)
	LDA #$29; ; 0AA3
	ADC $0340; ; 0AA5
	PHA; ; 0AA8
	LDA #$00; ; 0AA9
	ADC $0341; ; 0AAB
	TAX; ; 0AAE
	PLA; ; 0AAF
; tPEEK '(' expression ')' 
; peek( XA );
	TAY; ; 0AB0
	LDA $02; ; 0AB1
	PHA; ; 0AB3
	LDA $03; ; 0AB4
	PHA; ; 0AB6
	STY $02; ; 0AB7
	LDY #$00; ; 0AB9
	STX $03; ; 0ABB
	LDA ($02),Y; ; 0ABD
	TAX; ; 0ABF
	PLA; ; 0AC0
	STA $03; ; 0AC1
	PLA; ; 0AC3
	STA $02; ; 0AC4
	TXA; ; 0AC6
; A A vs. UintIMM u32
LBL3L36:			; Top of IF statement
; A relop UintIMM
	CMP #$20; ; 0AC7
	.BYTE $D0, $03;  BNE +3; ; 0AC9
	JMP LBL3L38;  if z==1 jump to ELSE; ; 0ACB
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL3L37:
; inc(expression)
	INC $033C; ; 0ACE
; =========================================================
	JMP LBL3L39; ; 0AD1
LBL3L38:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL3L39:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL3L40:
; tPEEK '(' expression ')' 
; peek( Word );
	LDY #$00; ; 0AD4
	LDA $0340; ; 0AD6
	LDX $0341; ; 0AD9
	STA $02; ; 0ADC
	STX $03; ; 0ADE
	LDA ($02),Y; ; 0AE0
; A A vs. UintIMM u32
LBL3L41:			; Top of IF statement
; A relop UintIMM
	CMP #$20; ; 0AE2
	.BYTE #$F0, #$03;  BEQ +3; ; 0AE4
	JMP LBL3L43;  jump to ELSE; ; 0AE6
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL3L42:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL4L0:
; UintID $033C vs. UintIMM u3
LBL4L1:			; Top of IF statement
; UintID relop UintIMM
	LDA $033C;  n; ; 0AE9
	CMP #$03; ; 0AEC
	.BYTE #$F0, #$03;  BEQ +3; ; 0AEE
	JMP LBL4L3;  jump to ELSE; ; 0AF0
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL4L2:
; poke( expression, expression );
	LDA $0342; ; 0AF3
	STA LBL5L0; ; 0AF6
	LDA $0343; ; 0AF9
	STA LBL5L1; ; 0AFC
	LDA #$51; ; 0AFF
	.BYTE $8D;	  <-- STA absolute; ; 0B01
LBL5L0:			; <-- low byte
	.BYTE $00; ; 0B02
LBL5L1:			; <-- hi byte
	.BYTE $00; ; 0B03
	JMP LBL4L4; ; 0B04
LBL4L3:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL4L4:
	JMP LBL3L44; ; 0B07
LBL3L43:
; ---------------------------------------------------------
;                       ELSE:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL4L5:
; UintID $033C vs. UintIMM u2
LBL4L6:			; Top of IF statement
; UintID relop UintIMM
	LDA $033C;  n; ; 0B0A
	CMP #$02; ; 0B0D
	.BYTE #$90, #$03;  BCC +3; ; 0B0F
	JMP LBL4L8;  jump to ELSE; ; 0B11
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL4L7:
; poke( expression, expression );
	LDA $0342; ; 0B14
	STA LBL5L2; ; 0B17
	LDA $0343; ; 0B1A
	STA LBL5L3; ; 0B1D
	LDA #$20; ; 0B20
	.BYTE $8D;	  <-- STA absolute; ; 0B22
LBL5L2:			; <-- low byte
	.BYTE $00; ; 0B23
LBL5L3:			; <-- hi byte
	.BYTE $00; ; 0B24
	JMP LBL4L9; ; 0B25
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
; UintID $033C vs. UintIMM u3
LBL4L11:			; Top of IF statement
; UintID relop UintIMM
	LDA $033C;  n; ; 0B28
	CMP #$03; ; 0B2B
	.BYTE #$B0, #$03;  BCS +3; ; 0B2D
	JMP LBL4L13;  if c==0 jump to ELSE; ; 0B2F
	.BYTE $D0, $03;  BNE +3; ; 0B32
	JMP LBL4L13;  if z==1 jump to ELSE; ; 0B34
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL4L12:
; poke( expression, expression );
	LDA $0342; ; 0B37
	STA LBL5L4; ; 0B3A
	LDA $0343; ; 0B3D
	STA LBL5L5; ; 0B40
	LDA #$20; ; 0B43
	.BYTE $8D;	  <-- STA absolute; ; 0B45
LBL5L4:			; <-- low byte
	.BYTE $00; ; 0B46
LBL5L5:			; <-- hi byte
	.BYTE $00; ; 0B47
	JMP LBL4L14; ; 0B48
LBL4L13:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL4L14:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL3L44:
; ---------------------------------------------------------
	JMP LBL2L2;  jump to iterator; ; 0B4B
LBL2L4:
	PLA; ; 0B4E
; ---------------------------------------------------------
; Restore $02
	PLA; ; 0B4F
	STA $02; ; 0B50
; memcpy(w49192,w1064,u255);
	LDY #$FF; ; 0B52
LBL2L5:
	CPY #$00; ; 0B54
	BEQ LBL2L6; ; 0B56
	LDA $C028,Y; ; 0B58
	STA $0428,Y; ; 0B5B
	DEY; ; 0B5E
	JMP LBL2L5; ; 0B5F
LBL2L6:
; memcpy(w49447,w1319,u255);
	LDY #$FF; ; 0B62
LBL2L7:
	CPY #$00; ; 0B64
	BEQ LBL2L8; ; 0B66
	LDA $C127,Y; ; 0B68
	STA $0527,Y; ; 0B6B
	DEY; ; 0B6E
	JMP LBL2L7; ; 0B6F
LBL2L8:
; memcpy(w49702,w1574,u255);
	LDY #$FF; ; 0B72
LBL2L9:
	CPY #$00; ; 0B74
	BEQ LBL2L10; ; 0B76
	LDA $C226,Y; ; 0B78
	STA $0626,Y; ; 0B7B
	DEY; ; 0B7E
	JMP LBL2L9; ; 0B7F
LBL2L10:
; memcpy(w49957,w1829,u154);
	LDY #$9A; ; 0B82
LBL2L11:
	CPY #$00; ; 0B84
	BEQ LBL2L12; ; 0B86
	LDA $C325,Y; ; 0B88
	STA $0725,Y; ; 0B8B
	DEY; ; 0B8E
	JMP LBL2L11; ; 0B8F
LBL2L12:
; =========================================================
;                  getin()
; =========================================================
	LDA $CB; ; 0B92
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: ID init
	STA $0344;  k; ; 0B94
; =========================================================
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL2L13:
; UintID $0344 vs. UintIMM u17
LBL2L14:			; Top of IF statement
; UintID relop UintIMM
	LDA $0344;  k; ; 0B97
	CMP #$11; ; 0B9A
	.BYTE #$F0, #$03;  BEQ +3; ; 0B9C
	JMP LBL2L16;  jump to ELSE; ; 0B9E
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL2L15:
; Call a function as a statement
	JSR LBL0L0; randomizeBoard(); ; 0BA1
	JMP LBL2L17; ; 0BA4
LBL2L16:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL2L17:
	JMP LBL1L9;  jump to top of WHILE loop; ; 0BA7
LBL1L11:
	PLA; ; 0BAA
; poke( expression, expression );
; POKE( (U)Int, IMM); Zero Page
	LDA #$00; ; 0BAB
	STA $C6; ; 0BAD
; =========================================================
;                         jsr(HEX_NUM)
; =========================================================
	JSR $FFE4; ; 0BAF
; Call a function as a statement
	JSR LBL0L1; clearShadowAndBoard(); ; 0BB2
; Call a function as a statement
	JSR LBL0L3; restoreregs(); ; 0BB5
; cursorxy(u10,u10)
	CLC; ; 0BB8
	LDY #$0A; ; 0BB9
	LDX #$0A; ; 0BBB
	JSR $FFF0; ; 0BBD
	LDA #$05; ; 0BC0
; =========================================================
;                         jsr(HEX_NUM)
; =========================================================
	JSR $FFD2; ; 0BC2
; =========================================================
;                         printf("CONWAYS GAME OF LIFE\n\n");
; =========================================================
	LDA #$0D; ; 0BC5
	STA $03; ; 0BC7
	LDA #$7F; ; 0BC9
	STA $02; ; 0BCB
	JSR PRN; ; 0BCD
	LDA #$9A; ; 0BD0
; =========================================================
;                         jsr(HEX_NUM)
; =========================================================
	JSR $FFD2; ; 0BD2
; =========================================================
;                         printf("  PROGRAMMED BY: MICHAEL K. PELLEGRINO\n USING HIS 6502 C COMPILER   2023 04 07\n\n         GITHUB.COM/MKPELLEGRINO\n");
; =========================================================
	LDA #$0D; ; 0BD5
	STA $03; ; 0BD7
	LDA #$96; ; 0BD9
	STA $02; ; 0BDB
	JSR PRN; ; 0BDD
; ------------------------------------------------
; romin() : Restore the default ROMS configuration
	SEI; ; 0BE0
	LDA #$37; Default Value; ; 0BE1
	STA $01; ; 0BE3
	CLI; ; 0BE5
; ------------------------------------------------
	RTS; ; 0BE6
; RULE: datatype: uint
; ======================== randomizeBoard ========================
LBL0L0:
; Preserve $02
	LDA $02; ; 0BE7
	PHA; ; 0BE9
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L12:
	PHA; ; 0BEA
; ---------------------------------------------------------
; RULE: init: '=' expression
; initialising WordIMM: 40
	LDA #$28; ; 0BEB
	LDX #$00; ; 0BED
; RULE: statement: ID init
; WordID = XA
	STA $033E;  i; ; 0BEF
	STX $033F; ; 0BF2
; ---------------------------------------------------------
; WordID $033E vs. WordIMM w920
LBL1L13:			; Top of FOR Loop
; =========================================================
;                         WORD ID relop  WORD IMM
; =========================================================
; $033E relop w920
	LDA $033F; ; 0BF5
	CMP #$03; ; 0BF8
	.BYTE #$D0, #$05;  BNE +5; ; 0BFA
	LDA $033E; ; 0BFC
	CMP #$98; ; 0BFF
	.BYTE #$B0, #$03; BCS +3; ; 0C01
	JMP LBL1L15;  if c==0 jump to BODY; ; 0C03
	JMP LBL1L16;  jump out of FOR; ; 0C06
; =========================================================
; ---------------------------------------------------------
LBL1L14:
; OP2
; RULE: expression: expression arithmetic expression
; $033E + u1
; $033E (2) + u1 (-1)
	CLC; ; 0C09
; WordID + (IntIMM || UintIMM)
	LDA #$01; ; 0C0A
	ADC $033E; ; 0C0C
	PHA; ; 0C0F
	LDA #$00; ; 0C10
	ADC $033F; ; 0C12
	TAX; ; 0C15
	PLA; ; 0C16
; RULE: init: '=' expression
; initialising a word with XA
; RULE: statement: ID init
; WordID = XA
	STA $033E;  i; ; 0C17
	STX $033F; ; 0C1A
	JMP LBL1L13;  jump to top of FOR loop; ; 0C1D
; ---------------------------------------------------------
LBL1L15:
; RULE: datatype: uint
; =========================================================
;            rnd(u1);
; =========================================================
	LDA $D41B; ; 0C20
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT a=A datatype#: 00
; UINT UintID A
	STA $0345;  a; ; 0C23
; =========================================================
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL2L18:
; UintID $0345 vs. UintIMM u127
LBL2L19:			; Top of IF statement
; UintID relop UintIMM
	LDA $0345;  a; ; 0C26
	CMP #$7F; ; 0C29
	.BYTE #$B0, #$03;  BCS +3; ; 0C2B
	JMP LBL2L21;  if c==0 jump to ELSE; ; 0C2D
	.BYTE $D0, $03;  BNE +3; ; 0C30
	JMP LBL2L21;  if z==1 jump to ELSE; ; 0C32
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL2L20:
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$51; ; 0C35
; RULE: statement: ID init
	STA $0345;  a; ; 0C37
; =========================================================
	JMP LBL2L22; ; 0C3A
LBL2L21:
; ---------------------------------------------------------
;                       ELSE:
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$20; ; 0C3D
; RULE: statement: ID init
	STA $0345;  a; ; 0C3F
; =========================================================
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL2L22:
; OP2
; RULE: expression: expression arithmetic expression
; $0338 + $033E
; $0338 (2) + $033E (2)
	CLC; ; 0C42
; WordID arith WordID
; WordID + WordID
	LDA $0338; ; 0C43
	ADC $033E; ; 0C46
	TAY; ; 0C49
	LDA $0339; ; 0C4A
	ADC $033F; ; 0C4D
	TAX; ; 0C50
	TYA; ; 0C51
; poke( expression, expression );
	STA LBL2L23; ; 0C52
	STX LBL2L24; ; 0C55
	LDA $0345;  a; ; 0C58
	.BYTE $8D	;  STA absolute; ; 0C5B
LBL2L23:			;  <-- low byte
	.BYTE $00; ; 0C5C
LBL2L24:			;  <-- hi byte
	.BYTE $00; ; 0C5D
; OP2
; RULE: expression: expression arithmetic expression
; $0336 + $033E
; $0336 (2) + $033E (2)
	CLC; ; 0C5E
; WordID arith WordID
; WordID + WordID
	LDA $0336; ; 0C5F
	ADC $033E; ; 0C62
	TAY; ; 0C65
	LDA $0337; ; 0C66
	ADC $033F; ; 0C69
	TAX; ; 0C6C
	TYA; ; 0C6D
; poke( expression, expression );
	STA LBL2L25; ; 0C6E
	STX LBL2L26; ; 0C71
	LDA $0345;  a; ; 0C74
	.BYTE $8D	;  STA absolute; ; 0C77
LBL2L25:			;  <-- low byte
	.BYTE $00; ; 0C78
LBL2L26:			;  <-- hi byte
	.BYTE $00; ; 0C79
; ---------------------------------------------------------
	JMP LBL1L14;  jump to iterator; ; 0C7A
LBL1L16:
	PLA; ; 0C7D
; ---------------------------------------------------------
; Restore $02
	PLA; ; 0C7E
	STA $02; ; 0C7F
	RTS; ; 0C81
; RULE: datatype: void
; ======================== clearShadowAndBoard ========================
LBL0L1:
; Preserve $02
	LDA $02; ; 0C82
	PHA; ; 0C84
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L17:
	PHA; ; 0C85
; ---------------------------------------------------------
; RULE: init: '=' expression
; initialising WordIMM: 0
	LDA #$00; ; 0C86
	TAX; ; 0C88
; RULE: statement: ID init
; WordID = XA
	STA $033E;  i; ; 0C89
	STX $033F; ; 0C8C
; ---------------------------------------------------------
; WordID $033E vs. WordIMM w1000
LBL1L18:			; Top of FOR Loop
; =========================================================
;                         WORD ID relop  WORD IMM
; =========================================================
; $033E relop w1000
	LDA $033F; ; 0C8F
	CMP #$03; ; 0C92
	.BYTE #$D0, #$05;  BNE +5; ; 0C94
	LDA $033E; ; 0C96
	CMP #$E8; ; 0C99
	.BYTE #$B0, #$03; BCS +3; ; 0C9B
	JMP LBL1L20;  if c==0 jump to BODY; ; 0C9D
	JMP LBL1L21;  jump out of FOR; ; 0CA0
; =========================================================
; ---------------------------------------------------------
LBL1L19:
; OP2
; RULE: expression: expression arithmetic expression
; $033E + u1
; $033E (2) + u1 (-1)
	CLC; ; 0CA3
; WordID + (IntIMM || UintIMM)
	LDA #$01; ; 0CA4
	ADC $033E; ; 0CA6
	PHA; ; 0CA9
	LDA #$00; ; 0CAA
	ADC $033F; ; 0CAC
	TAX; ; 0CAF
	PLA; ; 0CB0
; RULE: init: '=' expression
; initialising a word with XA
; RULE: statement: ID init
; WordID = XA
	STA $033E;  i; ; 0CB1
	STX $033F; ; 0CB4
	JMP LBL1L18;  jump to top of FOR loop; ; 0CB7
; ---------------------------------------------------------
LBL1L20:
; OP2
; RULE: expression: expression arithmetic expression
; $0338 + $033E
; $0338 (2) + $033E (2)
	CLC; ; 0CBA
; WordID arith WordID
; WordID + WordID
	LDA $0338; ; 0CBB
	ADC $033E; ; 0CBE
	TAY; ; 0CC1
	LDA $0339; ; 0CC2
	ADC $033F; ; 0CC5
	TAX; ; 0CC8
	TYA; ; 0CC9
; poke( expression, expression );
	STA LBL2L27; ; 0CCA
	STX LBL2L28; ; 0CCD
	LDA #$20; ; 0CD0
	.BYTE $8D	; <-- STA absolute; ; 0CD2
LBL2L27:			;  <-- low byte
	.BYTE $00; ; 0CD3
LBL2L28:			;  <-- hi byte
	.BYTE $00; ; 0CD4
; OP2
; RULE: expression: expression arithmetic expression
; $0336 + $033E
; $0336 (2) + $033E (2)
	CLC; ; 0CD5
; WordID arith WordID
; WordID + WordID
	LDA $0336; ; 0CD6
	ADC $033E; ; 0CD9
	TAY; ; 0CDC
	LDA $0337; ; 0CDD
	ADC $033F; ; 0CE0
	TAX; ; 0CE3
	TYA; ; 0CE4
; poke( expression, expression );
	STA LBL2L29; ; 0CE5
	STX LBL2L30; ; 0CE8
	LDA #$20; ; 0CEB
	.BYTE $8D	; <-- STA absolute; ; 0CED
LBL2L29:			;  <-- low byte
	.BYTE $00; ; 0CEE
LBL2L30:			;  <-- hi byte
	.BYTE $00; ; 0CEF
; OP2
; RULE: expression: expression arithmetic expression
; $033A + $033E
; $033A (2) + $033E (2)
	CLC; ; 0CF0
; WordID arith WordID
; WordID + WordID
	LDA $033A; ; 0CF1
	ADC $033E; ; 0CF4
	TAY; ; 0CF7
	LDA $033B; ; 0CF8
	ADC $033F; ; 0CFB
	TAX; ; 0CFE
	TYA; ; 0CFF
; poke( expression, expression );
	STA LBL2L31; ; 0D00
	STX LBL2L32; ; 0D03
	LDA #$01; ; 0D06
	.BYTE $8D	; <-- STA absolute; ; 0D08
LBL2L31:			;  <-- low byte
	.BYTE $00; ; 0D09
LBL2L32:			;  <-- hi byte
	.BYTE $00; ; 0D0A
; ---------------------------------------------------------
	JMP LBL1L19;  jump to iterator; ; 0D0B
LBL1L21:
	PLA; ; 0D0E
; ---------------------------------------------------------
; Restore $02
	PLA; ; 0D0F
	STA $02; ; 0D10
	RTS; ; 0D12
; RULE: datatype: void
; ======================== saveregs ========================
LBL0L2:
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D020; ; 0D13
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT oldD020=A datatype#: 00
; UINT UintID A
	STA $0346;  oldD020; ; 0D16
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D021; ; 0D19
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT oldD021=A datatype#: 00
; UINT UintID A
	STA $0347;  oldD021; ; 0D1C
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $0286; ; 0D1F
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT oldChar=A datatype#: 00
; UINT UintID A
	STA $0348;  oldChar; ; 0D22
; =========================================================
	RTS; ; 0D25
; RULE: datatype: void
; ======================== restoreregs ========================
LBL0L3:
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $0346; ; 0D26
	STA $D020; ; 0D29
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $0347; ; 0D2C
	STA $D021; ; 0D2F
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $0348; ; 0D32
	STA $0286; ; 0D35
	RTS; ; 0D38
SIDRND:
	PHA; ; 0D39
	LDA #$FF; ; 0D3A
	STA $D40E; ; 0D3C
	STA $D40F; ; 0D3F
	LDA #$80; ; 0D42
	STA $D412; ; 0D44
	PLA; ; 0D47
	RTS; ; 0D48
PRN:
	LDY #$00; ; 0D49
PRN_LOOP:
	LDA ($02),Y; ; 0D4B
	BEQ PRN_END; ; 0D4D
	JSR $FFD2; ; 0D4F
	INY; ; 0D52
	JMP PRN_LOOP; ; 0D53
PRN_END:
	RTS; ; 0D56
; ; $d57			" CONWAYS GAME OF LIFE       HOLD R OR Q"
STRLBL0:
	.byte $20, $43, $4F, $4E, $57, $41, $59, $53, $20, $47, $41, $4D, $45, $20, $4F, $46, $20, $4C, $49, $46, $45, $20, $20, $20, $20, $20, $20, $20, $48, $4F, $4C, $44, $20, $52, $20, $4F, $52, $20, $51, $00
; ; $d7f			"CONWAYS GAME OF LIFE\n\n"
STRLBL1:
	.byte $43, $4F, $4E, $57, $41, $59, $53, $20, $47, $41, $4D, $45, $20, $4F, $46, $20, $4C, $49, $46, $45, $0D, $0D, $00
; ; $d96			"  PROGRAMMED BY: MICHAEL K. PELLEGRINO\n USING HIS 6502 C COMPILER   2023 04 07\n\n         GITHUB.COM/MKPELLEGRINO\n"
STRLBL2:
	.byte $20, $20, $50, $52, $4F, $47, $52, $41, $4D, $4D, $45, $44, $20, $42, $59, $3A, $20, $4D, $49, $43, $48, $41, $45, $4C, $20, $4B, $2E, $20, $50, $45, $4C, $4C, $45, $47, $52, $49, $4E, $4F, $0D, $20, $55, $53, $49, $4E, $47, $20, $48, $49, $53, $20, $36, $35, $30, $32, $20, $43, $20, $43, $4F, $4D, $50, $49, $4C, $45, $52, $20, $20, $20, $32, $30, $32, $33, $20, $30, $34, $20, $30, $37, $0D, $0D, $20, $20, $20, $20, $20, $20, $20, $20, $20, $47, $49, $54, $48, $55, $42, $2E, $43, $4F, $4D, $2F, $4D, $4B, $50, $45, $4C, $4C, $45, $47, $52, $49, $4E, $4F, $0D, $00
