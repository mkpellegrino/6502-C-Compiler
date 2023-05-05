; uint : return_address_1 : $0334 (820)
; uint : return_address_2 : $0335 (821)
; uint : direction : $0336 (822)
; uint : pixelShift : $0337 (823)
; uint : int1flag : $0338 (824)
; uint : int2flag : $0339 (825)
; word : joshua : $033A (826)
; uint : oldD011a : $033C (828)
; uint : oldD016a : $033D (829)
; uint : oldD018a : $033E (830)
; uint : oldD020a : $033F (831)
; uint : oldD021a : $0340 (832)
; uint : old0286a : $0341 (833)
; word : bmpaddr : $0342 (834)
; word : bmpaddrX : $0344 (836)
; word : scraddr : $0346 (838)
; word : scraddrX : $0348 (840)
; word : colraddr : $034A (842)
; word : colraddrX : $034C (844)
; word : loc : $034E (846)
; uint : j : $0350 (848)
; uint : c : $0351 (849)
; word : mem1 : $0352 (850)
; uint : pausev : $0354 (852)
; uint : oldD011 : $0355 (853)
; uint : oldD016 : $0356 (854)
; uint : oldD018 : $0357 (855)
; uint : oldD020 : $0358 (856)
; uint : oldD021 : $0359 (857)
; uint : oldChar : $035A (858)
; RULE: datatype: void
.org $0834
; =========================================================
;                         main()
; =========================================================
; RULE: datatype: uint
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$00; ; 0834
; RULE: statement: datatype ID init
; UINT direction=A datatype#: 00
; UINT UintID A
	STA $0336;  direction; ; 0836
; =========================================================
; RULE: datatype: uint
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$00; ; 0839
; RULE: statement: datatype ID init
; UINT pixelShift=A datatype#: 00
; UINT UintID A
	STA $0337;  pixelShift; ; 083B
; =========================================================
; RULE: datatype: uint
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$00; ; 083E
; RULE: statement: datatype ID init
; UINT int1flag=A datatype#: 00
; UINT UintID A
	STA $0338;  int1flag; ; 0840
; =========================================================
; RULE: datatype: uint
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$00; ; 0843
; RULE: statement: datatype ID init
; UINT int2flag=A datatype#: 00
; UINT UintID A
	STA $0339;  int2flag; ; 0845
; =========================================================
; Data
	LDA #<LBL1L0; ; 0848
	STA $033A; ; 084A
	LDA #>LBL1L0; ; 084D
	STA $033B; ; 084F
	JMP LBL1L1; ; 0852
LBL1L0:
	.byte $00; ; 0855
	.byte $00; ; 0856
	.byte $00; ; 0857
	.byte $40; ; 0858
	.byte $40; ; 0859
	.byte $40; ; 085A
	.byte $55; ; 085B
	.byte $55; ; 085C
	.byte $14; ; 085D
	.byte $14; ; 085E
	.byte $14; ; 085F
	.byte $14; ; 0860
	.byte $14; ; 0861
	.byte $14; ; 0862
	.byte $54; ; 0863
	.byte $54; ; 0864
	.byte $55; ; 0865
	.byte $40; ; 0866
	.byte $40; ; 0867
	.byte $40; ; 0868
	.byte $50; ; 0869
	.byte $50; ; 086A
	.byte $50; ; 086B
	.byte $55; ; 086C
	.byte $54; ; 086D
	.byte $04; ; 086E
	.byte $04; ; 086F
	.byte $04; ; 0870
	.byte $04; ; 0871
	.byte $04; ; 0872
	.byte $04; ; 0873
	.byte $54; ; 0874
	.byte $55; ; 0875
	.byte $40; ; 0876
	.byte $40; ; 0877
	.byte $55; ; 0878
	.byte $00; ; 0879
	.byte $40; ; 087A
	.byte $40; ; 087B
	.byte $55; ; 087C
	.byte $54; ; 087D
	.byte $04; ; 087E
	.byte $00; ; 087F
	.byte $54; ; 0880
	.byte $04; ; 0881
	.byte $14; ; 0882
	.byte $14; ; 0883
	.byte $54; ; 0884
	.byte $55; ; 0885
	.byte $40; ; 0886
	.byte $40; ; 0887
	.byte $40; ; 0888
	.byte $50; ; 0889
	.byte $50; ; 088A
	.byte $50; ; 088B
	.byte $50; ; 088C
	.byte $54; ; 088D
	.byte $04; ; 088E
	.byte $04; ; 088F
	.byte $04; ; 0890
	.byte $04; ; 0891
	.byte $04; ; 0892
	.byte $04; ; 0893
	.byte $04; ; 0894
	.byte $40; ; 0895
	.byte $40; ; 0896
	.byte $40; ; 0897
	.byte $40; ; 0898
	.byte $50; ; 0899
	.byte $50; ; 089A
	.byte $50; ; 089B
	.byte $55; ; 089C
	.byte $04; ; 089D
	.byte $04; ; 089E
	.byte $04; ; 089F
	.byte $04; ; 08A0
	.byte $04; ; 08A1
	.byte $04; ; 08A2
	.byte $04; ; 08A3
	.byte $54; ; 08A4
	.byte $15; ; 08A5
	.byte $00; ; 08A6
	.byte $00; ; 08A7
	.byte $55; ; 08A8
	.byte $40; ; 08A9
	.byte $50; ; 08AA
	.byte $50; ; 08AB
	.byte $55; ; 08AC
	.byte $54; ; 08AD
	.byte $04; ; 08AE
	.byte $04; ; 08AF
	.byte $54; ; 08B0
	.byte $04; ; 08B1
	.byte $04; ; 08B2
	.byte $04; ; 08B3
	.byte $54; ; 08B4
