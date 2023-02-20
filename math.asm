; uint : return_address_1 : $0334 (820)
; uint : return_address_2 : $0335 (821)
; word : xa : $0336 (822)
; word : tmp : $033E (830)
; uint : i : $0340 (832)
; uint : ya : $0341 (833)
; uint : tmp2 : $0345 (837)
; uint : j : $0346 (838)
; uint : pausev : $0347 (839)
; uint : oldD011 : $0348 (840)
; uint : oldD016 : $0349 (841)
; uint : oldD018 : $034A (842)
; uint : oldD020 : $034B (843)
; uint : oldD021 : $034C (844)
; uint : oldChar : $034D (845)
; RULE: datatype: uint
.org $0834
; =========================================================
;                         main()
; =========================================================
; RULE: datatype: word
; RULE: statement: datatype ID '[' (U)INTIMM ']'  <== ARRAY
; =========================================================
; RULE: init: '=' expression
; 0
; w4096
; unknown type
; w4096
	LDX #$00; 0834
	LDA #$00; 0836
	STA $0336,X; 0838
	INX; 083B
	LDA #$10; 083C
	STA $0336,X; 083E
; =========================================================
; RULE: init: '=' expression
; 1
; w3840
; unknown type
; w3840
	LDX #$02; 0841
	LDA #$00; 0843
	STA $0336,X; 0845
	INX; 0848
	LDA #$0F; 0849
	STA $0336,X; 084B
; =========================================================
; RULE: init: '=' expression
; 2
; w2730
; unknown type
; w2730
	LDX #$04; 084E
	LDA #$AA; 0850
	STA $0336,X; 0852
	INX; 0855
	LDA #$0A; 0856
	STA $0336,X; 0858
; =========================================================
; RULE: init: '=' expression
; 3
; w4369
; unknown type
; w4369
	LDX #$06; 085B
	LDA #$11; 085D
	STA $0336,X; 085F
	INX; 0862
	LDA #$11; 0863
	STA $0336,X; 0865
; =========================================================
; RULE: datatype: word
; RULE: statement: datatype ID init
; WORD tmp=A datatype#: 02
	LDX #$00; 0868
	STA $033E; 086A
	STX $033F; 086D
; =========================================================
; Preserve $02
	LDA $02; 0870
	PHA; 0872
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L0:
	PHA; 0873
; ---------------------------------------------------------
; RULE: datatype: uint
; RULE: init: '=' expression
; i
; u1
	LDA #$01; 0874
; RULE: statement: datatype ID init
; UINT i=A datatype#: 00
; UINT UintID A
	STA $0340; 0876
; ---------------------------------------------------------
; UintID
; $0340
;  vs. 
; UintIMM
; u4
LBL1L1:			; Top of FOR Loop
	LDA $0340; 0879
	CMP #$04; 087C
	.BYTE #$B0, #$03; BCS +3; 087E
	JMP LBL1L3; if c==0 jump to BODY; 0880
	JMP LBL1L4; jump out of FOR; 0883
; =========================================================
; ---------------------------------------------------------
LBL1L2:
; inc(expression)
	INC $0340; 0886
	JMP LBL1L1; jump to top of FOR loop; 0889
; ---------------------------------------------------------
LBL1L3:
; ID '[' (U)IntIMM ']' -> XA
	LDX #$00; 088C
	LDA $0336,X; 088E
	PHA; 0891
	INX; 0892
	LDA $0336,X; 0893
	TAX; 0896
	PLA; 0897
; OP1
	PHA; 0898
	TXA; 0899
	PHA; 089A
; ID '[' (U)IntID ']' -> XA
	LDA $0340; 089B
	ASL; 089E
	TAX; 089F
	LDA $0336,X; 08A0
	PHA; 08A3
	INX; 08A4
	LDA $0336,X; 08A5
	TAX; 08A8
	PLA; 08A9
; OP2
; RULE: expression: expression arithmetic expression
; XA - XA
; XA (-1) - XA (-1)
	SEC; 08AA
