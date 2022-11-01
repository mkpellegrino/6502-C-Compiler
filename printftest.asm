; uint : return_address_1 : $0334 (820)
; uint : return_address_2 : $0335 (821)
; float : x : $0336 (822)
; int : y : $033B (827)
; uint : z : $033C (828)
; Adding: return_address_1 of type: uint
; Adding: return_address_2 of type: uint
; RULE: datatype: int
.org $0834
	JSR $FF81; cls(); 0834
	LDA #$09; 0837
	STA $03; 0839
	LDA #$90; 083B
	STA $02; 083D
	JSR PRN; 083F
	JSR LBL0L1; hl(); 0842
; RULE: datatype: float
; RULE: value: FLOAT_NUM: (3.14159)
; RULE: expression: value: [f3.14159)
; f3.14159
; RULE: init: '=' expression
; RULE: statement: datatype ID init
; FLOAT x=f3.14159
; Adding: x of type: float
; =========== IMM -> FAC ==========
; Base address: 0336
	LDA #$82; 0845
	STA $0336; 0847
	LDA #$49; 084A
	STA $0337; 084C
	LDA #$0F; 084F
	STA $0338; 0851
	LDA #$CF; 0854
	STA $0339; 0856
	LDA #$80; 0859
	STA $033A; 085B
; =================================
	LDA #$09; 085E
	STA $03; 0860
	LDA #$AC; 0862
	STA $02; 0864
	JSR PRN; 0866
; RULE: expression: ID : x
; printf($0336);
	LDA #$36; 0869
	LDY #$03; 086B
	JSR $BBA2; RAM -> FAC; 086D
	JSR $BDDD; FAC -> PETSCII ($0100); 0870
	LDA #$00; 0873
	STA $02; 0875
	LDA #$01; 0877
	STA $03; 0879
	JSR PRN; 087B
	JSR LBL0L2; cr(); 087E
; RULE: datatype: int
; RULE: expression: value: [i28)
; i28
; RULE: init: '=' expression
; else if( isInteger(i28)) - line 2263
	LDA #$1C; 0881
; RULE: statement: datatype ID init
; INT y=A
; Adding: y of type: signed int
	STA $033B; ; 0883
	LDA #$09; 0886
	STA $03; 0888
	LDA #$B1; 088A
	STA $02; 088C
	JSR PRN; 088E
; RULE: expression: ID : y
; printf($033B);
	LDA $033B; 0891
	PHA; 0894
	JSR DECDIG; 0895
	JSR SPLITBYTE; 0898
	PLA; 089B
	CLC; 089C
	ADC #$30; 089D
	JSR $FFD2; 089F
	PLA; 08A2
	CLC; 08A3
	ADC #$30; 08A4
	JSR $FFD2; 08A6
	JSR LBL0L2; cr(); 08A9
; RULE: datatype: uint
; RULE: expression: value: [u99)
; u99
; RULE: init: '=' expression
; else if( isInteger(u99)) - line 2263
	LDA #$63; 08AC
; RULE: statement: datatype ID init
; UINT z=A
; Adding: z of type: uint
	STA $033C; ; 08AE
	LDA #$09; 08B1
	STA $03; 08B3
	LDA #$B6; 08B5
	STA $02; 08B7
	JSR PRN; 08B9
; RULE: expression: ID : z
; printf($033C);
	LDA $033C; 08BC
	PHA; 08BF
	JSR DECDIG; 08C0
	JSR SPLITBYTE; 08C3
	PLA; 08C6
	CLC; 08C7
	ADC #$30; 08C8
	JSR $FFD2; 08CA
	PLA; 08CD
	CLC; 08CE
	ADC #$30; 08CF
	JSR $FFD2; 08D1
	JSR LBL0L2; cr(); 08D4
; RULE: return: RETURN {} ';'
	RTS; 08D7
; RULE: datatype: int
LBL0L0:
	LDA #$09; 08D8
	STA $03; 08DA
	LDA #$BB; 08DC
	STA $02; 08DE
	JSR PRN; 08E0
	JSR SCANF; 08E3
; RULE: return: RETURN {} ';'
	RTS; 08E6