LBL1L1:
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D011; ; 08B5
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT oldD011a=A datatype#: 00
; UINT UintID A
	STA $033C;  oldD011a; ; 08B8
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D016; ; 08BB
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT oldD016a=A datatype#: 00
; UINT UintID A
	STA $033D;  oldD016a; ; 08BE
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D018; ; 08C1
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT oldD018a=A datatype#: 00
; UINT UintID A
	STA $033E;  oldD018a; ; 08C4
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D020; ; 08C7
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT oldD020a=A datatype#: 00
; UINT UintID A
	STA $033F;  oldD020a; ; 08CA
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D021; ; 08CD
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT oldD021a=A datatype#: 00
; UINT UintID A
	STA $0340;  oldD021a; ; 08D0
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $0286; ; 08D3
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT old0286a=A datatype#: 00
; UINT UintID A
	STA $0341;  old0286a; ; 08D6
; =========================================================
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$3B; ; 08D9
	STA $D011; ; 08DB
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$18; ; 08DE
	STA $D016; ; 08E0
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$18; ; 08E3
	STA $D018; ; 08E5
; RULE: datatype: word
	SEI; ; 08E8
	LDA $D018; ; 08E9
	AND #$08; ; 08EC
	CLC; ; 08EE
	ASL; ; 08EF
	ASL; ; 08F0
	STA $FF; ; 08F1
	LDA $DD00; ; 08F3
	EOR #$FF; ; 08F6
	AND #$03; ; 08F8
	CLC; ; 08FA
	ASL; ; 08FB
	ASL; ; 08FC
	ASL; ; 08FD
	ASL; ; 08FE
	ASL; ; 08FF
	ASL; ; 0900
	ADC $FF; ; 0901
	TAX; ; 0903
	LDA #$00; ; 0904
	CLI; ; 0906
; RULE: init: '=' expression
; initialising a word with XA
; RULE: statement: datatype ID init
; WORD bmpaddr=XA datatype#: 02
	STA $0342;  bmpaddr; ; 0907
	STX $0343; ; 090A
; =========================================================
; RULE: datatype: word
; OP2
; RULE: expression: expression arithmetic expression
; $0342 + w1280
; $0342 (2) + w1280 (-1)
	CLC; ; 090D
; WordID + WordIMM -> XA
	LDA $0342; ; 090E
	ADC #$00; ; 0911
	TAY; ; 0913
	LDA $0343; ; 0914
	ADC #$05; ; 0917
	TAX; ; 0919
	TYA; ; 091A
; RULE: init: '=' expression
; initialising a word with XA
; RULE: statement: datatype ID init
; WORD bmpaddrX=XA datatype#: 02
	STA $0344;  bmpaddrX; ; 091B
	STX $0345; ; 091E
; =========================================================
; RULE: datatype: word
	LDA #$00; ; 0921
	STA $03; ; 0923
	JSR SCRMEM; ; 0925
	PLA; ; 0928
	CLC; ; 0929
	ADC $03; ; 092A
	STA $03; ; 092C
	JSR BNKMEM; ; 092E
	PLA; ; 0931
	ADC $03; ; 0932
	TAX; ; 0934
	LDA #$00; ; 0935
; RULE: init: '=' expression
; initialising a word with XA
; RULE: statement: datatype ID init
; WORD scraddr=XA datatype#: 02
	STA $0346;  scraddr; ; 0937
	STX $0347; ; 093A
; =========================================================
; RULE: datatype: word
; OP2
; RULE: expression: expression arithmetic expression
; $0346 + w160
; $0346 (2) + w160 (-1)
	CLC; ; 093D
; WordID + WordIMM -> XA
	LDA $0346; ; 093E
	ADC #$A0; ; 0941
	TAY; ; 0943
	LDA $0347; ; 0944
	ADC #$00; ; 0947
	TAX; ; 0949
	TYA; ; 094A
; RULE: init: '=' expression
; initialising a word with XA
; RULE: statement: datatype ID init
; WORD scraddrX=XA datatype#: 02
	STA $0348;  scraddrX; ; 094B
	STX $0349; ; 094E
; =========================================================
; RULE: datatype: word
; RULE: init: '=' expression
; initialising WordIMM: 55296
	LDA #$00; ; 0951
	LDX #$D8; ; 0953
; RULE: statement: datatype ID init
; WORD colraddr=XA datatype#: 02
	STA $034A;  colraddr; ; 0955
	STX $034B; ; 0958
; =========================================================
; RULE: datatype: word
; RULE: init: '=' expression
; initialising WordIMM: 55456
	LDA #$A0; ; 095B
	LDX #$D8; ; 095D
; RULE: statement: datatype ID init
; WORD colraddrX=XA datatype#: 02
	STA $034C;  colraddrX; ; 095F
	STX $034D; ; 0962
; =========================================================
; RULE: datatype: word
; OP2
; RULE: expression: expression arithmetic expression
; $0342 + w328
; $0342 (2) + w328 (-1)
	CLC; ; 0965
