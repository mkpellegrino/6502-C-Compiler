; uint : return_address_1 : $0334 (820)
; uint : return_address_2 : $0335 (821)
; uint : pixelShift : $0336 (822)
; word : joshua : $0337 (823)
; uint : oldD011a : $0339 (825)
; uint : oldD016a : $033A (826)
; uint : oldD018a : $033B (827)
; uint : oldD020a : $033C (828)
; uint : oldD021a : $033D (829)
; uint : old0286a : $033E (830)
; word : bmpaddr : $033F (831)
; word : bmpaddrX : $0341 (833)
; word : scraddr : $0343 (835)
; word : scraddrX : $0345 (837)
; word : colraddr : $0347 (839)
; word : colraddrX : $0349 (841)
; word : loc : $034B (843)
; uint : j : $034D (845)
; word : mem1 : $034E (846)
; uint : pausev : $0350 (848)
; uint : oldD011 : $0351 (849)
; uint : oldD016 : $0352 (850)
; uint : oldD018 : $0353 (851)
; uint : oldD020 : $0354 (852)
; uint : oldD021 : $0355 (853)
; uint : oldChar : $0356 (854)
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
; UINT pixelShift=A datatype#: 00
; UINT UintID A
	STA $0336;  pixelShift; ; 0836
; =========================================================
; Data
	LDA #<LBL1L0; ; 0839
	STA $0337; ; 083B
	LDA #>LBL1L0; ; 083E
	STA $0338; ; 0840
	JMP LBL1L1; ; 0843
LBL1L0:
	.byte $00; ; 0846
	.byte $00; ; 0847
	.byte $00; ; 0848
	.byte $40; ; 0849
	.byte $40; ; 084A
	.byte $40; ; 084B
	.byte $55; ; 084C
	.byte $55; ; 084D
	.byte $14; ; 084E
	.byte $14; ; 084F
	.byte $14; ; 0850
	.byte $14; ; 0851
	.byte $14; ; 0852
	.byte $14; ; 0853
	.byte $54; ; 0854
	.byte $54; ; 0855
	.byte $55; ; 0856
	.byte $40; ; 0857
	.byte $40; ; 0858
	.byte $40; ; 0859
	.byte $50; ; 085A
	.byte $50; ; 085B
	.byte $50; ; 085C
	.byte $55; ; 085D
	.byte $54; ; 085E
	.byte $04; ; 085F
	.byte $04; ; 0860
	.byte $04; ; 0861
	.byte $04; ; 0862
	.byte $04; ; 0863
	.byte $04; ; 0864
	.byte $54; ; 0865
	.byte $55; ; 0866
	.byte $40; ; 0867
	.byte $40; ; 0868
	.byte $55; ; 0869
	.byte $00; ; 086A
	.byte $40; ; 086B
	.byte $40; ; 086C
	.byte $55; ; 086D
	.byte $54; ; 086E
	.byte $04; ; 086F
	.byte $00; ; 0870
	.byte $54; ; 0871
	.byte $04; ; 0872
	.byte $14; ; 0873
	.byte $14; ; 0874
	.byte $54; ; 0875
	.byte $55; ; 0876
	.byte $40; ; 0877
	.byte $40; ; 0878
	.byte $40; ; 0879
	.byte $50; ; 087A
	.byte $50; ; 087B
	.byte $50; ; 087C
	.byte $50; ; 087D
	.byte $54; ; 087E
	.byte $04; ; 087F
	.byte $04; ; 0880
	.byte $04; ; 0881
	.byte $04; ; 0882
	.byte $04; ; 0883
	.byte $04; ; 0884
	.byte $04; ; 0885
	.byte $40; ; 0886
	.byte $40; ; 0887
	.byte $40; ; 0888
	.byte $40; ; 0889
	.byte $50; ; 088A
	.byte $50; ; 088B
	.byte $50; ; 088C
	.byte $55; ; 088D
	.byte $04; ; 088E
	.byte $04; ; 088F
	.byte $04; ; 0890
	.byte $04; ; 0891
	.byte $04; ; 0892
	.byte $04; ; 0893
	.byte $04; ; 0894
	.byte $54; ; 0895
	.byte $15; ; 0896
	.byte $00; ; 0897
	.byte $00; ; 0898
	.byte $55; ; 0899
	.byte $40; ; 089A
	.byte $50; ; 089B
	.byte $50; ; 089C
	.byte $55; ; 089D
	.byte $54; ; 089E
	.byte $04; ; 089F
	.byte $04; ; 08A0
	.byte $54; ; 08A1
	.byte $04; ; 08A2
	.byte $04; ; 08A3
	.byte $04; ; 08A4
	.byte $54; ; 08A5