; RULE: datatype: int
LBL0L1:
	LDA #$09; 08E7
	STA $03; 08E9
	LDA #$C7; 08EB
	STA $02; 08ED
	JSR PRN; 08EF
; RULE: return: RETURN {} ';'
	RTS; 08F2
; RULE: datatype: int
LBL0L2:
	LDA #$09; 08F3
	STA $03; 08F5
	LDA #$F0; 08F7
	STA $02; 08F9
	JSR PRN; 08FB
; RULE: return: RETURN {} ';'
	RTS; 08FE
SPLITBYTE:		;S1 -> S1=Hi Bits   S0=Lo Bits
	PLA; 08FF
	STA $0334; 0900
	PLA; 0903
	STA $0335; 0904
	PLA; 0907
	STA $52; 0908
	LSR; 090A
	LSR; 090B
	LSR; 090C
	LSR; 090D
	AND #$0F; 090E
	PHA; 0910
	LDA $52; 0911
	AND #$0F; 0913
	PHA; 0915
	LDA $0335; 0916
	PHA; 0919
	LDA $0334; 091A
	PHA; 091D
	RTS; 091E
DECDIG:		;Divide number on stack by 10
	PLA; 091F
	STA $0334; 0920
	PLA; 0923
	STA $0335; 0924
	PLA; 0927
	TAX; 0928
	DEX; 0929
	BMI DECDIGBK; 092A
	LDA #$00; 092C
	CLC; 092E
	PHP; 092F
	SED; 0930
DECDIGLP:
	ADC #$01; 0931
	DEX; 0933
	BPL DECDIGLP; 0934
	PLP; 0936
DECDIGBK:
	PHA; 0937
	LDA $0335; 0938
	PHA; 093B
	LDA $0334; 093C
	PHA; 093F
	RTS; 0940
PRN:
	LDY #$00; 0941
PRN_LOOP:
	LDA ($02),Y; 0943
	CMP #$00; 0945
	BEQ PRN_END; 0947
	JSR $FFD2; 0949
	INY; 094C
	JMP PRN_LOOP; 094D
PRN_END:
	RTS; 0950
SCANF:
	LDX #$00; 0951
	STX $CFDE; 0953
SCANFTOP:
	JSR $FF9F; 0956
	JSR $FFE4; 0959
	BEQ SCANFTOP; 095C
	CMP #$0D; 095E
	BEQ SCANFEND; 0960
	CMP #$14; 0962
	BEQ BKSPC; 0964
	JSR $FFD2; 0966
	LDX $CFDE; 0969
	STA $CFE0,X; 096C
	INX; 096F
	STX $CFDE; 0970
	CPX #$10; 0973
	BEQ SCANFEND; 0975
	JMP SCANFTOP; 0977
SCANFEND:
	RTS; 097A
BKSPC:
	LDX $CFDF; 097B
	DEX; 097E
	STX $CFDF; 097F
	JMP SCANFTOP; 0982
GETKEY:
	JSR $FFE4; 0985
	CMP #$00; 0988
	BEQ GETKEY; 098A
	STA $CFDF; 098C
	RTS; 098F
; $990			"               PRINTF TEST\n"
STRLBL0:
	.BYTE #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$20, #$50, #$52, #$49, #$4E, #$54, #$46, #$20, #$54, #$45, #$53, #$54, #$0D, #$00
; $9ac			"X = "
STRLBL1:
	.BYTE #$58, #$20, #$3D, #$20, #$00
; $9b1			"Y = "
STRLBL2:
	.BYTE #$59, #$20, #$3D, #$20, #$00
; $9b6			"Z = "
STRLBL3:
	.BYTE #$5A, #$20, #$3D, #$20, #$00
; $9bb			"PRESS ENTER"
STRLBL4:
	.BYTE #$50, #$52, #$45, #$53, #$53, #$20, #$45, #$4E, #$54, #$45, #$52, #$00
; $9c7			"=======================================\n"
STRLBL5:
	.BYTE #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$3D, #$0D, #$00
; $9f0			"\n"
STRLBL6:
	.BYTE #$0D, #$00