; WordID + WordIMM -> XA
	LDA $0342; ; 0966
	ADC #$48; ; 0969
	TAY; ; 096B
	LDA $0343; ; 096C
	ADC #$01; ; 096F
	TAX; ; 0971
	TYA; ; 0972
; RULE: init: '=' expression
; initialising a word with XA
; RULE: statement: datatype ID init
; WORD loc=XA datatype#: 02
	STA $034E;  loc; ; 0973
	STX $034F; ; 0976
; =========================================================
; Call a function as a statement
	JSR LBL0L2; clearhires(); ; 0979
; Preserve $02
	LDA $02; ; 097C
	PHA; ; 097E
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L2:
	PHA; ; 097F
; ---------------------------------------------------------
; RULE: datatype: uint
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$00; ; 0980
; RULE: statement: datatype ID init
; UINT j=A datatype#: 00
; UINT UintID A
	STA $0350;  j; ; 0982
; ---------------------------------------------------------
; UintID $0350 vs. UintIMM u96
LBL1L3:			; Top of FOR Loop
; UintID relop UintIMM
	LDA $0350;  j; ; 0985
	CMP #$60; ; 0988
	.BYTE #$B0, #$03; BCS +3; ; 098A
	JMP LBL1L5;  if c==0 jump to BODY; ; 098C
	JMP LBL1L6;  jump out of FOR; ; 098F
; =========================================================
; ---------------------------------------------------------
LBL1L4:
; inc(expression)
	INC $0350; ; 0992
	JMP LBL1L3;  jump to top of FOR loop; ; 0995
; ---------------------------------------------------------
LBL1L5:
; Dereference: joshua
	LDA $033A; ; 0998
	STA LBL2L0; ; 099B
	LDA $033B; ; 099E
	STA LBL2L0+1; ; 09A1
	LDX $0350; ; 09A4
	.BYTE #$BD;		LDA ABS,X; ; 09A7
LBL2L0:
	.BYTE #$00; ; 09A8
	.BYTE #$00; ; 09A9
; poke( expression, expression );
	STA LBL2L1-2; ; 09AA
	LDA $034E; ; 09AD
	STA LBL2L1; ; 09B0
	LDA $034F; ; 09B3
	STA LBL2L2; ; 09B6
	LDA #$00; ; 09B9
	.BYTE $A9; ; 09BB
	.BYTE $00; ; 09BC
	.BYTE $8D;	  <-- STA absolute; ; 09BD
LBL2L1:			; <-- low byte
	.BYTE $00; ; 09BE
LBL2L2:			; <-- hi byte
	.BYTE $00; ; 09BF
; OP2
; RULE: expression: expression arithmetic expression
; $034E + u1
; $034E (2) + u1 (-1)
	CLC; ; 09C0
; WordID + (IntIMM || UintIMM)
	LDA #$01; ; 09C1
	ADC $034E; ; 09C3
	PHA; ; 09C6
	LDA #$00; ; 09C7
	ADC $034F; ; 09C9
	TAX; ; 09CC
	PLA; ; 09CD
; RULE: init: '=' expression
; initialising a word with XA
; RULE: statement: ID init
; WordID = XA
	STA $034E;  loc; ; 09CE
	STX $034F; ; 09D1
; =========================================================
; ---------------------------------------------------------
	JMP LBL1L4;  jump to iterator; ; 09D4
LBL1L6:
	PLA; ; 09D7
; ---------------------------------------------------------
; Restore $02
	PLA; ; 09D8
	STA $02; ; 09D9
	SEI; ; 09DB
	LDA #$7F; ; 09DC
	STA $DC0D; ; 09DE
	STA $DD0D; ; 09E1
	LDA $DC0D; ; 09E4
	LDA $DD0D; ; 09E7
	LDA #$01; ; 09EA
	STA $D01A; ; 09EC
	LDA #$31; ; 09EF
	STA $D012; ; 09F1
	LDA $D011; ; 09F4
	AND #$7F; ; 09F7
	STA $D011; ; 09F9
	LDA #<int1; ; 09FC
	STA $0314; ; 09FE
	LDA #>int1; ; 0A01
	STA $0315; ; 0A03
	CLI; ; 0A06
; RULE: datatype: uint
; =========================================================
;                  getin()
; =========================================================
	LDA $CB; ; 0A07
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT c=A datatype#: 00
; UINT UintID A
	STA $0351;  c; ; 0A09
; =========================================================
; =========================================================
;                         WHILE LOOP
; =========================================================
	PHA; ; 0A0C
LBL1L7:
; ---------------------------------------------------------
; UintID $0351 vs. UintIMM u62
LBL1L8:			; Top of WHILE Loop
; UintID relop UintIMM
	LDA $0351;  c; ; 0A0D
	CMP #$3E; ; 0A10
	.BYTE $D0, $03;  BNE +3; ; 0A12
	JMP LBL1L10;  if z==1 jump to ELSE; ; 0A14
; =========================================================
LBL1L9:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL2L3:
; UintID $0351 vs. UintIMM u30
LBL2L4:			; Top of IF statement
; UintID relop UintIMM
	LDA $0351;  c; ; 0A17
	CMP #$1E; ; 0A1A
	.BYTE #$F0, #$03;  BEQ +3; ; 0A1C
	JMP LBL2L6;  jump to ELSE; ; 0A1E
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL2L5:
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$FF; ; 0A21
; RULE: statement: ID init
	STA $0336;  direction; ; 0A23
