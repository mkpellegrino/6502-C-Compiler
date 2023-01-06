; uint : return_address_1 : $0334 (820)
; uint : return_address_2 : $0335 (821)
; int : myY : $0336 (822)
; word : mem1 : $0337 (823)
; uint : oldD011 : $0339 (825)
; uint : oldD016 : $033A (826)
; uint : oldD018 : $033B (827)
; uint : oldD020 : $033C (828)
; uint : oldD021 : $033D (829)
; uint : oldChar : $033E (830)
; uint : x : $033F (831)
; uint : y : $0340 (832)
; uint : POINT : $0341 (833)
; uint : pausev : $0342 (834)
; RULE: datatype: void
.org $0834
; =========================================================
;                         main()
; =========================================================
; RULE: datatype: int
; INT myY=A datatype#: 01
; INT IntID A
	STA $0336; 0834
; =========================================================
; =========================================================
;                         FOR LOOP
; =========================================================
LBL1L0:
	PHA; 0837
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
	LDA #$00; 0838
	LDX #$20; 083A
	STA $0337; 083C
	STX $0338; 083F
; ---------------------------------------------------------
; RULE: value: NUM: (0x3FFF)
; RULE: value: NUM: (0x3FFF)->(w16383)
; WordID
; $0337
;  vs. 
; WordIMM
; w16383
LBL1L1:			; Top of FOR Loop
; =========================================================
;                         WORD ID vs. WORD IMM
; =========================================================
; $0337 v. w16383
	LDA $0338; 0842
	CMP #$3F; 0845
	.BYTE #$D0, #$05; 0847
	LDA $0337; 0849
	CMP #$FF; 084C
	.BYTE #$B0, #$03; 084E
	JMP LBL1L3; if c==0 jump to BODY; 0850
	JMP LBL1L4; jump out of FOR; 0853
; =========================================================
; ---------------------------------------------------------
LBL1L2:
; RULE: value: NUMBER: (1)
; $0337 (2) + u1 (-1)
; WordID + (IntIMM || UintIMM)
	CLC; 0856
	LDA #$01; 0857
	ADC $0337; 0859
	PHA; 085C
	LDA #$00; 085D
	ADC $0338; 085F
	TAX; 0862
	PLA; 0863
; RULE: init: '=' expression
; mem1
; XA
; unknown type
; XA
; RULE: statement: ID init
	STA $0337; 0864
	STX $0338; 0867
	JMP LBL1L1; jump to top of FOR loop; 086A
; ---------------------------------------------------------
LBL1L3:
; =========================================================
;                         poke mem1, 0
; =========================================================
	LDA $0337; 086D
	STA LBL2L0; 0870
	LDA $0338; 0873
	STA LBL2L1; 0876
	LDA #$00; 0879
	.BYTE #$8D;	  <-- STA absolute; 087B
LBL2L0:			; <-- low byte
	.BYTE #$00; 087C
LBL2L1:			; <-- hi byte
	.BYTE #$00; 087D
; ---------------------------------------------------------
	JMP LBL1L2; jump to iterator; 087E
LBL1L4:
	PLA; 0881
; ---------------------------------------------------------
; RULE: datatype: uint
; tPEEK '(' HEX_NUM ')' 
	LDA $D011; 0882
; RULE: init: '=' expression
; oldD011
; A
; initializing an unknown with A
; unknown type
; A
; UINT oldD011=A datatype#: 00
; UINT UintID A
	STA $0339; 0885
; =========================================================
; RULE: datatype: uint
; tPEEK '(' HEX_NUM ')' 
	LDA $D016; 0888
; RULE: init: '=' expression
; oldD016
; A
; initializing an unknown with A
; unknown type
; A
; UINT oldD016=A datatype#: 00
; UINT UintID A
	STA $033A; 088B
; =========================================================
; RULE: datatype: uint
; tPEEK '(' HEX_NUM ')' 
	LDA $D018; 088E