; XA - XA
	STA $FB; 08AB
	STX $FC; 08AD
	PLA; 08AF
	TAX; 08B0
	PLA; 08B1
	SBC $FB; 08B2
	TAY; 08B4
	TXA; 08B5
	SBC $FC; 08B6
	TAX; 08B8
	TYA; 08B9
; RULE: init: '=' expression
; tmp
; XA
; initialising a word with XA
; unknown type
; XA
; RULE: statement: ID init
; WordID = XA
	STA $033E; 08BA
	STX $033F; 08BD
; =========================================================
; ID '[' (U)IntIMM ']' -> XA
	LDX #$00; 08C0
	LDA $0336,X; 08C2
	PHA; 08C5
	INX; 08C6
	LDA $0336,X; 08C7
	TAX; 08CA
	PLA; 08CB
; =========================================================
;                         printf(XA);
; =========================================================
	PHA; 08CC
	TXA; 08CD
	PHA; 08CE
	JSR BYTE2HEX; 08CF
	JSR BYTE2HEX; 08D2
; =========================================================
;                         printf("-");
; =========================================================
	LDA #$0B; 08D5
	STA $03; 08D7
	LDA #$A6; 08D9
	STA $02; 08DB
	JSR PRN; 08DD
; ID '[' (U)IntID ']' -> XA
	LDA $0340; 08E0
	ASL; 08E3
	TAX; 08E4
	LDA $0336,X; 08E5
	PHA; 08E8
	INX; 08E9
	LDA $0336,X; 08EA
	TAX; 08ED
	PLA; 08EE
; =========================================================
;                         printf(XA);
; =========================================================
	PHA; 08EF
	TXA; 08F0
	PHA; 08F1
	JSR BYTE2HEX; 08F2
	JSR BYTE2HEX; 08F5
; =========================================================
;                         printf("=");
; =========================================================
	LDA #$0B; 08F8
	STA $03; 08FA
	LDA #$A8; 08FC
	STA $02; 08FE
	JSR PRN; 0900
; =========================================================
;                         printf($033E);
; =========================================================
	LDA $033E; 0903
	STA HTD_IN; 0906
	LDA $033F; 0909
	STA HTD_IN+1; 090C
	JSR WORD2DEC; 090F
	LDX #$00; 0912
LBL2L0:
	LDA HTD_STR,X; 0914
	CMP #$30; 0917
	.BYTE #$D0, #$04; BNE SKIP; 0919
	INX; 091B
	JMP LBL2L0; 091C
	CPX #$06; 091F
	.BYTE #$D0 #$01; BNE SKIP; 0921
	DEX; 0923
LBL2L1:
	LDA HTD_STR,X; 0924
	CMP #$00; 0927
	.BYTE #$F0, #$07; BEQ #$07; 0929
	INX; 092B
	JSR $FFD2; 092C
	JMP LBL2L1; 092F
	JSR LBL0L0; cr(); 0932
; ---------------------------------------------------------
	JMP LBL1L2; jump to iterator; 0935
LBL1L4:
	PLA; 0938
; ---------------------------------------------------------
; Restore $02
	PLA; 0939
	STA $02; 093A
	LDA #$0D; 093C
; =========================================================
;                         jsr(HEX_NUM)
; =========================================================
	JSR $FFD2; 093E
; =========================================================
;                         jsr(HEX_NUM)
; =========================================================
	JSR $FFD2; 0941
; RULE: datatype: uint
; RULE: statement: datatype ID '[' (U)INTIMM ']'  <== ARRAY
; =========================================================
; RULE: init: '=' expression
; 0
; u16
	LDA #$10; 0944
; UintID_array[(U)IntIMM] = A
	LDX #$00; 0946
	STA $0341,X; 0948
; =========================================================
; RULE: init: '=' expression
; 1
; u15
	LDA #$0F; 094B
; UintID_array[(U)IntIMM] = A
	LDX #$01; 094D
	STA $0341,X; 094F
; =========================================================
; RULE: init: '=' expression
; 2
; u10
	LDA #$0A; 0952