; =========================================================
	JMP LBL2L7; ; 0A26
LBL2L6:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL2L7:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL2L8:
; UintID $0351 vs. UintIMM u38
LBL2L9:			; Top of IF statement
; UintID relop UintIMM
	LDA $0351;  c; ; 0A29
	CMP #$26; ; 0A2C
	.BYTE #$F0, #$03;  BEQ +3; ; 0A2E
	JMP LBL2L11;  jump to ELSE; ; 0A30
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL2L10:
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$01; ; 0A33
; RULE: statement: ID init
	STA $0336;  direction; ; 0A35
; =========================================================
	JMP LBL2L12; ; 0A38
LBL2L11:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL2L12:
; =========================================================
;                  getin()
; =========================================================
	LDA $CB; ; 0A3B
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: ID init
	STA $0351;  c; ; 0A3D
; =========================================================
	JMP LBL1L8;  jump to top of WHILE loop; ; 0A40
LBL1L10:
	PLA; ; 0A43
; Call a function as a statement
	JSR LBL0L6; clearkb(); ; 0A44
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $0341; ; 0A47
	STA $0286; ; 0A4A
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $033F; ; 0A4D
	STA $D020; ; 0A50
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $0340; ; 0A53
	STA $D021; ; 0A56
	RTS; ; 0A59
; RULE: datatype: void
; ======================== int1 ========================
LBL0L0:
int1:
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$3B; ; 0A5A
	STA $D011; ; 0A5C
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$18; ; 0A5F
	STA $D016; ; 0A61
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$18; ; 0A64
	STA $D018; ; 0A66
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L11:
; UintID $0336 vs. UintIMM u255
LBL1L12:			; Top of IF statement
; UintID relop UintIMM
	LDA $0336;  direction; ; 0A69
	CMP #$FF; ; 0A6C
	.BYTE #$F0, #$03;  BEQ +3; ; 0A6E
	JMP LBL1L14;  jump to ELSE; ; 0A70
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L13:
; dec(ID)
	DEC $0337; ; 0A73
; =========================================================
	JMP LBL1L15; ; 0A76
LBL1L14:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L15:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L16:
; UintID $0336 vs. UintIMM u1
LBL1L17:			; Top of IF statement
; UintID relop UintIMM
	LDA $0336;  direction; ; 0A79
	CMP #$01; ; 0A7C
	.BYTE #$F0, #$03;  BEQ +3; ; 0A7E
	JMP LBL1L19;  jump to ELSE; ; 0A80
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L18:
; inc(expression)
	INC $0337; ; 0A83
; =========================================================
	JMP LBL1L20; ; 0A86
LBL1L19:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L20:
	LDA #$07; ; 0A89
	AND $0337; ; 0A8B
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: ID init
	STA $0337;  pixelShift; ; 0A8E
; =========================================================
	LDA #$C8; ; 0A91
	ORA $0337; ; 0A93
; poke( expression, expression );
; POKE(IMM,A)
	STA $D016; ; 0A96
	LDA #$7F; ; 0A99
	STA $DC0D; ; 0A9B
	STA $DD0D; ; 0A9E
	LDA $DC0D; ; 0AA1
	LDA $DD0D; ; 0AA4
	LDA #$01; ; 0AA7
	STA $D01A; ; 0AA9
	LDA #$51; ; 0AAC
	STA $D012; ; 0AAE
	LDA $D011; ; 0AB1
	AND #$7F; ; 0AB4
	STA $D011; ; 0AB6
	LDA #<int2; ; 0AB9
	STA $0314; ; 0ABB
	LDA #>int2; ; 0ABE
	STA $0315; ; 0AC0
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$FF; ; 0AC3
	STA $D019; ; 0AC5
; =========================================================
;                         jmp(WordIMM)
; =========================================================
	JMP $EA7E; ; 0AC8
	RTS; ; 0ACB
; RULE: datatype: void
; ======================== int2 ========================
LBL0L1:
int2:
	NOP; ; 0ACC
	NOP; ; 0ACD
	NOP; ; 0ACE
	NOP; ; 0ACF
	NOP; ; 0AD0
	NOP; ; 0AD1
	NOP; ; 0AD2
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $033C; ; 0AD3
	STA $D011; ; 0AD6
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $033D; ; 0AD9
	STA $D016; ; 0ADC
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $033E; ; 0ADF
	STA $D018; ; 0AE2
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$FF; ; 0AE5
	STA $D019; ; 0AE7
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$C8; ; 0AEA
	STA $D016; ; 0AEC
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L21:
; UintID $0336 vs. UintIMM u255
LBL1L22:			; Top of IF statement
; UintID relop UintIMM
	LDA $0336;  direction; ; 0AEF
	CMP #$FF; ; 0AF2
	.BYTE #$F0, #$03;  BEQ +3; ; 0AF4
	JMP LBL1L24;  jump to ELSE; ; 0AF6
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L23:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL2L13:
; UintID $0337 vs. UintIMM u0
LBL2L14:			; Top of IF statement
; UintID relop UintIMM
	LDA $0337;  pixelShift; ; 0AF9
	CMP #$00; ; 0AFC
	.BYTE #$F0, #$03;  BEQ +3; ; 0AFE
	JMP LBL2L16;  jump to ELSE; ; 0B00
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL2L15:
; memcpy(w8512,w9792,u8);
; memcpy L->R
	LDY #$07; ; 0B03