; RULE: init: '=' expression
; oldD018
; A
; initializing an unknown with A
; unknown type
; A
; UINT oldD018=A datatype#: 00
; UINT UintID A
	STA $033B; 0891
; =========================================================
; RULE: datatype: uint
; tPEEK '(' HEX_NUM ')' 
	LDA $D020; 0894
; RULE: init: '=' expression
; oldD020
; A
; initializing an unknown with A
; unknown type
; A
; UINT oldD020=A datatype#: 00
; UINT UintID A
	STA $033C; 0897
; =========================================================
; RULE: datatype: uint
; tPEEK '(' HEX_NUM ')' 
	LDA $D021; 089A
; RULE: init: '=' expression
; oldD021
; A
; initializing an unknown with A
; unknown type
; A
; UINT oldD021=A datatype#: 00
; UINT UintID A
	STA $033D; 089D
; =========================================================
; RULE: datatype: uint
; tPEEK '(' HEX_NUM ')' 
	LDA $0286; 08A0
; RULE: init: '=' expression
; oldChar
; A
; initializing an unknown with A
; unknown type
; A
; UINT oldChar=A datatype#: 00
; UINT UintID A
	STA $033E; 08A3
; =========================================================
	LDA #$3B; 08A6
	STA $D011; 08A8
	LDA #$18; 08AB
	STA $D016; 08AD
	LDA #$18; 08B0
	STA $D018; 08B2
	LDA #$00; 08B5
	STA $D020; 08B7
	LDA #$00; 08BA
	STA $D021; 08BC
; RULE: datatype: uint
; RULE: value: NUMBER: (10)
; RULE: init: '=' expression
; x
; u10
	LDA #$0A; 08BF
; UINT x=A datatype#: 00
; UINT UintID A
	STA $033F; 08C1
; =========================================================
; RULE: datatype: uint
; RULE: value: NUMBER: (10)
; RULE: init: '=' expression
; y
; u10
	LDA #$0A; 08C4
; UINT y=A datatype#: 00
; UINT UintID A
	STA $0340; 08C6
; =========================================================
; RULE: datatype: uint
	LDA #$60; 08C9
	STA PLOTRTS; 08CB
	LDA $033F; 08CE
	STA $FA; 08D1
	LDA #$00; 08D3
	STA $FB; 08D5
	LDA $0340; 08D7
	STA $FC; 08DA
	JSR PLOT; 08DC
	LDA #$A0; 08DF
	STA PLOTRTS; 08E1
	LDY #$00; 08E4
	LDA ($02),Y; 08E6
; RULE: init: '=' expression
; POINT
; A
; initializing an unknown with A
; unknown type
; A
; UINT POINT=A datatype#: 00
; UINT UintID A
	STA $0341; 08E8
; =========================================================
; =========================================================
;                         printf($0341);
; =========================================================
	LDA $0341; 08EB
	PHA; 08EE
	JSR BYT2STR; 08EF
	PLA; 08F2
	TAX; 08F3
	PLA; 08F4
	TAY; 08F5
	PLA; 08F6
	CMP #$30; 08F7
	BEQ LBL1L7; 08F9
	JSR $FFD2; 08FB
	TYA; 08FE
LBL1L5:			; Just Two Bytes
	JSR $FFD2; 08FF
LBL1L6:			; Only One Byte
	TXA; 0902
	JSR $FFD2; 0903
; jump to label below 
	JMP LBL1L8; 0906
LBL1L7:			; Label CMP2
	TYA; 0909
	CMP #$30; 090A
	BEQ LBL1L6; 090C
	JMP LBL1L5; 090E
LBL1L8:			; Done
	JSR LBL0L0; cr(); 0911
	JSR LBL0L2; pause(); 0914
	LDA $033F; 0917
	STA $FA; 091A
	LDA #$00; 091C
	STA $FB; 091E
	LDA $0340; 0920
	STA $FC; 0923
	JSR PLOT; 0925
; =========================================================
; inc(ID)
	INC $033F; 0928