; UintID_array[(U)IntIMM] = A
	LDX #$02; 0954
	STA $0341,X; 0956
; =========================================================
; RULE: init: '=' expression
; 3
; u17
	LDA #$11; 0959
; UintID_array[(U)IntIMM] = A
	LDX #$03; 095B
	STA $0341,X; 095D
; =========================================================
; RULE: datatype: uint
; RULE: statement: datatype ID init
; UINT tmp2=A datatype#: 00
; UINT UintID A
	STA $0345; 0960
; =========================================================
; Preserve $02
	LDA $02; 0963
	PHA; 0965
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L5:
	PHA; 0966
; ---------------------------------------------------------
; RULE: datatype: uint
; RULE: init: '=' expression
; j
; u1
	LDA #$01; 0967
; RULE: statement: datatype ID init
; UINT j=A datatype#: 00
; UINT UintID A
	STA $0346; 0969
; ---------------------------------------------------------
; UintID
; $0346
;  vs. 
; UintIMM
; u4
LBL1L6:			; Top of FOR Loop
	LDA $0346; 096C
	CMP #$04; 096F
	.BYTE #$B0, #$03; BCS +3; 0971
	JMP LBL1L8; if c==0 jump to BODY; 0973
	JMP LBL1L9; jump out of FOR; 0976
; =========================================================
; ---------------------------------------------------------
LBL1L7:
; inc(expression)
	INC $0346; 0979
	JMP LBL1L6; jump to top of FOR loop; 097C
; ---------------------------------------------------------
LBL1L8:
; ID '[' expression ']' -> A
	LDX #$00; 097F
	LDA $0341,X; 0981
	PHA; 0984
; ID '[' expression ']' -> A
	LDX $0346; 0985
	LDA $0341,X; 0988
; OP2
; RULE: expression: expression arithmetic expression
; A - A
; A (-1) - A (-1)
	SEC; 098B
; A arithmetic A
	STA $FB; 098C
	PLA; 098E
	SBC $FB; 098F
; RULE: init: '=' expression
; tmp2
; A
; initialising an int/uint with accumulator
; unknown type
; A
; RULE: statement: ID init
	STA $0345; 0991
; =========================================================
; ID '[' expression ']' -> A
	LDX #$00; 0994
	LDA $0341,X; 0996
; =========================================================
;                         printf(A);
; =========================================================
	PHA; 0999
	JSR BYTE2HEX; 099A
; =========================================================
;                         printf("-");
; =========================================================
	LDA #$0B; 099D
	STA $03; 099F
	LDA #$AA; 09A1
	STA $02; 09A3
	JSR PRN; 09A5
; ID '[' expression ']' -> A
	LDX $0346; 09A8
	LDA $0341,X; 09AB
; =========================================================
;                         printf(A);
; =========================================================
	PHA; 09AE
	JSR BYTE2HEX; 09AF
; =========================================================
;                         printf("=");
; =========================================================
	LDA #$0B; 09B2
	STA $03; 09B4
	LDA #$AC; 09B6
	STA $02; 09B8
	JSR PRN; 09BA
; =========================================================
;                         printf($0345);
; =========================================================
	LDA $0345; 09BD
	PHA; 09C0
	JSR BYT2STR; 09C1
	PLA; 09C4
	TAX; 09C5
	PLA; 09C6
	TAY; 09C7
	PLA; 09C8
	CMP #$30; 09C9
	BEQ LBL2L4; 09CB
	JSR $FFD2; 09CD
	TYA; 09D0
LBL2L2:			; Just Two Bytes
	JSR $FFD2; 09D1
LBL2L3:			; Only One Byte
	TXA; 09D4
	JSR $FFD2; 09D5
; jump to label below 
	JMP LBL2L5; 09D8
LBL2L4:			; Label CMP2
	TYA; 09DB
	CMP #$30; 09DC
	BEQ LBL2L3; 09DE
	JMP LBL2L2; 09E0