LBL3L0:
	LDA $2140,Y; ; 0B05
	STA $2640,Y; ; 0B08
	CPY #$00; ; 0B0B
	BEQ LBL3L1; ; 0B0D
	DEY; ; 0B0F
	JMP LBL3L0; ; 0B10
LBL3L1:
; memcpy(w8520,w8512,u248);
; memcpy R->L
	LDY #$00; ; 0B13
LBL3L2:
	LDA $2148,Y; ; 0B15
	STA $2140,Y; ; 0B18
	INY; ; 0B1B
	CPY #$F8; ; 0B1C
	BEQ LBL3L3; ; 0B1E
	JMP LBL3L2; ; 0B20
LBL3L3:
; memcpy(w8768,w8760,u64);
; memcpy R->L
	LDY #$00; ; 0B23
LBL3L4:
	LDA $2240,Y; ; 0B25
	STA $2238,Y; ; 0B28
	INY; ; 0B2B
	CPY #$40; ; 0B2C
	BEQ LBL3L5; ; 0B2E
	JMP LBL3L4; ; 0B30
LBL3L5:
; memcpy(w9792,w8824,u8);
; memcpy R->L
	LDY #$00; ; 0B33
LBL3L6:
	LDA $2640,Y; ; 0B35
	STA $2278,Y; ; 0B38
	INY; ; 0B3B
	CPY #$08; ; 0B3C
	BEQ LBL3L7; ; 0B3E
	JMP LBL3L6; ; 0B40
LBL3L7:
	JMP LBL2L17; ; 0B43
LBL2L16:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL2L17:
	JMP LBL1L25; ; 0B46
LBL1L24:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L25:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L26:
; UintID $0336 vs. UintIMM u1
LBL1L27:			; Top of IF statement
; UintID relop UintIMM
	LDA $0336;  direction; ; 0B49
	CMP #$01; ; 0B4C
	.BYTE #$F0, #$03;  BEQ +3; ; 0B4E
	JMP LBL1L29;  jump to ELSE; ; 0B50
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L28:
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL2L18:
; UintID $0337 vs. UintIMM u7
LBL2L19:			; Top of IF statement
; UintID relop UintIMM
	LDA $0337;  pixelShift; ; 0B53
	CMP #$07; ; 0B56
	.BYTE #$F0, #$03;  BEQ +3; ; 0B58
	JMP LBL2L21;  jump to ELSE; ; 0B5A
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL2L20:
; memcpy(w8824,w9792,u8);
; memcpy L->R
	LDY #$07; ; 0B5D
LBL3L8:
	LDA $2278,Y; ; 0B5F
	STA $2640,Y; ; 0B62
	CPY #$00; ; 0B65
	BEQ LBL3L9; ; 0B67
	DEY; ; 0B69
	JMP LBL3L8; ; 0B6A
LBL3L9:
; memcpy(w8760,w8768,u64);
; memcpy L->R
	LDY #$3F; ; 0B6D
LBL3L10:
	LDA $2238,Y; ; 0B6F
	STA $2240,Y; ; 0B72
	CPY #$00; ; 0B75
	BEQ LBL3L11; ; 0B77
	DEY; ; 0B79
	JMP LBL3L10; ; 0B7A
LBL3L11:
; memcpy(w8512,w8520,u248);
; memcpy L->R
	LDY #$F7; ; 0B7D
LBL3L12:
	LDA $2140,Y; ; 0B7F
	STA $2148,Y; ; 0B82
	CPY #$00; ; 0B85
	BEQ LBL3L13; ; 0B87
	DEY; ; 0B89
	JMP LBL3L12; ; 0B8A
LBL3L13:
; memcpy(w9792,w8512,u8);
; memcpy R->L
	LDY #$00; ; 0B8D
LBL3L14:
	LDA $2640,Y; ; 0B8F
	STA $2140,Y; ; 0B92
	INY; ; 0B95
	CPY #$08; ; 0B96
	BEQ LBL3L15; ; 0B98
	JMP LBL3L14; ; 0B9A
LBL3L15:
	JMP LBL2L22; ; 0B9D
LBL2L21:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL2L22:
	JMP LBL1L30; ; 0BA0
LBL1L29:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L30:
	LDA #$7F; ; 0BA3
	STA $DC0D; ; 0BA5
	STA $DD0D; ; 0BA8
	LDA $DC0D; ; 0BAB
	LDA $DD0D; ; 0BAE
	LDA #$01; ; 0BB1
	STA $D01A; ; 0BB3
	LDA #$31; ; 0BB6
	STA $D012; ; 0BB8
	LDA $D011; ; 0BBB
	AND #$7F; ; 0BBE
	STA $D011; ; 0BC0
	LDA #<int1; ; 0BC3
	STA $0314; ; 0BC5
	LDA #>int1; ; 0BC8
	STA $0315; ; 0BCA
; =========================================================
;                         jmp(WordIMM)
; =========================================================
	JMP $EA31; ; 0BCD
	RTS; ; 0BD0
; RULE: datatype: void
; ======================== clearhires ========================
LBL0L2:
clearhires:
; Preserve $02
	LDA $02; ; 0BD1
	PHA; ; 0BD3
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L31:
	PHA; ; 0BD4
; ---------------------------------------------------------
; RULE: datatype: word
; RULE: init: '=' expression
; initialising WordID
	LDA $034A;  colraddr; ; 0BD5
	LDX $034B; ; 0BD8