LBL1L1:
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D011; ; 08A6
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT oldD011a=A datatype#: 00
; UINT UintID A
	STA $0339;  oldD011a; ; 08A9
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D016; ; 08AC
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT oldD016a=A datatype#: 00
; UINT UintID A
	STA $033A;  oldD016a; ; 08AF
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D018; ; 08B2
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT oldD018a=A datatype#: 00
; UINT UintID A
	STA $033B;  oldD018a; ; 08B5
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D020; ; 08B8
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT oldD020a=A datatype#: 00
; UINT UintID A
	STA $033C;  oldD020a; ; 08BB
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D021; ; 08BE
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT oldD021a=A datatype#: 00
; UINT UintID A
	STA $033D;  oldD021a; ; 08C1
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $0286; ; 08C4
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT old0286a=A datatype#: 00
; UINT UintID A
	STA $033E;  old0286a; ; 08C7
; =========================================================
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$3B; ; 08CA
	STA $D011; ; 08CC
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$18; ; 08CF
	STA $D016; ; 08D1
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$18; ; 08D4
	STA $D018; ; 08D6
; RULE: datatype: word
	SEI; ; 08D9
	LDA $D018; ; 08DA
	AND #$08; ; 08DD
	CLC; ; 08DF
	ASL; ; 08E0
	ASL; ; 08E1
	STA $FF; ; 08E2
	LDA $DD00; ; 08E4
	EOR #$FF; ; 08E7
	AND #$03; ; 08E9
	CLC; ; 08EB
	ASL; ; 08EC
	ASL; ; 08ED
	ASL; ; 08EE
	ASL; ; 08EF
	ASL; ; 08F0
	ASL; ; 08F1
	ADC $FF; ; 08F2
	TAX; ; 08F4
	LDA #$00; ; 08F5
	CLI; ; 08F7
; RULE: init: '=' expression
; initialising a word with XA
; RULE: statement: datatype ID init
; WORD bmpaddr=XA datatype#: 02
	STA $033F;  bmpaddr; ; 08F8
	STX $0340; ; 08FB
; =========================================================
; RULE: datatype: word
; OP2
; RULE: expression: expression arithmetic expression
; $033F + w1280
; $033F (2) + w1280 (-1)
	CLC; ; 08FE
; WordID + WordIMM -> XA
	LDA $033F; ; 08FF
	ADC #$00; ; 0902
	TAY; ; 0904
	LDA $0340; ; 0905
	ADC #$05; ; 0908
	TAX; ; 090A
	TYA; ; 090B
; RULE: init: '=' expression
; initialising a word with XA
; RULE: statement: datatype ID init
; WORD bmpaddrX=XA datatype#: 02
	STA $0341;  bmpaddrX; ; 090C
	STX $0342; ; 090F
; =========================================================
; RULE: datatype: word
	LDA #$00; ; 0912
	STA $03; ; 0914
	JSR SCRMEM; ; 0916
	PLA; ; 0919
	CLC; ; 091A
	ADC $03; ; 091B
	STA $03; ; 091D
	JSR BNKMEM; ; 091F
	PLA; ; 0922
	ADC $03; ; 0923
	TAX; ; 0925
	LDA #$00; ; 0926
; RULE: init: '=' expression
; initialising a word with XA
; RULE: statement: datatype ID init
; WORD scraddr=XA datatype#: 02
	STA $0343;  scraddr; ; 0928
	STX $0344; ; 092B
; =========================================================
; RULE: datatype: word
; OP2
; RULE: expression: expression arithmetic expression
; $0343 + w160
; $0343 (2) + w160 (-1)
	CLC; ; 092E
; WordID + WordIMM -> XA
	LDA $0343; ; 092F
	ADC #$A0; ; 0932
	TAY; ; 0934
	LDA $0344; ; 0935
	ADC #$00; ; 0938
	TAX; ; 093A
	TYA; ; 093B
; RULE: init: '=' expression
; initialising a word with XA
; RULE: statement: datatype ID init
; WORD scraddrX=XA datatype#: 02
	STA $0345;  scraddrX; ; 093C
	STX $0346; ; 093F
; =========================================================
; RULE: datatype: word
; RULE: init: '=' expression
; initialising WordIMM: 55296
	LDA #$00; ; 0942
	LDX #$D8; ; 0944
; RULE: statement: datatype ID init
; WORD colraddr=XA datatype#: 02
	STA $0347;  colraddr; ; 0946
	STX $0348; ; 0949
; =========================================================
; RULE: datatype: word
; RULE: init: '=' expression
; initialising WordIMM: 55456
	LDA #$A0; ; 094C
	LDX #$D8; ; 094E
; RULE: statement: datatype ID init
; WORD colraddrX=XA datatype#: 02
	STA $0349;  colraddrX; ; 0950
	STX $034A; ; 0953