; =========================================================
	LDA $033F; 092B
	STA $FA; 092E
	LDA #$00; 0930
	STA $FB; 0932
	LDA $0340; 0934
	STA $FC; 0937
	JSR PLOT; 0939
; =========================================================
	LDA #$60; 093C
	STA PLOTRTS; 093E
	LDA $033F; 0941
	STA $FA; 0944
	LDA #$00; 0946
	STA $FB; 0948
	LDA $0340; 094A
	STA $FC; 094D
	JSR PLOT; 094F
	LDA #$A0; 0952
	STA PLOTRTS; 0954
	LDY #$00; 0957
	LDA ($02),Y; 0959
; RULE: init: '=' expression
; POINT
; A
; initializing an int/uint with accumulator
; unknown type
; A
; RULE: statement: ID init
	STA $0341; 095B
; =========================================================
; =========================================================
;                         printf($0341);
; =========================================================
	LDA $0341; 095E
	PHA; 0961
	JSR BYT2STR; 0962
	PLA; 0965
	TAX; 0966
	PLA; 0967
	TAY; 0968
	PLA; 0969
	CMP #$30; 096A
	BEQ LBL1L11; 096C
	JSR $FFD2; 096E
	TYA; 0971
LBL1L9:			; Just Two Bytes
	JSR $FFD2; 0972
LBL1L10:			; Only One Byte
	TXA; 0975
	JSR $FFD2; 0976
; jump to label below 
	JMP LBL1L12; 0979
LBL1L11:			; Label CMP2
	TYA; 097C
	CMP #$30; 097D
	BEQ LBL1L10; 097F
	JMP LBL1L9; 0981
LBL1L12:			; Done
	JSR LBL0L2; pause(); 0984
	JSR LBL0L3; clearkb(); 0987
	LDA $0339; oldD011; 098A
	STA $D011; 098D
	LDA $033A; oldD016; 0990
	STA $D016; 0993
	LDA $033B; oldD018; 0996
	STA $D018; 0999
	LDA $033C; oldD020; 099C
	STA $D020; 099F
	LDA $033D; oldD021; 09A2
	STA $D021; 09A5
	LDA $033E; oldChar; 09A8
	STA $0286; 09AB
	RTS; 09AE
; RULE: datatype: void
; ======================== cr ========================
LBL0L0:
; RULE: value: NUM: (0x0D)
; RULE: value: NUM: (0x0D)->(u13)
	LDA #$0D; 09AF
; =========================================================
;                         jsr(HEX_NUM)
; =========================================================
	JSR $FFD2; 09B1
	RTS; 09B4
; RULE: datatype: void
; ======================== sp ========================
LBL0L1:
; RULE: value: NUM: (0x20)
; RULE: value: NUM: (0x20)->(u32)
	LDA #$20; 09B5
; =========================================================
;                         jsr(HEX_NUM)
; =========================================================
	JSR $FFD2; 09B7
	RTS; 09BA
; RULE: datatype: void
; ======================== pause ========================
LBL0L2:
; =========================================================
;                         poke 198, 0
; =========================================================
	LDA #$00; 09BB
	STA $C6; ; 09BD
; =========================================================
;                         jsr(NUMBER)
; =========================================================
	JSR $FFE4; 09BF
; RULE: datatype: uint
; =========================================================
;                  getchar()
; =========================================================
	JSR $FFE4; 09C2
; RULE: init: '=' expression
; pausev
; A
; initializing an unknown with A
; unknown type
; A
; UINT pausev=A datatype#: 00
; UINT UintID A
	STA $0342; 09C5
; =========================================================
; =========================================================
;                         WHILE LOOP
; =========================================================
	PHA; 09C8
LBL1L13:
; ---------------------------------------------------------
; RULE: value: NUMBER: (0)
; UintID
; $0342
;  vs. 
; UintIMM
; u0
LBL1L14:			; Top of WHILE Loop
	LDA $0342; 09C9
	CMP #$00; 09CC
	.BYTE #$F0, #$03; 09CE
	JMP LBL1L16; jump to ELSE; 09D0