; RULE: statement: datatype ID init
; WORD mem1=XA datatype#: 02
	STA $0352;  mem1; ; 0BDB
	STX $0353; ; 0BDE
; ---------------------------------------------------------
; WordID $0352 vs. WordID $034C
LBL1L32:			; Top of FOR Loop
; =========================================================
;                         WORD ID relop WORD ID
; =========================================================
	LDA $0353; ; 0BE1
	CMP $034D; ; 0BE4
	.BYTE $D0, $06;  BNE +6; ; 0BE7
	LDA $0352; ; 0BE9
	CMP $034C; ; 0BEC
	.BYTE #$B0, #$03; BCS +3; ; 0BEF
	JMP LBL1L34;  if c==0 jump to BODY; ; 0BF1
	JMP LBL1L35;  jump out of FOR; ; 0BF4
; =========================================================
; ---------------------------------------------------------
LBL1L33:
; OP2
; RULE: expression: expression arithmetic expression
; $0352 + u1
; $0352 (2) + u1 (-1)
	CLC; ; 0BF7
; WordID + (IntIMM || UintIMM)
	LDA #$01; ; 0BF8
	ADC $0352; ; 0BFA
	PHA; ; 0BFD
	LDA #$00; ; 0BFE
	ADC $0353; ; 0C00
	TAX; ; 0C03
	PLA; ; 0C04
; RULE: init: '=' expression
; initialising a word with XA
; RULE: statement: ID init
; WordID = XA
	STA $0352;  mem1; ; 0C05
	STX $0353; ; 0C08
	JMP LBL1L32;  jump to top of FOR loop; ; 0C0B
; ---------------------------------------------------------
LBL1L34:
; poke( expression, expression );
	LDA $0352; ; 0C0E
	STA LBL2L23; ; 0C11
	LDA $0353; ; 0C14
	STA LBL2L24; ; 0C17
	LDA #$00; ; 0C1A
	.BYTE $8D;	  <-- STA absolute; ; 0C1C
LBL2L23:			; <-- low byte
	.BYTE $00; ; 0C1D
LBL2L24:			; <-- hi byte
	.BYTE $00; ; 0C1E
; ---------------------------------------------------------
	JMP LBL1L33;  jump to iterator; ; 0C1F
LBL1L35:
	PLA; ; 0C22
; ---------------------------------------------------------
; Restore $02
	PLA; ; 0C23
	STA $02; ; 0C24
; Preserve $02
	LDA $02; ; 0C26
	PHA; ; 0C28
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L36:
	PHA; ; 0C29
; ---------------------------------------------------------
; RULE: init: '=' expression
; initialising WordIMM: 1024
	LDA #$00; ; 0C2A
	LDX #$04; ; 0C2C
; RULE: statement: ID init
; WordID = XA
	STA $0352;  mem1; ; 0C2E
	STX $0353; ; 0C31
; ---------------------------------------------------------
; WordID $0352 vs. WordIMM w1144
LBL1L37:			; Top of FOR Loop
; =========================================================
;                         WORD ID relop  WORD IMM
; =========================================================
; $0352 relop w1144
	LDA $0353; ; 0C34
	CMP #$04; ; 0C37
	.BYTE #$D0, #$05;  BNE +5; ; 0C39
	LDA $0352; ; 0C3B
	CMP #$78; ; 0C3E
	.BYTE #$B0, #$03; BCS +3; ; 0C40
	JMP LBL1L39;  if c==0 jump to BODY; ; 0C42
	JMP LBL1L40;  jump out of FOR; ; 0C45
; =========================================================
; ---------------------------------------------------------
LBL1L38:
; OP2
; RULE: expression: expression arithmetic expression
; $0352 + u1
; $0352 (2) + u1 (-1)
	CLC; ; 0C48
; WordID + (IntIMM || UintIMM)
	LDA #$01; ; 0C49
	ADC $0352; ; 0C4B
	PHA; ; 0C4E
	LDA #$00; ; 0C4F
	ADC $0353; ; 0C51
	TAX; ; 0C54
	PLA; ; 0C55
; RULE: init: '=' expression
; initialising a word with XA
; RULE: statement: ID init
; WordID = XA
	STA $0352;  mem1; ; 0C56
	STX $0353; ; 0C59
	JMP LBL1L37;  jump to top of FOR loop; ; 0C5C
; ---------------------------------------------------------
LBL1L39:
; poke( expression, expression );
	LDA $0352; ; 0C5F
	STA LBL2L25; ; 0C62
	LDA $0353; ; 0C65
	STA LBL2L26; ; 0C68
	LDA #$D0; ; 0C6B
	.BYTE $8D;	  <-- STA absolute; ; 0C6D
LBL2L25:			; <-- low byte
	.BYTE $00; ; 0C6E
LBL2L26:			; <-- hi byte
	.BYTE $00; ; 0C6F
; ---------------------------------------------------------
	JMP LBL1L38;  jump to iterator; ; 0C70
LBL1L40:
	PLA; ; 0C73
; ---------------------------------------------------------
; Restore $02
	PLA; ; 0C74
	STA $02; ; 0C75
; Preserve $02
	LDA $02; ; 0C77
	PHA; ; 0C79
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L41:
	PHA; ; 0C7A