; =========================================================
; RULE: datatype: word
; OP2
; RULE: expression: expression arithmetic expression
; $033F + w328
; $033F (2) + w328 (-1)
	CLC; ; 0956
; WordID + WordIMM -> XA
	LDA $033F; ; 0957
	ADC #$48; ; 095A
	TAY; ; 095C
	LDA $0340; ; 095D
	ADC #$01; ; 0960
	TAX; ; 0962
	TYA; ; 0963
; RULE: init: '=' expression
; initialising a word with XA
; RULE: statement: datatype ID init
; WORD loc=XA datatype#: 02
	STA $034B;  loc; ; 0964
	STX $034C; ; 0967
; =========================================================
; Call a function as a statement
	JSR LBL0L2; clearhires(); ; 096A
; Preserve $02
	LDA $02; ; 096D
	PHA; ; 096F
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L2:
	PHA; ; 0970
; ---------------------------------------------------------
; RULE: datatype: uint
; RULE: init: '=' expression
; initialising UintIMM
	LDA #$00; ; 0971
; RULE: statement: datatype ID init
; UINT j=A datatype#: 00
; UINT UintID A
	STA $034D;  j; ; 0973
; ---------------------------------------------------------
; UintID $034D vs. UintIMM u96
LBL1L3:			; Top of FOR Loop
; UintID relop UintIMM
	LDA $034D;  j; ; 0976
	CMP #$60; ; 0979
	.BYTE #$B0, #$03; BCS +3; ; 097B
	JMP LBL1L5;  if c==0 jump to BODY; ; 097D
	JMP LBL1L6;  jump out of FOR; ; 0980
; =========================================================
; ---------------------------------------------------------
LBL1L4:
; inc(expression)
	INC $034D; ; 0983
	JMP LBL1L3;  jump to top of FOR loop; ; 0986
; ---------------------------------------------------------
LBL1L5:
; Dereference: joshua
	LDA $0337; ; 0989
	STA LBL2L0; ; 098C
	LDA $0338; ; 098F
	STA LBL2L0+1; ; 0992
	LDX $034D; ; 0995
	.BYTE #$BD;		LDA ABS,X; ; 0998
LBL2L0:
	.BYTE #$00; ; 0999
	.BYTE #$00; ; 099A
; poke( expression, expression );
	STA LBL2L1-2; ; 099B
	LDA $034B; ; 099E
	STA LBL2L1; ; 09A1
	LDA $034C; ; 09A4
	STA LBL2L2; ; 09A7
	LDA #$00; ; 09AA
	.BYTE $A9; ; 09AC
	.BYTE $00; ; 09AD
	.BYTE $8D;	  <-- STA absolute; ; 09AE
LBL2L1:			; <-- low byte
	.BYTE $00; ; 09AF
LBL2L2:			; <-- hi byte
	.BYTE $00; ; 09B0
; OP2
; RULE: expression: expression arithmetic expression
; $034B + u1
; $034B (2) + u1 (-1)
	CLC; ; 09B1
; WordID + (IntIMM || UintIMM)
	LDA #$01; ; 09B2
	ADC $034B; ; 09B4
	PHA; ; 09B7
	LDA #$00; ; 09B8
	ADC $034C; ; 09BA
	TAX; ; 09BD
	PLA; ; 09BE
; RULE: init: '=' expression
; initialising a word with XA
; RULE: statement: ID init
; WordID = XA
	STA $034B;  loc; ; 09BF
	STX $034C; ; 09C2
; =========================================================
; ---------------------------------------------------------
	JMP LBL1L4;  jump to iterator; ; 09C5
LBL1L6:
	PLA; ; 09C8
; ---------------------------------------------------------
; Restore $02
	PLA; ; 09C9
	STA $02; ; 09CA
	SEI; ; 09CC
	LDA #$7F; ; 09CD
	STA $DC0D; ; 09CF
	STA $DD0D; ; 09D2
	LDA $DC0D; ; 09D5
	LDA $DD0D; ; 09D8
	LDA #$01; ; 09DB
	STA $D01A; ; 09DD
	LDA #$31; ; 09E0
	STA $D012; ; 09E2
	LDA $D011; ; 09E5
	AND #$7F; ; 09E8
	STA $D011; ; 09EA
	LDA #<int1; ; 09ED
	STA $0314; ; 09EF
	LDA #>int1; ; 09F2
	STA $0315; ; 09F4
	CLI; ; 09F7
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $033E; ; 09F8
	STA $0286; ; 09FB
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $033C; ; 09FE
	STA $D020; ; 0A01
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $033D; ; 0A04
	STA $D021; ; 0A07
	RTS; ; 0A0A