LBL2L5:			; Done
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL2L6:
; UintID
; $0345
;  vs. 
; UintIMM
; u5
LBL2L7:			; Top of IF statement
	LDA $0345; 09E3
	CMP #$05; 09E6
	.BYTE #$90, #$03; BCC +3; 09E8
	JMP LBL2L9; jump to ELSE; 09EA
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL2L8:
; =========================================================
;                         printf(" *** COLLISION ***");
; =========================================================
	LDA #$0B; 09ED
	STA $03; 09EF
	LDA #$AE; 09F1
	STA $02; 09F3
	JSR PRN; 09F5
; inc(expression)
	INC $D020; 09F8
; =========================================================
	JMP LBL2L10; 09FB
LBL2L9:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL2L10:
	JSR LBL0L0; cr(); 09FE
; ---------------------------------------------------------
	JMP LBL1L7; jump to iterator; 0A01
LBL1L9:
	PLA; 0A04
; ---------------------------------------------------------
; Restore $02
	PLA; 0A05
	STA $02; 0A06
	RTS; 0A08
; RULE: datatype: void
; ======================== cr ========================
LBL0L0:
	LDA #$0D; 0A09
; =========================================================
;                         jsr(HEX_NUM)
; =========================================================
	JSR $FFD2; 0A0B
	RTS; 0A0E
; RULE: datatype: void
; ======================== sp ========================
LBL0L1:
	LDA #$20; 0A0F
; =========================================================
;                         jsr(HEX_NUM)
; =========================================================
	JSR $FFD2; 0A11
	RTS; 0A14
; RULE: datatype: void
; ======================== pause ========================
LBL0L2:
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$00; 0A15
	STA $C6; 0A17
; =========================================================
;                         jsr(HEX_NUM)
; =========================================================
	JSR $FFE4; 0A19
; RULE: datatype: uint
; =========================================================
;                  getchar()
; =========================================================
	JSR $FFE4; 0A1C
; RULE: init: '=' expression
; pausev
; A
; initialising an unknown type with A
; unknown type
; A
; RULE: statement: datatype ID init
; UINT pausev=A datatype#: 00
; UINT UintID A
	STA $0347; 0A1F
; =========================================================
; =========================================================
;                         WHILE LOOP
; =========================================================
	PHA; 0A22
LBL1L10:
; ---------------------------------------------------------
; UintID
; $0347
;  vs. 
; UintIMM
; u0
LBL1L11:			; Top of WHILE Loop
	LDA $0347; 0A23
	CMP #$00; 0A26
	.BYTE #$F0, #$03; BEQ +3; 0A28
	JMP LBL1L13; jump to ELSE; 0A2A
; =========================================================
LBL1L12:
; =========================================================
;                  getchar()
; =========================================================
	JSR $FFE4; 0A2D
; RULE: init: '=' expression
; pausev
; A
; initialising an int/uint with accumulator
; unknown type
; A
; RULE: statement: ID init
	STA $0347; 0A30
; =========================================================
	JMP LBL1L11; jump to top of WHILE loop; 0A33
LBL1L13:
	PLA; 0A36
	RTS; 0A37
; RULE: datatype: void
; ======================== clearkb ========================
LBL0L3:
; poke( expression, expression );
; POKE( <uint/int> IMM,IMM)
	LDA #$00; 0A38
	STA $C6; 0A3A
; =========================================================
;                         jsr(NUMBER)
; =========================================================
	JSR $FFE4; 0A3C
	RTS; 0A3F