; ---------------------------------------------------------
; RULE: init: '=' expression
; initialising WordIMM: 1144
	LDA #$78; ; 0C7B
	LDX #$04; ; 0C7D
; RULE: statement: ID init
; WordID = XA
	STA $0352;  mem1; ; 0C7F
	STX $0353; ; 0C82
; ---------------------------------------------------------
; WordID $0352 vs. WordIMM w1184
LBL1L42:			; Top of FOR Loop
; =========================================================
;                         WORD ID relop  WORD IMM
; =========================================================
; $0352 relop w1184
	LDA $0353; ; 0C85
	CMP #$04; ; 0C88
	.BYTE #$D0, #$05;  BNE +5; ; 0C8A
	LDA $0352; ; 0C8C
	CMP #$A0; ; 0C8F
	.BYTE #$B0, #$03; BCS +3; ; 0C91
	JMP LBL1L44;  if c==0 jump to BODY; ; 0C93
	JMP LBL1L45;  jump out of FOR; ; 0C96
; =========================================================
; ---------------------------------------------------------
LBL1L43:
; OP2
; RULE: expression: expression arithmetic expression
; $0352 + u1
; $0352 (2) + u1 (-1)
	CLC; ; 0C99
; WordID + (IntIMM || UintIMM)
	LDA #$01; ; 0C9A
	ADC $0352; ; 0C9C
	PHA; ; 0C9F
	LDA #$00; ; 0CA0
	ADC $0353; ; 0CA2
	TAX; ; 0CA5
	PLA; ; 0CA6
; RULE: init: '=' expression
; initialising a word with XA
; RULE: statement: ID init
; WordID = XA
	STA $0352;  mem1; ; 0CA7
	STX $0353; ; 0CAA
	JMP LBL1L42;  jump to top of FOR loop; ; 0CAD
; ---------------------------------------------------------
LBL1L44:
; poke( expression, expression );
	LDA $0352; ; 0CB0
	STA LBL2L27; ; 0CB3
	LDA $0353; ; 0CB6
	STA LBL2L28; ; 0CB9
	LDA #$20; ; 0CBC
	.BYTE $8D;	  <-- STA absolute; ; 0CBE
LBL2L27:			; <-- low byte
	.BYTE $00; ; 0CBF
LBL2L28:			; <-- hi byte
	.BYTE $00; ; 0CC0
; ---------------------------------------------------------
	JMP LBL1L43;  jump to iterator; ; 0CC1
LBL1L45:
	PLA; ; 0CC4
; ---------------------------------------------------------
; Restore $02
	PLA; ; 0CC5
	STA $02; ; 0CC6
; Preserve $02
	LDA $02; ; 0CC8
	PHA; ; 0CCA
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L46:
	PHA; ; 0CCB
; ---------------------------------------------------------
; RULE: init: '=' expression
; initialising WordID
	LDA $0342;  bmpaddr; ; 0CCC
	LDX $0343; ; 0CCF
; RULE: statement: ID init
; WordID = XA
	STA $0352;  mem1; ; 0CD2
	STX $0353; ; 0CD5
; ---------------------------------------------------------
; WordID $0352 vs. WordID $0344
LBL1L47:			; Top of FOR Loop
; =========================================================
;                         WORD ID relop WORD ID
; =========================================================
	LDA $0353; ; 0CD8
	CMP $0345; ; 0CDB
	.BYTE $D0, $06;  BNE +6; ; 0CDE
	LDA $0352; ; 0CE0
	CMP $0344; ; 0CE3
	.BYTE #$B0, #$03; BCS +3; ; 0CE6
	JMP LBL1L49;  if c==0 jump to BODY; ; 0CE8
	JMP LBL1L50;  jump out of FOR; ; 0CEB
; =========================================================
; ---------------------------------------------------------
LBL1L48:
; OP2
; RULE: expression: expression arithmetic expression
; $0352 + u1
; $0352 (2) + u1 (-1)
	CLC; ; 0CEE
; WordID + (IntIMM || UintIMM)
	LDA #$01; ; 0CEF
	ADC $0352; ; 0CF1
	PHA; ; 0CF4
	LDA #$00; ; 0CF5
	ADC $0353; ; 0CF7
	TAX; ; 0CFA
	PLA; ; 0CFB
; RULE: init: '=' expression
; initialising a word with XA
; RULE: statement: ID init
; WordID = XA
	STA $0352;  mem1; ; 0CFC
	STX $0353; ; 0CFF
	JMP LBL1L47;  jump to top of FOR loop; ; 0D02
; ---------------------------------------------------------
LBL1L49:
; poke( expression, expression );
	LDA $0352; ; 0D05
	STA LBL2L29; ; 0D08
	LDA $0353; ; 0D0B
	STA LBL2L30; ; 0D0E
	LDA #$00; ; 0D11
	.BYTE $8D;	  <-- STA absolute; ; 0D13
LBL2L29:			; <-- low byte
	.BYTE $00; ; 0D14
LBL2L30:			; <-- hi byte
	.BYTE $00; ; 0D15
; ---------------------------------------------------------
	JMP LBL1L48;  jump to iterator; ; 0D16
LBL1L50:
	PLA; ; 0D19
; ---------------------------------------------------------
; Restore $02
	PLA; ; 0D1A
	STA $02; ; 0D1B
	RTS; ; 0D1D
; RULE: datatype: void
; ======================== cr ========================
LBL0L3:
cr:
	LDA #$0D; ; 0D1E