; =========================================================
LBL1L15:
; =========================================================
;                  getchar()
; =========================================================
	JSR $FFE4; 09D3
; RULE: init: '=' expression
; pausev
; A
; initializing an int/uint with accumulator
; unknown type
; A
; RULE: statement: ID init
	STA $0342; 09D6
; =========================================================
	JMP LBL1L14; jump to top of WHILE loop; 09D9
LBL1L16:
	PLA; 09DC
	RTS; 09DD
; RULE: datatype: void
; ======================== clearkb ========================
LBL0L3:
; =========================================================
;                         poke 198, 0
; =========================================================
	LDA #$00; 09DE
	STA $C6; ; 09E0
; =========================================================
;                         jsr(NUMBER)
; =========================================================
	JSR $FFE4; 09E2
	RTS; 09E5
; vvv-------------------------------------vvv
; vvv  from p155 of Advanced Machine Code vvv
; vvv   Programming for the Commodore 64  vvv
; vvv-------------------------------------vvv
;       L    H
; x = ($FA, $FB), y = $FC
PLOT:
	LDA $FA; 09E6
	AND #$07; 09E8
	TAX; 09EA
	SEC; 09EB
	LDA #$00; 09EC
	STA $02; 09EE
	ROR; 09F0
	DEX; 09F1
	.BYTE #$10, #$FC; 09F2
	STA $59; 09F4
	LDA $FA; 09F6
	AND #$F8; 09F8
	STA $5C; 09FA
	LDA $FC; 09FC
	LSR; 09FE
	LSR; 09FF
	LSR; 0A00
	STA $03; 0A01
	LSR; 0A03
	ROR $02; 0A04
	LSR; 0A06
	ROR $02; 0A07
	ADC $03; 0A09
	STA $03; 0A0B
	LDA $FC; 0A0D
	AND #$07; 0A0F
	ADC $02; 0A11
	ADC $5C; 0A13
	STA $02; 0A15
	LDA $03; 0A17
	ADC $FB; 0A19
	ADC $FF; 0A1B
	STA $03; 0A1D
	PLOTRTS:; 0A1F
	LDY #$00; 0A1F
	LDA ($02),Y; 0A21
	ORA $59; 0A23
	STA ($02),Y; 0A25
	RTS; 0A27
; ^^^-------------------------------------^^^
; ^^^  from p155 of Advanced Machine Code ^^^
; ^^^   Programming for the Commodore 64  ^^^
; ^^^-------------------------------------^^^
BYT2STR:		;Turns a 1 byte value into 3 PETSCII chars on stack
	PLA; 0A28
	STA $0334; 0A29
	PLA; 0A2C
	STA $0335; 0A2D
	PLA; 0A30
	LDX #$00; 0A31
B2SL1:
	SEC; 0A33
	SBC #$64; 0A34
	BCC B2SL2; 0A36
	INX; 0A38
	JMP B2SL1; 0A39
B2SL2:
	CLC; 0A3C
	ADC #$64; 0A3D
	TAY; 0A3F
	TXA; 0A40
	CLC; 0A41
	ADC #$30; 0A42
	PHA; 0A44
	TYA; 0A45
	LDX #$00; 0A46
B2SL3:
	SEC; 0A48
	SBC #$0A; 0A49
	BCC B2SL4; 0A4B
	INX; 0A4D
	JMP B2SL3; 0A4E
B2SL4:
	CLC; 0A51
	ADC #$0A; 0A52
	TAY; 0A54
	TXA; 0A55
	CLC; 0A56
	ADC #$30; 0A57
	PHA; 0A59
	TYA; 0A5A
	LDX #$00; 0A5B
	TYA; 0A5D
	ADC #$30; 0A5E
	PHA; 0A60
	LDA $0335; 0A61
	PHA; 0A64
	LDA $0334; 0A65
	PHA; 0A68
	RTS; 0A69