; RULE: datatype: void
; ======================== saveregs ========================
LBL0L4:
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D011; 0A40
; RULE: init: '=' expression
; oldD011
; A
; initialising an unknown type with A
; unknown type
; A
; RULE: statement: datatype ID init
; UINT oldD011=A datatype#: 00
; UINT UintID A
	STA $0348; 0A43
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D016; 0A46
; RULE: init: '=' expression
; oldD016
; A
; initialising an unknown type with A
; unknown type
; A
; RULE: statement: datatype ID init
; UINT oldD016=A datatype#: 00
; UINT UintID A
	STA $0349; 0A49
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D018; 0A4C
; RULE: init: '=' expression
; oldD018
; A
; initialising an unknown type with A
; unknown type
; A
; RULE: statement: datatype ID init
; UINT oldD018=A datatype#: 00
; UINT UintID A
	STA $034A; 0A4F
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D020; 0A52
; RULE: init: '=' expression
; oldD020
; A
; initialising an unknown type with A
; unknown type
; A
; RULE: statement: datatype ID init
; UINT oldD020=A datatype#: 00
; UINT UintID A
	STA $034B; 0A55
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D021; 0A58
; RULE: init: '=' expression
; oldD021
; A
; initialising an unknown type with A
; unknown type
; A
; RULE: statement: datatype ID init
; UINT oldD021=A datatype#: 00
; UINT UintID A
	STA $034C; 0A5B
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $0286; 0A5E
; RULE: init: '=' expression
; oldChar
; A
; initialising an unknown type with A
; unknown type
; A
; RULE: statement: datatype ID init
; UINT oldChar=A datatype#: 00
; UINT UintID A
	STA $034D; 0A61
; =========================================================
	RTS; 0A64
; RULE: datatype: void
; ======================== restoreregs ========================
LBL0L5:
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $0348; 0A65
	STA $D011; 0A68
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $0349; 0A6B
	STA $D016; 0A6E
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $034A; 0A71
	STA $D018; 0A74
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $034B; 0A77
	STA $D020; 0A7A
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $034C; 0A7D
	STA $D021; 0A80
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $034D; 0A83
	STA $0286; 0A86
	RTS; 0A89
; RULE: datatype: void
; ======================== shortcls ========================
LBL0L6:
	LDA #$93; 0A8A
; =========================================================
;                         jsr(HEX_NUM)
; =========================================================
	JSR $FFD2; 0A8C
	RTS; 0A8F
HTD_STR:
	.BYTE #$00, #$00, #$00, #$00, #$00, #$00, #$00; 0A90
; ------------------------------------------------------------
; This chunk of code is by: Andrew Jacobs, 28-Feb-2004
; Taken from: http://6502.org/source/integers/hex2dec-more.htm
; ------------------------------------------------------------
HTD_IN:
	.BYTE #$00, #$00; 0A97
HTD_OUT:
	.BYTE #$00, #$00, #$00; 0A99
WORD2DEC:		;2 Byte Word to Decimal
	PLA; 0A9C
	STA $0334; 0A9D
	PLA; 0AA0
	STA $0335; 0AA1
	SED; 0AA4
	LDA #$00; 0AA5
	STA HTD_OUT; 0AA7
	STA HTD_OUT+1; 0AAA
	STA HTD_OUT+2; 0AAD
	LDX #$10; 0AB0
CNVBIT:
	ASL HTD_IN; 0AB2
	ROL HTD_IN+1; 0AB5
	LDA HTD_OUT; 0AB8
	ADC HTD_OUT; 0ABB
	STA HTD_OUT; 0ABE
	LDA HTD_OUT+1; 0AC1
	ADC HTD_OUT+1; 0AC4
	STA HTD_OUT+1; 0AC7
	LDA HTD_OUT+2; 0ACA
	ADC HTD_OUT+2; 0ACD
	STA HTD_OUT+2; 0AD0
	DEX; 0AD3
	BNE CNVBIT; 0AD4
	CLD; 0AD6
; ------------------------------------------------------------
	LDA HTD_OUT; 0AD7
	PHA; 0ADA
	LSR; 0ADB
	LSR; 0ADC
	LSR; 0ADD
	LSR; 0ADE
	ORA #$30; 0ADF
	STA HTD_STR+4; 0AE1
	PLA; 0AE4
	AND #$0F; 0AE5
	ORA #$30; 0AE7
	STA HTD_STR+5; 0AE9
	LDA HTD_OUT+1; 0AEC
	PHA; 0AEF
	LSR; 0AF0
	LSR; 0AF1
	LSR; 0AF2
	LSR; 0AF3
	ORA #$30; 0AF4
	STA HTD_STR+2; 0AF6
	PLA; 0AF9
	AND #$0F; 0AFA
	ORA #$30; 0AFC
	STA HTD_STR+3; 0AFE
	LDA HTD_OUT+2; 0B01
	PHA; 0B04
	LSR; 0B05
	LSR; 0B06
	LSR; 0B07
	LSR; 0B08
	ORA #$30; 0B09
	STA HTD_STR; 0B0B
	PLA; 0B0E
	AND #$0F; 0B0F
	ORA #$30; 0B11
	STA HTD_STR+1; 0B13
	LDA $0335; 0B16
	PHA; 0B19
	LDA $0334; 0B1A
	PHA; 0B1D
	RTS; 0B1E