; =========================================================
;                         jsr(HEX_NUM)
; =========================================================
	JSR $FFD2; ; 0D20
	RTS; ; 0D23
; RULE: datatype: void
; ======================== sp ========================
LBL0L4:
sp:
	LDA #$20; ; 0D24
; =========================================================
;                         jsr(HEX_NUM)
; =========================================================
	JSR $FFD2; ; 0D26
	RTS; ; 0D29
; RULE: datatype: void
; ======================== pause ========================
LBL0L5:
pause:
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$00; ; 0D2A
	STA $C6; ; 0D2C
; =========================================================
;                         jsr(HEX_NUM)
; =========================================================
	JSR $FFE4; ; 0D2E
; RULE: datatype: uint
; =========================================================
;                  getchar()
; =========================================================
	JSR $FFE4; ; 0D31
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT pausev=A datatype#: 00
; UINT UintID A
	STA $0354;  pausev; ; 0D34
; =========================================================
; =========================================================
;                         WHILE LOOP
; =========================================================
	PHA; ; 0D37
LBL1L51:
; ---------------------------------------------------------
; UintID $0354 vs. UintIMM u0
LBL1L52:			; Top of WHILE Loop
; UintID relop UintIMM
	LDA $0354;  pausev; ; 0D38
	CMP #$00; ; 0D3B
	.BYTE #$F0, #$03;  BEQ +3; ; 0D3D
	JMP LBL1L54;  jump to ELSE; ; 0D3F
; =========================================================
LBL1L53:
; =========================================================
;                  getchar()
; =========================================================
	JSR $FFE4; ; 0D42
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: ID init
	STA $0354;  pausev; ; 0D45
; =========================================================
	JMP LBL1L52;  jump to top of WHILE loop; ; 0D48
LBL1L54:
	PLA; ; 0D4B
	RTS; ; 0D4C
; RULE: datatype: void
; ======================== clearkb ========================
LBL0L6:
clearkb:
; poke( expression, expression );
; POKE( (U)Int, IMM); Zero Page
	LDA #$00; ; 0D4D
	STA $C6; ; 0D4F
; =========================================================
;                         jsr(NUMBER)
; =========================================================
	JSR $FFE4; ; 0D51
	RTS; ; 0D54
; RULE: datatype: void
; ======================== saveregs ========================
LBL0L7:
saveregs:
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D011; ; 0D55
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT oldD011=A datatype#: 00
; UINT UintID A
	STA $0355;  oldD011; ; 0D58
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D016; ; 0D5B
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT oldD016=A datatype#: 00
; UINT UintID A
	STA $0356;  oldD016; ; 0D5E
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D018; ; 0D61
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT oldD018=A datatype#: 00
; UINT UintID A
	STA $0357;  oldD018; ; 0D64
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D020; ; 0D67
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT oldD020=A datatype#: 00
; UINT UintID A
	STA $0358;  oldD020; ; 0D6A
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D021; ; 0D6D
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT oldD021=A datatype#: 00
; UINT UintID A
	STA $0359;  oldD021; ; 0D70
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $0286; ; 0D73
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT oldChar=A datatype#: 00
; UINT UintID A
	STA $035A;  oldChar; ; 0D76
; =========================================================
	RTS; ; 0D79
; RULE: datatype: void
; ======================== restoreregs ========================
LBL0L8:
restoreregs:
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $0355; ; 0D7A
	STA $D011; ; 0D7D
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $0356; ; 0D80
	STA $D016; ; 0D83
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $0357; ; 0D86
	STA $D018; ; 0D89
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $0358; ; 0D8C
	STA $D020; ; 0D8F
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $0359; ; 0D92
	STA $D021; ; 0D95
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $035A; ; 0D98
	STA $0286; ; 0D9B
	RTS; ; 0D9E
; RULE: datatype: void
; ======================== shortcls ========================
LBL0L9:
shortcls:
	LDA #$93; ; 0D9F
; =========================================================
;                         jsr(HEX_NUM)
; =========================================================
	JSR $FFD2; ; 0DA1
	RTS; ; 0DA4
SCRMEM:		; Get the screen mem location from the vic II
	PLA; ; 0DA5
	STA $0334; ; 0DA6
	PLA; ; 0DA9
	STA $0335; ; 0DAA
	LDA $D018; ; 0DAD
	AND #$F0; ; 0DB0
	CLC; ; 0DB2
	LSR; ; 0DB3
	LSR; ; 0DB4
	PHA; ; 0DB5
	LDA $0335; ; 0DB6
	PHA; ; 0DB9
	LDA $0334; ; 0DBA
	PHA; ; 0DBD
	RTS; ; 0DBE
BNKMEM:		; Get the bank memory from the vic II
	PLA; ; 0DBF
	STA $0334; ; 0DC0
	PLA; ; 0DC3
	STA $0335; ; 0DC4
	LDA $DD00; ; 0DC7
	EOR #$FF; ; 0DCA
	AND #$03; ; 0DCC
	CLC; ; 0DCE
	ASL; ; 0DCF
	ASL; ; 0DD0
	ASL; ; 0DD1
	ASL; ; 0DD2
	ASL; ; 0DD3
	ASL; ; 0DD4
	PHA; ; 0DD5
	LDA $0335; ; 0DD6
	PHA; ; 0DD9
	LDA $0334; ; 0DDA
	PHA; ; 0DDD
	RTS; ; 0DDE