; RULE: datatype: void
; ======================== int1 ========================
LBL0L0:
int1:
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$3B; ; 0A0B
	STA $D011; ; 0A0D
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$18; ; 0A10
	STA $D016; ; 0A12
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$18; ; 0A15
	STA $D018; ; 0A17
; dec(ID)
	DEC $0336; ; 0A1A
; =========================================================
	LDA #$07; ; 0A1D
	AND $0336; ; 0A1F
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: ID init
	STA $0336;  pixelShift; ; 0A22
; =========================================================
	LDA #$C8; ; 0A25
	ORA $0336; ; 0A27
; poke( expression, expression );
; POKE(IMM,A)
	STA $D016; ; 0A2A
	LDA #$7F; ; 0A2D
	STA $DC0D; ; 0A2F
	STA $DD0D; ; 0A32
	LDA $DC0D; ; 0A35
	LDA $DD0D; ; 0A38
	LDA #$01; ; 0A3B
	STA $D01A; ; 0A3D
	LDA #$51; ; 0A40
	STA $D012; ; 0A42
	LDA $D011; ; 0A45
	AND #$7F; ; 0A48
	STA $D011; ; 0A4A
	LDA #<int2; ; 0A4D
	STA $0314; ; 0A4F
	LDA #>int2; ; 0A52
	STA $0315; ; 0A54
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$FF; ; 0A57
	STA $D019; ; 0A59
; =========================================================
;                         jmp(WordIMM)
; =========================================================
	JMP $EA7E; ; 0A5C
	RTS; ; 0A5F
; RULE: datatype: void
; ======================== int2 ========================
LBL0L1:
int2:
	NOP; ; 0A60
	NOP; ; 0A61
	NOP; ; 0A62
	NOP; ; 0A63
	NOP; ; 0A64
	NOP; ; 0A65
	NOP; ; 0A66
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $0339; ; 0A67
	STA $D011; ; 0A6A
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $033A; ; 0A6D
	STA $D016; ; 0A70
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $033B; ; 0A73
	STA $D018; ; 0A76
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$FF; ; 0A79
	STA $D019; ; 0A7B
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$C8; ; 0A7E
	STA $D016; ; 0A80
; =========================================================
;                         IF STATEMENT
; =========================================================
LBL1L7:
; UintID $0336 vs. UintIMM u0
LBL1L8:			; Top of IF statement
; UintID relop UintIMM
	LDA $0336;  pixelShift; ; 0A83
	CMP #$00; ; 0A86
	.BYTE #$F0, #$03;  BEQ +3; ; 0A88
	JMP LBL1L10;  jump to ELSE; ; 0A8A
; =========================================================
; ---------------------------------------------------------
;                       THEN:
LBL1L9:
; memcpy(w8512,w9792,u8);
; memcpy L->R
	LDY #$08; ; 0A8D
LBL2L3:
	CPY #$FF; ; 0A8F
	BEQ LBL2L4; ; 0A91
	LDA $2140,Y; ; 0A93
	STA $2640,Y; ; 0A96
	DEY; ; 0A99
	JMP LBL2L3; ; 0A9A
LBL2L4:
; memcpy(w8832,w9800,u8);
; memcpy L->R
	LDY #$08; ; 0A9D
LBL2L5:
	CPY #$FF; ; 0A9F
	BEQ LBL2L6; ; 0AA1
	LDA $2280,Y; ; 0AA3
	STA $2648,Y; ; 0AA6
	DEY; ; 0AA9
	JMP LBL2L5; ; 0AAA
LBL2L6:
; memcpy(w8520,w8512,u248);
; memcpy R->L
	LDY #$00; ; 0AAD
LBL2L7:
	CPY #$F8; ; 0AAF
	BEQ LBL2L8; ; 0AB1
	LDA $2148,Y; ; 0AB3
	STA $2140,Y; ; 0AB6
	INY; ; 0AB9
	JMP LBL2L7; ; 0ABA
LBL2L8:
; memcpy(w8768,w8760,u64);
; memcpy R->L
	LDY #$00; ; 0ABD
LBL2L9:
	CPY #$40; ; 0ABF
	BEQ LBL2L10; ; 0AC1
	LDA $2240,Y; ; 0AC3
	STA $2238,Y; ; 0AC6
	INY; ; 0AC9
	JMP LBL2L9; ; 0ACA
LBL2L10:
; memcpy(w8840,w8832,u248);
; memcpy R->L
	LDY #$00; ; 0ACD
LBL2L11:
	CPY #$F8; ; 0ACF
	BEQ LBL2L12; ; 0AD1
	LDA $2288,Y; ; 0AD3
	STA $2280,Y; ; 0AD6
	INY; ; 0AD9
	JMP LBL2L11; ; 0ADA
LBL2L12:
; memcpy(w9088,w9080,u64);
; memcpy R->L
	LDY #$00; ; 0ADD