BYTE2HEX:		;Display a Hexadecimal Byte
	PLA; 0B1F
	STA $0334; 0B20
	PLA; 0B23
	STA $0335; 0B24
	CLD; 0B27
	PLA; 0B28
	TAX; 0B29
	AND #$F0; 0B2A
	LSR; 0B2C
	LSR; 0B2D
	LSR; 0B2E
	LSR; 0B2F
	CMP #$0A; 0B30
	.BYTE #$90, #$03; 0B32
	CLC; 0B34
	ADC #$07; 0B35
	ADC #$30; 0B37
	JSR $FFD2; 0B39
	TXA; 0B3C
	AND #$0F; 0B3D
	CMP #$0A; 0B3F
	.BYTE #$90, #$03; 0B41
	CLC; 0B43
	ADC #$07; 0B44
	ADC #$30; 0B46
	JSR $FFD2; 0B48
	LDA $0335; 0B4B
	PHA; 0B4E
	LDA $0334; 0B4F
	PHA; 0B52
	RTS; 0B53
BYT2STR:		;Turns a 1 byte value into 3 PETSCII chars on stack
	PLA; 0B54
	STA $0334; 0B55
	PLA; 0B58
	STA $0335; 0B59
	PLA; 0B5C
	LDX #$00; 0B5D
B2SL1:
	SEC; 0B5F
	SBC #$64; 0B60
	BCC B2SL2; 0B62
	INX; 0B64
	JMP B2SL1; 0B65
B2SL2:
	CLC; 0B68
	ADC #$64; 0B69
	TAY; 0B6B
	TXA; 0B6C
	CLC; 0B6D
	ADC #$30; 0B6E
	PHA; 0B70
	TYA; 0B71
	LDX #$00; 0B72
B2SL3:
	SEC; 0B74
	SBC #$0A; 0B75
	BCC B2SL4; 0B77
	INX; 0B79
	JMP B2SL3; 0B7A
B2SL4:
	CLC; 0B7D
	ADC #$0A; 0B7E
	TAY; 0B80
	TXA; 0B81
	CLC; 0B82
	ADC #$30; 0B83
	PHA; 0B85
	TYA; 0B86
	LDX #$00; 0B87
	TYA; 0B89
	ADC #$30; 0B8A
	PHA; 0B8C
	LDA $0335; 0B8D
	PHA; 0B90
	LDA $0334; 0B91
	PHA; 0B94
	RTS; 0B95
PRN:
	LDY #$00; 0B96
PRN_LOOP:
	LDA ($02),Y; 0B98
	CMP #$00; 0B9A
	BEQ PRN_END; 0B9C
	JSR $FFD2; 0B9E
	INY; 0BA1
	JMP PRN_LOOP; 0BA2
PRN_END:
	RTS; 0BA5
; $ba6			"-"
STRLBL0:
	.BYTE #$2D, #$00
; $ba8			"="
STRLBL1:
	.BYTE #$3D, #$00
; $baa			"-"
STRLBL2:
	.BYTE #$2D, #$00
; $bac			"="
STRLBL3:
	.BYTE #$3D, #$00
; $bae			" *** COLLISION ***"
STRLBL4:
	.BYTE #$20, #$2A, #$2A, #$2A, #$20, #$43, #$4F, #$4C, #$4C, #$49, #$53, #$49, #$4F, #$4E, #$20, #$2A, #$2A, #$2A, #$00