LBL2L13:
	CPY #$40; ; 0ADF
	BEQ LBL2L14; ; 0AE1
	LDA $2380,Y; ; 0AE3
	STA $2378,Y; ; 0AE6
	INY; ; 0AE9
	JMP LBL2L13; ; 0AEA
LBL2L14:
; memcpy(w9792,w8824,u8);
; memcpy R->L
	LDY #$00; ; 0AED
LBL2L15:
	CPY #$08; ; 0AEF
	BEQ LBL2L16; ; 0AF1
	LDA $2640,Y; ; 0AF3
	STA $2278,Y; ; 0AF6
	INY; ; 0AF9
	JMP LBL2L15; ; 0AFA
LBL2L16:
; memcpy(w9800,w9144,u8);
; memcpy R->L
	LDY #$00; ; 0AFD
LBL2L17:
	CPY #$08; ; 0AFF
	BEQ LBL2L18; ; 0B01
	LDA $2648,Y; ; 0B03
	STA $23B8,Y; ; 0B06
	INY; ; 0B09
	JMP LBL2L17; ; 0B0A
LBL2L18:
	JMP LBL1L11; ; 0B0D
LBL1L10:
; ---------------------------------------------------------
;                       ELSE:
; ---------------------------------------------------------
; ---------------------------------------------------------
LBL1L11:
	LDA #$7F; ; 0B10
	STA $DC0D; ; 0B12
	STA $DD0D; ; 0B15
	LDA $DC0D; ; 0B18
	LDA $DD0D; ; 0B1B
	LDA #$01; ; 0B1E
	STA $D01A; ; 0B20
	LDA #$31; ; 0B23
	STA $D012; ; 0B25
	LDA $D011; ; 0B28
	AND #$7F; ; 0B2B
	STA $D011; ; 0B2D
	LDA #<int1; ; 0B30
	STA $0314; ; 0B32
	LDA #>int1; ; 0B35
	STA $0315; ; 0B37
; =========================================================
;                         jmp(WordIMM)
; =========================================================
	JMP $EA31; ; 0B3A
	RTS; ; 0B3D
; RULE: datatype: void
; ======================== clearhires ========================
LBL0L2:
clearhires:
; Preserve $02
	LDA $02; ; 0B3E
	PHA; ; 0B40
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L12:
	PHA; ; 0B41
; ---------------------------------------------------------
; RULE: datatype: word
; RULE: init: '=' expression
; initialising WordID
	LDA $0347;  colraddr; ; 0B42
	LDX $0348; ; 0B45
; RULE: statement: datatype ID init
; WORD mem1=XA datatype#: 02
	STA $034E;  mem1; ; 0B48
	STX $034F; ; 0B4B
; ---------------------------------------------------------
; WordID $034E vs. WordID $0349
LBL1L13:			; Top of FOR Loop
; =========================================================
;                         WORD ID relop WORD ID
; =========================================================
	LDA $034F; ; 0B4E
	CMP $034A; ; 0B51
	.BYTE $D0, $06;  BNE +6; ; 0B54
	LDA $034E; ; 0B56
	CMP $0349; ; 0B59
	.BYTE #$B0, #$03; BCS +3; ; 0B5C
	JMP LBL1L15;  if c==0 jump to BODY; ; 0B5E
	JMP LBL1L16;  jump out of FOR; ; 0B61
; =========================================================
; ---------------------------------------------------------
LBL1L14:
; OP2
; RULE: expression: expression arithmetic expression
; $034E + u1
; $034E (2) + u1 (-1)
	CLC; ; 0B64
; WordID + (IntIMM || UintIMM)
	LDA #$01; ; 0B65
	ADC $034E; ; 0B67
	PHA; ; 0B6A
	LDA #$00; ; 0B6B
	ADC $034F; ; 0B6D
	TAX; ; 0B70
	PLA; ; 0B71
; RULE: init: '=' expression
; initialising a word with XA
; RULE: statement: ID init
; WordID = XA
	STA $034E;  mem1; ; 0B72
	STX $034F; ; 0B75
	JMP LBL1L13;  jump to top of FOR loop; ; 0B78
; ---------------------------------------------------------
LBL1L15:
; poke( expression, expression );
	LDA $034E; ; 0B7B
	STA LBL2L19; ; 0B7E
	LDA $034F; ; 0B81
	STA LBL2L20; ; 0B84
	LDA #$00; ; 0B87
	.BYTE $8D;	  <-- STA absolute; ; 0B89
LBL2L19:			; <-- low byte
	.BYTE $00; ; 0B8A
LBL2L20:			; <-- hi byte
	.BYTE $00; ; 0B8B
; ---------------------------------------------------------
	JMP LBL1L14;  jump to iterator; ; 0B8C
LBL1L16:
	PLA; ; 0B8F
; ---------------------------------------------------------
; Restore $02
	PLA; ; 0B90
	STA $02; ; 0B91
; Preserve $02
	LDA $02; ; 0B93
	PHA; ; 0B95
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L17:
	PHA; ; 0B96
; ---------------------------------------------------------
; RULE: init: '=' expression
; initialising WordIMM: 1024
	LDA #$00; ; 0B97
	LDX #$04; ; 0B99
; RULE: statement: ID init
; WordID = XA
	STA $034E;  mem1; ; 0B9B
	STX $034F; ; 0B9E
; ---------------------------------------------------------
; WordID $034E vs. WordIMM w1144
LBL1L18:			; Top of FOR Loop
; =========================================================
;                         WORD ID relop  WORD IMM
; =========================================================
; $034E relop w1144
	LDA $034F; ; 0BA1
	CMP #$04; ; 0BA4
	.BYTE #$D0, #$05;  BNE +5; ; 0BA6
	LDA $034E; ; 0BA8
	CMP #$78; ; 0BAB
	.BYTE #$B0, #$03; BCS +3; ; 0BAD
	JMP LBL1L20;  if c==0 jump to BODY; ; 0BAF
	JMP LBL1L21;  jump out of FOR; ; 0BB2
; =========================================================
; ---------------------------------------------------------
LBL1L19:
; OP2
; RULE: expression: expression arithmetic expression
; $034E + u1
; $034E (2) + u1 (-1)
	CLC; ; 0BB5
; WordID + (IntIMM || UintIMM)
	LDA #$01; ; 0BB6
	ADC $034E; ; 0BB8
	PHA; ; 0BBB
	LDA #$00; ; 0BBC
	ADC $034F; ; 0BBE
	TAX; ; 0BC1
	PLA; ; 0BC2
; RULE: init: '=' expression
; initialising a word with XA
; RULE: statement: ID init
; WordID = XA
	STA $034E;  mem1; ; 0BC3
	STX $034F; ; 0BC6
	JMP LBL1L18;  jump to top of FOR loop; ; 0BC9
; ---------------------------------------------------------
LBL1L20:
; poke( expression, expression );
	LDA $034E; ; 0BCC
	STA LBL2L21; ; 0BCF
	LDA $034F; ; 0BD2
	STA LBL2L22; ; 0BD5
	LDA #$50; ; 0BD8
	.BYTE $8D;	  <-- STA absolute; ; 0BDA
LBL2L21:			; <-- low byte
	.BYTE $00; ; 0BDB
LBL2L22:			; <-- hi byte
	.BYTE $00; ; 0BDC
; ---------------------------------------------------------
	JMP LBL1L19;  jump to iterator; ; 0BDD
LBL1L21:
	PLA; ; 0BE0
; ---------------------------------------------------------
; Restore $02
	PLA; ; 0BE1
	STA $02; ; 0BE2
; Preserve $02
	LDA $02; ; 0BE4
	PHA; ; 0BE6
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L22:
	PHA; ; 0BE7
; ---------------------------------------------------------
; RULE: init: '=' expression
; initialising WordIMM: 1144
	LDA #$78; ; 0BE8
	LDX #$04; ; 0BEA
; RULE: statement: ID init
; WordID = XA
	STA $034E;  mem1; ; 0BEC
	STX $034F; ; 0BEF
; ---------------------------------------------------------
; WordID $034E vs. WordIMM w1184
LBL1L23:			; Top of FOR Loop
; =========================================================
;                         WORD ID relop  WORD IMM
; =========================================================
; $034E relop w1184
	LDA $034F; ; 0BF2
	CMP #$04; ; 0BF5
	.BYTE #$D0, #$05;  BNE +5; ; 0BF7
	LDA $034E; ; 0BF9
	CMP #$A0; ; 0BFC
	.BYTE #$B0, #$03; BCS +3; ; 0BFE
	JMP LBL1L25;  if c==0 jump to BODY; ; 0C00
	JMP LBL1L26;  jump out of FOR; ; 0C03
; =========================================================
; ---------------------------------------------------------
LBL1L24:
; OP2
; RULE: expression: expression arithmetic expression
; $034E + u1
; $034E (2) + u1 (-1)
	CLC; ; 0C06
; WordID + (IntIMM || UintIMM)
	LDA #$01; ; 0C07
	ADC $034E; ; 0C09
	PHA; ; 0C0C
	LDA #$00; ; 0C0D
	ADC $034F; ; 0C0F
	TAX; ; 0C12
	PLA; ; 0C13
; RULE: init: '=' expression
; initialising a word with XA
; RULE: statement: ID init
; WordID = XA
	STA $034E;  mem1; ; 0C14
	STX $034F; ; 0C17
	JMP LBL1L23;  jump to top of FOR loop; ; 0C1A
; ---------------------------------------------------------
LBL1L25:
; poke( expression, expression );
	LDA $034E; ; 0C1D
	STA LBL2L23; ; 0C20
	LDA $034F; ; 0C23
	STA LBL2L24; ; 0C26
	LDA #$20; ; 0C29
	.BYTE $8D;	  <-- STA absolute; ; 0C2B
LBL2L23:			; <-- low byte
	.BYTE $00; ; 0C2C
LBL2L24:			; <-- hi byte
	.BYTE $00; ; 0C2D
; ---------------------------------------------------------
	JMP LBL1L24;  jump to iterator; ; 0C2E
LBL1L26:
	PLA; ; 0C31
; ---------------------------------------------------------
; Restore $02
	PLA; ; 0C32
	STA $02; ; 0C33
; Preserve $02
	LDA $02; ; 0C35
	PHA; ; 0C37
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L27:
	PHA; ; 0C38
; ---------------------------------------------------------
; RULE: init: '=' expression
; initialising WordID
	LDA $033F;  bmpaddr; ; 0C39
	LDX $0340; ; 0C3C
; RULE: statement: ID init
; WordID = XA
	STA $034E;  mem1; ; 0C3F
	STX $034F; ; 0C42
; ---------------------------------------------------------
; WordID $034E vs. WordID $0341
LBL1L28:			; Top of FOR Loop
; =========================================================
;                         WORD ID relop WORD ID
; =========================================================
	LDA $034F; ; 0C45
	CMP $0342; ; 0C48
	.BYTE $D0, $06;  BNE +6; ; 0C4B
	LDA $034E; ; 0C4D
	CMP $0341; ; 0C50
	.BYTE #$B0, #$03; BCS +3; ; 0C53
	JMP LBL1L30;  if c==0 jump to BODY; ; 0C55
	JMP LBL1L31;  jump out of FOR; ; 0C58
; =========================================================
; ---------------------------------------------------------
LBL1L29:
; OP2
; RULE: expression: expression arithmetic expression
; $034E + u1
; $034E (2) + u1 (-1)
	CLC; ; 0C5B
; WordID + (IntIMM || UintIMM)
	LDA #$01; ; 0C5C
	ADC $034E; ; 0C5E
	PHA; ; 0C61
	LDA #$00; ; 0C62
	ADC $034F; ; 0C64
	TAX; ; 0C67
	PLA; ; 0C68
; RULE: init: '=' expression
; initialising a word with XA
; RULE: statement: ID init
; WordID = XA
	STA $034E;  mem1; ; 0C69
	STX $034F; ; 0C6C
	JMP LBL1L28;  jump to top of FOR loop; ; 0C6F
; ---------------------------------------------------------
LBL1L30:
; poke( expression, expression );
	LDA $034E; ; 0C72
	STA LBL2L25; ; 0C75
	LDA $034F; ; 0C78
	STA LBL2L26; ; 0C7B
	LDA #$00; ; 0C7E
	.BYTE $8D;	  <-- STA absolute; ; 0C80
LBL2L25:			; <-- low byte
	.BYTE $00; ; 0C81
LBL2L26:			; <-- hi byte
	.BYTE $00; ; 0C82
; ---------------------------------------------------------
	JMP LBL1L29;  jump to iterator; ; 0C83
LBL1L31:
	PLA; ; 0C86
; ---------------------------------------------------------
; Restore $02
	PLA; ; 0C87
	STA $02; ; 0C88
	RTS; ; 0C8A
; RULE: datatype: void
; ======================== cr ========================
LBL0L3:
cr:
	LDA #$0D; ; 0C8B
; =========================================================
;                         jsr(HEX_NUM)
; =========================================================
	JSR $FFD2; ; 0C8D
	RTS; ; 0C90
; RULE: datatype: void
; ======================== sp ========================
LBL0L4:
sp:
	LDA #$20; ; 0C91
; =========================================================
;                         jsr(HEX_NUM)
; =========================================================
	JSR $FFD2; ; 0C93
	RTS; ; 0C96
; RULE: datatype: void
; ======================== pause ========================
LBL0L5:
pause:
; poke( expression, expression );
; POKE(wIMM,IMM)
	LDA #$00; ; 0C97
	STA $C6; ; 0C99
; =========================================================
;                         jsr(HEX_NUM)
; =========================================================
	JSR $FFE4; ; 0C9B
; RULE: datatype: uint
; =========================================================
;                  getchar()
; =========================================================
	JSR $FFE4; ; 0C9E
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT pausev=A datatype#: 00
; UINT UintID A
	STA $0350;  pausev; ; 0CA1
; =========================================================
; =========================================================
;                         WHILE LOOP
; =========================================================
	PHA; ; 0CA4
LBL1L32:
; ---------------------------------------------------------
; UintID $0350 vs. UintIMM u0
LBL1L33:			; Top of WHILE Loop
; UintID relop UintIMM
	LDA $0350;  pausev; ; 0CA5
	CMP #$00; ; 0CA8
	.BYTE #$F0, #$03;  BEQ +3; ; 0CAA
	JMP LBL1L35;  jump to ELSE; ; 0CAC
; =========================================================
LBL1L34:
; =========================================================
;                  getchar()
; =========================================================
	JSR $FFE4; ; 0CAF
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: ID init
	STA $0350;  pausev; ; 0CB2
; =========================================================
	JMP LBL1L33;  jump to top of WHILE loop; ; 0CB5
LBL1L35:
	PLA; ; 0CB8
	RTS; ; 0CB9
; RULE: datatype: void
; ======================== clearkb ========================
LBL0L6:
clearkb:
; poke( expression, expression );
; POKE( (U)Int, IMM); Zero Page
	LDA #$00; ; 0CBA
	STA $C6; ; 0CBC
; =========================================================
;                         jsr(NUMBER)
; =========================================================
	JSR $FFE4; ; 0CBE
	RTS; ; 0CC1
; RULE: datatype: void
; ======================== saveregs ========================
LBL0L7:
saveregs:
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D011; ; 0CC2
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT oldD011=A datatype#: 00
; UINT UintID A
	STA $0351;  oldD011; ; 0CC5
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D016; ; 0CC8
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT oldD016=A datatype#: 00
; UINT UintID A
	STA $0352;  oldD016; ; 0CCB
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D018; ; 0CCE
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT oldD018=A datatype#: 00
; UINT UintID A
	STA $0353;  oldD018; ; 0CD1
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D020; ; 0CD4
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT oldD020=A datatype#: 00
; UINT UintID A
	STA $0354;  oldD020; ; 0CD7
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $D021; ; 0CDA
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT oldD021=A datatype#: 00
; UINT UintID A
	STA $0355;  oldD021; ; 0CDD
; =========================================================
; RULE: datatype: uint
; tPEEK '(' expression ')' 
	LDA $0286; ; 0CE0
; RULE: init: '=' expression
; initialising a byte with A
; RULE: statement: datatype ID init
; UINT oldChar=A datatype#: 00
; UINT UintID A
	STA $0356;  oldChar; ; 0CE3
; =========================================================
	RTS; ; 0CE6
; RULE: datatype: void
; ======================== restoreregs ========================
LBL0L8:
restoreregs:
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $0351; ; 0CE7
	STA $D011; ; 0CEA
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $0352; ; 0CED
	STA $D016; ; 0CF0
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $0353; ; 0CF3
	STA $D018; ; 0CF6
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $0354; ; 0CF9
	STA $D020; ; 0CFC
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $0355; ; 0CFF
	STA $D021; ; 0D02
; poke( expression, expression );
; POKE(IMM,ID)
	LDA $0356; ; 0D05
	STA $0286; ; 0D08
	RTS; ; 0D0B
; RULE: datatype: void
; ======================== shortcls ========================
LBL0L9:
shortcls:
	LDA #$93; ; 0D0C
; =========================================================
;                         jsr(HEX_NUM)
; =========================================================
	JSR $FFD2; ; 0D0E
	RTS; ; 0D11
SCRMEM:		; Get the screen mem location from the vic II
	PLA; ; 0D12
	STA $0334; ; 0D13
	PLA; ; 0D16
	STA $0335; ; 0D17
	LDA $D018; ; 0D1A
	AND #$F0; ; 0D1D
	CLC; ; 0D1F
	LSR; ; 0D20
	LSR; ; 0D21
	PHA; ; 0D22
	LDA $0335; ; 0D23
	PHA; ; 0D26
	LDA $0334; ; 0D27
	PHA; ; 0D2A
	RTS; ; 0D2B
BNKMEM:		; Get the bank memory from the vic II
	PLA; ; 0D2C
	STA $0334; ; 0D2D
	PLA; ; 0D30
	STA $0335; ; 0D31
	LDA $DD00; ; 0D34
	EOR #$FF; ; 0D37
	AND #$03; ; 0D39
	CLC; ; 0D3B
	ASL; ; 0D3C
	ASL; ; 0D3D
	ASL; ; 0D3E
	ASL; ; 0D3F
	ASL; ; 0D40
	ASL; ; 0D41
	PHA; ; 0D42
	LDA $0335; ; 0D43
	PHA; ; 0D46
	LDA $0334; ; 0D47
	PHA; ; 0D4A
	RTS; ; 0D4B
